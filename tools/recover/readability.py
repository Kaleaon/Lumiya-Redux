#!/usr/bin/env python3
"""Make decompiled Java readable without changing what it compiles to.

Every rule here only changes spelling: a magic number becomes the platform
or protocol constant with the same value, a decimal mask becomes hex, a
decompiler banner comment is dropped. javac inlines constants, so the dex
must be identical before and after; tools/verify/smali_identical.py checks
that. Rules that would change code (even equivalently) do not belong here.

Constants are named after their source of truth: Android SDK constants,
OpenGL ES enums, and for Second Life data the names used by the
secondlife/viewer sources (llvolume.h, llregionhandle.h, ...).

Usage: readability.py FILE_OR_DIR...
"""
import pathlib
import re
import sys

# --- decompiler noise ------------------------------------------------------
NOISE = [
    (re.compile(r'^/\* loaded from: classes\.dex \*/\n', re.M), ''),
    (re.compile(r' // from class: [^\n]*'), ''),
    (re.compile(r'^[ \t]*/\* JADX INFO: [^\n]*\*/\n', re.M), ''),
    (re.compile(r'(@Override) // [\w.$, ]+'), r'\1'),
    (re.compile(r'(R\.\w+\.\w+) /\* -?\d+ \*/'), r'\1'),
]
RENAMED = re.compile(r'^([ \t]*)/\* renamed from: (\w+)(?:, reason: [^*]*)? \*/\n((?:[ \t]*@[^\n]*\n)*[^\n(]*\b(\w+)\()', re.M)

# --- Android SDK constants (value -> name), by call site --------------------
VISIBILITY = {'0': 'View.VISIBLE', '4': 'View.INVISIBLE', '8': 'View.GONE'}
UNIT = {'0': 'TypedValue.COMPLEX_UNIT_PX', '1': 'TypedValue.COMPLEX_UNIT_DIP', '2': 'TypedValue.COMPLEX_UNIT_SP'}
TOAST = {'0': 'Toast.LENGTH_SHORT', '1': 'Toast.LENGTH_LONG'}
PENDING_INTENT = {'SLMoveEvents.AGENT_CONTROL_AWAY': 'PendingIntent.FLAG_UPDATE_CURRENT',
                  '134217728': 'PendingIntent.FLAG_UPDATE_CURRENT',
                  '1073741824': 'PendingIntent.FLAG_ONE_SHOT',
                  '268435456': 'PendingIntent.FLAG_CANCEL_CURRENT',
                  '0': '0'}
INTENT_FLAGS = {'SLMoveEvents.AGENT_CONTROL_TURN_RIGHT': 'Intent.FLAG_ACTIVITY_CLEAR_TOP',
                '67108864': 'Intent.FLAG_ACTIVITY_CLEAR_TOP',
                '268435456': 'Intent.FLAG_ACTIVITY_NEW_TASK',
                '536870912': 'Intent.FLAG_ACTIVITY_SINGLE_TOP',
                '32768': 'Intent.FLAG_ACTIVITY_CLEAR_TASK',
                '131072': 'Intent.FLAG_ACTIVITY_REORDER_TO_FRONT',
                '1073741824': 'Intent.FLAG_ACTIVITY_NO_HISTORY'}

# --- constants jadx substituted from unrelated classes ----------------------
# Same value, misleading name. Replaced by the literal, in hex for masks.
FOREIGN = {
    'Ascii.DEL': '0x7F', 'Ascii.CAN': '24', 'Ascii.SO': '14', 'Ascii.NAK': '21', 'Ascii.FS': '28',
    'ViewCompat.MEASURED_STATE_MASK': '0xFF000000', 'ViewCompat.MEASURED_SIZE_MASK': '0x00FFFFFF',
    'MotionEventCompat.ACTION_POINTER_INDEX_MASK': '0xFF00',
    'InputDeviceCompat.SOURCE_ANY': '0xFFFFFF00',
    'SLMoveEvents.AGENT_CONTROL_ROTATION': '0x3C0',
}
# Per-file names with a real meaning in that file.
FILE_RULES = {
    'render/DrawableObject.java': [('InputDeviceCompat.SOURCE_DPAD', 'GLES10.GL_LESS')],
    'render/WindlightSky.java': [('InputDeviceCompat.SOURCE_DPAD', 'GLES20.GL_LESS')],
    'render/BoundingBox.java': [('InputDeviceCompat.SOURCE_DPAD', 'GLES30.GL_LESS')],
    # Region terrain is 256 m square sampled at 1 m: 257 vertices per side.
    'slproto/terrain/TerrainData.java': [('InputDeviceCompat.SOURCE_KEYBOARD', 'REGION_VERTICES_PER_SIDE')],
    # llvolume.h: const U8 LL_SCULPT_FLAG_MIRROR = 128;
    'slproto/prims/PrimVolumeParams.java': [('LL_SCULPT_FLAG_MIRROR = Byte.MIN_VALUE', 'LL_SCULPT_FLAG_MIRROR = (byte) 0x80')],
    # Sign-extend an 8-bit terse value: v >= 128 ? v - 256 : v.
    'slproto/types/LLTersePacking.java': [('i2 + InputDeviceCompat.SOURCE_ANY', 'i2 + (-256)')],
    'base64/Base64.java': [('Ascii.CR', "(byte) '\\r'")],
}
FILE_CONSTANTS = {
    'slproto/terrain/TerrainData.java':
        '    /** Terrain vertices along one region edge: 256 one-metre cells + 1 (llsurface.cpp). */\n'
        '    private static final int REGION_VERTICES_PER_SIDE = 257;\n',
}

MASK_DECIMALS = {'16711680': '0xFF0000', '65280': '0xFF00', '4294967295L': '0xFFFFFFFFL',
                 '16777215': '0xFFFFFF', '-16777216': '0xFF000000'}


def add_import(text, fqcn):
    simple = fqcn.rsplit('.', 1)[1]
    if re.search(r'^import [\w.]+\.%s;' % simple, text, re.M):
        return text if ('import %s;' % fqcn) in text else None  # clash with another class
    if re.search(r'\bclass %s\b' % simple, text):
        return None
    m = re.search(r'^import ', text, re.M)
    at = m.start() if m else text.index('\n', text.index('package ')) + 1
    return text[:at] + 'import %s;\n' % fqcn + ('' if m else '\n') + text[at:]


def call_arg_rule(text, call, table, fqcn, arg_index=0, nargs=None):
    """Replace a literal argument of `call(` using table, importing fqcn."""
    changed = False

    def rep(m):
        nonlocal changed
        args = split_args(m.group(2))
        if args is None or (nargs and len(args) != nargs) or arg_index >= len(args):
            return m.group(0)
        idx = arg_index if arg_index >= 0 else len(args) + arg_index
        old = args[idx].strip()
        new = table.get(old)
        if new is None:
            tern = re.match(r'^(.*\?\s*)(-?\d+)(\s*:\s*)(-?\d+)$', old, re.S)
            if tern and tern.group(2) in table and tern.group(4) in table:
                new = tern.group(1) + table[tern.group(2)] + tern.group(3) + table[tern.group(4)]
            else:
                return m.group(0)
        if new == old:
            return m.group(0)
        lead = args[idx][:len(args[idx]) - len(args[idx].lstrip())]
        args[idx] = lead + new
        changed = True
        return m.group(1) + ','.join(args) + ')'
    new = re.sub(r'(\b%s\()((?:[^()]|\((?:[^()]|\([^()]*\))*\))*)\)' % re.escape(call), rep, text)
    if changed and fqcn:
        with_import = add_import(new, fqcn)
        if with_import is None:
            return text
        new = with_import
    return new


def split_args(s):
    out, depth, cur = [], 0, ''
    for ch in s:
        if ch in '([{':
            depth += 1
        elif ch in ')]}':
            depth -= 1
        if ch == ',' and depth == 0:
            out.append(cur)
            cur = ''
        else:
            cur += ch
    out.append(cur)
    return out


def clean(path, text):
    rel = str(path).split('/java/', 1)[-1]
    for rx, rep in NOISE:
        text = rx.sub(rep, text)
    # "renamed from" is only noise once the name is back to the original.
    text = RENAMED.sub(lambda m: m.group(3) if m.group(2) == m.group(4) else m.group(0), text)

    text = call_arg_rule(text, 'setVisibility', VISIBILITY, 'android.view.View')
    text = call_arg_rule(text, 'TypedValue.applyDimension', UNIT, None)
    text = call_arg_rule(text, 'Toast.makeText', TOAST, None, arg_index=-1)
    for fn in ('PendingIntent.getActivity', 'PendingIntent.getService', 'PendingIntent.getBroadcast'):
        text = call_arg_rule(text, fn, PENDING_INTENT, None, arg_index=-1)
    if 'Intent' in text:
        text = re.sub(r'(\b\w*[iI]ntent\w*\.addFlags\()(SLMoveEvents\.AGENT_CONTROL_TURN_RIGHT|\d+)\)',
                      lambda m: m.group(1) + INTENT_FLAGS.get(m.group(2), m.group(2)) + ')', text)
    text = text.replace('requestWindowFeature(1);', 'requestWindowFeature(Window.FEATURE_NO_TITLE);')
    text = text.replace('getWindow().setFlags(1024, 1024);',
                        'getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);')
    for name, fq in (('Window.FEATURE_NO_TITLE', 'android.view.Window'), ('WindowManager.LayoutParams', 'android.view.WindowManager'),
                     ('GLES10.GL_LESS', 'android.opengl.GLES10'), ('GLES20.GL_LESS', 'android.opengl.GLES20'),
                     ('GLES30.GL_LESS', 'android.opengl.GLES30'), ('PendingIntent.', 'android.app.PendingIntent'),
                     ('Intent.FLAG_', 'android.content.Intent')):
        if name in text:
            text = add_import(text, fq) or text

    for old, new in FILE_RULES.get(rel.replace('com/lumiyaviewer/lumiya/', ''), []):
        text = text.replace(old, new)
    const = FILE_CONSTANTS.get(rel.replace('com/lumiyaviewer/lumiya/', ''))
    if const and const.strip() not in text:
        m = re.search(r'\n(public |final |abstract )*class \w+[^{]*\{\n', text)
        text = text[:m.end()] + const + text[m.end():]
    for old, new in FOREIGN.items():
        text = re.sub(r'\b%s\b' % re.escape(old), new, text)
    for old, new in MASK_DECIMALS.items():
        text = re.sub(r'([&|]\s*)%s\b' % re.escape(old), lambda m: m.group(1) + new, text)
        text = re.sub(r'\b%s(\s*[&|])' % re.escape(old), lambda m: new + m.group(1), text)

    # Drop imports that are no longer used.
    for imp in re.findall(r'^import ([\w.]+);\n', text, re.M):
        simple = imp.rsplit('.', 1)[1]
        body = re.sub(r'^import [^\n]*\n', '', text, flags=re.M)
        if not re.search(r'\b%s\b' % re.escape(simple), body):
            text = text.replace('import %s;\n' % imp, '', 1)
    return text


def main():
    changed = 0
    for arg in sys.argv[1:]:
        p = pathlib.Path(arg)
        for f in ([p] if p.is_file() else sorted(p.rglob('*.java'))):
            t = f.read_text(encoding='utf-8')
            n = clean(f, t)
            if n != t:
                f.write_text(n, encoding='utf-8')
                changed += 1
    print('readability: %d files changed' % changed, file=sys.stderr)


if __name__ == '__main__':
    main()
