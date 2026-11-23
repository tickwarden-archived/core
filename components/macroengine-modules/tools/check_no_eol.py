#!/usr/bin/env python3
"""Fail if generated Fabric resources contain standalone-datapack EOL controls."""
import re
import sys
import zipfile
from pathlib import Path

PATTERN = re.compile(rb'vf_eol_[0-9a-f]{10}|# EOL entry guard')
EXTENSIONS = ('.mcfunction', '.json')

def check(root):
    root = Path(root)
    if not root.is_dir():
        raise ValueError(f'No output directory: {root}')
    count = 0
    for path in sorted(root.rglob('*')):
        if not path.is_file():
            continue
        if path.name.endswith(EXTENSIONS):
            count += 1
            if PATTERN.search(path.read_bytes()):
                raise ValueError(f'EOL content in Fabric output: {path}')
        elif path.suffix == '.jar':
            with zipfile.ZipFile(path) as archive:
                for name in archive.namelist():
                    if name.endswith(EXTENSIONS):
                        count += 1
                        if PATTERN.search(archive.read(name)):
                            raise ValueError(f'EOL content in Fabric output: {path}!{name}')
    if not count:
        raise ValueError(f'No generated resources checked: {root}')
    return count

if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('Usage: check_no_eol.py DIRECTORY')
    try:
        print(f'No EOL markers in {check(sys.argv[1])} generated resources')
    except (ValueError, OSError, zipfile.BadZipFile) as exc:
        raise SystemExit(str(exc))
