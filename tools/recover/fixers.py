"""Mechanical repairs for known decompiler bugs, applied to any Java source
before it is allowed into app/src/main/java. Each fixer targets a bug that
was found by tools/verify/dexdiff.py; add new ones here rather than editing
files by hand so every candidate source gets the same treatment."""
import pathlib
import re
import sys

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))
import migrate_androidx  # noqa: E402
sys.path.insert(0, str(HERE))
import fix_resource_ids  # noqa: E402

PUBLIC_XML = HERE.parent.parent / 'recovered/android/res/values/public.xml'
_ids = None


def unsigned_bytes(text):
    # jadx "replace consts": the literal 255 became Guava's
    # UnsignedBytes.MAX_VALUE, which is a *byte* (-1). `b & 255` turned into
    # `b & -1`, so bytes sign-extend and index arrays out of bounds.
    text = text.replace('UnsignedBytes.MAX_VALUE', '0xFF')
    if 'UnsignedBytes.' not in text:
        text = re.sub(r'^import com\.google\.common\.primitives\.UnsignedBytes;\n', '', text, flags=re.M)
    return text


def renamed_clone(text):
    # jadx renames covariant clone() overrides to moNclone(), which then no
    # longer override Object.clone().
    return re.sub(r'\bmo\d+clone\b', 'clone', text)


def androidx(text):
    counts = {'ok': 0, 'unmapped': {}}

    def sub(m):
        new = migrate_androidx.map_fqn(m.group(0))
        return m.group(0) if new is None else new
    return migrate_androidx.FQN_RE.sub(sub, text)


def resource_ids(text):
    global _ids
    if _ids is None:
        _ids = fix_resource_ids.load(str(PUBLIC_XML))
    return fix_resource_ids.fix_text(text, _ids)[0]


ALL = [androidx, unsigned_bytes, renamed_clone, resource_ids]


def apply_all(text):
    for f in ALL:
        text = f(text)
    return text


if __name__ == '__main__':
    for arg in sys.argv[1:]:
        for p in ([pathlib.Path(arg)] if arg.endswith('.java') else pathlib.Path(arg).rglob('*.java')):
            t = p.read_text(encoding='utf-8')
            n = apply_all(t)
            if n != t:
                p.write_text(n, encoding='utf-8')
                print('fixed', p)
