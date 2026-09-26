package com.lumiyaviewer.lumiya.render.glres.textures

import android.graphics.Canvas
import android.graphics.SurfaceTexture
import android.opengl.GLES11
import android.view.Surface

class GLExternalTexture(private val width: Int, private val height: Int) {
    private val handle: Int
    private val onFrameAvailableListener = SurfaceTexture.OnFrameAvailableListener { }
    private val surface: Surface
    private val surfaceTexture: SurfaceTexture

    init {
        val ints = IntArray(1)
        GLES11.glGenTextures(1, ints, 0)
        handle = ints[0]
        bind()
        // 36197 = GL_TEXTURE_EXTERNAL_OES, 6408 = GL_RGBA, 5121 = GL_UNSIGNED_BYTE.
        GLES11.glTexImage2D(36197, 0, 6408, width, height, 0, 6408, 5121, null)
        // 10241 = GL_TEXTURE_MIN_FILTER, 10240 = GL_TEXTURE_MAG_FILTER, 9729 = GL_LINEAR.
        GLES11.glTexParameteri(36197, 10241, 9729)
        GLES11.glTexParameteri(36197, 10240, 9729)
        surfaceTexture = SurfaceTexture(handle)
        surfaceTexture.setDefaultBufferSize(width, height)
        surfaceTexture.setOnFrameAvailableListener(onFrameAvailableListener)
        surface = Surface(surfaceTexture)
    }

    fun bind() {
        // 36197 = GL_TEXTURE_EXTERNAL_OES.
        GLES11.glBindTexture(36197, handle)
    }

    fun getCanvas(): Canvas = surface.lockCanvas(null)

    fun getHeight(): Int = height

    fun getWidth(): Int = width

    fun postCanvas(canvas: Canvas) {
        surface.unlockCanvasAndPost(canvas)
    }

    fun release() {
        surface.release()
        surfaceTexture.release()
        GLES11.glDeleteTextures(1, intArrayOf(handle), 0)
    }

    fun update(matrix: FloatArray) {
        surfaceTexture.updateTexImage()
        surfaceTexture.getTransformMatrix(matrix)
    }
}
