#!/usr/bin/env python3
"""Report the migration state of every JVM production source file."""

from __future__ import annotations

import argparse
import csv
from collections import Counter
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[2]
SOURCE_ROOT = ROOT / "app/src/main/java"
MAPPING_FILE = ROOT / "rust-mirror/mapping.csv"


def rust_mapping_rows() -> list[dict[str, str]]:
    if not MAPPING_FILE.exists():
        return []
    with MAPPING_FILE.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream))


def rust_mappings() -> dict[str, str]:
    return {
        row["jvm_source"]: f"rust-mirror/{row['rust_source']}"
        for row in rust_mapping_rows()
    }


def source_rows() -> list[dict[str, str]]:
    rows = []
    mappings = rust_mappings()
    for source in sorted(SOURCE_ROOT.rglob("*")):
        if source.suffix not in {".java", ".kt"}:
            continue
        relative = source.relative_to(SOURCE_ROOT)
        rows.append(
            {
                "source": relative.as_posix(),
                "language": "kotlin" if source.suffix == ".kt" else "java",
                "package": ".".join(relative.parts[:-1]),
                "rust_counterpart": mappings.get(relative.as_posix(), ""),
            }
        )
    return rows


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--csv", action="store_true", help="emit one row per source")
    parser.add_argument(
        "--fail-if-empty", action="store_true", help="fail when no JVM sources are found"
    )
    parser.add_argument(
        "--check", action="store_true", help="validate that Rust mappings are not stale"
    )
    args = parser.parse_args()
    rows = source_rows()
    if args.fail_if_empty and not rows:
        print(f"no JVM sources found below {SOURCE_ROOT}", file=sys.stderr)
        return 1
    if args.check:
        sources = {row["source"] for row in rows}
        errors = []
        mapping_rows = rust_mapping_rows()
        mapped_sources = [row["jvm_source"] for row in mapping_rows]
        duplicates = sorted(
            source for source in set(mapped_sources) if mapped_sources.count(source) > 1
        )
        errors.extend(f"duplicate JVM mapping: {source}" for source in duplicates)
        allowed_statuses = {"behavior", "boundary", "contract"}
        errors.extend(
            f"invalid mapping status for {row['jvm_source']}: {row['status']}"
            for row in mapping_rows
            if row["status"] not in allowed_statuses
        )
        for source, counterpart in rust_mappings().items():
            if source not in sources:
                errors.append(f"mapped JVM source does not exist: {source}")
            if not (ROOT / counterpart).is_file():
                errors.append(f"mapped Rust source does not exist: {counterpart}")
        if errors:
            print("\n".join(errors), file=sys.stderr)
            return 1
    if args.csv:
        writer = csv.DictWriter(sys.stdout, fieldnames=rows[0].keys() if rows else ())
        if rows:
            writer.writeheader()
            writer.writerows(rows)
        return 0

    languages = Counter(row["language"] for row in rows)
    print(f"production JVM sources: {len(rows)}")
    print(f"kotlin: {languages['kotlin']}")
    print(f"java awaiting review: {languages['java']}")
    print(f"mapped Rust counterparts: {sum(bool(row['rust_counterpart']) for row in rows)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
