package com.lumiyaviewer.lumiya.render

import android.annotation.SuppressLint
import android.opengl.GLES20
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.glres.buffers.GLBuffer
import com.lumiyaviewer.lumiya.render.glres.textures.GLResourceTexture
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.io.IOException
import java.nio.FloatBuffer
import java.nio.ShortBuffer
import java.util.Arrays

@SuppressLint("InlinedApi")
class WindlightSky(renderContext: RenderContext) {

    private val cloudsTexture: GLResourceTexture?
    private val buffers = arrayOfNulls<GLBuffer>(4)
    private var skyMatrix: MatrixStack? = null
    private val starsCoords: FloatBuffer = FloatBuffer.allocate(NUM_STARS * 3)
    private val starsIndices: ShortBuffer = ShortBuffer.allocate(NUM_STARS)

    init {
        val vector3 = LLVector3()
        for (i in 0 until NUM_STARS) {
            vector3.set(StarsRadius, 0.0f, 0.0f)
            val quaternion = LLQuaternion(
                ((Math.random().toFloat()) * 2.0f) - 1.0f,
                ((Math.random().toFloat()) * 2.0f) - 1.0f,
                ((Math.random().toFloat()) * 2.0f) - 1.0f,
                ((Math.random().toFloat()) * 2.0f) - 1.0f
            )
            quaternion.normalize()
            vector3.mul(quaternion)
            starsCoords.put(vector3.x)
            starsCoords.put(vector3.y)
            starsCoords.put(vector3.z)
            starsIndices.put(i.toShort())
        }

        cloudsTexture = if (renderContext.skyProgram!!.hasCloudsTexture()) {
            loadClouds(renderContext)
        } else {
            null
        }

        val wrap = FloatBuffer.wrap(icosahedronVertices)
        val shortBuffer = ShortBuffer.wrap(icosahedronIndices)
        for (j in buffers.indices) {
            buffers[j] = GLBuffer(renderContext.glResourceManager, null)
        }

        GLES20.glBindBuffer(34962, buffers[SKY_VERTEX_BUFFER]!!.handle)
        GLES20.glBufferData(34962, icosahedronVertices.size * 4, wrap.position(0), 35044)
        GLES20.glBindBuffer(34963, buffers[SKY_INDEX_BUFFER]!!.handle)
        GLES20.glBufferData(34963, icosahedronIndices.size * 2, shortBuffer.position(0), 35044)

        GLES20.glUseProgram(renderContext.skyProgram!!.getHandle())
        GLES20.glEnableVertexAttribArray(renderContext.skyProgram!!.vPosition)
        GLES20.glVertexAttribPointer(renderContext.skyProgram!!.vPosition, 3, 5126, false, 12, 0)

        GLES20.glBindBuffer(34962, buffers[STARS_VERTEX_BUFFER]!!.handle)
        GLES20.glBufferData(34962, starsCoords.capacity() * 4, starsCoords.position(0), 35044)
        GLES20.glBindBuffer(34963, buffers[STARS_INDEX_BUFFER]!!.handle)
        GLES20.glBufferData(34963, starsIndices.capacity() * 2, starsIndices.position(0), 35044)

        GLES20.glUseProgram(renderContext.starsProgram!!.getHandle())
        GLES20.glEnableVertexAttribArray(renderContext.starsProgram!!.vPosition)
        GLES20.glVertexAttribPointer(renderContext.starsProgram!!.vPosition, 3, 5126, false, 12, 0)
    }

    private fun loadClouds(renderContext: RenderContext): GLResourceTexture? {
        return try {
            val assetManager = LumiyaApp.getAssetManager()!!
            val targets = intArrayOf(34070, 34072, 34074, 34069, 34071, 34073)
            val fileNames = arrayOf("clouds_nx.tga", "clouds_py.tga", "clouds_nz.tga", "clouds_px.tga", "clouds_ny.tga", "clouds_pz.tga")
            val openJPEGArr = arrayOfNulls<OpenJPEG>(targets.size)
            var totalSize = 0
            for (i in targets.indices) {
                val stream = assetManager.open("windlight/${fileNames[i]}")
                val openJPEG = OpenJPEG(stream, OpenJPEG.ImageFormat.TGA, false, false, 0.0f, 0.0f, true)
                stream.close()
                Debug.Printf("WindlightSky: texture %dx%d,  numcomps %d, bpp %d",
                    openJPEG.width, openJPEG.height, openJPEG.num_components, openJPEG.bytes_per_pixel)
                openJPEGArr[i] = openJPEG
                totalSize += openJPEG.getLoadedSize()
            }
            val glResourceTexture = GLResourceTexture(renderContext.glResourceManager, totalSize)
            GLES20.glBindTexture(34067, glResourceTexture.handle)
            for (j in targets.indices) {
                openJPEGArr[j]!!.SetAsTextureTarget(targets[j])
                openJPEGArr[j] = null
            }
            GLES20.glTexParameteri(34067, 10240, 9729)
            GLES20.glTexParameteri(34067, 10241, 9729)
            GLES20.glTexParameteri(34067, 10242, 10497)
            GLES20.glTexParameteri(34067, 10243, 10497)
            glResourceTexture
        } catch (e: IOException) {
            Debug.Warning(e)
            null
        }
    }

    fun GLDraw(renderContext: RenderContext, windDirection: Float, tilt: Float) {
        val matrix = skyMatrix ?: return

        GLES20.glDisable(2884)
        GLES20.glDisable(3042)
        GLES20.glDepthFunc(515)

        matrix.glPushMatrix()
        if (tilt != 0.0f) {
            matrix.glRotatef(tilt, 1.0f, 0.0f, 0.0f)
        }
        matrix.glRotatef((-windDirection) + 90.0f, 0.0f, 0.0f, 1.0f)

        GLES20.glUseProgram(renderContext.skyProgram!!.getHandle())
        renderContext.skyProgram!!.ApplyWindlight(renderContext)
        matrix.glApplyUniformMatrix(renderContext.skyProgram!!.uMVPMatrix)

        GLES20.glBindBuffer(34962, buffers[SKY_VERTEX_BUFFER]!!.handle)
        GLES20.glEnableVertexAttribArray(renderContext.skyProgram!!.vPosition)
        GLES20.glVertexAttribPointer(renderContext.skyProgram!!.vPosition, 3, 5126, false, 12, 0)
        GLES20.glBindBuffer(34963, buffers[SKY_INDEX_BUFFER]!!.handle)

        if (renderContext.skyProgram!!.hasCloudsTexture()) {
            GLES20.glBindTexture(34067, cloudsTexture!!.handle)
        }
        GLES20.glDrawElements(4, icosahedronIndices.size, 5123, 0)

        if (renderContext.windlightPreset.star_brightness != 0.0f) {
            GLES20.glUseProgram(renderContext.starsProgram!!.getHandle())
            renderContext.starsProgram!!.ApplyWindlight(renderContext)
            matrix.glApplyUniformMatrix(renderContext.starsProgram!!.uMVPMatrix)

            GLES20.glBindBuffer(34962, buffers[STARS_VERTEX_BUFFER]!!.handle)
            GLES20.glEnableVertexAttribArray(renderContext.starsProgram!!.vPosition)
            GLES20.glVertexAttribPointer(renderContext.starsProgram!!.vPosition, 3, 5126, false, 12, 0)
            GLES20.glBindBuffer(34963, buffers[STARS_INDEX_BUFFER]!!.handle)
            GLES20.glDrawElements(0, starsIndices.capacity(), 5123, 0)
        }

        GLES20.glEnable(2884)
        GLES20.glEnable(3042)
        GLES20.glDepthFunc(GLES20.GL_LESS)
        matrix.glPopMatrix()
    }

    fun updateMatrix(renderContext: RenderContext) {
        val matrix = skyMatrix ?: MatrixStack().also { skyMatrix = it }
        val floats = FloatArray(16)
        Arrays.fill(floats, 0.0f)
        val tan = 1.0f / Math.tan((renderContext.FOVAngle * Math.PI) / 360.0).toFloat()
        val f = 1.0f / renderContext.aspectRatio
        floats[0] = tan
        floats[5] = tan / f
        floats[10] = -1.0f
        floats[11] = -1.0f
        floats[14] = -1.0f
        matrix.reset()
        matrix.glLoadMatrixf(floats, 0)
        matrix.glRotatef(-90.0f, 1.0f, 0.0f, 0.0f)
    }

    companion object {
        private const val NUM_STARS = 500
        private const val SKY_VERTEX_BUFFER = 0
        private const val SKY_INDEX_BUFFER = 1
        private const val STARS_VERTEX_BUFFER = 2
        private const val STARS_INDEX_BUFFER = 3
        private const val StarsRadius = 0.8f

        @JvmStatic
        val Q: Float = ((Math.sqrt(5.0) + 1.0) / 2.0).toFloat()

        @JvmStatic
        val icoRadius: Float = Math.sqrt((Q * Q + 1.0f).toDouble()).toFloat()

        @JvmStatic
        val ico1: Float = 1.0f / icoRadius

        @JvmStatic
        val icoQ: Float = Q / icoRadius

        @JvmStatic
        val icosahedronVertices: FloatArray = floatArrayOf(
            0.0f, ico1, icoQ, 0.0f, -ico1, icoQ, 0.0f, -ico1, -icoQ, 0.0f, ico1, -icoQ,
            icoQ, 0.0f, ico1, -icoQ, 0.0f, ico1, -icoQ, 0.0f, -ico1, icoQ, 0.0f, -ico1,
            ico1, -icoQ, 0.0f, -ico1, -icoQ, 0.0f, -ico1, icoQ, 0.0f, ico1, icoQ, 0.0f
        )

        @JvmStatic
        val icosahedronIndices: ShortArray = shortArrayOf(
            5, 0, 1, 10, 0, 5, 5, 1, 9, 10, 5, 6, 6, 5, 9, 11, 0, 10, 3, 11, 10, 3, 10, 6,
            3, 6, 2, 7, 3, 2, 8, 7, 2, 4, 7, 8, 1, 4, 8, 9, 8, 2, 9, 2, 6, 11, 3, 7,
            4, 0, 11, 4, 11, 7, 1, 0, 4, 1, 8, 9
        )
    }
}
