#!/usr/bin/env python3
"""Ensure protocol modernization docs keep required upstream mapping anchors."""

from pathlib import Path
import sys

DOC = Path("docs/protocol_migration_conformance.md")
REQUIRED_SNIPPETS = [
    "secondlife/viewer",
    "secondlife/python-llsd",
    "LLSD",
    "Inventory",
    "Room entity",
]


def main() -> int:
    if not DOC.exists():
        print(f"Missing required protocol migration doc: {DOC}", file=sys.stderr)
        return 1

    content = DOC.read_text(encoding="utf-8")
    missing = [snippet for snippet in REQUIRED_SNIPPETS if snippet not in content]
    if missing:
        print("Protocol migration doc is missing required anchors:", file=sys.stderr)
        for item in missing:
            print(f" - {item}", file=sys.stderr)
        return 1

    print(f"OK: protocol migration documentation anchors present in {DOC}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
