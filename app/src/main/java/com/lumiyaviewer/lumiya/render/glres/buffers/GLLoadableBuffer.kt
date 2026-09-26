package com.lumiyaviewer.lumiya.render.glres.buffers

import android.opengl.GLES10
import android.opengl.GLES11
import android.opengl.GLES20
import android.opengl.GLES30
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.glres.GLCleanable
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import javax.annotation.Nonnull

class GLLoadableBuffer(@Nonnull val rawBuffer: DirectByteBuffer) : GLCleanable {

    private var glBuffer: GLBuffer? = null

    init {
        rawBuffer.position(0)
    }

    fun Bind(renderContext: RenderContext, clientState: Int, size: Int, type: Int, stride: Int, offset: Int) {
        if (!renderContext.useVBO) {
            renderContext.KeepBuffer(rawBuffer)
            GLES10.glEnableClientState(clientState)
            when (clientState) {
                32884 -> GLES10.glVertexPointer(size, type, stride, rawBuffer.positionFloat(offset))
                32885 -> GLES10.glNormalPointer(type, stride, rawBuffer.positionFloat(offset))
                32888 -> GLES10.glTexCoordPointer(size, type, stride, rawBuffer.positionFloat(offset))
            }
        }
        if (glBuffer == null) {
            renderContext.KeepBuffer(rawBuffer)
            glBuffer = GLBuffer(renderContext.glResourceManager, rawBuffer)
            renderContext.glBindArrayBuffer(glBuffer!!.handle)
            renderContext.glBufferArrayData(rawBuffer.capacity, rawBuffer.asByteBuffer(), false)
            renderContext.glResourceManager.addCleanable(this)
        } else {
            renderContext.glBindArrayBuffer(glBuffer!!.handle)
        }
        GLES10.glEnableClientState(clientState)
        when (clientState) {
            32884 -> GLES11.glVertexPointer(size, type, stride, offset)
            32885 -> GLES11.glNormalPointer(type, stride, offset)
            32888 -> GLES11.glTexCoordPointer(size, type, stride, offset)
        }
    }

    fun Bind20(renderContext: RenderContext, attribIndex: Int, size: Int, type: Int, stride: Int, offset: Int) {
        if (glBuffer == null) {
            renderContext.KeepBuffer(rawBuffer)
            glBuffer = GLBuffer(renderContext.glResourceManager, rawBuffer)
            GLES20.glBindBuffer(34962, glBuffer!!.handle)
            GLES20.glBufferData(34962, rawBuffer.capacity, rawBuffer.asByteBuffer(), 35044)
            renderContext.glResourceManager.addCleanable(this)
        } else {
            GLES20.glBindBuffer(34962, glBuffer!!.handle)
        }
        GLES20.glEnableVertexAttribArray(attribIndex)
        GLES20.glVertexAttribPointer(attribIndex, size, type, false, stride, offset)
    }

    fun Bind30Integer(renderContext: RenderContext, attribIndex: Int, size: Int, type: Int, stride: Int, offset: Int) {
        if (glBuffer == null) {
            renderContext.KeepBuffer(rawBuffer)
            glBuffer = GLBuffer(renderContext.glResourceManager, rawBuffer)
            GLES20.glBindBuffer(34962, glBuffer!!.handle)
            GLES20.glBufferData(34962, rawBuffer.capacity, rawBuffer.asByteBuffer(), 35044)
            renderContext.glResourceManager.addCleanable(this)
        } else {
            GLES20.glBindBuffer(34962, glBuffer!!.handle)
        }
        GLES30.glEnableVertexAttribArray(attribIndex)
        GLES30.glVertexAttribIPointer(attribIndex, size, type, stride, offset)
    }

    fun BindElements(renderContext: RenderContext) {
        if (renderContext.useVBO) {
            if (glBuffer != null) {
                renderContext.glBindElementArrayBuffer(glBuffer!!.handle)
                return
            }
            renderContext.KeepBuffer(rawBuffer)
            glBuffer = GLBuffer(renderContext.glResourceManager, rawBuffer)
            renderContext.glBindElementArrayBuffer(glBuffer!!.handle)
            renderContext.glBufferElementArrayData(rawBuffer.capacity, rawBuffer.asByteBuffer(), false)
            renderContext.glResourceManager.addCleanable(this)
        }
    }

    fun BindElements20(renderContext: RenderContext) {
        if (glBuffer != null) {
            GLES20.glBindBuffer(34963, glBuffer!!.handle)
            return
        }
        renderContext.KeepBuffer(rawBuffer)
        glBuffer = GLBuffer(renderContext.glResourceManager, rawBuffer)
        GLES20.glBindBuffer(34963, glBuffer!!.handle)
        GLES20.glBufferData(34963, rawBuffer.capacity, rawBuffer.asByteBuffer(), 35044)
        renderContext.glResourceManager.addCleanable(this)
    }

    fun BindUniform(renderContext: RenderContext, bindingPoint: Int) {
        var isNew = false
        if (glBuffer == null) {
            glBuffer = GLBuffer(renderContext.glResourceManager, rawBuffer)
            renderContext.glResourceManager.addCleanable(this)
            isNew = true
        }
        GLES30.glBindBufferBase(35345, bindingPoint, glBuffer!!.handle)
        if (isNew) {
            GLES20.glBufferData(35345, rawBuffer.capacity, rawBuffer.asByteBuffer(), 35044)
        }
    }

    fun BindUniformDynamic(renderContext: RenderContext, bindingPoint: Int, needsUpdate: Boolean) {
        var isNew = false
        if (glBuffer == null) {
            glBuffer = GLBuffer(renderContext.glResourceManager, rawBuffer)
            renderContext.glResourceManager.addCleanable(this)
            isNew = true
        }
        GLES30.glBindBufferBase(35345, bindingPoint, glBuffer!!.handle)
        if (isNew) {
            GLES20.glBufferData(35345, rawBuffer.capacity, rawBuffer.asByteBuffer(), 35048)
        } else if (needsUpdate) {
            GLES20.glBufferSubData(35345, 0, rawBuffer.capacity, rawBuffer.asByteBuffer())
        }
    }

    fun DrawElements(renderContext: RenderContext, mode: Int, count: Int, type: Int, offset: Int) {
        if (renderContext.useVBO) {
            GLES11.glDrawElements(mode, count, type, offset)
        } else {
            GLES10.glDrawElements(mode, count, 5123, rawBuffer.position(offset))
        }
    }

    fun DrawElements20(mode: Int, count: Int, type: Int, offset: Int) {
        GLES20.glDrawElements(mode, count, type, offset)
    }

    override fun GLCleanup() {
        glBuffer = null
    }

    fun Reload(renderContext: RenderContext) {
        if (!renderContext.useVBO || glBuffer == null) return
        renderContext.KeepBuffer(rawBuffer)
        renderContext.glBindArrayBuffer(glBuffer!!.handle)
        renderContext.glBufferArrayData(rawBuffer.capacity, rawBuffer.asByteBuffer(), false)
    }

    fun getFloat(index: Int): Float = rawBuffer.getFloat(index)

    fun getShort(index: Int): Int = rawBuffer.getShort(index)
}
