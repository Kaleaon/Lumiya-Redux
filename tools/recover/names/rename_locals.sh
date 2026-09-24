#!/usr/bin/env bash
# Rename decompiler-generated locals across the compiled sources and prove
# the build is unchanged.
#
#   tools/recover/names/rename_locals.sh ORIGINAL_APK [WORKDIR]
#
# 1. build + disassemble the current tree (baseline),
# 2. run RenameLocals over every .java that Gradle compiles,
# 3. build + disassemble again and compare with tools/verify/smali_identical.py;
#    files whose classes differ are restored from git and the check repeats
#    until the build is byte-identical.
set -euo pipefail
APK="${1:?usage: $0 ORIGINAL_APK [WORKDIR]}"
ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
WORK="${2:-$ROOT/build/rename}"
SRC="$ROOT/app/src/main/java"
mkdir -p "$WORK/classes" "$WORK/lib"
MVN="${MAVEN_REPO:-https://repo1.maven.org/maven2}"
JP="$WORK/lib/javaparser-core-3.26.2.jar"
[[ -f "$JP" ]] || curl -sSLf -o "$JP" "$MVN/com/github/javaparser/javaparser-core/3.26.2/javaparser-core-3.26.2.jar"
javac -nowarn -d "$WORK/classes" -cp "$JP" "$ROOT/tools/recover/names/RenameLocals.java"

build_smali() {  # outdir
  (cd "$ROOT" && ./gradlew -q :app:assembleDebug)
  SKIP_BUILD=1 "$ROOT/tools/verify/verify_against_apk.sh" "$APK" "$WORK/verify" > /dev/null || true
  rm -rf "$1"; cp -r "$WORK/verify/new-smali" "$1"
}

echo "[1/3] baseline build"
build_smali "$WORK/before"

echo "[2/3] renaming"
grep -v '^#' "$ROOT/tools/recover/bytecode_classes.txt" | sed '/^\s*$/d; s|$|.java|' > "$WORK/excluded.txt" || true
(cd "$SRC" && find . -name '*.java' | sed 's|^\./||' | grep -vFxf "$WORK/excluded.txt") > "$WORK/files.txt"
(cd "$SRC" && xargs java -cp "$WORK/classes:$JP" RenameLocals < "$WORK/files.txt")

echo "[3/3] identity check"
for round in 1 2 3; do
  build_smali "$WORK/after"
  if python3 "$ROOT/tools/verify/smali_identical.py" "$WORK/before" "$WORK/after" > "$WORK/diff.txt"; then
    echo "byte-identical after renaming"
    exit 0
  fi
  # Map differing classes back to their source files and restore them.
  sed -n 's/^DIFFERENT \([^$:]*\)[$:.].*/\1.java/p' "$WORK/diff.txt" | sort -u | while read -r f; do
    echo "restoring $f"
    git -C "$ROOT" checkout -- "app/src/main/java/$f"
  done
done
echo "still not identical; see $WORK/diff.txt" >&2
exit 1
