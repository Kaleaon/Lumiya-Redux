package com.lumiyaviewer.lumiya.render.tex

import java.util.concurrent.Executors
import java.util.concurrent.Future
import java.util.concurrent.ThreadPoolExecutor

/**
 * Worker thread executor pool for asynchronous background ASTC texture transcoding.
 * Offloads compute-heavy DXT-to-ASTC conversions from the main rendering thread.
 */
object AstcTranscoderWorkerPool {

    private val threadCount = Runtime.getRuntime().availableProcessors().coerceIn(2, 8)
    private val executor = Executors.newFixedThreadPool(threadCount) as ThreadPoolExecutor
    private val transcoder = AstcTranscoder()

    fun submitTranscodeTask(
        srcBytes: ByteArray,
        width: Int,
        height: Int,
        srcFormat: AstcTranscoder.SourceFormat,
        targetFormat: AstcTranscoder.TargetAstcFormat,
        callback: (ByteArray) -> Unit
    ): Future<*> {
        return executor.submit {
            val astcResult = transcoder.transcodeTexture(srcBytes, width, height, srcFormat, targetFormat)
            callback(astcResult)
        }
    }

    fun shutdown() {
        executor.shutdown()
    }
}
