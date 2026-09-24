#!/usr/bin/env python3
"""Check that every View class named in the app's resources exists in the APK.

A layout that names a class the APK does not contain compiles fine and then
throws InflateException at runtime. The recovered resources held copies of
support-library-28 layouts whose class names the AndroidX migration mapped to
classes that do not exist (androidx.appcompat.widget.PreferenceImageView,
com.google.android.material.internal.SnackbarContentLayout).

Usage: tools/verify/layout_classes.py app/build/outputs/apk/debug/app-debug.apk [res_dir]
Exits 1 and lists the missing classes if any are found.
"""
import os
import re
import sys
import zipfile

TAG = re.compile(rb'<([a-z][A-Za-z0-9_]*(?:\.[A-Za-z0-9_$]+)+)')
CLASS_ATTR = re.compile(rb'class="([a-z][A-Za-z0-9_.$]+)"')
DESCRIPTOR = re.compile(rb'L([A-Za-z0-9_/$]+);')


def apk_classes(apk):
    classes = set()
    with zipfile.ZipFile(apk) as z:
        for name in z.namelist():
            if re.fullmatch(r'classes\d*\.dex', name):
                for m in DESCRIPTOR.finditer(z.read(name)):
                    classes.add(m.group(1).decode().replace('/', '.'))
    return classes


def referenced_classes(res_dir):
    refs = {}
    for root, _, files in os.walk(res_dir):
        for f in files:
            if not f.endswith('.xml'):
                continue
            path = os.path.join(root, f)
            data = open(path, 'rb').read()
            for rx in (TAG, CLASS_ATTR):
                for m in rx.finditer(data):
                    refs.setdefault(m.group(1).decode(), []).append(os.path.relpath(path, res_dir))
    return refs


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    apk = sys.argv[1]
    res_dir = sys.argv[2] if len(sys.argv) > 2 else 'app/src/main/res'
    classes = apk_classes(apk)
    missing = {c: where for c, where in referenced_classes(res_dir).items() if c not in classes}
    for c in sorted(missing):
        print('MISSING %s  (%s)' % (c, ', '.join(sorted(set(missing[c])))))
    print('%d view classes referenced, %d missing' % (len(referenced_classes(res_dir)), len(missing)))
    sys.exit(1 if missing else 0)


if __name__ == '__main__':
    main()
