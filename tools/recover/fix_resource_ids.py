#!/usr/bin/env python3
"""Replace raw resource-id literals with symbolic R references.

Decompilers print the resource ids that were inlined into the original
classes.dex as plain integers (0x7f0e0012 or 2131623954). Once resources are
recompiled those numbers point at different resources (or none), so the app
shows the wrong string/layout or crashes. The original id -> name table is
recovered/android/res/values/public.xml; every literal found there is
rewritten to the fully qualified com.lumiyaviewer.lumiya.R.<type>.<name>.

Usage: fix_resource_ids.py PUBLIC_XML FILE_OR_DIR...
"""
import pathlib
import re
import sys

LIT_RE = re.compile(r'(?<![\w.])(0x7[fF][0-9a-fA-F]{6}|21[0-9]{8})(?![\w.])')
R = 'com.lumiyaviewer.lumiya.R'


def load(path):
    ids = {}
    for m in re.finditer(r'<public type="([^"]+)" name="([^"]+)" id="(0x[0-9a-f]+)"', open(path).read()):
        ids[int(m.group(3), 16)] = '%s.%s.%s' % (R, m.group(1), m.group(2).replace('.', '_'))
    return ids


def fix_text(text, ids):
    out, n = [], 0
    # Leave comments and string literals alone.
    token_re = re.compile(r'//[^\n]*|/\*.*?\*/|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'', re.S)
    pos = 0
    for m in token_re.finditer(text):
        seg, cnt = sub_code(text[pos:m.start()], ids)
        out.append(seg)
        n += cnt
        out.append(m.group(0))
        pos = m.end()
    seg, cnt = sub_code(text[pos:], ids)
    out.append(seg)
    return ''.join(out), n + cnt


def sub_code(code, ids):
    count = [0]

    def rep(m):
        v = int(m.group(1), 16) if m.group(1).lower().startswith('0x') else int(m.group(1))
        if v in ids:
            count[0] += 1
            return ids[v]
        return m.group(0)
    return LIT_RE.sub(rep, code), count[0]


def main():
    ids = load(sys.argv[1])
    total = files = 0
    for arg in sys.argv[2:]:
        p = pathlib.Path(arg)
        for f in ([p] if p.is_file() else p.rglob('*.java')):
            text = f.read_text(encoding='utf-8')
            new, n = fix_text(text, ids)
            if n:
                f.write_text(new, encoding='utf-8')
                total += n
                files += 1
                print('%4d  %s' % (n, f))
    print('replaced %d literals in %d files' % (total, files), file=sys.stderr)


if __name__ == '__main__':
    main()
