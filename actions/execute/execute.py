#!/usr/bin/env python3
"""Run one script from a public VortaForge checkout in the selected working directory."""
import importlib.util
import json
import os
import re
import subprocess
import sys
from pathlib import Path

here = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('vf_download', here.parent / 'download' / 'download.py')
downloader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(downloader)

def execute(repo, ref, destination, script, interpreter, args_json, working_directory, workspace):
    if interpreter not in ('python3', 'bash', 'node', 'direct'):
        raise ValueError('interpreter must be python3, bash, node or direct')
    if working_directory not in ('repository', 'workspace'):
        raise ValueError('working-directory must be repository or workspace')
    args = json.loads(args_json)
    if not isinstance(args, list) or not all(isinstance(v, str) and '\x00' not in v for v in args):
        raise ValueError('args-json must be an array of strings')
    if not script or script.startswith('/') or any(part in ('', '.', '..') or not re.fullmatch(r'[A-Za-z0-9_.-]+', part) for part in script.split('/')):
        raise ValueError('script must be a safe relative path inside the cloned repository')
    path, sha = downloader.download(repo, ref, destination, workspace)
    executable = path / script
    if not executable.is_file() or not executable.resolve().is_relative_to(path.resolve()):
        raise ValueError('Script is missing or escapes the cloned repository')
    for component in (executable, *executable.parents):
        if component == path:
            break
        if component.is_symlink():
            raise ValueError('Symlinked script paths are not accepted')
    cwd = path if working_directory == 'repository' else Path(workspace).resolve(strict=True)
    command = ([str(executable)] if interpreter == 'direct' else [interpreter, str(executable)]) + args
    subprocess.run(command, cwd=cwd, check=True)
    return path, sha

def main():
    path, sha = execute(os.environ['VF_REPOSITORY'], os.environ['VF_REF'], os.environ['VF_DESTINATION'], os.environ['VF_SCRIPT'], os.environ['VF_INTERPRETER'], os.environ['VF_ARGS_JSON'], os.environ['VF_WORKDIR'], os.environ['GITHUB_WORKSPACE'])
    if os.environ.get('GITHUB_OUTPUT'):
        with open(os.environ['GITHUB_OUTPUT'], 'a', encoding='utf-8') as out:
            out.write(f'path={path}\nsha={sha}\n')

if __name__ == '__main__':
    try:
        main()
    except (KeyError, ValueError, OSError, subprocess.CalledProcessError) as exc:
        print(f'::error::execute failed: {type(exc).__name__}', file=sys.stderr)
        sys.exit(1)
