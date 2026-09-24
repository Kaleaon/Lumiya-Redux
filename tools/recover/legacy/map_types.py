#!/usr/bin/env python3
"""stdin: internal type names; stdout: 'old new' lines for every
android.support/android.arch name, using the same mapping as the source
migration (tools/migrate_androidx.py)."""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[2]))
import migrate_androidx  # noqa: E402

for line in sys.stdin:
    name = line.strip()
    if not name.startswith(('android/support/', 'android/arch/')):
        continue
    new = migrate_androidx.map_fqn(name.replace('/', '.'))
    if new is None:
        print('UNMAPPED', name, file=sys.stderr)
        continue
    # map_fqn treats '$' as a separator it keeps; convert packages back.
    pkg, _, cls = new.rpartition('.')
    if '$' in name:
        outer = name.rsplit('/', 1)[1]
        base = new[:len(new) - len(outer)]
        print(name, base.replace('.', '/') + outer)
    else:
        print(name, new.replace('.', '/'))
