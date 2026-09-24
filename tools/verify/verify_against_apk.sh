#!/usr/bin/env bash
# Build the app and diff its bytecode against the original Lumiya 3.4.2 APK.
#
#   tools/verify/verify_against_apk.sh /path/to/Lumiya_3.4.2.apk [WORKDIR]
#
# Expected APK sha256:
#   cc4bac60dc2df24f5e4e98be293ba4b9061ac237156afab6629793fa2ffc0c5d
#
# Needs: JDK 17+, Android SDK (ANDROID_HOME), python3, and baksmali
# (BAKSMALI_JAR, or it is downloaded to WORKDIR/tools).
#
# Output: WORKDIR/report.txt (one line per damaged class) and
# WORKDIR/report.json (per-method detail). Exit status 1 if any class that
# existed in the original APK lost behaviour.
set -euo pipefail

APK="${1:?usage: $0 ORIGINAL_APK [WORKDIR]}"
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
WORK="${2:-$ROOT/build/verify}"
EXPECTED_SHA=cc4bac60dc2df24f5e4e98be293ba4b9061ac237156afab6629793fa2ffc0c5d
mkdir -p "$WORK/tools"

actual_sha="$(sha256sum "$APK" | cut -d' ' -f1)"
if [[ "$actual_sha" != "$EXPECTED_SHA" ]]; then
  echo "WARNING: APK sha256 is $actual_sha, expected $EXPECTED_SHA" >&2
fi

BAKSMALI_JAR="${BAKSMALI_JAR:-$WORK/tools/baksmali-3.0.9-fat-release.jar}"
if [[ ! -f "$BAKSMALI_JAR" ]]; then
  curl -sSLf -o "$BAKSMALI_JAR" \
    https://github.com/baksmali/smali/releases/download/3.0.9/baksmali-3.0.9-fat-release.jar
fi

baksmali_apk() {  # apk outdir
  local tmp; tmp="$(mktemp -d)"
  rm -rf "$2"; mkdir -p "$2"
  unzip -q -o "$1" 'classes*.dex' -d "$tmp"
  for dex in "$tmp"/classes*.dex; do
    java -jar "$BAKSMALI_JAR" d "$dex" -o "$2" 2>/dev/null
  done
  rm -rf "$tmp"
}

if [[ ! -d "$WORK/orig-smali" || "${REFRESH_ORIG:-0}" == 1 ]]; then
  echo "[1/4] Disassembling original APK"
  baksmali_apk "$APK" "$WORK/orig-smali"
fi

if [[ "${SKIP_BUILD:-0}" != 1 ]]; then
  echo "[2/4] Building :app:assembleDebug"
  (cd "$ROOT" && ./gradlew -q :app:assembleDebug)
fi

echo "[3/4] Disassembling rebuilt APK"
baksmali_apk "$ROOT/app/build/outputs/apk/debug/app-debug.apk" "$WORK/new-smali"

echo "[4/4] Comparing"
R_TXT="$(find "$ROOT/app/build/intermediates/runtime_symbol_list/debug" -name R.txt | head -1)"
set +e
python3 "$ROOT/tools/verify/dexdiff.py" \
  "$WORK/orig-smali" "$ROOT/recovered/android/res/values/public.xml" \
  "$WORK/new-smali" "$R_TXT" \
  --accept "$ROOT/tools/verify/accepted.txt" \
  --json "$WORK/report.json" --verbose > "$WORK/report.txt"
rc=$?
set -e
echo "damaged classes: $(grep -c '^DAMAGED' "$WORK/report.txt" || true)"
echo "report: $WORK/report.txt"
# Original bytecode linked from app/libs is not checked by javac: make sure
# every call/field access between app classes still resolves.
python3 "$ROOT/tools/verify/linkcheck.py" "$WORK/new-smali" > "$WORK/linkcheck.txt" || rc=1
tail -n 20 "$WORK/linkcheck.txt"
exit $rc
