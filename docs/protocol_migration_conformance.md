# Protocol modernization conformance map (Second Life upstream references)

This checklist is the migration safety contract for protocol-facing changes in
`slproto/*` and protocol-derived persistence models.

## 1) Message template conformance (`slproto/messages`)

- Source of truth: `recovered/reference/message_template.msg` (mirrors
  `secondlife/master-message-template/message_template.msg`).
- Required check: run `tools/protocol/verify_message_template_conformance.py` to
  validate Java block order and per-block field order against the template.
- Baseline policy: any intentional mismatch delta must update
  `tools/protocol/message_template_mismatches.txt` in the same PR.
- CI entrypoint: `tools/protocol/run_conformance.sh`.

## 2) LLSD model mapping (`slproto/llsd`) to upstream semantics

Use these upstream references when modernizing LLSD parsing/serialization:

| Lumiya class/package | Upstream equivalent | Expected semantics |
| --- | --- | --- |
| `LLSDNode`, `LLSDNodeFactory`, `LLSDNodeType` | `secondlife/viewer` (`indra/llcommon/llsd.h`, `llsd.cpp`) | Node types must preserve LLSD scalar/container distinctions; undefined vs empty values cannot be conflated. |
| `LLSDStreamingParser` | `secondlife/python-llsd` (`llsd.py`) and viewer LLSD parsers | Streaming parse must preserve map/array ordering as emitted, with explicit type tags from XML/binary forms. |
| `slproto/llsd/types/*` (`LLSDMap`, `LLSDArray`, `LLSDUUID`, `LLSDDate`, etc.) | `secondlife/python-llsd` type encoders/decoders | Round-trip encoding must be lossless for UUID, binary blobs, and ISO8601 dates used by caps/inventory payloads. |
| `LLSDSerialized` | `secondlife/viewer` LLSD serialization helpers | Serialization format selection (XML/binary) must remain explicit and deterministic. |

- Normative LLSD edge-case matrix: `docs/llsd_edge_case_conformance.md`.

## 3) Inventory model mapping (`slproto/inventory`, `orm`) to upstream semantics

| Lumiya class/package | Upstream equivalent | Expected semantics |
| --- | --- | --- |
| `SLInventoryEntry`, `SLInventory`, `SLTaskInventory` | `secondlife/viewer` (`indra/llinventory/llinventory.h`, `llinventory.cpp`) | Preserve folder/item identity, parent hierarchy, type, and permission masks exactly. |
| `SLInventoryHTTPFetchRequest`, `SLInventoryUDPFetchRequest` | `secondlife/viewer` inventory fetch pipeline (`newview` + `llinventorymodel`) | HTTP caps and UDP inventory fetch paths must produce equivalent inventory objects for same source content. |
| `InventoryEntryDBObject` (protocol-derived persistence) | Viewer inventory item fields + message-template inventory updates | Stored columns and blob payload must keep upstream permission/sale/inventory metadata semantics. |

- Required mapping ledger for migrated persistence models:
  `docs/protocol_model_mapping.md`.

## 4) Room entity migration rule (protocol-derived storage)

When a protocol-derived greenDAO/SQLite model is migrated to a Room entity,
annotate every schema field with an upstream source reference in code comments.

Required comment format per field:

```java
// Upstream: secondlife/viewer indra/llinventory/... (semantic source)
// Upstream message: UpdateInventoryItem.InventoryData.<FieldName> in message_template.msg
@ColumnInfo(name = "field_name")
public ... fieldName;
```

At minimum, annotate:

- Inventory identity fields (`item_id`, `parent_id`, owner/creator IDs)
- Permission/sale fields (`base_mask`, `owner_mask`, `sale_type`, `sale_price`)
- Type fields (`inv_type`, `asset_type`, folder/type-default flags)

## 5) CI conformance rule for protocol-adjacent changes

`tools/protocol/run_conformance.sh` is required in CI for any PR touching:

- `app/src/main/java/com/lumiyaviewer/lumiya/slproto/**`
- `app/src/main/java/com/lumiyaviewer/lumiya/orm/**`
- `recovered/reference/message_template.msg`
- `tools/protocol/**`
- `docs/protocol_migration_conformance.md`
- `docs/llsd_edge_case_conformance.md`
- `docs/protocol_model_mapping.md`
