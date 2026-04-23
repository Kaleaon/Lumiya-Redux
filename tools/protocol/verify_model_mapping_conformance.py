#!/usr/bin/env python3
"""Verify migrated protocol model mapping guardrails remain documented."""

from pathlib import Path
import sys

MAPPING_DOC = Path("docs/protocol_model_mapping.md")
MODEL_FILE = Path("app/src/main/java/com/lumiyaviewer/lumiya/orm/InventoryEntryDBObject.java")

DOC_REQUIRED = [
    "InventoryEntryDBObject",
    "secondlife/viewer",
    "message_template.msg",
    "_blobField",
    "invType",
    "assetType",
]

MODEL_REQUIRED = [
    "Protocol-derived schema notes",
    "secondlife/viewer",
    "message_template",
]


def _check_required(path: Path, required: list[str], label: str) -> list[str]:
    if not path.exists():
        return [f"Missing {label}: {path}"]
    content = path.read_text(encoding="utf-8")
    return [item for item in required if item not in content]


def main() -> int:
    doc_missing = _check_required(MAPPING_DOC, DOC_REQUIRED, "mapping doc")
    model_missing = _check_required(MODEL_FILE, MODEL_REQUIRED, "model file")

    problems: list[str] = []
    for missing in doc_missing:
        problems.append(f"doc missing token: {missing}")
    for missing in model_missing:
        problems.append(f"model missing token: {missing}")

    if problems:
        print("Model mapping conformance check failed:", file=sys.stderr)
        for problem in problems:
            print(f" - {problem}", file=sys.stderr)
        return 1

    print(f"OK: model mapping conformance anchors present in {MAPPING_DOC} and {MODEL_FILE}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
