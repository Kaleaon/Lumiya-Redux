#!/usr/bin/env bash
# Build app/libs/lumiya-original-classes.jar: the ORIGINAL compiled bytecode
# of every class listed in tools/recover/bytecode_classes.txt, with
# android.support references rewritten to AndroidX. app/build.gradle excludes
# the matching .java files from compilation and links this jar instead.
#
#   tools/recover/legacy/build_legacy_jar.sh ORIGINAL_APK [WORKDIR]
#
# Use this only for classes that no decompiler reproduces faithfully (see
# tools/verify/dexdiff.py). Resource ids inside this bytecode are the
# original ones, which is why app/build.gradle pins ids with --stable-ids.
set -euo pipefail
APK="${1:?usage: $0 ORIGINAL_APK [WORKDIR]}"
ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
WORK="${2:-$ROOT/build/legacy}"
LIST="$ROOT/tools/recover/bytecode_classes.txt"
OUT="$ROOT/app/libs/lumiya-original-classes.jar"
mkdir -p "$WORK/lib" "$WORK/classes" "$(dirname "$OUT")"

MVN="${MAVEN_REPO:-https://repo1.maven.org/maven2}"
fetch() { [[ -f "$WORK/lib/$2" ]] || curl -sSLf -o "$WORK/lib/$2" "$MVN/$1/$2"; }
for a in asm asm-commons asm-tree asm-util asm-analysis; do fetch "org/ow2/asm/$a/9.7.1" "$a-9.7.1.jar"; done
for a in dex-tools dex-translator dex-reader dex-reader-api dex-ir dex-writer d2j-base-cmd \
         d2j-smali d2j-jasmin d2j-external; do
  fetch "de/femtopedia/dex2jar/$a/2.4.24" "$a-2.4.24.jar"
done
fetch org/antlr/antlr-runtime/3.5.3 antlr-runtime-3.5.3.jar
fetch org/antlr/antlr4-runtime/4.13.2 antlr4-runtime-4.13.2.jar
CP="$WORK/lib/*"

if [[ ! -f "$WORK/orig.jar" ]]; then
  unzip -q -o "$APK" classes.dex -d "$WORK"
  java -cp "$CP" com.googlecode.dex2jar.tools.Dex2jarCmd -f -o "$WORK/orig.jar" "$WORK/classes.dex"
fi
javac -nowarn -d "$WORK/classes" -cp "$CP" "$ROOT/tools/recover/legacy/RemapLegacy.java"

grep -v '^#' "$LIST" | sed '/^\s*$/d' > "$WORK/tops.txt"
# ButterKnife only generates Foo_ViewBinding for sources it compiles; bring
# the original generated binding along with each bytecode class.
unzip -Z1 "$WORK/orig.jar" | sed -n 's/_ViewBinding\.class$//p' > "$WORK/bound.txt"
grep -Fxf "$WORK/bound.txt" "$WORK/tops.txt" | sed 's/$/_ViewBinding/' >> "$WORK/tops.txt" || true
# D8-desugared lambda classes live at package level; pull in the ones the
# selected classes use.
java -cp "$WORK/classes:$CP" RemapLegacy dump "$WORK/orig.jar" "$WORK/tops.txt" > "$WORK/refs.txt"
grep -F -- '-$Lambda$' "$WORK/refs.txt" | sed 's/\$[0-9]*$//' >> "$WORK/tops.txt" || true
sort -u -o "$WORK/tops.txt" "$WORK/tops.txt"
java -cp "$WORK/classes:$CP" RemapLegacy dump "$WORK/orig.jar" "$WORK/tops.txt" \
  | python3 "$ROOT/tools/recover/legacy/map_types.py" > "$WORK/map.txt"
java -cp "$WORK/classes:$CP" RemapLegacy remap "$WORK/orig.jar" "$WORK/tops.txt" "$WORK/map.txt" "$OUT"
echo "wrote $OUT"
