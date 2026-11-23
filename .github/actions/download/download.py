#!/usr/bin/env python3
"""Clone a public vortaforge repo to a new path under the caller workspace."""
import os
import re
import subprocess
import sys
import tempfile
import urllib.parse
import urllib.request
from pathlib import Path

NAME = re.compile(r'[A-Za-z0-9][A-Za-z0-9_.-]{0,99}\Z')
REF = re.compile(r'[A-Za-z0-9][A-Za-z0-9_./-]{0,239}\Z')

def download(repo, ref, destination, workspace):
    if repo.startswith('vortaforge/'):
        repo = repo[len('vortaforge/'):]
    if not NAME.fullmatch(repo) or repo in ('.', '..'):
        raise ValueError('repository must be a vortaforge repository name')
    if not REF.fullmatch(ref) or '..' in ref or ref.endswith(('.', '/')) or '//' in ref:
        raise ValueError('Invalid Git ref')
    ws = Path(workspace).resolve(strict=True)
    raw = Path(destination)
    if raw.is_absolute() or any(x in ('', '.', '..') or not re.fullmatch(r'[A-Za-z0-9_.-]+', x) for x in destination.split('/')):
        raise ValueError('destination must be a safe relative workspace path')
    target = ws / raw
    if target.exists() or target.is_symlink():
        raise ValueError('destination already exists')
    for parent in target.parents:
        if parent == ws:
            break
        if parent.is_symlink():
            raise ValueError('destination parent is a symlink')
    if not target.resolve().is_relative_to(ws) or target == ws:
        raise ValueError('destination escapes workspace')
    # Anonymous page + anonymous Git transport: private repositories return
    # 404, without consuming the 60/hour unauthenticated GitHub API quota.
    url = f'https://github.com/vortaforge/{repo}'
    request = urllib.request.Request(url, method='HEAD', headers={'User-Agent':'vortaforge-public-download'})
    with urllib.request.urlopen(request, timeout=30) as response:
        final = urllib.parse.urlsplit(response.geturl())
        if response.status != 200 or final.scheme != 'https' or final.hostname != 'github.com' or final.path.rstrip('/').lower() != f'/vortaforge/{repo}'.lower():
            raise ValueError('Only public vortaforge repositories are supported')
    git = ['git', '-c', 'credential.helper=', '-c', 'core.hooksPath=/dev/null']
    target.mkdir(parents=True, exist_ok=False)
    # Isolate credential/config paths; a caller token must not grant private access.
    # Failed clones remain for inspection; no caller data is deleted.
    with tempfile.TemporaryDirectory(prefix='vf-git-home-') as home:
        env = {k: v for k, v in os.environ.items() if not k.startswith('GIT_') and k not in ('GH_TOKEN', 'GITHUB_TOKEN')}
        env.update(HOME=home, XDG_CONFIG_HOME=home, GIT_TERMINAL_PROMPT='0', GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL=os.devnull, GIT_CONFIG_COUNT='0', GIT_ASKPASS='/bin/false', SSH_ASKPASS='/bin/false')
        subprocess.run(git + ['init', '--quiet', str(target)], check=True, env=env)
        subprocess.run(git + ['-C', str(target), 'fetch', '--quiet', '--depth=1', '--no-tags', f'https://github.com/vortaforge/{repo}.git', ref], check=True, env=env)
        subprocess.run(git + ['-C', str(target), 'checkout', '--quiet', '--detach', 'FETCH_HEAD'], check=True, env=env)
        sha = subprocess.check_output(git + ['-C', str(target), 'rev-parse', 'HEAD'], env=env, text=True).strip()
    if not re.fullmatch(r'[0-9a-f]{40}', sha):
        raise ValueError('Invalid resolved commit')
    return target, sha

def main():
    path, sha = download(os.environ['VF_REPOSITORY'], os.environ['VF_REF'], os.environ['VF_DESTINATION'], os.environ['GITHUB_WORKSPACE'])
    if os.environ.get('GITHUB_OUTPUT'):
        with open(os.environ['GITHUB_OUTPUT'], 'a', encoding='utf-8') as f:
            f.write(f'path={path}\nsha={sha}\n')
    print(f'Downloaded public vortaforge/{os.environ["VF_REPOSITORY"].removeprefix("vortaforge/")} at {sha}')

if __name__ == '__main__':
    try:
        main()
    except (KeyError, ValueError, OSError, subprocess.CalledProcessError) as exc:
        print(f'::error::download failed: {exc}', file=sys.stderr)
        sys.exit(1)
