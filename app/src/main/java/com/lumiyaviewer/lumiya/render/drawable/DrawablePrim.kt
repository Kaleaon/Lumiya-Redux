package com.lumiyaviewer.lumiya.render.drawable

import android.opengl.GLES10
import android.opengl.GLES11
import android.opengl.GLES20
import android.opengl.Matrix
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.avatar.AvatarSkeleton
import com.lumiyaviewer.lumiya.render.avatar.AvatarTextures
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.lumiya.render.picking.IntersectInfo
import com.lumiyaviewer.lumiya.render.shaders.FlexiPrimProgram
import com.lumiyaviewer.lumiya.render.shaders.PrimProgram
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import com.lumiyaviewer.lumiya.slproto.avatar.BakesOnMesh
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations
import com.lumiyaviewer.lumiya.slproto.prims.AvatarBakes
import com.lumiyaviewer.lumiya.slproto.prims.PrimDrawParams
import com.lumiyaviewer.lumiya.slproto.prims.PrimFlexibleInfo
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntryFace
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

class DrawablePrim(primDrawParams: PrimDrawParams, drawableGeometry: DrawableGeometry) {

    private val volumeGeometry: DrawableGeometry = drawableGeometry
    val isRiggedMesh: Boolean
    private val riggingFitsGL20: Boolean
    private val FaceCount: Int
    private val FaceColorsIDs: IntArray?
    private val FaceTextures: Array<DrawableFaceTexture?>?
    private val FaceUVMatrices: FloatArray?
    private var drawingTextureEnabled: Boolean = false
    private var firstFace: Boolean = false
    private val isSingleFace: Boolean
    private val singleFaceColor: Int
    private val singleFaceMatrix: FloatArray?
    private val singleFaceTexture: DrawableFaceTexture?

    init {
        val isFacesCombined = drawableGeometry.facesCombined
        this.isRiggedMesh = drawableGeometry.isRiggedMesh
        this.riggingFitsGL20 = if (isRiggedMesh) drawableGeometry.riggingFitsGL20() else false
        this.FaceCount = drawableGeometry.getFaceCount()
        val textures = primDrawParams.textures
        if (textures == null) {
            isSingleFace = false
            singleFaceColor = 0
            singleFaceTexture = null
            singleFaceMatrix = null
            FaceColorsIDs = IntArray(FaceCount * 2)
            FaceTextures = arrayOfNulls(FaceCount)
            FaceUVMatrices = FloatArray(FaceCount * 16)
        } else {
            val textureEntryFace = textures.GetDefaultTexture()
            if (textures.isSingleFace && isFacesCombined) {
                isSingleFace = true
                singleFaceMatrix = FloatArray(16)
                val textureEntryFace2 = textures.GetFace(0)
                if (textureEntryFace2 != null) {
                    singleFaceColor = textureEntryFace2.getRGBA(textureEntryFace)
                    val textureID = textureEntryFace2.getTextureID(textureEntryFace)
                    singleFaceTexture = if (textureID != null) {
                        DrawableFaceTexture(faceTextureParams(textureID, primDrawParams.bakes))
                    } else null
                    initFaceUVMatrix(textureEntryFace, textureEntryFace2, singleFaceMatrix, 0)
                } else {
                    singleFaceColor = 0
                    singleFaceTexture = null
                }
                FaceColorsIDs = null
                FaceTextures = null
                FaceUVMatrices = null
            } else {
                isSingleFace = false
                singleFaceColor = 0
                singleFaceTexture = null
                singleFaceMatrix = null
                FaceColorsIDs = IntArray(FaceCount * 2)
                FaceTextures = arrayOfNulls(FaceCount)
                FaceUVMatrices = FloatArray(FaceCount * 16)
                var i = 0
                for (j in 0 until FaceCount) {
                    val textureEntryFace3 = textures.GetFace(drawableGeometry.getFaceID(j))
                    if (textureEntryFace3 != null) {
                        FaceColorsIDs[i] = textureEntryFace3.getRGBA(textureEntryFace)
                        FaceColorsIDs[i + 1] = 0
                        val textureID2 = textureEntryFace3.getTextureID(textureEntryFace)
                        if (textureID2 != null) {
                            FaceTextures[j] = DrawableFaceTexture(faceTextureParams(textureID2, primDrawParams.bakes))
                        }
                        initFaceUVMatrix(textureEntryFace, textureEntryFace3, FaceUVMatrices, j * 16)
                    }
                    i += 2
                }
            }
        }
    }

    private fun DrawFace(
        renderContext: RenderContext, drawableGeometry: DrawableGeometry,
        glLoadableBuffer: GLLoadableBuffer?, z: Boolean, i: Int, i2: Int,
        drawableFaceTexture: DrawableFaceTexture?, floats: FloatArray, i3: Int, i4: Int
    ): Int {
        val faceRenderMask = getFaceRenderMask(i2, drawableFaceTexture)
        if (faceRenderMask and i4 == 0) {
            return faceRenderMask
        }
        var z2 = false
        if (!z) {
            if (renderContext.hasGL20) {
                GLES20.glUniform4f(renderContext.curPrimProgram.vColor, (255 - (i2 and 255)) / 255.0f, (255 - ((i2 shr 8) and 255)) / 255.0f, (255 - ((i2 shr 16) and 255)) / 255.0f, (255 - ((i2 shr 24) and 255)) / 255.0f)
            } else {
                GLES10.glColor4f((255 - (i2 and 255)) / 255.0f, (255 - ((i2 shr 8) and 255)) / 255.0f, (255 - ((i2 shr 16) and 255)) / 255.0f, (255 - ((i2 shr 24) and 255)) / 255.0f)
            }
            if (drawableFaceTexture != null && drawableFaceTexture.GLDraw(renderContext)) {
                z2 = true
            }
        } else if (renderContext.hasGL20) {
            GLES20.glUniform4f(renderContext.curPrimProgram.vColor, 1.0f, 0.0f, 0.0f, 0.6f)
        } else {
            GLES10.glColor4f(1.0f, 0.0f, 0.0f, 0.6f)
        }
        if (z2 != drawingTextureEnabled || firstFace) {
            if (renderContext.hasGL20) {
                if (z2) {
                    renderContext.curPrimProgram.setTextureEnabled(true)
                } else {
                    GLES20.glBindTexture(3553, 0)
                    renderContext.curPrimProgram.setTextureEnabled(false)
                }
            } else if (z2) {
                GLES10.glEnable(3553)
                GLES10.glEnableClientState(32888)
            } else {
                GLES10.glDisable(3553)
                GLES10.glDisableClientState(32888)
            }
            drawingTextureEnabled = z2
            firstFace = false
        }
        if (renderContext.hasGL20) {
            GLES20.glUniformMatrix4fv(renderContext.curPrimProgram.uTexMatrix, 1, false, floats, i3)
            if (i == -1) {
                drawableGeometry.GLDrawAll20(renderContext)
            } else {
                drawableGeometry.GLDrawFace20(renderContext, i)
            }
        } else {
            GLES11.glMatrixMode(5890)
            GLES11.glPushMatrix()
            GLES11.glLoadMatrixf(floats, i3)
            if (i == -1) {
                drawableGeometry.GLDrawAll10(renderContext)
            } else {
                drawableGeometry.GLDrawFace10(renderContext, i, glLoadableBuffer!!)
            }
            GLES11.glPopMatrix()
            GLES11.glMatrixMode(5888)
        }
        return faceRenderMask
    }

    private fun DrawFaceFast20(
        renderContext: RenderContext, drawableGeometry: DrawableGeometry,
        i: Int, i2: Int, drawableFaceTexture: DrawableFaceTexture?,
        floats: FloatArray, i3: Int, i4: Int
    ): Int {
        val faceRenderMask = getFaceRenderMask(i2, drawableFaceTexture)
        if (faceRenderMask and i4 == 0) {
            return faceRenderMask
        }
        GLES20.glUniform4f(renderContext.curPrimProgram.vColor, (255 - (i2 and 255)) / 255.0f, (255 - ((i2 shr 8) and 255)) / 255.0f, (255 - ((i2 shr 16) and 255)) / 255.0f, (255 - ((i2 shr 24) and 255)) / 255.0f)
        renderContext.bindFaceTexture(drawableFaceTexture)
        GLES20.glUniformMatrix4fv(renderContext.curPrimProgram.uTexMatrix, 1, false, floats, i3)
        if (i == -1) {
            drawableGeometry.GLDrawAll20(renderContext)
        } else {
            drawableGeometry.GLDrawFace20(renderContext, i)
        }
        return faceRenderMask
    }

    private fun getFaceRenderMask(i: Int, drawableFaceTexture: DrawableFaceTexture?): Int {
        if (i and (-16777216) == -16777216) {
            return 0
        }
        var hasAlphaLayer = i and (-16777216) != 0
        if (!hasAlphaLayer && drawableFaceTexture != null) {
            hasAlphaLayer = drawableFaceTexture.hasAlphaLayer()
        }
        return if (hasAlphaLayer) RENDER_PASS_TRANSPARENT else RENDER_PASS_OPAQUE
    }

    private fun initFaceUVMatrix(textureEntryFace: SLTextureEntryFace, textureEntryFace2: SLTextureEntryFace, floats2: FloatArray, i: Int) {
        val floats = FloatArray(16)
        Matrix.setIdentityM(floats, 0)
        Matrix.translateM(floats, 0, textureEntryFace2.getOffsetU(textureEntryFace) + 0.5f, textureEntryFace2.getOffsetV(textureEntryFace) + 0.5f, 0.0f)
        Matrix.scaleM(floats, 0, textureEntryFace2.getRepeatU(textureEntryFace), textureEntryFace2.getRepeatV(textureEntryFace), 1.0f)
        Matrix.rotateM(floats2, i, floats, 0, textureEntryFace2.getRotation(textureEntryFace) / 0.017453292f, 0.0f, 0.0f, -1.0f)
        Matrix.translateM(floats2, i, -0.5f, -0.5f, 0.0f)
    }

    fun ApplyJointTranslations(meshJointTranslations: MeshJointTranslations) {
        if (isRiggedMesh) {
            volumeGeometry.ApplyJointTranslations(meshJointTranslations)
        }
    }

    fun Draw(renderContext: RenderContext, z: Boolean, primFlexibleInfo: PrimFlexibleInfo?, i: Int): Int {
        val drawableGeometry = volumeGeometry
        firstFace = true
        val glLoadableBuffer: GLLoadableBuffer?
        if (renderContext.hasGL20) {
            val matrices = primFlexibleInfo?.matrices
            renderContext.curPrimProgram = when {
                isRiggedMesh && riggingFitsGL20 -> renderContext.riggedMeshProgram
                matrices != null -> renderContext.flexiPrimProgram
                else -> renderContext.primProgram
            }
            GLES20.glUseProgram(renderContext.curPrimProgram.handle)
            renderContext.glModelApplyMatrix(renderContext.curPrimProgram.uMVPMatrix)
            renderContext.glObjWorldApplyMatrix(renderContext.curPrimProgram.uObjWorldMatrix)
            renderContext.glObjScaleApplyVector(renderContext.curPrimProgram.uObjCoordScale)
            if (matrices != null && renderContext.curPrimProgram is FlexiPrimProgram) {
                val flexiPrimProgram = renderContext.curPrimProgram as FlexiPrimProgram
                GLES20.glUniform1i(flexiPrimProgram.uNumSectionMatrices, matrices.size / 16)
                GLES20.glUniformMatrix4fv(flexiPrimProgram.uSectionMatrices, matrices.size / 16, false, matrices, 0)
            }
            glLoadableBuffer = drawableGeometry.GLBindBuffers20(renderContext)
        } else {
            glLoadableBuffer = drawableGeometry.GLBindBuffers10(renderContext, primFlexibleInfo)
        }
        drawingTextureEnabled = false
        if (isSingleFace) {
            return DrawFace(renderContext, drawableGeometry, glLoadableBuffer, z, -1, singleFaceColor, singleFaceTexture, singleFaceMatrix!!, 0, i)
        }
        var drawFace = 0
        for (i2 in 0 until FaceCount) {
            drawFace = drawFace or DrawFace(renderContext, drawableGeometry, glLoadableBuffer, z, i2, FaceColorsIDs!![i2 * 2], FaceTextures!![i2], FaceUVMatrices!!, i2 * 16, i)
        }
        return drawFace
    }

    fun DrawFast20(renderContext: RenderContext, z: Boolean, primFlexibleInfo: PrimFlexibleInfo?, i: Int): Int {
        val drawableGeometry = volumeGeometry
        val matrices = primFlexibleInfo?.matrices
        val z2 = i == 1
        val primProgram: PrimProgram = when {
            isRiggedMesh && riggingFitsGL20 -> renderContext.riggedMeshProgram
            matrices != null -> if (z2) renderContext.flexiPrimOpaqueProgram else renderContext.flexiPrimProgram
            else -> if (z2) renderContext.primOpaqueProgram else renderContext.primProgram
        }
        if (renderContext.curPrimProgram !== primProgram) {
            renderContext.curPrimProgram = primProgram
            GLES20.glUseProgram(renderContext.curPrimProgram.handle)
            renderContext.glModelApplyMatrix(renderContext.curPrimProgram.uMVPMatrix)
        }
        renderContext.glObjWorldApplyMatrix(renderContext.curPrimProgram.uObjWorldMatrix)
        renderContext.glObjScaleApplyVector(renderContext.curPrimProgram.uObjCoordScale)
        if (matrices != null) {
            GLES20.glUniform1i(renderContext.flexiPrimProgram.uNumSectionMatrices, matrices.size / 16)
            GLES20.glUniformMatrix4fv(renderContext.flexiPrimProgram.uSectionMatrices, matrices.size / 16, false, matrices, 0)
        }
        drawableGeometry.GLBindBuffers20(renderContext)
        if (isSingleFace) {
            return DrawFaceFast20(renderContext, drawableGeometry, -1, singleFaceColor, singleFaceTexture, singleFaceMatrix!!, 0, i)
        }
        var drawFaceFast = 0
        for (i2 in 0 until FaceCount) {
            drawFaceFast = drawFaceFast or DrawFaceFast20(renderContext, drawableGeometry, i2, FaceColorsIDs!![i2 * 2], FaceTextures!![i2], FaceUVMatrices!!, i2 * 16, i)
        }
        return drawFaceFast
    }

    fun DrawRigged30(renderContext: RenderContext, i: Int): Int {
        val drawableGeometry = volumeGeometry
        var z = false
        var i2 = 0
        for (j in 0 until FaceCount) {
            val i4 = FaceColorsIDs!![j * 2]
            val drawableFaceTexture = FaceTextures!![j]
            val faceRenderMask = getFaceRenderMask(i4, drawableFaceTexture)
            i2 = i2 or faceRenderMask
            if (faceRenderMask and i != 0) {
                if (!z) {
                    drawableGeometry.GLBindBuffersRigged30(renderContext)
                    z = true
                }
                GLES20.glUniform4f(renderContext.curPrimProgram.vColor, (255 - (i4 and 255)) / 255.0f, (255 - ((i4 shr 8) and 255)) / 255.0f, (255 - ((i4 shr 16) and 255)) / 255.0f, (255 - ((i4 shr 24) and 255)) / 255.0f)
                renderContext.bindFaceTexture(drawableFaceTexture)
                GLES20.glUniformMatrix4fv(renderContext.curPrimProgram.uTexMatrix, 1, false, FaceUVMatrices!!, j * 16)
                drawableGeometry.GLDrawRiggedFace30(renderContext, j)
            }
        }
        return i2
    }

    fun IntersectRay(vector3: LLVector3, vector33: LLVector3): IntersectInfo? {
        val intersectInfo = volumeGeometry.IntersectRay(vector3, vector33) ?: return null
        if (!intersectInfo.faceKnown) return intersectInfo
        return when {
            isSingleFace && singleFaceMatrix != null -> IntersectInfo(intersectInfo, singleFaceMatrix, 0)
            !isSingleFace && FaceUVMatrices != null -> IntersectInfo(intersectInfo, FaceUVMatrices, intersectInfo.faceID * 16)
            else -> intersectInfo
        }
    }

    fun UpdateRigged(renderContext: RenderContext, avatarSkeleton: AvatarSkeleton): Boolean {
        return if (isRiggedMesh) volumeGeometry.UpdateRigged(renderContext, avatarSkeleton) else false
    }

    fun hasExtendedBones(): Boolean = volumeGeometry.hasExtendedBones()

    companion object {
        const val RENDER_PASS_ALL = 3
        const val RENDER_PASS_OPAQUE = 1
        const val RENDER_PASS_TRANSPARENT = 2

        @JvmStatic
        fun faceTextureParams(textureID: UUID, bakes: AvatarBakes?): DrawableTextureParams {
            if (bakes != null) {
                val bakedFace = BakesOnMesh.getBakedFace(textureID)
                if (bakedFace != null) {
                    val bake = bakes.getBake(bakedFace)
                    if (bake != null && bake != UUIDPool.ZeroUUID && bake != AvatarTextures.DEFAULT_AVATAR_TEXTURE) {
                        return DrawableTextureParams.create(bake, bakedFace, bakes.avatarUUID)
                    }
                }
            }
            return DrawableTextureParams.create(textureID, TextureClass.Prim)
        }
    }
}
