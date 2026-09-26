#!/usr/bin/env python3
"""Check that every method/field reference to an app class resolves.

javac proves this for code compiled together, but not for original bytecode
linked in as a jar (tools/recover/legacy) or for anything reached by
reflection-free synthetic calls: a renamed method in recompiled source makes
the preserved bytecode throw NoSuchMethodError at runtime. This runs over the
baksmali tree of the built APK.

Usage: linkcheck.py NEW_SMALI [--prefix com/lumiyaviewer/ ...]
Exit status 1 if any reference is unresolved.
"""
import argparse
import os
import re
import sys

REF_RE = re.compile(r'(L[^;\s]+;)->([^\s(:]+)(\([^)]*\)\S+|:\S+)')


def load(root):
    classes = {}
    refs = []
    for dp, _, fns in os.walk(root):
        for fn in fns:
            if not fn.endswith('.smali'):
                continue
            cls, sup, ifaces, members = None, None, [], set()
            for line in open(os.path.join(dp, fn), encoding='utf-8', errors='replace'):
                s = line.strip()
                if s.startswith('.class'):
                    cls = s.split()[-1]
                elif s.startswith('.super'):
                    sup = s.split()[-1]
                elif s.startswith('.implements'):
                    ifaces.append(s.split()[-1])
                elif s.startswith('.method'):
                    members.add(s.split()[-1])
                elif s.startswith('.field'):
                    decl = s.split(' = ')[0].split()[-1]
                    members.add(decl)
                elif s.startswith(('invoke-', 'iget', 'iput', 'sget', 'sput')):
                    m = REF_RE.search(s)
                    if m:
                        refs.append((cls, m.group(1), m.group(2) + m.group(3)))
            classes[cls] = (sup, ifaces, members)
    return classes, refs


def resolves(classes, owner, member, seen=None):
    if owner not in classes:
        return None  # framework/library: not our business
    seen = seen or set()
    if owner in seen:
        return False
    seen.add(owner)
    sup, ifaces, members = classes[owner]
    if member in members:
        return True
    for parent in [sup] + ifaces:
        if parent is None:
            continue
        r = resolves(classes, parent, member, seen)
        if r is None or r:
            return True  # reached a library type: assume it defines it
    return False


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('smali')
    ap.add_argument('--prefix', action='append', default=None)
    a = ap.parse_args()
    prefixes = tuple('L' + p for p in (a.prefix or ['com/lumiyaviewer/', 'com/google/vr/', 'com/google/vrtoolkit/']))
    classes, refs = load(a.smali)
    bad = set()
    for src, owner, member in refs:
        if not owner.startswith(prefixes):
            continue
        # fields are referenced as name:Type, declared as name:Type
        if resolves(classes, owner, member) is False:
            bad.add((src, owner, member))
    for b in sorted(bad):
        print('UNRESOLVED %s -> %s->%s' % b)
    print('linkcheck: %d unresolved references' % len(bad), file=sys.stderr)
    return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main())
