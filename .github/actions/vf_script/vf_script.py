#!/usr/bin/env python3
"""Execute explicitly supplied Python with syntax and static dependency checks.

This is not a sandbox: pip packages and the user program run with job privileges.
"""
import ast
import hashlib
import json
import os
import re
import subprocess
import sys
import tempfile
import venv
from pathlib import Path

# No general guessing from import names. Only these exact opt-in mappings.
AUTO = {'requests': 'requests==2.32.3', 'yaml': 'PyYAML==6.0.2', 'PIL': 'Pillow==11.1.0'}
PACKAGE = re.compile(r'[A-Za-z0-9][A-Za-z0-9_.-]*(?:\[[A-Za-z0-9_,.-]+\])?(?:[<>=!~][A-Za-z0-9.*,+!=<>~_-]+)?\Z')
IDENT = re.compile(r'[A-Za-z_][A-Za-z0-9_]*\Z')

def workspace_file(workspace, relative):
    p = Path(relative)
    if not relative or p.is_absolute() or '\\' in relative or any(x in ('', '.', '..') for x in relative.split('/')):
        raise ValueError('File path must be a relative workspace path')
    target = workspace / p
    for part in (target, *target.parents):
        if part == workspace:
            break
        if part.is_symlink():
            raise ValueError('Symlinked input paths are not accepted')
    if not target.resolve().is_relative_to(workspace) or not target.is_file():
        raise ValueError('Input file missing or outside workspace')
    return target

def parse_code(code):
    tree = ast.parse(code, filename='<vf_script>', mode='exec')
    compile(tree, '<vf_script>', 'exec')
    names = set()
    for node in ast.walk(tree):
        if isinstance(node, ast.Import):
            names.update(a.name.split('.')[0] for a in node.names)
        elif isinstance(node, ast.ImportFrom) and node.level == 0 and node.module:
            names.add(node.module.split('.')[0])
    return sorted(names)

def missing_imports(python, names, path, workspace):
    if not names:
        return []
    probe = 'import importlib.util,json,sys; print(json.dumps([n for n in json.loads(sys.argv[1]) if importlib.util.find_spec(n) is None]))'
    env = dict(os.environ, PYTHONPATH=os.pathsep.join([str(path), str(workspace)]), PYTHONNOUSERSITE='1')
    output = subprocess.check_output([str(python), '-c', probe, json.dumps(names)], cwd=path, text=True, env=env)
    return json.loads(output)

def run(environ):
    workspace = Path(environ['GITHUB_WORKSPACE']).resolve(strict=True)
    inline, script_name = environ.get('VF_CODE', ''), environ.get('VF_SCRIPT_PATH', '')
    if bool(inline) == bool(script_name):
        raise ValueError('Provide exactly one of code or script-path')
    script = workspace_file(workspace, script_name) if script_name else None
    code = script.read_text(encoding='utf-8') if script else inline
    imports = parse_code(code)  # No installation or user execution before syntax check.
    digest = hashlib.sha256(code.encode('utf-8')).hexdigest()
    requirements_name = environ.get('VF_REQUIREMENTS', '')
    requirements = workspace_file(workspace, requirements_name) if requirements_name else None
    packages = [x.strip() for x in environ.get('VF_PACKAGES', '').splitlines() if x.strip()]
    if any(not PACKAGE.fullmatch(p) for p in packages):
        raise ValueError('Invalid package requirement; use one package spec per line')
    ignored = [x.strip() for x in environ.get('VF_IGNORE_IMPORTS', '').split(',') if x.strip()]
    if any(not IDENT.fullmatch(x) for x in ignored):
        raise ValueError('ignore-imports must contain comma-separated top-level names')
    args = json.loads(environ.get('VF_ARGS_JSON', '[]'))
    if not isinstance(args, list) or not all(isinstance(x, str) and '\x00' not in x for x in args):
        raise ValueError('args-json must be an array of strings')
    auto = environ.get('VF_AUTO_INSTALL', 'false')
    if auto not in ('true', 'false'):
        raise ValueError('auto-install must be true or false')
    checked = [x for x in imports if x not in ignored]
    base = environ.get('RUNNER_TEMP') or None
    with tempfile.TemporaryDirectory(prefix='vf-python-', dir=base) as tmp:
        temp = Path(tmp)
        venv.create(temp / 'venv', with_pip=True)
        python = temp / 'venv' / 'bin' / 'python'
        # pip's isolated mode ignores caller pip environment settings, and only
        # wheels are allowed. Dependencies are still third-party code, not safe by fiat.
        pip = [str(python), '-m', 'pip', '--isolated', 'install', '--disable-pip-version-check', '--only-binary=:all:']
        before = missing_imports(python, checked, script.parent if script else workspace, workspace)
        print('Static imports:', ', '.join(imports) or '(none)', flush=True)
        print('Initially missing:', ', '.join(before) or '(none)', flush=True)
        if requirements or packages:
            cmd = pip + (['-r', str(requirements)] if requirements else []) + (['--'] + packages if packages else [])
            subprocess.run(cmd, cwd=workspace, check=True)
        missing = missing_imports(python, checked, script.parent if script else workspace, workspace)
        installed = []
        if missing and auto == 'true':
            unknown = [n for n in missing if n not in AUTO]
            if unknown:
                raise ValueError('Unknown import-to-package mapping; declare it explicitly: ' + ', '.join(unknown))
            installed = sorted({AUTO[n] for n in missing})
            subprocess.run(pip + ['--'] + installed, cwd=workspace, check=True)
            missing = missing_imports(python, checked, script.parent if script else workspace, workspace)
        if missing:
            raise ValueError('Unresolved static imports; declare dependencies or ignore optional imports: ' + ', '.join(missing))
        if script:
            if hashlib.sha256(script.read_text(encoding='utf-8').encode('utf-8')).hexdigest() != digest:
                raise ValueError('Script changed after syntax check')
            program = script
        else:
            program = temp / 'inline.py'
            program.write_text(code, encoding='utf-8')
            program.chmod(0o600)
        env = dict(os.environ, PYTHONPATH=os.pathsep.join([str(script.parent if script else workspace), str(workspace)]), PYTHONNOUSERSITE="1")
        subprocess.run([str(python), str(program), *args], cwd=workspace, check=True, env=env)
    return imports, len(installed)

def main():
    imports, count = run(os.environ)
    if os.environ.get('GITHUB_OUTPUT'):
        with open(os.environ['GITHUB_OUTPUT'], 'a', encoding='utf-8') as f:
            f.write('imports=' + ','.join(imports) + '\n')
            f.write('automatic-packages=' + str(count) + '\n')

if __name__ == '__main__':
    try:
        main()
    except (ValueError, OSError, KeyError, SyntaxError, subprocess.CalledProcessError) as exc:
        print(f'::error::vf_script failed: {type(exc).__name__}: {exc}', file=sys.stderr)
        sys.exit(1)
