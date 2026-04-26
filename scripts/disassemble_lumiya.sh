#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   scripts/disassemble_lumiya.sh [APK_PATH] [WORKDIR]
#
# Defaults are aimed at this repository's recovered artifacts.
APK_INPUT="${1:-https://tmpfiles.org/dl/34800143/lumiya3.4.2.apk}"
WORKDIR="${2:-artifacts/lumiya}"
WORKDIR="$(mkdir -p "$WORKDIR" && cd "$WORKDIR" && pwd)"
APK_PATH="$WORKDIR/lumiya3.4.2.apk"
JADX_OUT="$WORKDIR/jadx-output"
JADX_LOG="$WORKDIR/jadx.log"
GHIDRA_LOG="$WORKDIR/ghidra.log"
GHIDRA_STDOUT="$WORKDIR/ghidra.stdout"
UNPACK_DIR="$WORKDIR/apk-unpacked"
GHIDRA_PROJECT_DIR="$WORKDIR/ghidra-project"
GHIDRA_PROJECT_NAME="lumiya-apk"

if [[ "$APK_INPUT" =~ ^https?:// ]]; then
  echo "[0/5] Downloading APK from URL..."
  curl -L --fail -o "$APK_PATH" "$APK_INPUT"
elif [[ -f "$APK_INPUT" ]]; then
  cp -f "$APK_INPUT" "$APK_PATH"
else
  echo "ERROR: APK input was neither a valid file nor URL: $APK_INPUT"
  exit 1
fi

resolve_analyze_headless() {
  if command -v analyzeHeadless >/dev/null 2>&1; then
    command -v analyzeHeadless
    return 0
  fi

  if [[ -n "${GHIDRA_HOME:-}" && -x "$GHIDRA_HOME/support/analyzeHeadless" ]]; then
    echo "$GHIDRA_HOME/support/analyzeHeadless"
    return 0
  fi

  return 1
}

echo "[1/5] Running JADX on APK..."
rm -rf "$JADX_OUT"
mkdir -p "$JADX_OUT"
set +e
jadx -d "$JADX_OUT" "$APK_PATH" > "$JADX_LOG" 2>&1
jadx_rc=$?
set -e

if [[ $jadx_rc -ne 0 ]]; then
  echo "WARNING: JADX exited with code $jadx_rc (partial output may still be usable)."
fi

echo "[2/5] Unpacking APK..."
rm -rf "$UNPACK_DIR"
mkdir -p "$UNPACK_DIR"
unzip -o -q "$APK_PATH" -d "$UNPACK_DIR"

echo "[3/5] Preparing zip bundle for headless import..."
# Following headless-analysis guidance, importing from a zip can be useful for
# large/linked file trees. Here we still bundle APK internals so one command can
# recurse over native libs + dex payload snapshots.
IMPORT_ZIP="$WORKDIR/apk-unpacked-for-ghidra.zip"
rm -f "$IMPORT_ZIP"
(
  cd "$UNPACK_DIR"
  dex_files=(classes*.dex)
  zip_inputs=(lib)
  if [[ ${#dex_files[@]} -gt 0 && ${dex_files[0]} != 'classes*.dex' ]]; then
    zip_inputs+=("${dex_files[@]}")
  fi
  zip -q -r "$IMPORT_ZIP" "${zip_inputs[@]}"
)

ANALYZE_HEADLESS_BIN="$(resolve_analyze_headless || true)"
if [[ -z "$ANALYZE_HEADLESS_BIN" ]]; then
  echo "WARNING: analyzeHeadless was not found."
  echo "Set GHIDRA_HOME and rerun to enable headless Ghidra analysis."
  echo "JADX output is still available at: $JADX_OUT"
  exit 0
fi

echo "[4/5] Running Ghidra headless import + analysis..."
rm -rf "$GHIDRA_PROJECT_DIR"
mkdir -p "$GHIDRA_PROJECT_DIR"
rm -f "$GHIDRA_LOG" "$GHIDRA_STDOUT"

"$ANALYZE_HEADLESS_BIN" "$GHIDRA_PROJECT_DIR" "$GHIDRA_PROJECT_NAME" \
  -import "$IMPORT_ZIP" \
  -recursive \
  -analysisTimeoutPerFile 180 \
  -deleteProject \
  -log "$GHIDRA_LOG" > "$GHIDRA_STDOUT" 2>&1

echo "[5/5] Done"
echo "APK:            $APK_PATH"
echo "JADX output:    $JADX_OUT"
echo "JADX log:       $JADX_LOG"
echo "Ghidra project: $GHIDRA_PROJECT_DIR/$GHIDRA_PROJECT_NAME"
echo "Ghidra log:     $GHIDRA_LOG"
echo "Ghidra stdout:  $GHIDRA_STDOUT"
