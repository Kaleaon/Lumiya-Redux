#!/usr/bin/env python3
"""Map Second Life UDP message names to the viewer functions that handle them.

Reads a checkout of secondlife/viewer (a sparse checkout of indra/ is enough),
finds every `setHandlerFunc[Fast](_PREHASH_Name, handler)` registration and
the .cpp that defines each handler, and writes JSON used by
label_messages.py for the "Viewer reference" line of each message class.

  git clone --depth 1 --filter=blob:none --sparse https://github.com/secondlife/viewer.git
  (cd viewer && git sparse-checkout set indra/newview indra/llmessage)
  sl_viewer_handlers.py viewer > tools/recover/reference/sl_viewer_handlers.json

The checked-in JSON was generated from secondlife/viewer
c179f76c01a93fe6a46318be0e1c23a9d3089ddb.
"""
import glob
import json
import os
import re
import sys


def main():
    root = sys.argv[1]
    sources = glob.glob(os.path.join(root, 'indra/**/*.cpp'), recursive=True)
    registrations, definitions = {}, {}
    for path in sources:
        text = open(path, errors='replace').read()
        rel = os.path.relpath(path, root)
        for m in re.finditer(r'setHandlerFunc(?:Fast)?\(\s*(?:_PREHASH_(\w+)|"(\w+)")\s*,\s*&?([\w:]+)', text):
            registrations.setdefault(m.group(1) or m.group(2), (m.group(3), rel))
        for m in re.finditer(r'^\s*(?:static\s+)?void\s+([\w:]+)\s*\(\s*LLMessageSystem\s*\*', text, re.M):
            definitions.setdefault(m.group(1), rel)
    out = {}
    for name, (fn, where) in sorted(registrations.items()):
        out[name] = {'handler': fn,
                     'defined_in': definitions.get(fn) or definitions.get(fn.split('::')[-1]),
                     'registered_in': where}
    json.dump(out, sys.stdout, indent=1)


if __name__ == '__main__':
    main()
