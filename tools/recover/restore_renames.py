#!/usr/bin/env python3
"""Undo jadx method renames across a source tree.

jadx gives methods synthetic names (m157xe7f9f9c3, mo6clone,
m420com_lumiyaviewer_..._mthref0) and leaves `/* renamed from: NAME */`
above the declaration. A renamed method no longer overrides, is not found by
original bytecode linked from the legacy jar, and breaks reflection. This
maps every such synthetic name back to the original one, tree-wide, and
rewrites enum `valuesCustom()` calls to `values()`.

A rename is only undone when the synthetic name maps to a single original
name. The compiler rejects any resulting clash; the verifier checks the rest.

Usage: restore_renames.py SRC_DIR
"""
import collections
import pathlib
import re
import sys

DECL_RE = re.compile(r'/\* renamed from: (\w+)(?:, reason: [^*]*)? \*/\s*\n(?:\s*(?:@\w+(?:\([^)]*\))?|/\*(?:[^*]|\*(?!/))*\*/)\s*\n)*\s*([\w<>\[\], .?]+?)\s(m[\w$]+)\s*\(')
SYNTH_RE = re.compile(r'^mo?\d+')


def main():
    root = pathlib.Path(sys.argv[1])
    files = list(root.rglob('*.java'))
    mapping = collections.defaultdict(set)
    for f in files:
        for m in DECL_RE.finditer(f.read_text(encoding='utf-8')):
            orig, synth = m.group(1), m.group(3)
            if SYNTH_RE.match(synth) and orig != synth:
                mapping[synth].add(orig)
    mapping = {k: next(iter(v)) for k, v in mapping.items() if len(v) == 1}
    if mapping:
        name_re = re.compile(r'(?<![\w$])(%s)(?![\w$])' % '|'.join(map(re.escape, sorted(mapping, key=len, reverse=True))))
    changed = 0
    for f in files:
        text = f.read_text(encoding='utf-8')
        new = name_re.sub(lambda m: mapping[m.group(1)], text) if mapping else text
        new = re.sub(r'\.valuesCustom\(\)', '.values()', new)
        if new != text:
            f.write_text(new, encoding='utf-8')
            changed += 1
    print('restored %d method names in %d files' % (len(mapping), changed), file=sys.stderr)


if __name__ == '__main__':
    main()
