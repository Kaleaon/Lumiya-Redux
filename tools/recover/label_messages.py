#!/usr/bin/env python3
"""Label the slproto/messages classes with Second Life protocol names.

The message classes were generated (by the original developer) from
message_template.msg; the decompiler lost everything that tied them back to
it and even printed message numbers as ASCII control-character names
(`byteBuffer.put(Ascii.SO)` is Medium message 14). This rewrites each class
using the upstream template (recovered/reference/message_template.msg, from
secondlife/master-message-template) and the Second Life viewer sources:

  * class Javadoc: the template's description comment, its declaration line
    (name, frequency, number, trust, encoding) and the secondlife/viewer
    function that handles the message, when the viewer registers one;
  * the message-number bytes at the start of PackPayload, written in hex with
    a comment giving the frequency and number;
  * each block class and field annotated with the template block quantity
    and field type (LLUUID, U32, Variable 1, ...).

The header is checked against the template; a mismatch is reported and the
file is left alone, because it would mean the class encodes a different
message number than the protocol says. Only comments and the spelling of
constants change, so the compiled bytecode must stay byte-for-byte the same
(check with tools/verify/verify_against_apk.sh and a smali diff).

Usage: label_messages.py TEMPLATE HANDLERS_JSON VIEWER_COMMIT MESSAGES_DIR
HANDLERS_JSON maps message name -> {handler, defined_in} (see
tools/recover/sl_viewer_handlers.py).
"""
import json
import pathlib
import re
import sys


def parse_template(path):
    text = open(path, encoding='utf-8', errors='replace').read()
    lines = text.split('\n')
    messages = {}
    i = 0
    comment = []
    depth = 0
    cur = None
    block = None
    while i < len(lines):
        raw = lines[i]
        line = raw.strip()
        i += 1
        if depth == 0:
            if line.startswith('//'):
                comment.append(line[2:].strip())
                continue
            if not line:
                if comment and comment[-1] != '':
                    comment.append('')
                continue
            if line == '{':
                depth = 1
                continue
            if line.startswith('version') or line.startswith('udp_deprecated') or line.startswith('udp_blacklisted'):
                comment = []
                continue
            continue
        if line.startswith('//') or not line:
            continue
        fm = re.match(r'\{\s*(\w+)\s+([^}]+?)\s*\}\s*(?://\s*(.*))?$', line)
        if fm and block is not None:
            ftype = ' '.join(fm.group(2).split())
            note = (fm.group(3) or '').strip()
            # Template notes often restate the type ("U8 - IM type").
            note = re.sub(r'^%s\s*[-:]?\s*' % re.escape(ftype), '', note)
            block['fields'][fm.group(1)] = ftype + (' - ' + note if note else '')
            continue
        line = line.split('//')[0].strip()
        if not line:
            continue
        if depth == 1 and cur is None:
            parts = line.split()
            cur = {'name': parts[0], 'freq': parts[1], 'num': parts[2], 'decl': ' '.join(parts),
                   'comment': [c for c in comment if c and not re.match(r'^[-=*]+$', c)], 'blocks': []}
            comment = []
            continue
        if line == '{':
            depth += 1
            continue
        if line == '}':
            depth -= 1
            if depth == 1:
                block = None
            if depth == 0:
                messages[cur['name']] = cur
                cur = None
            continue
        m = re.match(r'\{\s*(\w+)\s+(.+?)\s*\}$', line)
        if m and block is not None:
            block['fields'][m.group(1)] = m.group(2)
            continue
        if depth == 2:
            parts = line.split()
            block = {'name': parts[0], 'quantity': ' '.join(parts[1:]), 'fields': {}}
            cur['blocks'].append(block)
            if raw.rstrip().endswith('{') or (i < len(lines) and lines[i].strip() == '{'):
                pass
    return messages


def header_bytes(msg):
    """Bytes the template says start the packed message body."""
    freq, num = msg['freq'], msg['num']
    n = int(num, 16) if num.lower().startswith('0x') else int(num)
    if freq == 'High':
        return [('put', n & 0xFF)]
    if freq == 'Medium':
        return [('put', 0xFF), ('put', n & 0xFF)]
    if freq == 'Low':
        return [('putShort', 0xFFFF), ('put', (n >> 8) & 0xFF), ('put', n & 0xFF)]
    if freq == 'Fixed':
        return [('putShort', 0xFFFF), ('put', 0xFF), ('put', n & 0xFF)]
    raise ValueError(freq)


ASCII = {'NUL': 0, 'SOH': 1, 'STX': 2, 'ETX': 3, 'EOT': 4, 'ENQ': 5, 'ACK': 6, 'BEL': 7, 'BS': 8,
         'HT': 9, 'LF': 10, 'VT': 11, 'FF': 12, 'CR': 13, 'SO': 14, 'SI': 15, 'DLE': 16, 'DC1': 17,
         'DC2': 18, 'DC3': 19, 'DC4': 20, 'NAK': 21, 'SYN': 22, 'ETB': 23, 'CAN': 24, 'EM': 25,
         'SUB': 26, 'ESC': 27, 'FS': 28, 'GS': 29, 'RS': 30, 'US': 31, 'SP': 32, 'DEL': 127}
PUT_RE = re.compile(r'^(\s*)byteBuffer\.(put|putShort)\((.+)\);\s*$')


# Unrelated byte constants jadx substituted for message-number bytes because
# their values happened to match.
MISNAMED = {'Byte.MIN_VALUE': 0x80, 'PrimProfileParams.LL_PCODE_HOLE_MASK': 0xF0,
            'MutableSLTextureEntryFace.SHINY_MASK': 0xC0}


def const_value(expr):
    expr = expr.strip()
    if expr in MISNAMED:
        return MISNAMED[expr]
    m = re.match(r'^Ascii\.(\w+)$', expr)
    if m:
        return ASCII.get(m.group(1))
    m = re.match(r'^\((byte|short)\)\s*(-?(?:0x[0-9a-fA-F]+|\d+))$', expr)
    if m:
        v = int(m.group(2), 0)
        return v & (0xFF if m.group(1) == 'byte' else 0xFFFF)
    if re.match(r'^-?\d+$', expr):
        return int(expr) & 0xFF
    return None


def javadoc(msg, handler, commit):
    out = ['/**']
    desc = msg['comment'] or [msg['name']]
    for c in desc:
        out.append(' * ' + c.replace('*/', '* /'))
    out.append(' *')
    out.append(' * <p>Template: {@code %s}' % msg['decl'])
    out.append(' * (recovered/reference/message_template.msg).')
    if handler and handler.get('handler'):
        where = handler.get('defined_in') or handler.get('registered_in')
        out.append(' * <p>Viewer reference: {@code %s()} in %s' % (handler['handler'], where))
        out.append(' * (secondlife/viewer @ %s).' % commit[:10])
    out.append(' */')
    return out


def label(path, messages, handlers, commit):
    name = path.stem
    msg = messages.get(name)
    if msg is None:
        return 'no-template'
    text = path.read_text(encoding='utf-8')
    lines = text.split('\n')

    # 1. message-number header in PackPayload
    try:
        start = next(i for i, l in enumerate(lines) if 'void PackPayload(ByteBuffer byteBuffer)' in l)
    except StopIteration:
        return 'no-pack'
    expected = header_bytes(msg)
    if lines[start + 1].strip().startswith('// Message number'):
        start += 1  # already labelled
    got = []
    for j in range(start + 1, start + 1 + len(expected)):
        m = PUT_RE.match(lines[j])
        if not m:
            break
        got.append((m.group(2), const_value(m.group(3)), m.group(1)))
    if [(g[0], g[1]) for g in got] != expected:
        return 'HEADER-MISMATCH %s expected %s got %s' % (name, expected, [(g[0], g[1]) for g in got])
    indent = got[0][2]
    num = msg['num']
    new_header = ['%s// Message number: %s %s (%s).' % (indent, msg['freq'], num, msg['name'])]
    for kind, value in expected:
        if kind == 'putShort':
            new_header.append('%sbyteBuffer.putShort((short) 0x%04X);' % (indent, value))
        else:
            new_header.append('%sbyteBuffer.put((byte) 0x%02X);' % (indent, value))
    if not lines[start].strip().startswith('// Message number'):
        lines[start + 1:start + 1 + len(expected)] = new_header

    text = '\n'.join(lines)

    # 2. field and block annotations
    for block in msg['blocks']:
        text = re.sub(r'(\n(\s*)public static class %s(?:_\w+)? \{)' % re.escape(block['name']),
                      lambda m: m.group(1) if text[:m.start()].rstrip().endswith('*/')
                      else '\n%s/** Block %s, %s. */%s' % (m.group(2), block['name'], block['quantity'], m.group(1)[len(m.group(2)) + 1:].join(['\n' + m.group(2), ''])),
                      text, count=1)
        for field, ftype in block['fields'].items():
            text = re.sub(r'(\n\s*public [\w.<>\[\]]+ %s;)(?![ \t]*//)' % re.escape(field),
                          lambda m: m.group(1) + ' // ' + ftype, text)

    text = re.sub(r'(/\*\* Block [^\n]*\*/)\n\s*\n', r'\1\n', text)

    # 3. class Javadoc, replacing the decompiler banner
    text = text.replace('/* loaded from: classes.dex */\n', '')
    decl = re.search(r'\npublic (?:final )?class %s\b' % re.escape(name), text)
    if decl and '<p>Template:' not in text:
        doc = '\n'.join(javadoc(msg, handlers.get(name), commit))
        text = text[:decl.start() + 1] + doc + '\n' + text[decl.start() + 1:]
    text = re.sub(r'(@Override) // com\.lumiyaviewer\.lumiya\.slproto\.SLMessage', r'\1', text)
    for used, imp in (('Ascii.', 'import com.google.common.base.Ascii;\n'),
                      ('PrimProfileParams.', 'import com.lumiyaviewer.lumiya.slproto.prims.PrimProfileParams;\n'),
                      ('MutableSLTextureEntryFace.', 'import com.lumiyaviewer.lumiya.slproto.textures.MutableSLTextureEntryFace;\n')):
        if used not in text:
            text = text.replace(imp, '')
    path.write_text(text, encoding='utf-8')
    return 'ok'


def main():
    messages = parse_template(sys.argv[1])
    handlers = json.load(open(sys.argv[2]))
    commit = sys.argv[3]
    results = {}
    for path in sorted(pathlib.Path(sys.argv[4]).glob('*.java')):
        r = label(path, messages, handlers, commit)
        results.setdefault(r.split()[0], []).append(r if r != 'ok' else path.stem)
    for k, v in results.items():
        print('%-16s %d' % (k, len(v)))
        if k != 'ok':
            for x in v[:20]:
                print('   ', x)


if __name__ == '__main__':
    main()
