#!/usr/bin/env python3
"""Verify LLSD edge-case conformance documentation guardrails."""

from pathlib import Path
import sys

DOC = Path("docs/llsd_edge_case_conformance.md")
REQUIRED_SNIPPETS = [
    "secondlife/python-llsd",
    "secondlife/viewer",
    "LLSD-EDGE-001",
    "LLSD-EDGE-002",
    "LLSD-EDGE-003",
    "LLSD-EDGE-004",
    "LLSD-EDGE-005",
    "LLSD-EDGE-006",
    "LLSD-EDGE-007",
    "LLSD-EDGE-008",
]


def main() -> int:
    if not DOC.exists():
        print(f"Missing LLSD conformance doc: {DOC}", file=sys.stderr)
        return 1

    content = DOC.read_text(encoding="utf-8")
    missing = [item for item in REQUIRED_SNIPPETS if item not in content]
    if missing:
        print("LLSD conformance doc is missing required anchors:", file=sys.stderr)
        for item in missing:
            print(f" - {item}", file=sys.stderr)
        return 1

    print(f"OK: LLSD conformance anchors present in {DOC}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
