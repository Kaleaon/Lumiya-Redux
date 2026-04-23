# Lumiya disassembly log diagnosis (2026-04-23)

## Errors diagnosed

### 1) `ghidra-headless` launcher failed
Observed error:
- `/usr/local/bin/ghidra-headless: ... /opt/dev-tools/ghidra_11.2.1_PUBLIC/support/analyzeHeadless: No such file or directory`

Root cause:
- The wrapper script existed but its target Ghidra installation directory was missing.

Fix applied in environment:
- Installed Ghidra 11.2.1 into `/opt/dev-tools/ghidra_11.2.1_PUBLIC`.

### 2) Ghidra JDK prompt failure in non-interactive shell
Observed error:
- `Unable to prompt user for JDK path, no TTY detected.`

Root cause:
- Ghidra 11.2.1 requires Java 21+, while environment initially had Java 17.

Fix applied in environment:
- Installed `openjdk-21-jdk-headless`, making `java` resolve to 21.0.10.

### 3) JADX non-zero exit
Observed error:
- `ERROR - finished with errors, count: 2` and exit code 3.

Root cause:
- Partial decompilation issues in a small number of classes/resources; this is common for obfuscated APKs.

Status:
- Output was still produced successfully under `artifacts/lumiya/jadx-output`.

## Current workflow

Use:

```bash
scripts/disassemble_lumiya.sh
```

This downloads the APK, runs JADX, unpacks native libraries, and runs Ghidra headless analysis.
