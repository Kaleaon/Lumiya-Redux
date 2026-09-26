package com.lumiyaviewer.lumiya.res.textures

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.executors.LoaderExecutor
import com.lumiyaviewer.lumiya.res.executors.Startable
import com.lumiyaviewer.lumiya.res.executors.StartingExecutor
import com.lumiyaviewer.lumiya.res.executors.WeakExecutor
import com.lumiyaviewer.lumiya.slproto.modules.texfetcher.SLTextureFetcher
import com.lumiyaviewer.lumiya.utils.HasPriority
import java.io.File
import java.io.IOException
import java.util.UUID
import java.util.concurrent.ExecutorService
import java.util.concurrent.Future
import java.util.concurrent.PriorityBlockingQueue
import java.util.concurrent.atomic.AtomicBoolean

class TextureCache private constructor() : ResourceMemoryCache<DrawableTextureParams, OpenJPEG>() {

    private var baseDir: File? = null
    private var textureTempDir: File? = null
    private val cacheDirLock = Any()
    private val isLowMemory = AtomicBoolean(false)
    val textureCompressedCache = TextureCompressedCache()
    val decompressorExecutor: ExecutorService = WeakExecutor("TextureDecompressor", 1, PriorityBlockingQueue())
    val memoryAwareExecutor = StartingExecutor()

    private object InstanceHolder {
        @JvmField
        val Instance = TextureCache()
    }

    companion object {
        @JvmStatic
        fun getInstance(): TextureCache = InstanceHolder.Instance
    }

    private inner class TextureDecompressRequest(
        params: DrawableTextureParams,
        manager: ResourceManager<DrawableTextureParams, OpenJPEG>
    ) : ResourceRequest<DrawableTextureParams, OpenJPEG>(params, manager),
        ResourceConsumer, Runnable, HasPriority, Startable {

        @Volatile
        private var compressedFile: File? = null

        @Volatile
        private var decompressorFuture: Future<*>? = null

        @Volatile
        private var lowQualityDone = false

        private fun decompress(source: File, rawFile: File, highQuality: Boolean): OpenJPEG? {
            return try {
                val params = getParams()
                if (rawFile.exists()) {
                    return OpenJPEG(rawFile, params.textureClass(), OpenJPEG.ImageFormat.Raw, highQuality)
                }
                Debug.Printf(
                    "Decompressing (%s) %s texture %s to %s",
                    if (highQuality) "high" else "low",
                    params.textureClass().toString(),
                    params.uuid().toString(),
                    rawFile.absolutePath
                )
                val jpeg = OpenJPEG(source, params.textureClass(), OpenJPEG.ImageFormat.JPEG2000, highQuality)
                rawFile.parentFile?.mkdirs()
                val tmpFile = File(rawFile.absolutePath + ".tmpdec")
                if (params.textureClass() == TextureClass.Prim && GlobalOptions.getInstance().compressedTextures) {
                    jpeg.CompressETC1()
                }
                jpeg.SaveRaw(tmpFile)
                tmpFile.renameTo(rawFile)
                Debug.Log("Decompressed texture ${rawFile.absolutePath}")
                jpeg
            } catch (e: IOException) {
                Debug.Log("Failed to decompress texture ${source.absolutePath}")
                e.printStackTrace()
                null
            }
        }

        @Suppress("FunctionName")
        override fun OnResourceReady(resource: Any?, success: Boolean) {
            if (resource !is File) {
                if (resource == null) {
                    completeRequest(null)
                }
            } else {
                compressedFile = resource
                if (getParams().textureClass() == TextureClass.Prim) {
                    memoryAwareExecutor.queueRequest(this)
                } else {
                    decompressorFuture = decompressorExecutor.submit(this)
                }
            }
        }

        override fun cancelRequest() {
            Debug.Printf("DecompressRequest: cancelled (%s)", getParams().uuid().toString())
            decompressorFuture?.cancel(false)
            textureCompressedCache.CancelRequest(this)
            memoryAwareExecutor.cancelRequest(this)
            super.cancelRequest()
        }

        override fun execute() {
            textureCompressedCache.RequestResource(getParams(), this as ResourceConsumer)
        }

        override fun getPriority(): Int {
            val params = getParams()
            if (canBeLowQuality(params) && lowQualityDone) {
                return 4
            }
            return when (params.textureClass()) {
                TextureClass.Baked -> 2
                TextureClass.Sculpt -> 1
                else -> 3
            }
        }

        override fun run() {
            val params = getParams()
            val file = compressedFile ?: return
            if (params.textureClass() == TextureClass.Sculpt || params.textureClass() == TextureClass.Baked) {
                completeRequest(decompress(file, getResourceFile(params, true), true))
            } else if (canBeLowQuality(params) && !lowQualityDone) {
                val result = decompress(file, getResourceFile(params, false), false)
                if (result == null) {
                    completeRequest(null)
                } else if (GlobalOptions.getInstance().highQualityTextures) {
                    lowQualityDone = true
                    intermediateResult(result)
                    decompressorFuture = decompressorExecutor.submit(this)
                } else {
                    completeRequest(result)
                }
            } else {
                completeRequest(decompress(file, getResourceFile(params, true), true))
            }
            memoryAwareExecutor.completeRequest(this)
        }

        override fun start() {
            decompressorFuture = decompressorExecutor.submit(this)
        }
    }

    private inner class TextureLoadRequest(
        params: DrawableTextureParams,
        manager: ResourceManager<DrawableTextureParams, OpenJPEG>,
        private val rawFile: File
    ) : ResourceRequest<DrawableTextureParams, OpenJPEG>(params, manager), Runnable, Startable {

        override fun cancelRequest() {
            memoryAwareExecutor.cancelRequest(this)
            LoaderExecutor.getInstance().remove(this)
            super.cancelRequest()
        }

        override fun execute() {
            if (getParams().textureClass() == TextureClass.Prim) {
                memoryAwareExecutor.queueRequest(this)
            } else {
                LoaderExecutor.getInstance().execute(this)
            }
        }

        override fun run() {
            try {
                completeRequest(
                    OpenJPEG(rawFile.absoluteFile, getParams().textureClass(), OpenJPEG.ImageFormat.Raw, true)
                )
            } catch (e: IOException) {
                Debug.Warning(e)
                completeRequest(null)
            }
            memoryAwareExecutor.completeRequest(this)
        }

        override fun start() {
            LoaderExecutor.getInstance().execute(this)
        }
    }

    fun canBeLowQuality(params: DrawableTextureParams): Boolean {
        return params.textureClass() == TextureClass.Prim
    }

    @Suppress("FunctionName")
    override fun CreateNewRequest(
        params: DrawableTextureParams,
        manager: ResourceManager<DrawableTextureParams, OpenJPEG>
    ): ResourceRequest<DrawableTextureParams, OpenJPEG> {
        if (GlobalOptions.getInstance().highQualityTextures || !canBeLowQuality(params)) {
            val resourceFile = getResourceFile(params, true)
            if (resourceFile.exists()) {
                return TextureLoadRequest(params, manager, resourceFile)
            }
        }
        if (canBeLowQuality(params) && !GlobalOptions.getInstance().highQualityTextures) {
            val resourceFile = getResourceFile(params, false)
            if (resourceFile.exists()) {
                return TextureLoadRequest(params, manager, resourceFile)
            }
        }
        return TextureDecompressRequest(params, manager)
    }

    protected fun getBaseDir(): File {
        synchronized(cacheDirLock) {
            if (baseDir == null) {
                baseDir = GlobalOptions.getInstance().getCacheDir("tex2")
            }
            return baseDir!!
        }
    }

    fun getBitmapsBaseDir(): File {
        return GlobalOptions.getInstance().getCacheDir("bitmaps")
    }

    @Synchronized
    fun getResourceFile(params: DrawableTextureParams, highQuality: Boolean): File {
        return params.getTextureRawPath(getBaseDir(), highQuality)
    }

    fun getTextureCompressedFile(params: DrawableTextureParams): File {
        val uuid = params.uuid()
        val hashCode = uuid.hashCode()
        return File(
            getTextureTempDir(),
            String.format(
                "%02x/%s.jp2",
                ((hashCode shr 24) xor (((hashCode shr 8) xor hashCode) xor (hashCode shr 16))) and 255,
                uuid.toString()
            )
        )
    }

    fun getTextureCompressedFileOld(params: DrawableTextureParams): File {
        return File(getTextureTempDir(), "${params.uuid()}.jp2")
    }

    protected fun getTextureTempDir(): File {
        synchronized(cacheDirLock) {
            if (textureTempDir == null) {
                textureTempDir = GlobalOptions.getInstance().getCacheDir("textures")
            }
            return textureTempDir!!
        }
    }

    fun onCacheDirChanged() {
        synchronized(cacheDirLock) {
            baseDir = null
            textureTempDir = null
        }
    }

    fun setFetcher(textureFetcher: SLTextureFetcher) {
        textureCompressedCache.setFetcher(textureFetcher)
    }

    fun setMaxTextureDownloads(maxTextureDownloads: Int) {
        textureCompressedCache.setMaxTextureDownloads(maxTextureDownloads)
    }

    fun setTextureMemoryState(isLow: Boolean) {
        if (isLowMemory.getAndSet(isLow) != isLow) {
            if (isLow) {
                memoryAwareExecutor.pause()
            } else {
                memoryAwareExecutor.unpause()
            }
        }
    }
}
