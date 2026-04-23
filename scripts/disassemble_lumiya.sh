#!/usr/bin/env bash
set -euo pipefail

APK_URL="${1:-https://tmpfiles.org/dl/34800143/lumiya3.4.2.apk}"
WORKDIR="${2:-artifacts/lumiya}"
APK_PATH="$WORKDIR/lumiya3.4.2.apk"
JADX_OUT="$WORKDIR/jadx-output"
JADX_LOG="$WORKDIR/jadx.log"
GHIDRA_LOG="$WORKDIR/ghidra.log"
GHIDRA_STDOUT="$WORKDIR/ghidra.stdout"

mkdir -p "$WORKDIR"

echo "[1/5] Downloading APK..."
curl -L --fail -o "$APK_PATH" "$APK_URL"

echo "[2/5] Running JADX..."
rm -rf "$JADX_OUT"
mkdir -p "$JADX_OUT"
set +e
jadx -d "$JADX_OUT" "$APK_PATH" > "$JADX_LOG" 2>&1
jadx_rc=$?
set -e

if [[ $jadx_rc -ne 0 ]]; then
  echo "JADX exited with code $jadx_rc (often means partial decode issues)."
fi

echo "[3/5] Unpacking APK libraries for Ghidra..."
mkdir -p "$WORKDIR/apk-unpacked"
unzip -o -q "$APK_PATH" -d "$WORKDIR/apk-unpacked"

if ! command -v ghidra-headless >/dev/null 2>&1; then
  echo "ERROR: ghidra-headless not found on PATH."
  exit 2
fi

echo "[4/5] Running Ghidra headless import+analysis..."
mkdir -p "$WORKDIR/ghidra-project"
rm -f "$GHIDRA_LOG" "$GHIDRA_STDOUT"

ghidra-headless "$WORKDIR/ghidra-project" lumiya-apk \
  -import "$WORKDIR/apk-unpacked/lib" \
  -recursive \
  -analysisTimeoutPerFile 120 \
  -deleteproject \
  -log "$GHIDRA_LOG" > "$GHIDRA_STDOUT" 2>&1

echo "[5/5] Done"
echo "APK:          $APK_PATH"
echo "JADX output:  $JADX_OUT"
echo "JADX log:     $JADX_LOG"
echo "Ghidra log:   $GHIDRA_LOG"
echo "Ghidra stdout:$GHIDRA_STDOUT"
