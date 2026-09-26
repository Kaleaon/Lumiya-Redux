package com.lumiyaviewer.lumiya.res.textures

import com.google.common.io.ByteStreams
import com.google.common.net.HttpHeaders
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.executors.HTTPFetchExecutor
import com.lumiyaviewer.lumiya.res.executors.Startable
import com.lumiyaviewer.lumiya.res.executors.StartingExecutor
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection
import com.lumiyaviewer.lumiya.slproto.modules.texfetcher.SLTextureFetchRequest
import com.lumiyaviewer.lumiya.slproto.modules.texfetcher.SLTextureFetcher
import com.lumiyaviewer.lumiya.utils.HasPriority
import okhttp3.Request
import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.net.MalformedURLException
import java.net.URL
import java.util.concurrent.Future

class TextureCompressedCache : ResourceManager<DrawableTextureParams, File>() {

    private val downloadExecutor = StartingExecutor(GlobalOptions.getInstance().maxTextureDownloads)
    private val lock = Any()

    @Volatile
    private var fetcher: SLTextureFetcher? = null

    private inner class TextureFetchRequest(
        params: DrawableTextureParams,
        manager: ResourceManager<DrawableTextureParams, File>,
        private val compressedFile: File,
        private val fetcher: SLTextureFetcher?
    ) : ResourceRequest<DrawableTextureParams, File>(params, manager),
        Startable, SLTextureFetchRequest.TextureFetchCompleteListener, Runnable, HasPriority {

        @Volatile
        private var fetchRequest: SLTextureFetchRequest? = null

        @Volatile
        private var fetchTask: Future<*>? = null

        companion object {
            private const val MAX_RETRIES = 2
        }

        @Suppress("FunctionName")
        override fun OnTextureFetchComplete(request: SLTextureFetchRequest) {
            completeRequest(request.outputFile)
        }

        override fun cancelRequest() {
            val currentFetchRequest: SLTextureFetchRequest?
            val currentFetcher: SLTextureFetcher?
            val currentFuture: Future<*>?
            Debug.Printf("TextureFetchRequest: cancelled (%s)", getParams().uuid().toString())
            synchronized(this) {
                currentFetchRequest = fetchRequest
                currentFetcher = fetcher
                currentFuture = fetchTask
            }
            if (currentFetcher != null && currentFetchRequest != null) {
                currentFetcher.CancelFetch(currentFetchRequest)
            }
            currentFuture?.cancel(true)
            downloadExecutor.cancelRequest(this)
            super.cancelRequest()
        }

        override fun completeRequest(result: File?) {
            downloadExecutor.completeRequest(this)
            super.completeRequest(result)
        }

        override fun execute() {
            fetchTask = HTTPFetchExecutor.getInstance().submit(this)
        }

        override fun getPriority(): Int {
            return when (getParams().textureClass()) {
                TextureClass.Baked -> 1
                TextureClass.Sculpt -> 0
                else -> 2
            }
        }

        override fun run() {
            val currentFetcher = fetcher
            if (currentFetcher == null) {
                completeRequest(null)
                return
            }
            val capURL = currentFetcher.capURL
            var appearanceService = currentFetcher.agentAppearanceService
            val params = getParams()
            val url: URL
            try {
                val avatarUUID = params.avatarUUID()
                val faceIndex = params.avatarFaceIndex()
                if (appearanceService == null || avatarUUID == null || faceIndex == null) {
                    if (capURL == null) {
                        downloadExecutor.queueRequest(this)
                        return
                    }
                    url = URL("$capURL/?texture_id=${params.uuid()}")
                } else {
                    if (!appearanceService.endsWith("/")) {
                        appearanceService = "$appearanceService/"
                    }
                    url = URL(
                        "${appearanceService}texture/$avatarUUID/${faceIndex.bakedTextureName}/${params.uuid()}"
                    )
                }
            } catch (e: MalformedURLException) {
                Debug.Warning(e)
                completeRequest(null)
                return
            }

            Debug.Log("TextureFetchRequest: Fetching texture ${params.uuid()}, url = $url")
            val partFile = File("${compressedFile.absolutePath}.part")
            val tempOutputDir = partFile.parentFile!!
            val createResult = tempOutputDir.mkdirs()
            Debug.Printf(
                "TextureFetchRequest: tempOutputDir = %s, createResult = %b, exists = %b",
                tempOutputDir, createResult, tempOutputDir.exists()
            )

            for (attempt in 0 until MAX_RETRIES) {
                if (Thread.currentThread().isInterrupted) break
                var success = false
                try {
                    Debug.Printf("TextureFetchRequest: getting connection")
                    val response = SLHTTPSConnection.getOkHttpClient().newCall(
                        Request.Builder().url(url).header(HttpHeaders.ACCEPT, "image/x-j2c").build()
                    ).execute()
                    try {
                        if (!response.isSuccessful) {
                            throw IOException("Response code ${response.code}")
                        }
                        val input = response.body!!.byteStream()
                        BufferedOutputStream(FileOutputStream(partFile)).use { output ->
                            ByteStreams.copy(input, output)
                        }
                        success = true
                    } finally {
                        response.close()
                    }
                } catch (e: IOException) {
                    Debug.Warning(e)
                }
                if (success) {
                    val committed: Boolean
                    synchronized(lock) {
                        committed = partFile.renameTo(compressedFile)
                    }
                    if (committed) {
                        completeRequest(compressedFile)
                        return
                    }
                    Debug.Log("TextureFetchRequest: cannot commit texture cache file $compressedFile")
                }
                partFile.delete()
            }
            if (fetchTask?.isCancelled != true) {
                Debug.Log("TextureFetchRequest: HTTP fetch unsuccessful. Trying UDP.")
                downloadExecutor.queueRequest(this)
            }
        }

        override fun start() {
            val currentFetcher = fetcher ?: run {
                completeRequest(null as File?)
                return
            }
            val params = getParams()
            val textureFetchRequest: SLTextureFetchRequest
            synchronized(this) {
                textureFetchRequest = SLTextureFetchRequest(
                    params.uuid(), 0,
                    params.textureClass(), params.avatarFaceIndex(),
                    params.avatarUUID(), compressedFile
                )
                textureFetchRequest.setOnFetchComplete(this)
                fetchRequest = textureFetchRequest
            }
            currentFetcher.BeginFetch(textureFetchRequest)
        }
    }

    @Suppress("FunctionName")
    override fun CreateNewRequest(
        params: DrawableTextureParams,
        manager: ResourceManager<DrawableTextureParams, File>
    ): ResourceRequest<DrawableTextureParams, File> {
        return TextureFetchRequest(
            params, manager,
            TextureCache.getInstance().getTextureCompressedFile(params),
            fetcher
        )
    }

    @Suppress("FunctionName")
    override fun RequestResource(params: DrawableTextureParams, consumer: ResourceConsumer) {
        val oldFile = TextureCache.getInstance().getTextureCompressedFileOld(params)
        val newFile = TextureCache.getInstance().getTextureCompressedFile(params)
        val existingFile: File?
        synchronized(lock) {
            existingFile = when {
                oldFile.exists() -> oldFile
                newFile.exists() -> newFile
                else -> null
            }
        }
        if (existingFile != null) {
            consumer.OnResourceReady(existingFile, false)
        } else {
            super.RequestResource(params, consumer)
        }
    }

    fun setFetcher(textureFetcher: SLTextureFetcher) {
        fetcher = textureFetcher
    }

    fun setMaxTextureDownloads(maxTextureDownloads: Int) {
        if (maxTextureDownloads > 0) {
            downloadExecutor.setMaxConcurrentTasks(maxTextureDownloads)
            HTTPFetchExecutor.getInstance().corePoolSize = maxTextureDownloads
            HTTPFetchExecutor.getInstance().maximumPoolSize = maxTextureDownloads
        }
    }
}
