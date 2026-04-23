#!/usr/bin/env python3
"""Detect regressions in slproto/messages vs message_template.msg.

The checker computes current template mismatches and compares them to a committed
baseline allowlist. Any delta indicates a protocol-field/order regression (or an
intentional modernization that must update the baseline in the same PR).
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path


@dataclass
class BlockSpec:
    name: str
    fields: list[str]


@dataclass
class MessageSpec:
    name: str
    blocks: list[BlockSpec]


def parse_message_template(path: Path) -> dict[str, MessageSpec]:
    lines = path.read_text(encoding="utf-8").splitlines()
    specs: dict[str, MessageSpec] = {}
    i = 0
    while i < len(lines):
        line = lines[i].strip()
        if line != "{":
            i += 1
            continue
        i += 1
        while i < len(lines) and (not lines[i].strip() or lines[i].strip().startswith("//")):
            i += 1
        if i >= len(lines):
            break
        header = lines[i].strip().split()
        if len(header) < 2:
            i += 1
            continue
        msg_name = header[0]
        blocks: list[BlockSpec] = []
        i += 1
        while i < len(lines):
            cur = lines[i].strip()
            if not cur or cur.startswith("//"):
                i += 1
                continue
            if cur == "}":
                specs[msg_name] = MessageSpec(msg_name, blocks)
                break
            if cur == "{":
                i += 1
                while i < len(lines) and (not lines[i].strip() or lines[i].strip().startswith("//")):
                    i += 1
                block_header = lines[i].strip().split()
                block_name = block_header[0]
                fields: list[str] = []
                i += 1
                while i < len(lines):
                    inner = lines[i].strip()
                    if not inner or inner.startswith("//"):
                        i += 1
                        continue
                    if inner == "}":
                        blocks.append(BlockSpec(block_name, fields))
                        break
                    if inner.startswith("{"):
                        cleaned = inner.split("//", 1)[0].replace("{", " ").replace("}", " ").strip()
                        parts = cleaned.split()
                        if parts:
                            fields.append(parts[0])
                    i += 1
            i += 1
        i += 1
    return specs


def parse_java_message(path: Path) -> MessageSpec:
    text = path.read_text(encoding="utf-8")
    block_names: list[str] = []
    for line in text.splitlines():
        m = re.search(r"public\s+(\w+)\s+\1_Field\s*;", line)
        if m:
            block_names.append(m.group(1))
            continue
        m = re.search(r"public\s+ArrayList<\s*(\w+)\s*>\s+\1_Fields\s*=", line)
        if m:
            block_names.append(m.group(1))

    blocks: list[BlockSpec] = []
    for name in block_names:
        m = re.search(rf"public\s+static\s+class\s+{re.escape(name)}\s*\{{(.*?)\n\s*\}}", text, re.S)
        fields: list[str] = []
        if m:
            for inner in m.group(1).splitlines():
                mf = re.match(r"\s*public\s+[\w\[\]<>]+\s+(\w+)\s*;", inner)
                if mf:
                    fields.append(mf.group(1))
        blocks.append(BlockSpec(name, fields))
    return MessageSpec(path.stem, blocks)


def collect_mismatches(template: dict[str, MessageSpec], messages_dir: Path) -> list[str]:
    out: list[str] = []
    for java_file in sorted(messages_dir.glob("*.java")):
        java = parse_java_message(java_file)
        ref = template.get(java.name)
        if not ref:
            continue
        ref_block_names = [b.name for b in ref.blocks]
        java_block_names = [b.name for b in java.blocks]
        if ref_block_names != java_block_names:
            out.append(f"{java.name}: block order mismatch")
        by_name = {b.name: b for b in java.blocks}
        for rb in ref.blocks:
            jb = by_name.get(rb.name)
            if jb and rb.fields != jb.fields:
                out.append(f"{java.name}.{rb.name}: field order mismatch")
    return sorted(out)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--template", default="recovered/reference/message_template.msg", type=Path)
    ap.add_argument("--messages-dir", default="app/src/main/java/com/lumiyaviewer/lumiya/slproto/messages", type=Path)
    ap.add_argument("--baseline", default="tools/protocol/message_template_mismatches.txt", type=Path)
    ap.add_argument("--write-baseline", action="store_true")
    args = ap.parse_args()

    mismatches = collect_mismatches(parse_message_template(args.template), args.messages_dir)
    if args.write_baseline:
        args.baseline.write_text("\n".join(mismatches) + "\n", encoding="utf-8")
        print(f"Wrote {len(mismatches)} baseline mismatches to {args.baseline}")
        return 0

    if not args.baseline.exists():
        print(f"Missing baseline file: {args.baseline}", file=sys.stderr)
        return 1
    baseline = [ln.strip() for ln in args.baseline.read_text(encoding="utf-8").splitlines() if ln.strip()]
    bset = set(baseline)
    mset = set(mismatches)

    added = sorted(mset - bset)
    removed = sorted(bset - mset)

    if added or removed:
        print("Message template regression baseline changed.", file=sys.stderr)
        if added:
            print("New mismatches:", file=sys.stderr)
            for x in added[:50]:
                print(f" + {x}", file=sys.stderr)
        if removed:
            print("Resolved mismatches (update baseline if intentional):", file=sys.stderr)
            for x in removed[:50]:
                print(f" - {x}", file=sys.stderr)
        if len(added) > 50 or len(removed) > 50:
            print("(truncated to 50 entries per section)", file=sys.stderr)
        return 1

    print(f"OK: {len(mismatches)} template mismatches match baseline {args.baseline}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
