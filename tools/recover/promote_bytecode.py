#!/usr/bin/env python3
"""Move classes from original bytecode back to verified source.

For every class in tools/recover/bytecode_classes.txt:
  1. take a candidate source (the .java in the tree, or a file from another
     decompiler output run through tools/recover/fixers.py),
  2. drop the class from the bytecode list so Gradle compiles it,
  3. compile, applying the error-guided repairs from swap_candidates.py and
     giving up on files that still do not compile,
  4. build + verify; a class is promoted only if the referee reports it OK
     (or ADDED_ONLY / ACCEPTED) and nothing else got worse. Everything else
     goes back to the bytecode list with its previous .java restored.

Usage:
  promote_bytecode.py --apk APK --work DIR [--candidate NAME=DIR ...] [--only CLASS ...]
With no --candidate, the in-tree .java files are tried as they are.
"""
import argparse
import json
import os
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
SRC = ROOT / 'app/src/main/java'
LIST = ROOT / 'tools/recover/bytecode_classes.txt'
sys.path.insert(0, str(ROOT / 'tools/recover'))
import fixers  # noqa: E402
import swap_candidates as sc  # noqa: E402

GOOD = ('OK', 'ADDED_ONLY', 'ACCEPTED')


def read_list():
    head, classes = [], []
    for line in LIST.read_text().splitlines():
        (head if line.startswith('#') or not line.strip() else classes).append(line.strip() if not line.startswith('#') else line)
    return [h for h in head if h], classes


def write_list(head, classes):
    LIST.write_text('\n'.join(head + sorted(set(classes))) + '\n')


def run(cmd, **kw):
    return subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True, **kw)


def build_jar(apk, work):
    r = run([str(ROOT / 'tools/recover/legacy/build_legacy_jar.sh'), apk, os.path.join(work, 'legacy')])
    if r.returncode != 0:
        sys.stderr.write(r.stdout[-2000:] + r.stderr[-2000:])
        raise SystemExit('jar build failed')


def verify(apk, work):
    path = os.path.join(work, 'report.json')
    if os.path.exists(path):
        os.remove(path)
    run([str(ROOT / 'tools/verify/verify_against_apk.sh'), apk, work])
    path = os.path.join(work, 'report.json')
    if not os.path.exists(path):
        raise SystemExit('verify produced no report')
    return json.load(open(path))


def status(report, rel):
    e = report.get('L' + rel + ';')
    return e['status'] if e else 'MISSING'


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--apk', required=True)
    ap.add_argument('--work', required=True)
    ap.add_argument('--candidate', action='append', default=[])
    ap.add_argument('--only', action='append', default=None)
    a = ap.parse_args()
    log = open(os.path.join(a.work, 'promote-log.txt'), 'a')
    rounds = [('in-tree', None)] + [tuple(c.split('=', 1)) for c in a.candidate]
    for name, cdir in rounds:
        head, bytecode = read_list()
        trial = [c for c in bytecode if (a.only is None or c in a.only)]
        if cdir:
            trial = [c for c in trial if (pathlib.Path(cdir) / (c + '.java')).exists()]
        if not trial:
            continue
        backups = {c: (SRC / (c + '.java')).read_text(encoding='utf-8') if (SRC / (c + '.java')).exists() else None for c in trial}
        if cdir:
            for c in trial:
                text = (pathlib.Path(cdir) / (c + '.java')).read_text(encoding='utf-8')
                (SRC / (c + '.java')).write_text(fixers.apply_all(text), encoding='utf-8')
        write_list(head, [c for c in bytecode if c not in trial])
        build_jar(a.apk, a.work)
        print('[%s] trying %d classes' % (name, len(trial)), flush=True)

        pending = set(trial)
        attempts = {}

        def give_up(c, why):
            pending.discard(c)
            old = backups[c]
            if old is not None:
                (SRC / (c + '.java')).write_text(old, encoding='utf-8')
            log.write('%s BACK %s (%s)\n' % (name, c, why[:300]))

        for it in range(25):
            errs = sc.compile_errors()
            if not errs:
                break
            touched = False
            for rel, msgs in errs.items():
                c = rel[:-5]
                if c in pending:
                    attempts[c] = attempts.get(c, 0) + 1
                    if attempts[c] <= 4 and sc.repair(SRC / rel, msgs):
                        touched = True
                        continue
                    give_up(c, 'compile: ' + msgs[0])
                    touched = True
            if not touched:
                # Errors only in files we did not touch: a trial class changed
                # an API they use. Blame trial classes named in those files.
                ctx = ' '.join((SRC / f).read_text(encoding='utf-8') for f in errs if (SRC / f).exists())
                blamed = [c for c in pending if re.search(r'\b%s\b' % re.escape(c.rsplit('/', 1)[1]), ctx)] or list(pending)
                for c in blamed:
                    give_up(c, 'broke dependents')
            # Classes given up on go back to bytecode before the next compile.
            write_list(head, [c for c in bytecode if c not in pending])
            build_jar(a.apk, a.work)
            print('  round %d: %d files with errors, %d still trying' % (it, len(errs), len(pending)), flush=True)
        else:
            for c in list(pending):
                give_up(c, 'compile rounds exhausted')
            write_list(head, [c for c in bytecode if c not in pending])
            build_jar(a.apk, a.work)

        report = verify(a.apk, a.work)
        failed = [c for c in pending if status(report, c) not in GOOD]
        for c in failed:
            give_up(c, 'verify: %s' % status(report, c))
        for c in pending:
            log.write('%s PROMOTED %s (%s)\n' % (name, c, status(report, c)))
        write_list(head, [c for c in bytecode if c not in pending])
        build_jar(a.apk, a.work)
        report = verify(a.apk, a.work)
        bad = [k for k, e in report.items() if e['status'] not in GOOD]
        print('[%s] promoted %d, back to bytecode %d, damaged after round: %d %s'
              % (name, len(pending), len(trial) - len(pending), len(bad), bad[:5]), flush=True)
        log.flush()
        if bad:
            raise SystemExit('regression after round %s: %s' % (name, bad))


if __name__ == '__main__':
    main()
