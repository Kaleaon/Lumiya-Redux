package com.lumiyaviewer.lumiya.render.tex

import kotlin.math.min

/**
 * Transcodes server-delivered S3TC (DXT1, DXT3, DXT5) blocks into ASTC 4x4 and ASTC 6x6 compressed formats.
 *
 * OpenGL ES constants:
 * GL_COMPRESSED_RGBA_ASTC_4x4_KHR = 0x93B0
 * GL_COMPRESSED_RGBA_ASTC_6x6_KHR = 0x93B3
 */
class AstcTranscoder {

    enum class SourceFormat {
        DXT1, DXT3, DXT5
    }

    enum class TargetAstcFormat(val glFormat: Int, val blockWidth: Int, val blockHeight: Int) {
        ASTC_4x4(0x93B0, 4, 4),
        ASTC_6x6(0x93B3, 6, 6)
    }

    companion object {
        const val GL_COMPRESSED_RGBA_ASTC_4x4_KHR = 0x93B0
        const val GL_COMPRESSED_RGBA_ASTC_6x6_KHR = 0x93B3

        private fun decode565(c: Int, out: ByteArray, offset: Int) {
            val r = (c shr 11) and 0x1F
            val g = (c shr 5) and 0x3F
            val b = c and 0x1F
            out[offset] = ((r * 527 + 23) shr 6).toByte()
            out[offset + 1] = ((g * 259 + 33) shr 6).toByte()
            out[offset + 2] = ((b * 527 + 23) shr 6).toByte()
            out[offset + 3] = 0xFF.toByte()
        }

        fun decodeDxt1Block(src: ByteArray, srcOffset: Int, outRgbaTexels: ByteArray) {
            val c0 = (src[srcOffset].toInt() and 0xFF) or ((src[srcOffset + 1].toInt() and 0xFF) shl 8)
            val c1 = (src[srcOffset + 2].toInt() and 0xFF) or ((src[srcOffset + 3].toInt() and 0xFF) shl 8)

            decode565(c0, outRgbaTexels, 0)
            decode565(c1, outRgbaTexels, 4)

            val r0 = outRgbaTexels[0].toInt() and 0xFF
            val g0 = outRgbaTexels[1].toInt() and 0xFF
            val b0 = outRgbaTexels[2].toInt() and 0xFF

            val r1 = outRgbaTexels[4].toInt() and 0xFF
            val g1 = outRgbaTexels[5].toInt() and 0xFF
            val b1 = outRgbaTexels[6].toInt() and 0xFF

            if (c0 > c1) {
                outRgbaTexels[8] = ((2 * r0 + r1) / 3).toByte()
                outRgbaTexels[9] = ((2 * g0 + g1) / 3).toByte()
                outRgbaTexels[10] = ((2 * b0 + b1) / 3).toByte()
                outRgbaTexels[11] = 0xFF.toByte()

                outRgbaTexels[12] = ((r0 + 2 * r1) / 3).toByte()
                outRgbaTexels[13] = ((g0 + 2 * g1) / 3).toByte()
                outRgbaTexels[14] = ((b0 + 2 * b1) / 3).toByte()
                outRgbaTexels[15] = 0xFF.toByte()
            } else {
                outRgbaTexels[8] = ((r0 + r1) / 2).toByte()
                outRgbaTexels[9] = ((g0 + g1) / 2).toByte()
                outRgbaTexels[10] = ((b0 + b1) / 2).toByte()
                outRgbaTexels[11] = 0xFF.toByte()

                outRgbaTexels[12] = 0
                outRgbaTexels[13] = 0
                outRgbaTexels[14] = 0
                outRgbaTexels[15] = 0
            }

            var codeBits = (src[srcOffset + 4].toInt() and 0xFF) or
                    ((src[srcOffset + 5].toInt() and 0xFF) shl 8) or
                    ((src[srcOffset + 6].toInt() and 0xFF) shl 16) or
                    ((src[srcOffset + 7].toInt() and 0xFF) shl 24)

            val tempRgba = TransientBufferPool.obtain4x4TexelBuffer()
            System.arraycopy(outRgbaTexels, 0, tempRgba, 0, 16)

            for (i in 0 until 16) {
                val code = codeBits and 0x03
                codeBits = codeBits ushr 2
                val srcIdx = code * 4
                val dstIdx = i * 4
                outRgbaTexels[dstIdx] = tempRgba[srcIdx]
                outRgbaTexels[dstIdx + 1] = tempRgba[srcIdx + 1]
                outRgbaTexels[dstIdx + 2] = tempRgba[srcIdx + 2]
                outRgbaTexels[dstIdx + 3] = tempRgba[srcIdx + 3]
            }

            TransientBufferPool.release4x4TexelBuffer(tempRgba)
        }

        fun decodeDxt3Block(src: ByteArray, srcOffset: Int, outRgbaTexels: ByteArray) {
            decodeDxt1Block(src, srcOffset + 8, outRgbaTexels)
            for (i in 0 until 16) {
                val alphaByteIndex = srcOffset + (i shr 1)
                val alphaNibble = if ((i and 1) == 0) {
                    src[alphaByteIndex].toInt() and 0x0F
                } else {
                    (src[alphaByteIndex].toInt() ushr 4) and 0x0F
                }
                outRgbaTexels[i * 4 + 3] = ((alphaNibble * 255) / 15).toByte()
            }
        }

        fun decodeDxt5Block(src: ByteArray, srcOffset: Int, outRgbaTexels: ByteArray) {
            val a0 = src[srcOffset].toInt() and 0xFF
            val a1 = src[srcOffset + 1].toInt() and 0xFF

            val alphas = IntArray(8)
            alphas[0] = a0
            alphas[1] = a1

            if (a0 > a1) {
                for (i in 1..6) {
                    alphas[i + 1] = ((7 - i) * a0 + i * a1) / 7
                }
            } else {
                for (i in 1..4) {
                    alphas[i + 1] = ((5 - i) * a0 + i * a1) / 5
                }
                alphas[6] = 0
                alphas[7] = 255
            }

            var alphaBits = 0L
            for (i in 0 until 6) {
                alphaBits = alphaBits or ((src[srcOffset + 2 + i].toLong() and 0xFFL) shl (i * 8))
            }

            decodeDxt1Block(src, srcOffset + 8, outRgbaTexels)

            for (i in 0 until 16) {
                val alphaIndex = ((alphaBits ushr (i * 3)) and 0x07L).toInt()
                outRgbaTexels[i * 4 + 3] = alphas[alphaIndex].toByte()
            }
        }

        fun encodeAstc4x4Block(rgbaTexels: ByteArray, outAstcBlock: ByteArray, outOffset: Int) {
            var minR = 255
            var maxR = 0
            var minG = 255
            var maxG = 0
            var minB = 255
            var maxB = 0
            var minA = 255
            var maxA = 0

            for (i in 0 until 16) {
                val r = rgbaTexels[i * 4].toInt() and 0xFF
                val g = rgbaTexels[i * 4 + 1].toInt() and 0xFF
                val b = rgbaTexels[i * 4 + 2].toInt() and 0xFF
                val a = rgbaTexels[i * 4 + 3].toInt() and 0xFF

                if (r < minR) minR = r
                if (r > maxR) maxR = r
                if (g < minG) minG = g
                if (g > maxG) maxG = g
                if (b < minB) minB = b
                if (b > maxB) maxB = b
                if (a < minA) minA = a
                if (a > maxA) maxA = a
            }

            var low64 = 0x012CL // ASTC 4x4, 1 partition, LDR RGBA, weight grid 4x4
            val e0 = ((minR and 0xF8) shl 24) or ((minG and 0xF8) shl 16) or ((minB and 0xF8) shl 8) or (minA and 0xF8)
            val e1 = ((maxR and 0xF8) shl 24) or ((maxG and 0xF8) shl 16) or ((maxB and 0xF8) shl 8) or (maxA and 0xF8)

            low64 = low64 or ((e0.toLong() and 0xFFFFFFFFL) shl 13)
            var high64 = (e1.toLong() and 0xFFFFFFFFL) or 0x8000000000000000UL.toLong()

            var weightBits = 0L
            for (i in 0 until 16) {
                val r = rgbaTexels[i * 4].toInt() and 0xFF
                val distMin = kotlin.math.abs(r - minR)
                val distMax = kotlin.math.abs(r - maxR)
                val weight = if (distMin + distMax == 0) 0 else ((distMax * 3) / (distMin + distMax))
                weightBits = weightBits or ((weight and 0x03).toLong() shl (i * 2))
            }

            high64 = high64 or ((weightBits and 0x0FFFFFFFFL) shl 32)

            for (i in 0 until 8) {
                outAstcBlock[outOffset + i] = ((low64 ushr (i * 8)) and 0xFFL).toByte()
                outAstcBlock[outOffset + 8 + i] = ((high64 ushr (i * 8)) and 0xFFL).toByte()
            }
        }

        fun encodeAstc6x6Block(rgbaTexels36: ByteArray, outAstcBlock: ByteArray, outOffset: Int) {
            var minR = 255
            var maxR = 0
            var minG = 255
            var maxG = 0
            var minB = 255
            var maxB = 0
            var minA = 255
            var maxA = 0

            for (i in 0 until 36) {
                val r = rgbaTexels36[i * 4].toInt() and 0xFF
                val g = rgbaTexels36[i * 4 + 1].toInt() and 0xFF
                val b = rgbaTexels36[i * 4 + 2].toInt() and 0xFF
                val a = rgbaTexels36[i * 4 + 3].toInt() and 0xFF

                if (r < minR) minR = r
                if (r > maxR) maxR = r
                if (g < minG) minG = g
                if (g > maxG) maxG = g
                if (b < minB) minB = b
                if (b > maxB) maxB = b
                if (a < minA) minA = a
                if (a > maxA) maxA = a
            }

            var low64 = 0x01B2L // ASTC 6x6, weight grid 6x6
            val e0 = ((minR and 0xF8) shl 24) or ((minG and 0xF8) shl 16) or ((minB and 0xF8) shl 8) or (minA and 0xF8)
            val e1 = ((maxR and 0xF8) shl 24) or ((maxG and 0xF8) shl 16) or ((maxB and 0xF8) shl 8) or (maxA and 0xF8)

            low64 = low64 or ((e0.toLong() and 0xFFFFFFFFL) shl 13)
            var high64 = (e1.toLong() and 0xFFFFFFFFL) or 0x9000000000000000UL.toLong()

            var weightBits = 0L
            for (i in 0 until 36) {
                val r = rgbaTexels36[i * 4].toInt() and 0xFF
                val distMin = kotlin.math.abs(r - minR)
                val distMax = kotlin.math.abs(r - maxR)
                val weight = if (distMin + distMax == 0) 0 else ((distMax * 3) / (distMin + distMax))
                weightBits = weightBits or ((weight and 0x01).toLong() shl (i % 32))
            }

            high64 = high64 or ((weightBits and 0x0FFFFFFFFL) shl 28)

            for (i in 0 until 8) {
                outAstcBlock[outOffset + i] = ((low64 ushr (i * 8)) and 0xFFL).toByte()
                outAstcBlock[outOffset + 8 + i] = ((high64 ushr (i * 8)) and 0xFFL).toByte()
            }
        }
    }

    fun transcodeTexture(
        srcBytes: ByteArray,
        width: Int,
        height: Int,
        srcFormat: SourceFormat,
        targetFormat: TargetAstcFormat
    ): ByteArray {
        val bw = targetFormat.blockWidth
        val bh = targetFormat.blockHeight

        val numBlocksX = (width + bw - 1) / bw
        val numBlocksY = (height + bh - 1) / bh
        val totalAstcBlocks = numBlocksX * numBlocksY

        val resultAstc = ByteArray(totalAstcBlocks * 16)

        val srcBlocksX = (width + 3) / 4
        val srcBlocksY = (height + 3) / 4
        val bytesPerS3tcBlock = if (srcFormat == SourceFormat.DXT1) 8 else 16

        val texels4x4 = TransientBufferPool.obtain4x4TexelBuffer()

        if (bw == 4 && bh == 4) {
            for (by in 0 until numBlocksY) {
                for (bx in 0 until numBlocksX) {
                    val s3tcBlockIdx = by * srcBlocksX + bx
                    val s3tcOffset = s3tcBlockIdx * bytesPerS3tcBlock

                    if (s3tcOffset + bytesPerS3tcBlock <= srcBytes.size) {
                        when (srcFormat) {
                            SourceFormat.DXT1 -> decodeDxt1Block(srcBytes, s3tcOffset, texels4x4)
                            SourceFormat.DXT3 -> decodeDxt3Block(srcBytes, s3tcOffset, texels4x4)
                            SourceFormat.DXT5 -> decodeDxt5Block(srcBytes, s3tcOffset, texels4x4)
                        }
                    }

                    val astcOffset = (by * numBlocksX + bx) * 16
                    encodeAstc4x4Block(texels4x4, resultAstc, astcOffset)
                }
            }
        } else if (bw == 6 && bh == 6) {
            val texels36 = TransientBufferPool.obtain6x6TexelBuffer()

            for (by in 0 until numBlocksY) {
                for (bx in 0 until numBlocksX) {
                    for (i in 0 until 36) {
                        val px = min(bx * 6 + (i % 6), width - 1)
                        val py = min(by * 6 + (i / 6), height - 1)

                        val s3tcBx = px / 4
                        val s3tcBy = py / 4
                        val s3tcBlockIdx = s3tcBy * srcBlocksX + s3tcBx
                        val s3tcOffset = s3tcBlockIdx * bytesPerS3tcBlock

                        if (s3tcOffset + bytesPerS3tcBlock <= srcBytes.size) {
                            when (srcFormat) {
                                SourceFormat.DXT1 -> decodeDxt1Block(srcBytes, s3tcOffset, texels4x4)
                                SourceFormat.DXT3 -> decodeDxt3Block(srcBytes, s3tcOffset, texels4x4)
                                SourceFormat.DXT5 -> decodeDxt5Block(srcBytes, s3tcOffset, texels4x4)
                            }
                            val inBlockX = px % 4
                            val inBlockY = py % 4
                            val srcTexelIdx = (inBlockY * 4 + inBlockX) * 4

                            System.arraycopy(texels4x4, srcTexelIdx, texels36, i * 4, 4)
                        }
                    }

                    val astcOffset = (by * numBlocksX + bx) * 16
                    encodeAstc6x6Block(texels36, resultAstc, astcOffset)
                }
            }

            TransientBufferPool.release6x6TexelBuffer(texels36)
        }

        TransientBufferPool.release4x4TexelBuffer(texels4x4)
        return resultAstc
    }
}
