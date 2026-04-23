# LLSD edge-case conformance matrix (python-llsd + viewer semantics)

This document captures **normative** LLSD parser/serializer behaviors that must
remain stable while modernizing `slproto/llsd/*`.

## Upstream semantic baselines

- `secondlife/python-llsd` (`llsd.py`) for parse/serialization behavior and
  accepted textual encodings.
- `secondlife/viewer` (`indra/llcommon/llsd.h`, `llsd.cpp`) for value model and
  undefined-vs-empty distinctions.

## Required edge cases

Each case ID below is enforced by CI using
`tools/protocol/verify_llsd_conformance.py`.

| Case ID | Input / operation | Expected behavior |
| --- | --- | --- |
| `LLSD-EDGE-001` | Parse XML `<undef />` | Produces **Undefined** node type (not empty string, empty map, or null surrogate). |
| `LLSD-EDGE-002` | Parse XML `<string />` vs `<string></string>` | Both decode as empty string and serialize back as explicit string type. |
| `LLSD-EDGE-003` | Parse binary/blob payload | Blob bytes are preserved losslessly across parse→serialize cycles. |
| `LLSD-EDGE-004` | Parse UUID textual form | Canonical UUID round-trips with no case/byte-order corruption. |
| `LLSD-EDGE-005` | Parse date / serialize date | ISO8601 timestamps retain instant precision expected by python-llsd. |
| `LLSD-EDGE-006` | Parse map with stable key order in stream | Streaming parser preserves emitted order while decoding tokens. |
| `LLSD-EDGE-007` | Parse array nesting + mixed scalar/container values | Container boundaries and nested type tags are retained exactly. |
| `LLSD-EDGE-008` | Serialize explicit format choice (XML vs binary) | Serialization format must be caller-selected and deterministic. |

## Review rule

Any PR that changes `slproto/llsd/*` parser/serializer code must:

1. Confirm each `LLSD-EDGE-*` case remains true.
2. Update this matrix if behavior intentionally changes.
3. Keep semantics aligned with `secondlife/python-llsd` and
   `secondlife/viewer` references listed above.
