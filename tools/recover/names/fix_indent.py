#!/usr/bin/env python3
"""Repair the indentation JavaParser's lexical-preserving printer leaves on
the member that follows a removed declaration: an annotation (or the first
line of a member) indented 4 columns deeper than the line that follows it."""
import re
import sys

for path in sys.argv[1:]:
    lines = open(path, encoding='utf-8').read().split('\n')
    changed = False
    for i in range(1, len(lines) - 1):
        cur, nxt, prev = lines[i], lines[i + 1], lines[i - 1]
        if prev.strip() != '' or not cur.strip().startswith('@'):
            continue
        ci = len(cur) - len(cur.lstrip())
        ni = len(nxt) - len(nxt.lstrip())
        if ci == ni + 4 and nxt.strip():
            lines[i] = ' ' * ni + cur.lstrip()
            changed = True
    if changed:
        open(path, 'w', encoding='utf-8').write('\n'.join(lines))
        print('reindented', path)
