# Coding standard for recovered code

This adapts the Second Life viewer conventions
([secondlife/viewer](https://github.com/secondlife/viewer), and the Firestorm
fork that follows them) to this Java code base. It applies to every line that
is repaired or recovered, and to anything moved from original bytecode back to
source.

## 1. Behaviour first

* The shipped 3.4.2 bytecode defines correct behaviour. A change that alters
  behaviour is either a repair (dexdiff reports the class `OK` afterwards) or a
  documented intentional change (a line in `tools/verify/accepted.txt` with the
  reason).
* Readability changes must compile to identical code. Check with
  `tools/verify/smali_identical.py` before and after.
* Never hand-edit a decompiled method "to make it compile" without comparing it
  to its smali. That is how the earlier damage got in.

## 2. Names come from the protocol

Second Life already names everything. Use those names, not decompiler or
invented ones.

| Kind | Source of truth | Example |
| --- | --- | --- |
| UDP messages, blocks, fields | `recovered/reference/message_template.msg` | `ImprovedInstantMessage.MessageBlock.Dialog` |
| LLSD keys (caps, login, event queue) | the literal key strings, as in the viewer | `"agent_id"`, `"inventory_host_name"` |
| capabilities | `SLCapability` / viewer `llviewerregion.cpp` | `FetchInventoryDescendents2` |
| volume, prim and sculpt constants | `indra/llmath/llvolume.h` | `LL_PCODE_HOLE_MASK = 0xF0`, `LL_SCULPT_FLAG_MIRROR = 0x80` |
| terrain | `indra/newview/llsurface*.cpp` | 256 m region, 257 vertices per side |
| Android / GL | SDK constant names | `View.GONE`, `PendingIntent.FLAG_UPDATE_CURRENT`, `GLES20.GL_LESS` |

Message classes keep the template's field spelling (`AgentData_Field.AgentID`).
It matches the template and the viewer's `_PREHASH_AgentID`, so it is searchable
across all three code bases.

## 3. No magic numbers

* Use the named constant when one exists (Android SDK, GL, Second Life header).
* Write masks in hex: `0xFF0000`, not `16711680`.
* For a value with no public name, add a `private static final` with a comment
  saying where the value comes from.
* Watch out for decompiler constant substitution: jadx swaps a literal for any
  unrelated constant with the same value (`SLMoveEvents.AGENT_CONTROL_AWAY` used
  as a `PendingIntent` flag, `Ascii.SO` used as a message number). Replace these
  with the right name or the literal. If the constant has a different *type*,
  as with `UnsignedBytes.MAX_VALUE` (byte -1), it also changes behaviour.

## 4. Comments

* **Class Javadoc** says what the class is in Second Life terms and points at
  the reference: message template entry, viewer function
  (`process_improved_im()` in `indra/newview/llviewermessage.cpp`), or LLSD
  capability. Message classes get this automatically from
  `tools/recover/label_messages.py`.
* **Repairs** get a comment saying what 3.4.2 did and what was wrong, e.g.
  "the decompiled source had lost the cases and returned local chat settings
  for every type".
* **Intentional divergences** from 3.4.2 get a comment in the code *and* a
  line in `accepted.txt`.
* **Viewer references** cite the file and function, plus the commit when it
  matters (`secondlife/viewer @ c179f76c01`).
* Remove decompiler banners (`/* loaded from: classes.dex */`, `// from
  class: -$Lambda$…`, satisfied `/* renamed from */`).
  `tools/recover/readability.py` does this, and it is verified byte-identical.
* Keep jadx `Code decompiled incorrectly` warnings until the method has been
  rewritten from smali and verified. They mark the places not to trust.

## 5. Formatting

* 4-space indent, braces on the same line: the existing style, which matches
  the viewer's Java-adjacent code.
* One statement per line in repaired code; split long builder chains.
* Local variable names: the original APK kept parameter names but not locals.
  When you touch a method, rename `i2`/`z`/`str3` to what they hold, and use
  protocol names where they apply (`regionHandle`, `seqNum`, `agentId`).

## 6. Third Party Viewer policy

Lumiya-Redux is a Third Party Viewer. Follow the
[Second Life Policy on Third-Party Viewers](https://secondlife.com/corporate/third-party-viewers):
honest viewer identification at login (channel / version), no circumvention
of permissions, and user data handled per the policy. Login identity lives in
`slproto/auth/SLAuth.SendLoginRequest`.
