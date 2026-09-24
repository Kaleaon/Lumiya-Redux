#!/usr/bin/env python3
"""Semantic diff between the original Lumiya dex and a rebuilt dex.

Both inputs are baksmali output trees. Each method is reduced to a
fingerprint that survives recompilation (register allocation, instruction
ordering and compiler choice change; what the code *does* does not):

  * methods invoked, fields read/written, types instantiated/cast/checked,
  * string constants, numeric constants (resource ids resolved to names),
  * whether it throws / has try-catch / has a switch.

A method whose original fingerprint contains something the rebuilt one lacks
is reported as DAMAGED: the recovered source dropped a call, a field store,
a constant, a branch... That is the signature of a bad decompilation (lost
statements, stubbed bodies, "simplified" rewrites). Things present only in
the rebuilt code are reported as ADDED (usually intentional modernisation).

Normalisations applied to both sides so that legitimate toolchain changes do
not show up as damage:
  * android.support.* / android.arch.* / androidx.* -> simple class name
  * desugared lambda classes and their synthetic bodies are folded away;
    lambda bodies are compared per top-level class, not per method
  * access$NNN accessors are compared by target, not by number
  * 0x7fXXXXXX resource ids are replaced with type/name using each side's
    resource table

Usage:
  dexdiff.py ORIG_SMALI ORIG_PUBLIC_XML NEW_SMALI NEW_R_TXT [--json OUT]
             [--prefix com/lumiyaviewer/] [--verbose]
"""
import argparse
import collections
import json
import os
import re
import struct
import sys

SUPPORT_RE = re.compile(r'L(?:android/support|androidx|android/arch)/[\w/$]*?/?([\w$]+);')
LAMBDA_CLASS_RE = re.compile(r'(-\$Lambda\$|\$\$Lambda\$|\$\$ExternalSynthetic|\$\$ExternalSyntheticLambda)')
LAMBDA_METHOD_RE = re.compile(r'(^lambda\$|-lambda\$|^\$r8\$lambda\$|^-\$\$Nest\$|^\$\$Nest\$|^-wrap\d+$|^-get\d+$|^-set\d+$|-mthref-\d+$|^m\d+get.*SwitchesValues$)')
ACCESS_RE = re.compile(r'access\$\d+')
REF_RE = re.compile(r'(L[^;\s]+;)->([^\s(:]+)(\([^)]*\)\S+|:\S+)')
TYPE_RE = re.compile(r'L[^;\s]+;')


APP_PREFIXES = ('Lcom/lumiyaviewer/', 'Luk/co/senab/', 'Lcom/google/vr/', 'Lcom/google/vrtoolkit/')
ANON_RE = re.compile(r'\$\d+;$')
# Reads that disappear on purpose: minSdk was raised to 26, so SDK_INT
# checks were removed. Reported separately, never counted as damage.
INTENTIONAL = ('Landroid/os/Build$VERSION;->SDK_INT',)


def norm_type(t):
    t = SUPPORT_RE.sub(lambda m: 'LSUPPORT/' + m.group(1) + ';', t)
    if LAMBDA_CLASS_RE.search(t):
        return 'LLAMBDA;'
    return t


def norm_owner(t):
    # For library receivers the static type javac picks (Iterable vs List,
    # Editable vs CharSequence) depends on a local's declared type, not on
    # behaviour; compare by method name + descriptor only.
    t = norm_type(t)
    if t == 'Lcom/lumiyaviewer/lumiya/compat/PlatformCompat;':
        return '*'  # redirected platform call (tools/recover/legacy)
    if t == 'LLAMBDA;' or t.startswith(APP_PREFIXES):
        return t
    return '*'


def norm_types(s):
    return TYPE_RE.sub(lambda m: norm_type(m.group(0)), s)


def norm_mname(n):
    if n in ('valuesCustom', '$values'):
        return 'values'  # jadx's alias for the enum values() it could not name
    if LAMBDA_METHOD_RE.search(n) or re.match(r'^m\d+x[0-9a-f]+$', n):
        return 'LAMBDA'
    return ACCESS_RE.sub('access$', n)


def load_public_xml(path):
    ids = {}
    for m in re.finditer(r'<public type="([^"]+)" name="([^"]+)" id="(0x[0-9a-f]+)"', open(path).read()):
        ids[int(m.group(3), 16)] = m.group(1) + '/' + m.group(2).replace('.', '_')
    return ids


def load_r_txt(path):
    ids = {}
    for line in open(path):
        p = line.split()
        if len(p) == 4 and p[0] == 'int' and p[3].startswith('0x'):
            ids[int(p[3], 16)] = p[1] + '/' + p[2]
    return ids


class Method:
    __slots__ = ('invokes', 'fields', 'types', 'strings', 'numbers', 'flags', 'size', 'private')

    def __init__(self):
        self.invokes = collections.Counter()
        self.fields = collections.Counter()
        self.types = collections.Counter()
        self.strings = collections.Counter()
        self.numbers = set()
        self.flags = set()
        self.size = 0
        self.private = False

    def merge(self, o):
        self.invokes.update(o.invokes)
        self.fields.update(o.fields)
        self.types.update(o.types)
        self.strings.update(o.strings)
        self.numbers |= o.numbers
        self.flags |= o.flags
        self.size += o.size


CONST_RE = re.compile(r'^const(?:/4|/16|/high16|-wide/16|-wide/32|-wide/high16|-wide)?\s+\w+,\s*(-?0x[0-9a-fA-F]+)L?')
STRING_RE = re.compile(r'^const-string(?:/jumbo)?\s+\w+,\s*"(.*)"$')


def payload_value(tok):
    tok = tok.strip()
    try:
        if tok.endswith('f') and not tok.startswith('0x'):
            return struct.unpack('>i', struct.pack('>f', float(tok[:-1])))[0]
        if tok.endswith('d') or ('.' in tok and not tok.startswith('0x')):
            return struct.unpack('>q', struct.pack('>d', float(tok.rstrip('d'))))[0]
        return int(tok.rstrip('tsL'), 16)
    except (ValueError, struct.error):
        return None


def parse_smali(path, resmap):
    cls = None
    methods = {}
    cur = None
    in_array = None
    for raw in open(path, encoding='utf-8', errors='replace'):
        line = raw.strip()
        if not line or line.startswith('#') or line.startswith('.line') or line.startswith('.local') \
                or line.startswith('.param') or line.startswith('.prologue') or line.startswith('.end local') \
                or line.startswith('.restart'):
            continue
        if line.startswith('.class'):
            cls = line.split()[-1]
            continue
        if line.startswith('.method'):
            sig = line.split()[-1]
            name, desc = sig.split('(', 1)
            key = norm_mname(name) + '(' + norm_types(desc)
            if name.startswith('access$'):
                # Synthetic accessors exist only when the compiler needs them
                # (private member touched from a nested class); their bodies
                # are compared in the per-class bucket.
                key = 'LAMBDA'
            elif name == '$values':
                # javac 15+ moves the enum $VALUES initialiser out of <clinit>.
                key = '<clinit>()V'
            elif re.match(r'^-get.*SwitchesValues$', name) or name.startswith('$SWITCH_TABLE$'):
                # Enum switch-map helpers: Jack/Eclipse put them in the class,
                # javac in a synthetic $N class. Compare them in the bucket.
                key = 'LAMBDA'
            cur = Method()
            cur.private = ' private ' in line or ' synthetic ' in line
            if key.startswith('LAMBDA('):
                key = 'LAMBDA'
            if key in methods:
                methods[key].merge(cur)
                cur = methods[key]
            else:
                methods[key] = cur
            continue
        if line.startswith('.end method'):
            cur = None
            continue
        if cur is None:
            continue
        op = line.split(None, 1)[0]
        if op == '.array-data':
            in_array = 0
            continue
        if op == '.end' and line.startswith('.end array-data'):
            # dx fills small arrays with indexed aputs, d8 with a payload;
            # record the indices either way.
            cur.numbers.update(i for i in range(2, (in_array or 0) + 1))
            in_array = None
            continue
        if in_array is not None:
            in_array += 1
            v = payload_value(line)
            if v is not None and v not in (0, 1, -1):
                cur.numbers.add(v)
            continue
        if op.startswith('.') or op.startswith(':'):
            if op in ('.catch', '.catchall'):
                cur.flags.add('try')
            if op in ('.packed-switch', '.sparse-switch'):
                cur.flags.add('switch')
            continue
        cur.size += 1
        op = op.replace('/range', '')
        if op.startswith('invoke-'):
            m = REF_RE.search(line)
            if m and m.group(2) == 'desiredAssertionStatus':
                continue  # d8 strips `assert` support
            if m:
                owner = norm_owner(m.group(1))
                if owner == 'LLAMBDA;':
                    cur.flags.add('lambda')
                    continue
                if m.group(2).startswith('access$'):
                    continue
                mname = norm_mname(m.group(2))
                if mname == 'LAMBDA' or re.search(r'SwitchesValues$', m.group(2)):
                    continue  # synthetic accessor / lambda / switch-map helper
                if m.group(2) == '<init>' and ANON_RE.search(m.group(1)):
                    continue  # anonymous-class ctor: captured-args signature varies
                if m.group(2) == '<init>':
                    # Private nested constructors are reached through a synthetic
                    # constructor with a trailing marker parameter: the class
                    # itself (dx/Jack) or Outer$N (javac). Drop the marker.
                    params = re.findall(r'\[*(?:L[^;]+;|[ZBSCIJFD])', m.group(3)[1:m.group(3).index(')')])
                    if params and (params[-1] == m.group(1) or re.search(r'\$\d+;$', params[-1])):
                        m = re.match(r'(L[^;\s]+;)->(<init>)(\(.*\)V)', '%s-><init>(%s)V' % (m.group(1), ''.join(params[:-1])))
                if line[m.start() - 1:m.start()] == '[':
                    owner = '*'  # array clone()
                if m.group(2) in ('equals', 'hashCode', 'toString', 'getClass', 'iterator'):
                    owner = '*'  # java.lang.Object methods: dispatch is virtual either way
                desc = norm_types(m.group(3))
                if owner == '*':
                    desc = desc[:desc.index(')') + 1]  # covariant library returns
                cur.invokes[owner + '->' + norm_mname(m.group(2)) + desc] += 1
        elif op[1:4] == 'get' or op[1:4] == 'put':
            m = REF_RE.search(line)
            if m:
                owner = norm_type(m.group(1))
                rm = re.search(r'/R\$(\w+);$', owner)
                if rm and m.group(3) == ':I' and op.startswith('sget'):
                    # Library R classes are read at runtime; the app's R is
                    # inlined. Compare as the resource name either way.
                    cur.numbers.add('@%s/%s' % (rm.group(1), m.group(2)))
                    continue
                if m.group(2) == '$assertionsDisabled':
                    continue  # d8 compiles `assert` as disabled, as ART runs it
                if owner == 'LLAMBDA;' or 'SwitchesValues' in m.group(2) or m.group(2).startswith(('$SwitchMap$', 'this$', 'val$')):
                    cur.flags.add('lambda')
                    continue
                fname = m.group(2)
                if owner.endswith('_ViewBinding;') and re.match(r'^view(\d+|[0-9a-f]{8})$', fname):
                    fname = 'view<id>'  # ButterKnife 8 decimal vs 10 hex naming
                ref = owner + '->' + fname + norm_types(m.group(3))
                cur.fields[('W ' if 'put' in op else 'R ') + ref] += 1
        elif op in ('new-instance', 'instance-of', 'const-class', 'new-array', 'filled-new-array'):
            if 'array' in op:
                cur.flags.add('newarray')
            m = TYPE_RE.search(line)
            if m:
                t = norm_type(m.group(0))
                if op == 'new-instance' and (t == 'LLAMBDA;' or ANON_RE.search(t)):
                    cur.flags.add('lambda')
                    continue
                kind = 'array' if 'array' in op else op.split('-')[0]
                if op == 'new-array':
                    cur.flags.add('newarray')
                if op == 'filled-new-array':
                    # d8 folds `new-array` + indexed `aput`s into one
                    # instruction; restore the size/index constants dx emits.
                    regs = line[line.index('{') + 1:line.index('}')]
                    if '..' in regs:
                        a, b = [int(x.strip()[1:]) for x in regs.split('..')]
                        count = b - a + 1
                    else:
                        count = len([x for x in regs.split(',') if x.strip()])
                    cur.numbers.update(i for i in range(count + 1) if i > 1)
                cur.types[kind + ' ' + t] += 1
        elif op.startswith('const-string'):
            m = STRING_RE.match(line)
            if m:
                cur.strings[m.group(1)] += 1
        elif op.startswith('const'):
            m = CONST_RE.match(line)
            if m:
                v = int(m.group(1), 16)
                if v & 0xff000000 == 0x7f000000 and v in resmap:
                    cur.numbers.add('@' + resmap[v])
                elif v not in (0, 1, -1):
                    cur.numbers.add(v)
        elif '/lit' in op:
            v = int(line.rsplit(',', 1)[1].strip(), 16)
            if v not in (0, 1, -1):
                cur.numbers.add(v)
        elif op == 'throw':
            cur.flags.add('throw')
    return cls, methods


def load_tree(root, resmap, prefixes):
    classes = {}
    for dp, _, fns in os.walk(root):
        for fn in fns:
            if not fn.endswith('.smali'):
                continue
            rel = os.path.relpath(os.path.join(dp, fn), root)
            if prefixes and not any(rel.startswith(p) for p in prefixes):
                continue
            cls, methods = parse_smali(os.path.join(dp, fn), resmap)
            if cls is None or LAMBDA_CLASS_RE.search(cls):
                continue
            if re.search(r'/R(\$\w+)?;$', cls):
                continue  # generated resource tables; ids are checked by name
            classes[cls] = methods
    return classes


def top_level(cls):
    return cls.split('$', 1)[0].rstrip(';') + ';'


def counter_missing(a, b):
    return sorted(k for k in a if k not in b)


def diff_method(o, n):
    missing = {}
    added = {}
    for attr in ('invokes', 'fields', 'types', 'strings'):
        mo, mn = getattr(o, attr), getattr(n, attr)
        miss = [k for k in counter_missing(mo, mn) if not any(i in k for i in INTENTIONAL)]
        if attr == 'strings':
            # "a" + "b" literals may be folded or split differently.
            joined = '\x00'.join(mn)
            miss = [k for k in miss if k not in joined]
        add = counter_missing(mn, mo)
        if miss:
            missing[attr] = miss
        if add:
            added[attr] = add
    lost = o.numbers - n.numbers
    if 'newarray' in o.flags or o.types.get('array') or any(k.startswith('array ') for k in o.types):
        # dx initialises arrays with one aput per index, d8 with a payload or
        # filled-new-array: the index constants are not behaviour.
        lost = {v for v in lost if not (isinstance(v, int) and 2 <= v <= 64)}
    miss = sorted(map(str, lost))
    add = sorted(map(str, n.numbers - o.numbers))
    if miss:
        missing['numbers'] = miss
    if add:
        added['numbers'] = add
    fm = sorted(o.flags - n.flags - {'lambda', 'newarray'})
    if fm:
        missing['flags'] = fm
    sdk = 'R Landroid/os/Build$VERSION;->SDK_INT:I'
    if missing and o.fields.get(sdk) and not n.fields.get(sdk):
        # A version check against SDK_INT disappeared together with the
        # code it guarded: minSdk 26 made that branch dead (d8 folds it for
        # original bytecode; the source cleanup removed it on purpose).
        added['sdk_folded'] = missing
        missing = {}
    return missing, added


def compare(orig, new):
    report = {}
    tops = sorted({top_level(c) for c in orig})
    for top in tops:
        entry = {'status': 'OK', 'methods': {}, 'missing_methods': [], 'added_methods': []}
        o_classes = {c: m for c, m in orig.items() if top_level(c) == top}
        n_classes = {c: m for c, m in new.items() if top_level(c) == top}
        if not n_classes:
            entry['status'] = 'ABSENT'
            report[top] = entry
            continue
        # Lambda bodies and anonymous-class numbering can legitimately move,
        # so those are compared as one bucket per top-level class.
        o_bucket, n_bucket = Method(), Method()
        for cname, methods in o_classes.items():
            anon = re.search(r'\$\d+;$', cname) is not None
            for mk, m in methods.items():
                if mk == 'LAMBDA' or anon:
                    o_bucket.merge(m)
                    continue
                nm = n_classes.get(cname, {}).get(mk)
                if nm is None:
                    # Private methods can be renamed or inlined without
                    # changing behaviour; their bodies are checked in the
                    # bucket. A missing overridable method breaks dispatch.
                    nested_ctor = mk.startswith('<init>(') and '$' in cname
                    empty_clinit = mk == '<clinit>()V' and m.size <= 1  # bare return-void
                    if not (m.private or nested_ctor or empty_clinit):
                        entry['missing_methods'].append(cname + '->' + mk)
                    o_bucket.merge(m)
                    continue
                miss, add = diff_method(m, nm)
                if miss or add:
                    entry['methods'][cname + '->' + mk] = {'missing': miss, 'added': add, 'orig_size': m.size, 'new_size': nm.size}
        for cname, methods in n_classes.items():
            anon = re.search(r'\$\d+;$', cname) is not None
            for mk, m in methods.items():
                if mk == 'LAMBDA' or anon or mk not in o_classes.get(cname, {}):
                    n_bucket.merge(m)
                    if not (mk == 'LAMBDA' or anon):
                        entry['added_methods'].append(cname + '->' + mk)
        # Accessor/lambda bodies moved into ordinary methods (javac inlines
        # an access$ call as a direct call from the nested class) count as
        # present when found anywhere in the rebuilt class.
        n_all = Method()
        for methods in n_classes.values():
            for m in methods.values():
                n_all.merge(m)
        miss, add = diff_method(o_bucket, n_bucket)
        for kind in ('invokes', 'fields', 'types', 'strings'):
            if kind in miss:
                have = getattr(n_all, kind)
                miss[kind] = [k for k in miss[kind] if k not in have]
                if not miss[kind]:
                    del miss[kind]
        if 'numbers' in miss:
            miss['numbers'] = [v for v in miss['numbers'] if not (v.lstrip('-').isdigit() and int(v) in n_all.numbers) and v not in n_all.numbers]
            if not miss['numbers']:
                del miss['numbers']
        if miss or add:
            entry['methods']['<lambdas/anonymous/moved>'] = {'missing': miss, 'added': add, 'orig_size': o_bucket.size, 'new_size': n_bucket.size}
        damaged = entry['missing_methods'] or any(v['missing'] for v in entry['methods'].values())
        if damaged:
            entry['status'] = 'DAMAGED'
        elif entry['methods'] or entry['added_methods']:
            entry['status'] = 'ADDED_ONLY'
        report[top] = entry
    return report


def apply_accepted(report, path):
    """Differences a human reviewed against the original bytecode and
    judged intentional (modernisation) or codegen-only. Each needs a reason."""
    accepted = {}
    for line in open(path):
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        key, _, reason = line.partition(' ')
        if not reason.strip():
            raise SystemExit('accepted entry without a reason: ' + key)
        accepted[key] = reason.strip()
    for top, e in report.items():
        if e['status'] != 'DAMAGED':
            continue
        for mk, v in e['methods'].items():
            if v['missing'] and (mk in accepted or top + '->' + mk in accepted):
                v['added']['accepted'] = accepted.get(mk) or accepted.get(top + '->' + mk)
                v['added']['accepted_missing'] = v['missing']
                v['missing'] = {}
        e['missing_methods'] = [m for m in e['missing_methods'] if m not in accepted]
        if not e['missing_methods'] and not any(v['missing'] for v in e['methods'].values()):
            e['status'] = 'ACCEPTED'


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('orig_smali')
    ap.add_argument('orig_public_xml')
    ap.add_argument('new_smali')
    ap.add_argument('new_r_txt')
    ap.add_argument('--prefix', action='append', default=None)
    ap.add_argument('--json')
    ap.add_argument('--verbose', action='store_true')
    ap.add_argument('--accept', help='reviewed differences: "Lclass;->method  reason" per line')
    a = ap.parse_args()
    prefixes = a.prefix or ['com/lumiyaviewer/', 'uk/co/senab/', 'com/google/vr/', 'com/google/vrtoolkit/']
    orig = load_tree(a.orig_smali, load_public_xml(a.orig_public_xml), prefixes)
    new_res = load_public_xml(a.new_r_txt) if a.new_r_txt.endswith('.xml') else load_r_txt(a.new_r_txt)
    new = load_tree(a.new_smali, new_res, prefixes)
    report = compare(orig, new)
    if a.accept:
        apply_accepted(report, a.accept)
    counts = collections.Counter(e['status'] for e in report.values())
    if a.json:
        with open(a.json, 'w') as f:
            json.dump(report, f, indent=1, sort_keys=True)
    for top, e in report.items():
        if e['status'] in ('DAMAGED', 'ABSENT'):
            nm = sum(1 for v in e['methods'].values() if v['missing']) + len(e['missing_methods'])
            print('%-8s %4d  %s' % (e['status'], nm, top))
            if a.verbose:
                for mm in e['missing_methods']:
                    print('    missing method', mm)
                for mk, v in e['methods'].items():
                    if v['missing']:
                        print('    %s  (orig %d insns, new %d)' % (mk, v['orig_size'], v['new_size']))
                        for k, vals in v['missing'].items():
                            print('        -%s: %s' % (k, ', '.join(map(str, vals[:8])) + (' ...' if len(vals) > 8 else '')))
    print('SUMMARY', dict(counts), file=sys.stderr)
    return 1 if counts.get('DAMAGED') or counts.get('ABSENT') else 0


if __name__ == '__main__':
    sys.exit(main())
