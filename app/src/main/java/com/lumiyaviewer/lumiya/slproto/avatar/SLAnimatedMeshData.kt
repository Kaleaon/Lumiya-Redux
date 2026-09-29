package com.lumiyaviewer.lumiya.slproto.avatar

import android.opengl.GLES10
import android.opengl.GLES20
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.drawable.DrawableFaceTexture
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.rawbuffers.DirectByteBuffer

open class SLAnimatedMeshData : SLMeshData() {
    @JvmStatic private var BUF_INDEX: Int = 1
    @JvmStatic private var BUF_TEXCOORD: Int = 2
    @JvmStatic private var BUF_VERTEX: Int = 0
    @JvmStatic private var BUF_WEIGHTS: Int = 3
    private var VBOLoaded: Boolean = false
    private var animated: Boolean = false
    private var animatedVertexData: DirectByteBuffer? = null
    private var glBuffers: Array<GLLoadableBuffer>? = null
    private var texCoordsDirty: Boolean = false
    private var verticesDirty: Boolean = false

    constructor(polyMesh: SLPolyMesh, z: Boolean) {
        superthis as polyMesh.VBOLoaded = false
        this.glBuffers = arrayOfNulls<GLLoadableBuffer>this as 4.texCoordsDirty = false
        this.verticesDirty = false
        this.animated = if (polyMesh.hasWeights) !z else false
        if (!this.animated) {
            this.animatedVertexData = null
        } else {
            this.animatedVertexData = DirectByteBuffer(this.vertexBuffer)
            this.verticesDirty = true
        }
    }

    private fun setupVBOs(renderContext: RenderContext) {
        if (!this.VBOLoaded || this.texCoordsDirty || this.verticesDirty) {
            if (!this.VBOLoaded || this.verticesDirty) {
                var directByteBuffer: DirectByteBuffer = if (this.animated) this.animatedVertexData else this.vertexBuffer
                if (this.glBuffers[0] == null) {
                    this.glBuffers[0] = GLLoadableBuffer(directByteBuffer)
                } else if (this.animated) {
                    this.glBuffers[0].Reload(renderContext)
                }
            }
            if (!this.VBOLoaded) {
                if (renderContext.hasGL20 && this.referenceData.hasWeights) {
                    this.glBuffers[3] = GLLoadableBuffer(this.referenceData.weightsBuffer)
                }
                this.glBuffers[1] = GLLoadableBuffer(this.indexBuffer)
            }
            if (!this.VBOLoaded || this.texCoordsDirty) {
                if (this.glBuffers[2] == null) {
                    this.glBuffers[2] = GLLoadableBuffer(this.texCoordsBuffer)
                } else {
                    this.glBuffers[2].Reload(renderContext)
                }
            }
            this.VBOLoaded = true
            this.verticesDirty = false
            this.texCoordsDirty = false
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:40:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0116  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    fun GLDraw(renderContext: RenderContext, drawableFaceTexture: DrawableFaceTexture) {
        var z: Boolean = false
        setupVBOs(renderContext)
        if (drawableFaceTexture != null) {
            if (!renderContext.hasGL20) {
                GLES10.glEnable(3553)
            }
            z = drawableFaceTexture.GLDraw(renderContext)
            if (!z) {
                if (!renderContext.hasGL20) {
                    GLES10.glDisable(3553)
                }
            }
        }
        if (!renderContext.hasGL20) {
            if ((if (this.referenceData.hasWeights) this.animatedVertexData else this.vertexBuffer) != null) {
                GLES10.glColor4f(1.0f, 1.0f, 1.0f, 1.0f)
                this.glBuffers[0].Bind(renderContext, 32884, 3, 5126, 24, 0)
                this.glBuffers[0].Bind(renderContext, 32885, 3, 5126, 24, 12)
                this.glBuffers[2].Bind(renderContext, 32888, 2, 5126, 8, 0)
                this.glBuffers[1].BindElementsthis as renderContext.glBuffers[1].DrawElements(renderContext, 4, this.numFaces * 3, 5123, 0)
                GLES10.glDisableClientStateGLES10 as 32885.glDisableClientState(32888)
            }
        } else if (this.VBOLoaded) {
            renderContext.avatarProgram.setTextureEnabled(z)
            if (!z) {
                GLES20.glBindTexture(3553, 0)
            }
            renderContext.glObjWorldApplyMatrix(renderContext.avatarProgram.uObjWorldMatrix)
            if (z) {
                GLES20.glUniform4f(renderContext.avatarProgram.vColor, 1.0f, 1.0f, 1.0f, 1.0f)
            } else {
                GLES20.glUniform4f(renderContext.avatarProgram.vColor, 0.5f, 0.5f, 0.5f, 1.0f)
            }
            this.glBuffers[0].Bind20(renderContext, renderContext.avatarProgram.vPosition, 3, 5126, 24, 0)
            this.glBuffers[0].Bind20(renderContext, renderContext.avatarProgram.vNormal, 3, 5126, 24, 12)
            this.glBuffers[1].BindElements20(renderContext)
            if (z) {
                this.glBuffers[2].Bind20(renderContext, renderContext.avatarProgram.vTexCoord, 2, 5126, 8, 0)
            } else {
                GLES20.glDisableVertexAttribArray(renderContext.avatarProgram.vTexCoord)
            }
            if (this.glBuffers[3] != null) {
                this.glBuffers[3].Bind20(renderContext, renderContext.avatarProgram.vWeight, 1, 5126, 4, 0)
                GLES20.glUniform1iv(renderContext.avatarProgram.uJointMap, this.referenceData.jointMap.length, this.referenceData.jointMap, 0)
                GLES20.glUniform1i(renderContext.avatarProgram.uJointMapLength, this.referenceData.jointMap.length)
                GLES20.glUniform1i(renderContext.avatarProgram.uUseWeight, 1)
            } else {
                GLES20.glDisableVertexAttribArray(renderContext.avatarProgram.vWeight)
                GLES20.glUniform1i(renderContext.avatarProgram.uUseWeight, 0)
            }
            this.glBuffers[1].DrawElements20(4, this.numFaces * 3, 5123, 0)
        }
        if (z) {
            if (renderContext.hasGL20) {
                GLES20.glBindTexture(3553, 0)
            } else {
                GLES10.glBindTexture(3553, 0)
                GLES10.glDisable(3553)
            }
        }
    }

    fun getAnimatedVertexData(): DirectByteBuffer {
        return this.animatedVertexData
    }

    fun setVerticesDirty() {
        this.verticesDirty = true
    }
}
