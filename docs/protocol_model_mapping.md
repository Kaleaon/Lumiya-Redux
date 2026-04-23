# Protocol-derived model mapping guardrails (viewer semantic anchors)

This map prevents semantic drift for persisted models derived from SL protocol
messages during migration (greenDAO/SQLite -> Room or equivalent stores).

## Upstream references

- `secondlife/viewer` inventory model (`indra/llinventory/*`)
- `recovered/reference/message_template.msg` inventory update messages

## Required mappings for migrated data models

### `InventoryEntryDBObject` (`app/.../orm/InventoryEntryDBObject.java`)

| Local field(s) | Upstream concept anchor | Guardrail |
| --- | --- | --- |
| `uuid`, `parentUUID`, `parent_id` | Viewer inventory node identity/hierarchy | Preserve item identity and parent lineage exactly across persistence/re-hydration. |
| `name`, `description` | Viewer inventory metadata strings | Preserve UTF-8 text content without type coercion. |
| `invType`, `assetType`, `typeDefault` | `LLInventoryType` / `LLAssetType` semantics | Do not remap enum/int ranges without explicit migration mapping. |
| `version`, `flags`, `creationDate` | InventoryData metadata + template fields | Maintain numeric meaning and signedness compatibility with upstream payloads. |
| `_blobField` packed UUID + permissions + sale info | `InventoryData` permission/sale semantics from message template | Preserve byte layout for owner/creator IDs, permission masks, and sale tuples. |

## Code annotation contract

`InventoryEntryDBObject` (and any newly migrated protocol-adjacent persistence
model) must keep a dedicated mapping comment block containing:

- The literal token: `Protocol-derived schema notes`
- The literal token: `secondlife/viewer`
- The literal token: `message_template`

CI validates these tokens via `tools/protocol/verify_model_mapping_conformance.py`.
