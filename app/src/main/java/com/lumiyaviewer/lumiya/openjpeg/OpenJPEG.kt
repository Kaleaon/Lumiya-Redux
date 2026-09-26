package com.lumiyaviewer.lumiya.openjpeg

import android.graphics.Bitmap
import android.opengl.ETC1
import android.opengl.GLES10
import android.opengl.GLES20
import android.opengl.GLES30
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.GLTexture
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.InputStream
import java.nio.ByteBuffer

class OpenJPEG : GLTexture {

    @JvmField var bytes_per_pixel: Int = 0
    @JvmField var error_code: Int = 0
    @JvmField var height: Int = 0
    private var mmapped: Boolean = false
    private var mmappedAddr: Long = 0
    private var mmappedSize: Long = 0
    @JvmField var num_components: Int = 0
    @JvmField var num_extra_components: Int = 0
    private var rawBuffer: ByteBuffer? = null
    @JvmField var width: Int = 0

    enum class ImageFormat {
        Raw,
        JPEG2000,
        TGA;

        companion object {
            @JvmStatic
            fun valuesCustom(): Array<ImageFormat> = entries.toTypedArray()
        }
    }

    @Throws(OutOfMemoryError::class)
    constructor(width: Int, height: Int, numComponents: Int, bytesPerPixel: Int, numExtraComponents: Int, flags: Int) {
        this.width = width
        this.height = height
        this.num_components = numComponents
        this.num_extra_components = numExtraComponents
        this.bytes_per_pixel = bytesPerPixel
        this.rawBuffer = allocateNew(width, height, numComponents, bytesPerPixel, numExtraComponents, flags)
            ?: throw OutOfMemoryError("allocateNew() returned NULL")
        TextureMemoryTracker.allocOpenJpegMemory(rawBuffer!!.capacity(), mmapped)
    }

    @Throws(IOException::class)
    constructor(file: File?, maxWidth: Int, maxHeight: Int, asPrim: Boolean) {
        if (file == null) throw IOException("Null source file")
        rawBuffer = decompress(file.absolutePath, 0, 0, asPrim, maxWidth, maxHeight)
            ?: throw IOException("Failed to decompress texture ($error_code) ${file.absolutePath}")
        TextureMemoryTracker.allocOpenJpegMemory(rawBuffer!!.capacity(), mmapped)
    }

    @Throws(IOException::class)
    constructor(file: File?, textureClass: TextureClass, imageFormat: ImageFormat, scalePrim: Boolean) {
        if (file == null) throw IOException("Null source file")
        Debug.Log("OpenJPEG: decompressing ${file.name} class $textureClass format $imageFormat")
        val applyScale = if (textureClass == TextureClass.Prim) !scalePrim else false
        when (imageFormat) {
            ImageFormat.JPEG2000 -> {
                rawBuffer = decompress(
                    file.absolutePath,
                    if (applyScale) 1 else 0,
                    if (applyScale) 6 else 0,
                    textureClass == TextureClass.Prim,
                    0, 0
                ) ?: throw IOException("Failed to decompress texture ($error_code) ${file.absolutePath}")
            }
            ImageFormat.Raw -> {
                rawBuffer = readRaw(file.absolutePath)
                    ?: throw IOException("Failed to read raw texture ${file.absolutePath}")
            }
            ImageFormat.TGA -> throw IOException("TGA not supported for non-asset files")
        }
        TextureMemoryTracker.allocOpenJpegMemory(rawBuffer!!.capacity(), mmapped)
    }

    @Throws(IOException::class)
    constructor(
        inputStream: InputStream,
        imageFormat: ImageFormat,
        flipVertical: Boolean,
        flipHorizontal: Boolean,
        scaleX: Float,
        scaleY: Float,
        premultiplyAlpha: Boolean
    ) {
        if (imageFormat != ImageFormat.TGA) {
            throw IOException("Unsupported format for image stream.")
        }
        val bytes = ByteArray(inputStream.available())
        inputStream.read(bytes)
        rawBuffer = decompressTGA(bytes, flipVertical, flipHorizontal, scaleX, scaleY, premultiplyAlpha)
            ?: throw IOException("Failed to decompress TGA texture.")
        TextureMemoryTracker.allocOpenJpegMemory(rawBuffer!!.capacity(), mmapped)
    }

    private external fun allocateNew(i: Int, i2: Int, i3: Int, i4: Int, i5: Int, i6: Int): ByteBuffer?
    private external fun allocateRaw(i: Int): ByteBuffer?

    private external fun decompress(str: String, i: Int, i2: Int, z: Boolean, i3: Int, i4: Int): ByteBuffer?
    private external fun decompressTGA(bytes: ByteArray, z: Boolean, z2: Boolean, f: Float, f2: Float, z3: Boolean): ByteBuffer?
    private external fun drawBuf(
        byteBuffer: ByteBuffer, i: Int, i2: Int, i3: Int,
        byteBuffer2: ByteBuffer, i4: Int, i5: Int, i6: Int,
        i7: Int, z: Boolean, z2: Boolean, z3: Boolean, z4: Boolean
    )
    private external fun readRaw(str: String): ByteBuffer?
    private external fun release(byteBuffer: ByteBuffer)
    private external fun setComponentBuf(byteBuffer: ByteBuffer, i: Int, i2: Int, i3: Int, i4: Int, i5: Int, b: Byte)
    private external fun writeJPEG2K(str: String, byteBuffer: ByteBuffer, i: Int, i2: Int, i3: Int, i4: Int): Int
    private external fun writeRaw(byteBuffer: ByteBuffer, str: String)
    private external fun bakeTerrainRaw(
        byteBuffer: ByteBuffer, i: Int, i2: Int,
        byteBufferArr: Array<ByteBuffer?>, ints: IntArray, ints2: IntArray, ints3: IntArray,
        floats: FloatArray, i3: Int, i4: Int
    )

    @Throws(IOException::class)
    fun CompressETC1(): Boolean {
        val buf = rawBuffer ?: return false
        if (num_components != 3 || num_extra_components != 0 ||
            (bytes_per_pixel != 2 && bytes_per_pixel != 3)
        ) return false
        val encodedDataSize = ETC1.getEncodedDataSize(width, height)
        val allocateRaw = allocateRaw(encodedDataSize)
            ?: throw IOException("Out of memory for ${encodedDataSize} allocation")
        ETC1.encodeImage(buf, width, height, bytes_per_pixel, width * bytes_per_pixel, allocateRaw)
        TextureMemoryTracker.releaseOpenJpegMemory(buf.capacity(), mmapped)
        release(buf)
        rawBuffer = allocateRaw
        TextureMemoryTracker.allocOpenJpegMemory(allocateRaw.capacity(), mmapped)
        bytes_per_pixel = ETC1_BYTES_PER_PIXEL
        return true
    }

    @Throws(IOException::class)
    fun SaveJPEG2K(file: File) {
        val buf = rawBuffer ?: return
        if (writeJPEG2K(file.absolutePath, buf, width, height, num_components, num_extra_components) != 0) {
            throw IOException("Failed to save JPEG2k to ${file.absolutePath}")
        }
    }

    fun SaveRaw(file: File) {
        rawBuffer?.let { writeRaw(it, file.absolutePath) }
    }

    fun SaveToFile(file: File) {
        try {
            FileOutputStream(file, false).use { fos ->
                fos.channel.write(rawBuffer)
            }
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    fun SetAsImmutableTexture(): Int {
        val buf = rawBuffer
        if (buf != null) {
            if (bytes_per_pixel == ETC1_BYTES_PER_PIXEL) {
                GLES30.glTexStorage2D(3553, 1, 37492, width, height)
                GLES30.glCompressedTexSubImage2D(3553, 0, 0, 0, width, height, 37492, buf.capacity(), buf)
            } else {
                var internalFormat: Int
                var format: Int
                var type = 5121
                when (num_components) {
                    1 -> { internalFormat = 33321; format = 6403 }
                    3 -> {
                        internalFormat = if (bytes_per_pixel == 2) 36194 else 32849
                        format = 6407
                        if (bytes_per_pixel == 2) type = 33635
                    }
                    4 -> { internalFormat = 32856; format = 6408 }
                    else -> return SetAsTexture()
                }
                val finalType = if (bytes_per_pixel == 2 && num_components == 3) 33635 else type
                GLES30.glTexStorage2D(3553, 1, internalFormat, width, height)
                GLES30.glTexSubImage2D(3553, 0, 0, 0, width, height, format, finalType, buf)
                if (num_components == 1) {
                    GLES30.glTexParameteri(3553, 36418, 1)
                    GLES30.glTexParameteri(3553, 36419, 1)
                    GLES30.glTexParameteri(3553, 36420, 1)
                    GLES30.glTexParameteri(3553, 36421, 6403)
                }
            }
        }
        return getLoadedSize()
    }

    override fun SetAsTexture(): Int {
        val buf = rawBuffer
        if (buf != null) {
            if (bytes_per_pixel == ETC1_BYTES_PER_PIXEL) {
                GLES10.glCompressedTexImage2D(3553, 0, 36196, width, height, 0, buf.capacity(), buf)
            } else {
                val format = when (num_components) {
                    1 -> 6406
                    3 -> 6407
                    4 -> 6408
                    else -> num_components
                }
                val type = if (bytes_per_pixel == 2 && num_components == 3) 33635 else 5121
                GLES10.glTexImage2D(3553, 0, format, width, height, 0, format, type, buf)
            }
        }
        return getLoadedSize()
    }

    fun SetAsTextureTarget(target: Int): Int {
        val buf = rawBuffer ?: return 0
        if (bytes_per_pixel == ETC1_BYTES_PER_PIXEL) {
            val capacity = buf.capacity()
            GLES20.glCompressedTexImage2D(target, 0, 36196, width, height, 0, capacity, buf)
            return capacity
        }
        val format = when (num_components) {
            1 -> 6406
            3 -> 6407
            4 -> 6408
            else -> num_components
        }
        val type = if (bytes_per_pixel == 2 && num_components == 3) 33635 else 5121
        GLES20.glTexImage2D(target, 0, format, width, height, 0, format, type, buf)
        return width * height * bytes_per_pixel
    }

    fun blendAlpha(other: OpenJPEG, z: Boolean) {
        val myBuf = rawBuffer ?: return
        val otherBuf = other.rawBuffer ?: return
        if (num_components < 4 || other.num_components < 4) return
        drawBuf(myBuf, width, height, num_components, otherBuf, other.width, other.height, other.num_components, 0, false, true, z, false)
    }

    fun draw(other: OpenJPEG, i: Int, z: Boolean) {
        val myBuf = rawBuffer ?: return
        val otherBuf = other.rawBuffer ?: return
        drawBuf(myBuf, width, height, num_components, otherBuf, other.width, other.height, other.num_components, i, z, false, false, false)
    }

    fun drawBump(other: OpenJPEG, i: Int, z: Boolean, z2: Boolean) {
        val myBuf = rawBuffer ?: return
        val otherBuf = other.rawBuffer ?: return
        if (num_extra_components < 1 || other.num_components < 4) return
        drawBuf(myBuf, width, height, num_components, otherBuf, other.width, other.height, other.num_components, 0, false, false, z2, true)
    }

    @Throws(Throwable::class)
    protected fun finalize() {
        rawBuffer?.let { buf ->
            TextureMemoryTracker.releaseOpenJpegMemory(buf.capacity(), mmapped)
            release(buf)
            rawBuffer = null
        }
    }

    override fun getAsBitmap(): Bitmap? {
        val createBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888) ?: return null
        for (j in 0 until height) {
            for (k in 0 until width) {
                val pixel: Int
                if (num_components == 1) {
                    val v = getByte((width * j + k) * num_components).toInt() and 0xFF
                    pixel = v or (v shl 16) or 0xFF000000.toInt() or (v shl 8)
                } else {
                    val offset = (width * j + k) * num_components
                    val alpha = if (num_components >= 4) getByte(offset + 3).toInt() and 0xFF else 255
                    pixel = (alpha shl 24) or
                            ((getByte(offset).toInt() and 0xFF) shl 16) or
                            ((getByte(offset + 1).toInt() and 0xFF) shl 8) or
                            (getByte(offset + 2).toInt() and 0xFF)
                }
                createBitmap.setPixel(k, (height - 1) - j, pixel)
            }
        }
        return createBitmap
    }

    override fun getByte(i: Int): Byte {
        return rawBuffer?.get(i) ?: 0
    }

    fun getExtraAsBitmap(): Bitmap {
        val createBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        for (j in 0 until height) {
            for (k in 0 until width) {
                val pixel: Int = if (num_extra_components == 1) {
                    val v = getByte(width * height * num_components + width * j + k).toInt() and 0xFF
                    v or (v shl 16) or 0xFF000000.toInt() or (v shl 8)
                } else {
                    0
                }
                createBitmap.setPixel(k, (height - 1) - j, pixel)
            }
        }
        return createBitmap
    }

    override fun getExtraComponentsBuffer(): ByteBuffer? {
        if (num_extra_components == 0) return null
        val buf = rawBuffer ?: return null
        val asReadOnly = buf.asReadOnlyBuffer()
        val pos = width * height * num_components
        if (pos in 0..asReadOnly.limit()) {
            asReadOnly.position(pos)
            return asReadOnly
        }
        return null
    }

    override fun getHeight(): Int = height

    fun getLoadedSize(): Int {
        val buf = rawBuffer ?: return 0
        return when {
            bytes_per_pixel == ETC1_BYTES_PER_PIXEL -> buf.capacity()
            bytes_per_pixel == 3 && num_components == 3 -> width * height * (bytes_per_pixel + 1)
            else -> width * height * bytes_per_pixel
        }
    }

    override fun getNumComponents(): Int = num_components

    override fun getRGB(i: Int): Int {
        val buf = rawBuffer ?: return 0
        return ((buf.get(i).toInt() shl 16) and 0xFF0000) or
                ((buf.get(i + 1).toInt() shl 8) and 0xFF00) or
                (buf.get(i + 2).toInt() and 0xFF)
    }

    override fun getWidth(): Int = width

    fun hasAlphaLayer(): Boolean {
        return bytes_per_pixel != ETC1_BYTES_PER_PIXEL && (num_components >= 4 || num_components == 1)
    }

    fun putPixelRow(row: Int, ints: IntArray, count: Int) {
        val buf = rawBuffer ?: return
        var pos = width * num_components * row
        if (num_components == 3) {
            for (i in 0 until count) {
                val px = ints[i]
                buf.put(pos++, (px shr 16).toByte())
                buf.put(pos++, (px shr 8).toByte())
                buf.put(pos++, px.toByte())
            }
        } else if (num_components == 4) {
            for (i in 0 until count) {
                val px = ints[i]
                buf.put(pos++, (px shr 16).toByte())
                buf.put(pos++, (px shr 8).toByte())
                buf.put(pos++, px.toByte())
                buf.put(pos++, (px shr 24).toByte())
            }
        }
    }

    fun setComponent(component: Int, value: Byte) {
        rawBuffer?.let { setComponentBuf(it, width, height, num_components, num_extra_components, component, value) }
    }

    companion object {
        private const val ETC1_BYTES_PER_PIXEL = 888

        init {
            System.loadLibrary("openjpeg")
        }

        @JvmStatic
        external fun applyFlexibleMorph(byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer, i: Int, floats: FloatArray)

        @JvmStatic
        external fun applyMeshMorph(
            f: Float, byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer, i: Int,
            byteBuffer3: ByteBuffer, byteBuffer4: ByteBuffer, byteBuffer5: ByteBuffer,
            i2: Int, i3: Int, i4: Int, byteBuffer6: ByteBuffer
        )

        @JvmStatic
        external fun applyMorphingTransform(
            i: Int, byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer, byteBuffer3: ByteBuffer,
            ints: IntArray, floats: FloatArray
        )

        @JvmStatic
        external fun applyRiggedMeshMorph(
            byteBuffer: ByteBuffer, i: Int, floats: FloatArray, floats2: FloatArray,
            byteBuffer2: ByteBuffer, byteBuffer3: ByteBuffer, i2: Int
        )

        @JvmStatic
        fun bakeTerrain(
            w: Int, h: Int, sources: Array<OpenJPEG?>, floats: FloatArray, i3: Int, i4: Int
        ): OpenJPEG {
            val result = OpenJPEG(w, h, 3, 2, 0, 0)
            val buffers = arrayOfNulls<ByteBuffer>(sources.size)
            val widths = IntArray(sources.size)
            val heights = IntArray(sources.size)
            val components = IntArray(sources.size)
            for (j in sources.indices) {
                val src = sources[j]
                if (src != null) {
                    buffers[j] = src.rawBuffer
                    widths[j] = src.width
                    heights[j] = src.height
                    components[j] = src.num_components
                } else {
                    buffers[j] = null
                    widths[j] = 0
                    heights[j] = 0
                    components[j] = 0
                }
            }
            result.bakeTerrainRaw(result.rawBuffer!!, w, h, buffers, widths, heights, components, floats, i3, i4)
            return result
        }

        @JvmStatic
        external fun calcFlexiSections(
            floats: FloatArray, i: Int, floats2: FloatArray, floats3: FloatArray,
            i2: Int, f: Float, f2: Float, f3: Float, f4: Float, f5: Float,
            f6: Float, f7: Float, f8: Float, f9: Float, f10: Float, z: Boolean
        )

        @JvmStatic
        external fun checkFrustrumOcclusion(floats: FloatArray, floats2: FloatArray, f: Float, f2: Float, f3: Float): Int

        @JvmStatic
        external fun getFlexiDataSize(i: Int): Int

        @JvmStatic
        external fun meshPrepareInfluenceBuffer(byteBuffer: ByteBuffer, i: Int, byteBuffer2: ByteBuffer, i2: Int)

        @JvmStatic
        external fun meshPrepareSeparateInfluenceBuffer(
            byteBuffer: ByteBuffer, i: Int, byteBuffer2: ByteBuffer, byteBuffer3: ByteBuffer, i2: Int
        )
    }
}
