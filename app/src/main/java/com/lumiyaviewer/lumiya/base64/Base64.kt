package com.lumiyaviewer.lumiya.base64

import java.util.Arrays

object Base64 {
    @JvmField
    val CA: CharArray = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray()

    @JvmField
    val IA: IntArray = IntArray(256).also { ia ->
        Arrays.fill(ia, -1)
        for (i in CA.indices) {
            ia[CA[i].code] = i
        }
        ia[61] = 0 // '='
    }

    @JvmStatic
    fun decode(str: String?): ByteArray? {
        val length = str?.length ?: 0
        if (length == 0) return ByteArray(0)
        str!!
        var illegals = 0
        for (j in 0 until length) {
            if (IA[str[j].code] < 0) illegals++
        }
        if ((length - illegals) % 4 != 0) return null
        var end = length
        var padCount = 0
        while (end > 1) {
            end--
            if (IA[str[end].code] > 0) break
            if (str[end] == '=') padCount++
        }
        val outLen = (((length - illegals) * 6) shr 3) - padCount
        val bytes = ByteArray(outLen)
        var d = 0
        var s = 0
        while (d < outLen) {
            var i8 = 0
            var sPos = s
            var j = 0
            while (j < 4) {
                val nextS = sPos + 1
                val v = IA[str[sPos].code]
                if (v < 0) {
                    j--
                } else {
                    i8 = i8 or (v shl (18 - j * 6))
                }
                j++
                sPos = nextS
            }
            var dPos = d + 1
            bytes[d] = (i8 shr 16).toByte()
            if (dPos < outLen) {
                var dPos2 = dPos + 1
                bytes[dPos] = (i8 shr 8).toByte()
                if (dPos2 < outLen) {
                    dPos = dPos2 + 1
                    bytes[dPos2] = i8.toByte()
                } else {
                    dPos = dPos2
                }
            }
            d = dPos
            s = sPos
        }
        return bytes
    }

    @JvmStatic
    fun decode(bytes2: ByteArray): ByteArray? {
        val length = bytes2.size
        var illegals = 0
        for (b in bytes2) {
            if (IA[b.toInt() and 0xFF] < 0) illegals++
        }
        if ((length - illegals) % 4 != 0) return null
        var end = length
        var padCount = 0
        while (end > 1) {
            end--
            if (IA[bytes2[end].toInt() and 0xFF] > 0) break
            if (bytes2[end].toInt() == 61) padCount++
        }
        val outLen = (((length - illegals) * 6) shr 3) - padCount
        val bytes = ByteArray(outLen)
        var d = 0
        var s = 0
        while (d < outLen) {
            var i7 = 0
            var sPos = s
            var j = 0
            while (j < 4) {
                val nextS = sPos + 1
                val v = IA[bytes2[sPos].toInt() and 0xFF]
                if (v < 0) {
                    j--
                } else {
                    i7 = i7 or (v shl (18 - j * 6))
                }
                j++
                sPos = nextS
            }
            var dPos = d + 1
            bytes[d] = (i7 shr 16).toByte()
            if (dPos < outLen) {
                var dPos2 = dPos + 1
                bytes[dPos] = (i7 shr 8).toByte()
                if (dPos2 < outLen) {
                    dPos = dPos2 + 1
                    bytes[dPos2] = i7.toByte()
                } else {
                    dPos = dPos2
                }
            }
            d = dPos
            s = sPos
        }
        return bytes
    }

    @JvmStatic
    fun decode(chars: CharArray?): ByteArray? {
        val length = chars?.size ?: 0
        if (length == 0) return ByteArray(0)
        chars!!
        var illegals = 0
        for (j in 0 until length) {
            if (IA[chars[j].code] < 0) illegals++
        }
        if ((length - illegals) % 4 != 0) return null
        var end = length
        var padCount = 0
        while (end > 1) {
            end--
            if (IA[chars[end].code] > 0) break
            if (chars[end] == '=') padCount++
        }
        val outLen = (((length - illegals) * 6) shr 3) - padCount
        val bytes = ByteArray(outLen)
        var d = 0
        var s = 0
        while (d < outLen) {
            var i8 = 0
            var sPos = s
            var j = 0
            while (j < 4) {
                val nextS = sPos + 1
                val v = IA[chars[sPos].code]
                if (v < 0) {
                    j--
                } else {
                    i8 = i8 or (v shl (18 - j * 6))
                }
                j++
                sPos = nextS
            }
            var dPos = d + 1
            bytes[d] = (i8 shr 16).toByte()
            if (dPos < outLen) {
                var dPos2 = dPos + 1
                bytes[dPos] = (i8 shr 8).toByte()
                if (dPos2 < outLen) {
                    dPos = dPos2 + 1
                    bytes[dPos2] = i8.toByte()
                } else {
                    dPos = dPos2
                }
            }
            d = dPos
            s = sPos
        }
        return bytes
    }

    @JvmStatic
    fun decodeFast(str: String): ByteArray {
        val length = str.length
        if (length == 0) return ByteArray(0)
        val last = length - 1
        var sIx = 0
        while (sIx < last && IA[str[sIx].code and 0xFF] < 0) sIx++
        var eIx = last
        while (eIx > 0 && IA[str[eIx].code and 0xFF] < 0) eIx--
        val pad = if (str[eIx] != '=') 0 else if (str[eIx - 1] != '=') 1 else 2
        val cCnt = eIx - sIx + 1
        val sepCnt = if (length <= 76) 0 else (if (str[76] != '\r') 0 else cCnt / 78) shl 1
        val len = (((cCnt - sepCnt) * 6) shr 3) - pad
        val bytes = ByteArray(len)
        val eLen = (len / 3) * 3
        var s = sIx
        var d = 0
        var cc = 0
        while (d < eLen) {
            val s0 = s + 1; val s1 = s0 + 1
            val i14 = (IA[str[s].code] shl 18) or (IA[str[s0].code] shl 12)
            val s2 = s1 + 1
            val i16 = (IA[str[s1].code] shl 6) or i14
            s = s2 + 1
            val i17 = i16 or IA[str[s2].code]
            bytes[d] = (i17 shr 16).toByte()
            bytes[d + 1] = (i17 shr 8).toByte()
            bytes[d + 2] = i17.toByte()
            d += 3
            if (sepCnt > 0) {
                cc++
                if (cc == 19) { s += 2; cc = 0 }
            }
        }
        if (d < len) {
            var i20 = 0
            var shift = 0
            var sp = s
            while (sp <= eIx - pad) {
                i20 = i20 or (IA[str[sp].code] shl (18 - shift * 6))
                shift++
                sp++
            }
            var bitShift = 16
            for (j in d until len) {
                bytes[j] = (i20 shr bitShift).toByte()
                bitShift -= 8
            }
        }
        return bytes
    }

    @JvmStatic
    fun decodeFast(bytes2: ByteArray): ByteArray {
        val length = bytes2.size
        if (length == 0) return ByteArray(0)
        val last = length - 1
        var sIx = 0
        while (sIx < last && IA[bytes2[sIx].toInt() and 0xFF] < 0) sIx++
        var eIx = last
        while (eIx > 0 && IA[bytes2[eIx].toInt() and 0xFF] < 0) eIx--
        val pad = if (bytes2[eIx].toInt() != 61) 0 else if (bytes2[eIx - 1].toInt() != 61) 1 else 2
        val cCnt = eIx - sIx + 1
        val sepCnt = if (length <= 76) 0 else (if (bytes2[76].toInt() != 13) 0 else cCnt / 78) shl 1
        val len = (((cCnt - sepCnt) * 6) shr 3) - pad
        val bytes = ByteArray(len)
        val eLen = (len / 3) * 3
        var s = sIx
        var d = 0
        var cc = 0
        while (d < eLen) {
            val s0 = s + 1; val s1 = s0 + 1
            val i14 = (IA[bytes2[s].toInt()] shl 18) or (IA[bytes2[s0].toInt()] shl 12)
            val s2 = s1 + 1
            val i16 = (IA[bytes2[s1].toInt()] shl 6) or i14
            s = s2 + 1
            val i17 = i16 or IA[bytes2[s2].toInt()]
            bytes[d] = (i17 shr 16).toByte()
            bytes[d + 1] = (i17 shr 8).toByte()
            bytes[d + 2] = i17.toByte()
            d += 3
            if (sepCnt > 0) {
                cc++
                if (cc == 19) { s += 2; cc = 0 }
            }
        }
        if (d < len) {
            var i20 = 0
            var shift = 0
            var sp = s
            while (sp <= eIx - pad) {
                i20 = i20 or (IA[bytes2[sp].toInt()] shl (18 - shift * 6))
                shift++
                sp++
            }
            var bitShift = 16
            for (j in d until len) {
                bytes[j] = (i20 shr bitShift).toByte()
                bitShift -= 8
            }
        }
        return bytes
    }

    @JvmStatic
    fun decodeFast(chars: CharArray): ByteArray {
        val length = chars.size
        if (length == 0) return ByteArray(0)
        val last = length - 1
        var sIx = 0
        while (sIx < last && IA[chars[sIx].code] < 0) sIx++
        var eIx = last
        while (eIx > 0 && IA[chars[eIx].code] < 0) eIx--
        val pad = if (chars[eIx] != '=') 0 else if (chars[eIx - 1] != '=') 1 else 2
        val cCnt = eIx - sIx + 1
        val sepCnt = if (length <= 76) 0 else (if (chars[76] != '\r') 0 else cCnt / 78) shl 1
        val len = (((cCnt - sepCnt) * 6) shr 3) - pad
        val bytes = ByteArray(len)
        val eLen = (len / 3) * 3
        var s = sIx
        var d = 0
        var cc = 0
        while (d < eLen) {
            val s0 = s + 1; val s1 = s0 + 1
            val i14 = (IA[chars[s].code] shl 18) or (IA[chars[s0].code] shl 12)
            val s2 = s1 + 1
            val i16 = (IA[chars[s1].code] shl 6) or i14
            s = s2 + 1
            val i17 = i16 or IA[chars[s2].code]
            bytes[d] = (i17 shr 16).toByte()
            bytes[d + 1] = (i17 shr 8).toByte()
            bytes[d + 2] = i17.toByte()
            d += 3
            if (sepCnt > 0) {
                cc++
                if (cc == 19) { s += 2; cc = 0 }
            }
        }
        if (d < len) {
            var i20 = 0
            var shift = 0
            var sp = s
            while (sp <= eIx - pad) {
                i20 = i20 or (IA[chars[sp].code] shl (18 - shift * 6))
                shift++
                sp++
            }
            var bitShift = 16
            for (j in d until len) {
                bytes[j] = (i20 shr bitShift).toByte()
                bitShift -= 8
            }
        }
        return bytes
    }

    @JvmStatic
    fun encodeToByte(bytes2: ByteArray?, lineSep: Boolean): ByteArray {
        val length = bytes2?.size ?: 0
        if (length == 0) return ByteArray(0)
        bytes2!!
        val eLen = (length / 3) * 3
        val cCnt = (((length - 1) / 3) + 1) shl 2
        val dLen = cCnt + if (!lineSep) 0 else ((cCnt - 1) / 76) shl 1
        val out = ByteArray(dLen)
        var s = 0
        var d = 0
        var cc = 0
        while (s < eLen) {
            val s0 = s + 1; val s1 = s0 + 1
            val i9 = ((bytes2[s].toInt() and 0xFF) shl 16) or ((bytes2[s0].toInt() and 0xFF) shl 8)
            s = s1 + 1
            val i10 = i9 or (bytes2[s1].toInt() and 0xFF)
            out[d] = CA[(i10 ushr 18) and 63].code.toByte()
            out[d + 1] = CA[(i10 ushr 12) and 63].code.toByte()
            out[d + 2] = CA[(i10 ushr 6) and 63].code.toByte()
            out[d + 3] = CA[i10 and 63].code.toByte()
            d += 4
            if (lineSep) {
                cc++
                if (cc == 19 && d < dLen - 2) {
                    out[d] = '\r'.code.toByte()
                    out[d + 1] = '\n'.code.toByte()
                    d += 2
                    cc = 0
                }
            }
        }
        val left = length - eLen
        if (left > 0) {
            val i16 = ((bytes2[eLen].toInt() and 0xFF) shl 10) or
                    (if (left == 2) (bytes2[length - 1].toInt() and 0xFF) shl 2 else 0)
            out[dLen - 4] = CA[i16 shr 12].code.toByte()
            out[dLen - 3] = CA[(i16 ushr 6) and 63].code.toByte()
            out[dLen - 2] = if (left != 2) 61.toByte() else CA[i16 and 63].code.toByte()
            out[dLen - 1] = 61.toByte()
        }
        return out
    }

    @JvmStatic
    fun encodeToChar(bytes: ByteArray?, lineSep: Boolean): CharArray {
        val length = bytes?.size ?: 0
        if (length == 0) return CharArray(0)
        bytes!!
        val eLen = (length / 3) * 3
        val cCnt = (((length - 1) / 3) + 1) shl 2
        val dLen = cCnt + if (!lineSep) 0 else ((cCnt - 1) / 76) shl 1
        val out = CharArray(dLen)
        var s = 0
        var d = 0
        var cc = 0
        while (s < eLen) {
            val s0 = s + 1; val s1 = s0 + 1
            val i9 = ((bytes[s].toInt() and 0xFF) shl 16) or ((bytes[s0].toInt() and 0xFF) shl 8)
            s = s1 + 1
            val i10 = i9 or (bytes[s1].toInt() and 0xFF)
            out[d] = CA[(i10 ushr 18) and 63]
            out[d + 1] = CA[(i10 ushr 12) and 63]
            out[d + 2] = CA[(i10 ushr 6) and 63]
            out[d + 3] = CA[i10 and 63]
            d += 4
            if (lineSep) {
                cc++
                if (cc == 19 && d < dLen - 2) {
                    out[d] = '\r'
                    out[d + 1] = '\n'
                    d += 2
                    cc = 0
                }
            }
        }
        val left = length - eLen
        if (left > 0) {
            val i16 = ((bytes[eLen].toInt() and 0xFF) shl 10) or
                    (if (left == 2) (bytes[length - 1].toInt() and 0xFF) shl 2 else 0)
            out[dLen - 4] = CA[i16 shr 12]
            out[dLen - 3] = CA[(i16 ushr 6) and 63]
            out[dLen - 2] = if (left != 2) '=' else CA[i16 and 63]
            out[dLen - 1] = '='
        }
        return out
    }

    @JvmStatic
    fun encodeToString(bytes: ByteArray?, lineSep: Boolean): String {
        return String(encodeToChar(bytes, lineSep))
    }
}
