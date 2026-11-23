#!/usr/bin/env python3
"""Strict GNU-style SHA-256 manifest verification; no shell or network."""
import hashlib
import os
import re
import sys
from pathlib import Path, PurePosixPath

LINE = re.compile(r'^([0-9a-fA-F]{64}) [ *](.+)$')

def switch(name, default):
    value = os.environ.get(name, default)
    if value not in ('true', 'false'):
        raise ValueError(f'{name} must be true or false')
    return value == 'true'

def safe_path(root, name):
    if not name or '\\' in name or '\x00' in name or '\r' in name:
        raise ValueError('Invalid manifest path')
    path = PurePosixPath(name)
    if path.is_absolute() or any(p in ('', '.', '..') for p in name.split('/')):
        raise ValueError(f'Unsafe manifest path: {name!r}')
    candidate = root.joinpath(*path.parts)
    for p in (candidate, *candidate.parents):
        if p == root:
            break
        if p.is_symlink():
            raise ValueError(f'Symlinks are not accepted: {name!r}')
    if not candidate.resolve().is_relative_to(root.resolve()):
        raise ValueError(f'Path escapes directory: {name!r}')
    return candidate

def verify(root, manifest, reject_extra=False, allow_empty=False):
    root = Path(root)
    if root.is_symlink() or not root.is_dir():
        raise ValueError('Directory does not exist or is a symlink')
    root = root.resolve()
    listing = safe_path(root, manifest)
    if not listing.is_file():
        raise ValueError('Manifest is missing')
    text = listing.read_text(encoding='utf-8')
    lines = text.splitlines()
    if not lines:
        raise ValueError('Manifest is empty')
    seen = set()
    total = 0
    for line in lines:
        match = LINE.fullmatch(line)
        if not match:
            raise ValueError('Invalid SHA-256 manifest line')
        expected, name = match.groups()
        path = safe_path(root, name)
        if name in seen or path == listing:
            raise ValueError(f'Duplicate or self-referencing entry: {name!r}')
        seen.add(name)
        if not path.is_file():
            raise ValueError(f'Missing file: {name!r}')
        size = path.stat().st_size
        if size == 0 and not allow_empty:
            raise ValueError(f'Empty file: {name!r}')
        digest = hashlib.sha256()
        with path.open('rb') as stream:
            for chunk in iter(lambda: stream.read(1024 * 1024), b''):
                digest.update(chunk)
        if digest.hexdigest() != expected.lower():
            raise ValueError(f'Checksum mismatch: {name!r}')
        total += size
    if reject_extra:
        actual = set()
        for path in root.rglob('*'):
            if path.is_symlink():
                raise ValueError(f'Symlink in directory: {path.relative_to(root)}')
            if path.is_file() and path != listing:
                actual.add(path.relative_to(root).as_posix())
        if actual != seen:
            raise ValueError(f'Unexpected or unlisted files: {sorted(actual - seen)!r}')
    return len(seen), total

def main():
    count, size = verify(os.environ.get('CHECK_DIRECTORY', '.'), os.environ.get('CHECK_MANIFEST', 'SHA256SUMS'),
                         switch('CHECK_REJECT_EXTRA', 'false'), switch('CHECK_ALLOW_EMPTY', 'false'))
    summary = switch('CHECK_SUMMARY', 'true')
    if os.environ.get('GITHUB_OUTPUT'):
        with open(os.environ['GITHUB_OUTPUT'], 'a', encoding='utf-8') as out:
            out.write(f'files={count}\nbytes={size}\n')
    if summary and os.environ.get('GITHUB_STEP_SUMMARY'):
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'a', encoding='utf-8') as out:
            out.write(f'## SHA-256 verification\n\nVerified {count} file(s), {size} bytes.\n')
    print(f'Verified {count} file(s), {size} bytes')

if __name__ == '__main__':
    try:
        main()
    except (ValueError, OSError, UnicodeError) as exc:
        print(f'::error::SHA-256 verification failed: {exc}', file=sys.stderr)
        sys.exit(1)
