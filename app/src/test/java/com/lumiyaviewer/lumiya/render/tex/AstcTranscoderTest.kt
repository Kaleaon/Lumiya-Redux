package com.lumiyaviewer.lumiya.render.tex

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

class AstcTranscoderTest {

    private val transcoder = AstcTranscoder()

    @Test
    fun testDxt1ToAstc4x4Transcode() {
        val dxt1Block = byteArrayOf(
            0x00, 0xF8.toByte(), 0x1F, 0x00,
            0x00, 0x00, 0x00, 0x00
        )

        val resultAstc = transcoder.transcodeTexture(
            dxt1Block,
            4,
            4,
            AstcTranscoder.SourceFormat.DXT1,
            AstcTranscoder.TargetAstcFormat.ASTC_4x4
        )

        assertNotNull(resultAstc)
        assertEquals(16, resultAstc.size)
    }

    @Test
    fun testDxt5ToAstc6x6Transcode() {
        val dxt5Block = byteArrayOf(
            0xFF.toByte(), 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0xF8.toByte(), 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
        )

        val resultAstc = transcoder.transcodeTexture(
            dxt5Block,
            6,
            6,
            AstcTranscoder.SourceFormat.DXT5,
            AstcTranscoder.TargetAstcFormat.ASTC_6x6
        )

        assertNotNull(resultAstc)
        assertEquals(16, resultAstc.size)
    }

    @Test
    fun testTranscodingPerformanceLatencyBenchmark() {
        val width = 1024
        val height = 1024
        val numBlocks = (width / 4) * (height / 4)
        val dxt1Bytes = ByteArray(numBlocks * 8)

        val startTime = System.currentTimeMillis()
        val resultAstc = transcoder.transcodeTexture(
            dxt1Bytes,
            width,
            height,
            AstcTranscoder.SourceFormat.DXT1,
            AstcTranscoder.TargetAstcFormat.ASTC_4x4
        )
        val elapsedTimeMs = System.currentTimeMillis() - startTime

        assertNotNull(resultAstc)
        assertEquals((1024 / 4) * (1024 / 4) * 16, resultAstc.size)
        assertTrue("Transcoding 1024x1024 level took ${elapsedTimeMs}ms (expected < 100ms)", elapsedTimeMs < 100)
    }

    @Test
    fun testTransientBufferPoolReuse() {
        TransientBufferPool.clearPools()

        val buf1 = TransientBufferPool.obtain4x4TexelBuffer()
        assertEquals(64, buf1.size)

        TransientBufferPool.release4x4TexelBuffer(buf1)
        val buf2 = TransientBufferPool.obtain4x4TexelBuffer()

        assertTrue("Expected recycled buffer instance", buf1 === buf2)
    }
}
