#!/usr/bin/env python3
"""Prove a source-only cleanup did not change the compiled code.

Compares two baksmali trees of the same app built before and after a
readability change (renames, named constants, comments). Allowed
differences: .line / .local / .param debug info, parameter-name
annotations, and added `static final` constant fields (named constants
that javac inlines). Every instruction, every other member and every
class must be identical.

Usage: smali_identical.py BEFORE_SMALI AFTER_SMALI [--prefix com/lumiyaviewer/ ...]
"""
import argparse
import os
import re
import sys

SKIP = re.compile(r'^\s*(\.line |\.local |\.end local|\.restart local|\.param |\.end param|\.prologue|\.source )')


def normalise(path):
    out = []
    in_annotation = False
    for line in open(path, encoding='utf-8', errors='replace'):
        s = line.rstrip()
        if SKIP.match(s):
            continue
        # Parameter names come from source (MethodParameters annotation).
        if s.strip().startswith('.annotation system Ldalvik/annotation/MethodParameters;'):
            in_annotation = True
            continue
        if in_annotation:
            if s.strip() == '.end annotation':
                in_annotation = False
            continue
        # Local register names in comments
        s = re.sub(r'\s+#.*$', '', s)
        if s.strip():
            out.append(s.strip())
    return out


def strip_const_fields(lines):
    """Remove `.field ... static final X = value` (inlined named constants)."""
    return [l for l in lines if not re.match(r'^\.field (\w+ )*static final \w+ = ', l)
            and not re.match(r'^\.field (\w+ )*static final [^ ]+:[IJZBSCFD] = ', l)]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('before')
    ap.add_argument('after')
    ap.add_argument('--prefix', action='append', default=None)
    a = ap.parse_args()
    prefixes = a.prefix or ['com/lumiyaviewer/', 'uk/co/senab/', 'com/google/vr/', 'com/google/vrtoolkit/', 'com/google/protobuf/']
    files = set()
    for root in (a.before, a.after):
        for dp, _, fns in os.walk(root):
            for fn in fns:
                rel = os.path.relpath(os.path.join(dp, fn), root)
                if rel.endswith('.smali') and rel.startswith(tuple(prefixes)):
                    files.add(rel)
    bad = []
    for rel in sorted(files):
        pb, pa = os.path.join(a.before, rel), os.path.join(a.after, rel)
        if not (os.path.exists(pb) and os.path.exists(pa)):
            bad.append((rel, 'class added or removed'))
            continue
        if strip_const_fields(normalise(pb)) != strip_const_fields(normalise(pa)):
            bad.append((rel, 'code differs'))
    for rel, why in bad:
        print('DIFFERENT %s: %s' % (rel, why))
    print('smali_identical: %d classes compared, %d differ' % (len(files), len(bad)), file=sys.stderr)
    return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main())
