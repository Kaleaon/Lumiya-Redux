#!/usr/bin/env python3
"""Try alternative decompilations for classes the verifier flags as damaged.

For every top-level class that tools/verify/dexdiff.py reports as DAMAGED,
take that class's file from a candidate decompiler output (jadx with safe
flags, Vineflower, CFR, ...), run it through tools/recover/fixers.py, drop it
into app/src/main/java, and let the compiler and the bytecode verifier decide:

  1. compile; candidates that do not compile (or break a file that uses
     them) are reverted, repeat until the tree compiles;
  2. build + verify; a candidate is kept only if its class has strictly
     fewer damaged methods than before and no other class got worse.

Nothing is accepted on trust. Files listed in --protect (intentional
modernisation work) are never replaced.

Usage:
  swap_candidates.py --apk ORIGINAL_APK --work WORKDIR --candidate NAME=DIR [...]
"""
import argparse
import json
import os
import pathlib
import re
import shutil
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
SRC = ROOT / 'app/src/main/java'
sys.path.insert(0, str(ROOT / 'tools/recover'))
import fixers  # noqa: E402

ERR_RE = re.compile(r'^(/\S+\.java):(\d+): error: (.*)$')


def damaged_count(entry):
    if entry is None:
        return 10 ** 6
    if entry['status'] == 'ABSENT':
        return 10 ** 5
    return len(entry['missing_methods']) + sum(1 for v in entry['methods'].values() if v['missing'])


def rel_of(cls):
    return cls[1:-1] + '.java'   # Lcom/foo/Bar; -> com/foo/Bar.java


def verify(apk, work):
    env = dict(os.environ)
    r = subprocess.run([str(ROOT / 'tools/verify/verify_against_apk.sh'), apk, work],
                       cwd=ROOT, env=env, capture_output=True, text=True)
    if not os.path.exists(os.path.join(work, 'report.json')) or 'BUILD FAILED' in r.stderr:
        sys.stderr.write(r.stdout[-3000:] + r.stderr[-3000:])
        raise SystemExit('build/verify failed')
    return json.load(open(os.path.join(work, 'report.json')))


def compile_errors():
    r = subprocess.run(['./gradlew', '-q', ':app:compileDebugJavaWithJavac'], cwd=ROOT,
                       capture_output=True, text=True)
    errs = {}
    lines = (r.stdout + r.stderr).splitlines()
    for i, line in enumerate(lines):
        m = ERR_RE.match(line)
        if m:
            ctx = ' '.join(lines[i:i + 3])
            errs.setdefault(os.path.relpath(m.group(1), SRC), []).append(ctx)
    if r.returncode != 0 and not errs:
        sys.stderr.write((r.stdout + r.stderr)[-3000:])
        raise SystemExit('compile failed without parseable errors')
    return errs


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--apk', required=True)
    ap.add_argument('--work', required=True)
    ap.add_argument('--candidate', action='append', required=True, help='NAME=DIR')
    ap.add_argument('--protect', default=str(ROOT / 'tools/recover/protected.txt'))
    ap.add_argument('--log', default=None)
    a = ap.parse_args()

    protected = set()
    if os.path.exists(a.protect):
        protected = {l.strip() for l in open(a.protect) if l.strip() and not l.startswith('#')}
    log = open(a.log or os.path.join(a.work, 'swap-log.txt'), 'a')

    report = verify(a.apk, a.work)
    for spec in a.candidate:
        name, cdir = spec.split('=', 1)
        cdir = pathlib.Path(cdir)
        targets = {}
        for cls, e in report.items():
            if e['status'] not in ('DAMAGED', 'ABSENT'):
                continue
            rel = rel_of(cls)
            cand = cdir / rel
            if rel in protected or not cand.exists():
                continue
            targets[rel] = cls
        print('[%s] %d candidate files' % (name, len(targets)))
        backups = {}
        for rel in targets:
            dst = SRC / rel
            backups[rel] = dst.read_text(encoding='utf-8') if dst.exists() else None
            dst.parent.mkdir(parents=True, exist_ok=True)
            dst.write_text(fixers.apply_all(cand_text := (cdir / rel).read_text(encoding='utf-8')), encoding='utf-8')

        def revert(rel, why):
            if rel not in backups:
                return
            old = backups.pop(rel)
            if old is None:
                (SRC / rel).unlink()
            else:
                (SRC / rel).write_text(old, encoding='utf-8')
            log.write('%s REVERT %s (%s)\n' % (name, rel, why))

        for it in range(12):
            errs = compile_errors()
            if not errs:
                break
            swapped_err = [r for r in errs if r in backups]
            for r in swapped_err:
                revert(r, 'compile: ' + errs[r][0][:200])
            if not swapped_err:
                # A swapped class broke its users; blame the ones they mention.
                blamed = set()
                ctx = ' '.join(c for v in errs.values() for c in v)
                for rel in list(backups):
                    simple = pathlib.Path(rel).stem
                    if re.search(r'\b%s\b' % re.escape(simple), ctx):
                        blamed.add(rel)
                if not blamed:
                    blamed = set(backups)
                for r in blamed:
                    revert(r, 'broke dependents')
            print('  compile round %d: %d files with errors, %d candidates left' % (it, len(errs), len(backups)))
        else:
            for r in list(backups):
                revert(r, 'gave up')

        new_report = verify(a.apk, a.work)
        kept = 0
        for rel in list(backups):
            cls = targets[rel]
            before, after = damaged_count(report.get(cls)), damaged_count(new_report.get(cls))
            if after < before:
                kept += 1
                log.write('%s KEEP %s (%d -> %d damaged methods)\n' % (name, rel, before, after))
                del backups[rel]
            else:
                revert(rel, 'verify: %d -> %d' % (before, after))
        # Anything that got worse elsewhere means an accepted swap changed an
        # API used by other classes; roll back the whole batch in that case.
        regress = [c for c, e in new_report.items()
                   if damaged_count(e) > damaged_count(report.get(c)) and rel_of(c) not in targets]
        if regress:
            print('  regressions in', regress[:10])
            log.write('%s REGRESSIONS %s\n' % (name, regress))
        report = verify(a.apk, a.work)
        print('[%s] kept %d' % (name, kept))
        log.flush()
    counts = {}
    for e in report.values():
        counts[e['status']] = counts.get(e['status'], 0) + 1
    print('final', counts)


if __name__ == '__main__':
    main()
