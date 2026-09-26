package com.lumiyaviewer.lumiya.res.mesh

import com.google.common.io.ByteStreams
import com.google.common.net.HttpHeaders
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.res.ResourceFileCache
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.executors.HTTPFetchExecutor
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection
import com.lumiyaviewer.lumiya.slproto.mesh.MeshData
import okhttp3.Request
import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.util.UUID
import java.util.concurrent.Future

class MeshCache : ResourceFileCache<UUID, MeshData>() {

    private val capURLlock = Any()

    @Volatile
    var capURL: String? = null
        private set

    private inner class MeshDownloadRequest(
        uuid: UUID,
        manager: ResourceManager<UUID, MeshData>,
        private val outputFile: File
    ) : ResourceRequest<UUID, MeshData>(uuid, manager), Runnable {

        @Volatile
        private var downloadTask: Future<*>? = null

        override fun cancelRequest() {
            downloadTask?.cancel(true)
            super.cancelRequest()
        }

        override fun execute() {
            downloadTask = HTTPFetchExecutor.getInstance().submit(this)
        }

        override fun run() {
            val str: String
            synchronized(capURLlock) {
                var s: String? = null
                while (s == null) {
                    s = capURL
                    if (s == null) {
                        try {
                            @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN")
                            (capURLlock as java.lang.Object).wait()
                        } catch (_: InterruptedException) {}
                    }
                }
                str = s
            }
            val partFile = File(outputFile.absolutePath + ".tmp")
            val url = "$str/?mesh_id=${getParams()}"
            Debug.Printf("Fetching mesh: %s", url)
            for (attempt in 0 until MAX_ATTEMPTS) {
                if (Thread.currentThread().isInterrupted) break
                var saved = false
                try {
                    val response = SLHTTPSConnection.getOkHttpClient().newCall(
                        Request.Builder().url(url).header(HttpHeaders.ACCEPT, "application/octet-stream").build()
                    ).execute()
                    try {
                        if (!response.isSuccessful) {
                            throw IOException("Error response code ${response.code}")
                        }
                        partFile.parentFile?.mkdirs()
                        BufferedOutputStream(FileOutputStream(partFile)).use { output ->
                            val copied = ByteStreams.copy(response.body!!.byteStream(), output)
                            outputFile.parentFile?.mkdirs()
                            saved = partFile.renameTo(outputFile)
                            Debug.Printf("MeshFetch: Saved %d bytes to %s", copied, outputFile.toString())
                        }
                    } finally {
                        response.close()
                    }
                    if (saved) {
                        completeRequest(MeshData(outputFile))
                        return
                    }
                } catch (e: IOException) {
                    Debug.Warning(e)
                }
                partFile.delete()
            }
            if (downloadTask?.isCancelled != true) {
                completeRequest(null)
            }
        }
    }

    companion object {
        private const val MAX_ATTEMPTS = 2

        @Volatile
        private var baseDir: File? = null

        private fun getBaseDir(): File {
            var dir = baseDir
            if (dir == null) {
                dir = GlobalOptions.getInstance().getCacheDir("mesh")
                baseDir = dir
            }
            return dir
        }

        @JvmStatic
        fun onCacheDirChanged() {
            baseDir = null
        }
    }

    override fun createResourceFromFile(params: UUID, file: File): MeshData? {
        return try {
            MeshData(file)
        } catch (e: IOException) {
            null
        }
    }

    override fun createResourceGenRequest(
        params: UUID,
        manager: ResourceManager<UUID, MeshData>,
        file: File
    ): ResourceRequest<UUID, MeshData> {
        return MeshDownloadRequest(params, manager, file)
    }

    override fun getResourceFile(params: UUID): File {
        val hashCode = params.hashCode()
        return File(
            getBaseDir(),
            String.format(
                "%02x/%s.mesh",
                ((hashCode shr 24) xor (((hashCode shr 8) xor hashCode) xor (hashCode shr 16))) and 255,
                params.toString()
            )
        )
    }

    fun setCapURL(url: String?) {
        synchronized(capURLlock) {
            capURL = url
            @Suppress("PLATFORM_CLASS_MAPPED_TO_KOTLIN")
            (capURLlock as java.lang.Object).notifyAll()
        }
    }
}
