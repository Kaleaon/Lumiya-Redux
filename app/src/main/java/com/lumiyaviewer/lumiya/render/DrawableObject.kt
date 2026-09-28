package com.lumiyaviewer.lumiya.render

import android.opengl.GLES10
import android.opengl.Matrix
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.avatar.AvatarSkeleton
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.render.avatar.DrawableHoverText
import com.lumiyaviewer.lumiya.render.drawable.DrawablePrim
import com.lumiyaviewer.lumiya.render.glres.GLQuery
import com.lumiyaviewer.lumiya.render.picking.CollisionBox
import com.lumiyaviewer.lumiya.render.picking.GLRayTrace
import com.lumiyaviewer.lumiya.render.picking.IntersectPickable
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations
import com.lumiyaviewer.lumiya.slproto.objects.HoverText
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.prims.PrimDrawParams
import com.lumiyaviewer.lumiya.slproto.prims.PrimFlexibleInfo
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import javax.annotation.Nullable

class DrawableObject(
    private val drawableStore: DrawableStore,
    private val objInfo: SLObjectInfo,
    private val attachedTo: DrawableAvatar?
) : IntersectPickable, ResourceConsumer {

    @Volatile
    private var drawableHoverText: DrawableHoverText? = null

    @Volatile
    private var drawablePrim: DrawablePrim? = null

    @Volatile
    private var flexibleInfo: PrimFlexibleInfo? = null

    @Volatile
    private var hoverText: HoverText? = null

    private val objCoordsData: FloatArray = objInfo.getObjectCoords().getData()
    private val objCoordsScale: Int = objInfo.getObjectCoords().getElementOffset(1)
    private var occlusionQuery: GLQuery? = null
    private var isInvisible = false
    private var invisibleCount = 0
    private var invisibleFrames = 0

    init {
        setPrimDrawParams(objInfo.getPrimDrawParams())
        setHoverText(objInfo.getHoverText())
    }

    /** Rebuild faces that show the wearer's bakes (Bakes on Mesh) after an appearance change. */
    fun refreshBakesOnMesh() {
        val primDrawParams = objInfo.getPrimDrawParams()
        if (attachedTo != null && primDrawParams != null && primDrawParams.usesBakesOnMesh()) {
            setPrimDrawParams(primDrawParams)
        }
    }

    fun ApplyJointTranslations(meshJointTranslations: MeshJointTranslations) {
        drawablePrim?.ApplyJointTranslations(meshJointTranslations)
    }

    fun Draw(renderContext: RenderContext, i: Int): Int {
        val drawablePrim = this.drawablePrim
        val worldMatrix = objInfo.worldMatrix
        val primFlexibleInfo = flexibleInfo
        if (drawablePrim == null || worldMatrix == null || isInvisible) {
            return 0
        }
        val f = objCoordsData[objCoordsScale]
        val f2 = objCoordsData[objCoordsScale + 1]
        val f3 = objCoordsData[objCoordsScale + 2]
        renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0)
        renderContext.glPushObjectScale(f, f2, f3)
        if (primFlexibleInfo != null) {
            primFlexibleInfo.doFlexibleUpdate(
                objInfo.getPrimDrawParams()!!.getVolumeParams()!!.FlexiParams!!,
                renderContext.objWorldMatrix.matrixData,
                renderContext.objWorldMatrix.matrixDataOffset,
                f, f2, f3
            )
        }
        val DrawFast20 = if (renderContext.hasGL20)
            drawablePrim.DrawFast20(renderContext, false, primFlexibleInfo, i)
        else
            drawablePrim.Draw(renderContext, false, primFlexibleInfo, i)
        renderContext.glPopObjectScale()
        renderContext.glObjWorldPopMatrix()
        return DrawFast20
    }

    fun DrawHoverText(renderContext: RenderContext, z: Boolean) {
        val drawableHoverText = this.drawableHoverText
        val hoverText = this.hoverText
        val worldMatrix = objInfo.worldMatrix
        if (drawableHoverText == null || worldMatrix == null || hoverText == null) {
            return
        }
        var f2 = worldMatrix[12]
        var f3 = worldMatrix[13]
        var f4 = worldMatrix[14]
        val f: Float
        if (z) {
            f = 0.0f
        } else {
            val f5 = objCoordsData[objCoordsScale]
            val f6 = objCoordsData[objCoordsScale + 1]
            val f7 = objCoordsData[objCoordsScale + 2]
            val max = (Math.max(Math.max(f5, f6), f7) + 0.01f) / 2.0f
            val vector3 = LLVector3(renderContext.frameCamera.x - f2, renderContext.frameCamera.y - f3, renderContext.frameCamera.z - f4)
            vector3.normVec()
            vector3.mul(max)
            f2 += vector3.x
            f3 += vector3.y
            f4 += vector3.z
            f = f7 / 2.0f
        }
        drawableHoverText.DrawAtWorld(
            renderContext, f2, f3, f4, f,
            if (z) renderContext.projectionHUDMatrix else renderContext.projectionMatrix,
            true, hoverText.color()
        )
    }

    fun DrawIfPicked(renderContext: RenderContext, objectInfo: SLObjectInfo) {
        if (objInfo === objectInfo) {
            val drawablePrim = this.drawablePrim
            val worldMatrix = objInfo.worldMatrix
            val primFlexibleInfo = flexibleInfo
            if (drawablePrim == null || worldMatrix == null) {
                return
            }
            val f = objCoordsData[objCoordsScale]
            val f2 = objCoordsData[objCoordsScale + 1]
            val f3 = objCoordsData[objCoordsScale + 2]
            renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0)
            if (primFlexibleInfo != null) {
                primFlexibleInfo.doFlexibleUpdate(
                    objInfo.getPrimDrawParams()!!.getVolumeParams()!!.FlexiParams!!,
                    renderContext.objWorldMatrix.matrixData,
                    renderContext.objWorldMatrix.matrixDataOffset,
                    f, f2, f3
                )
            }
            renderContext.glPushObjectScale(f, f2, f3)
            GLES10.glDepthFunc(515)
            drawablePrim.Draw(renderContext, true, primFlexibleInfo, 3)
            GLES10.glDepthFunc(GLES10.GL_LESS)
            renderContext.glPopObjectScale()
            renderContext.glObjWorldPopMatrix()
        }
    }

    fun DrawRigged(renderContext: RenderContext, avatarSkeleton: AvatarSkeleton, i: Int): Int {
        val drawablePrim = this.drawablePrim ?: return 0
        if (i and 1 != 0) {
            drawablePrim.UpdateRigged(renderContext, avatarSkeleton)
        }
        return if (renderContext.hasGL20)
            drawablePrim.DrawFast20(renderContext, false, null, i)
        else
            drawablePrim.Draw(renderContext, false, null, i)
    }

    fun DrawRigged30(renderContext: RenderContext, i: Int): Int {
        val drawablePrim = this.drawablePrim
        if (drawablePrim == null || !drawablePrim.isRiggedMesh) {
            return 0
        }
        return drawablePrim.DrawRigged30(renderContext, i)
    }

    override fun OnResourceReady(obj: Any?, z: Boolean) {
        if (obj is DrawablePrim) {
            this.drawablePrim = obj
            if (!obj.isRiggedMesh || attachedTo == null) {
                return
            }
            attachedTo.onRiggedMeshReady(this)
        }
    }

    override fun PickObject(renderContext: RenderContext, f: Float, f2: Float, f3: Float): ObjectIntersectInfo? {
        val drawablePrim = this.drawablePrim
        val worldMatrix = objInfo.worldMatrix
        if (drawablePrim == null || worldMatrix == null) {
            return null
        }
        val viewportRect = renderContext.viewportRect
        val floats = FloatArray(32)
        val floats2 = FloatArray(6)
        val f4 = viewportRect[3] - f2
        val f5 = objCoordsData[objCoordsScale]
        val f6 = objCoordsData[objCoordsScale + 1]
        val f7 = objCoordsData[objCoordsScale + 2]
        renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0)
        if (renderContext.hasGL20) {
            Matrix.scaleM(floats, 0, renderContext.objWorldMatrix.matrixData, renderContext.objWorldMatrix.matrixDataOffset, f5, f6, f7)
            RenderContext.gluUnProject(f, f4, 0.0f, floats, 0, renderContext.modelViewMatrix.matrixData, renderContext.modelViewMatrix.matrixDataOffset, viewportRect, 0, floats2, 0)
            RenderContext.gluUnProject(f, f4, 1.0f, floats, 0, renderContext.modelViewMatrix.matrixData, renderContext.modelViewMatrix.matrixDataOffset, viewportRect, 0, floats2, 3)
        } else {
            Matrix.scaleM(floats, 16, renderContext.objWorldMatrix.matrixData, renderContext.objWorldMatrix.matrixDataOffset, f5, f6, f7)
            Matrix.multiplyMM(floats, 0, renderContext.modelViewMatrix.matrixData, renderContext.modelViewMatrix.matrixDataOffset, floats, 16)
            val activeProjectionMatrix = renderContext.getActiveProjectionMatrix()
            if (activeProjectionMatrix != null) {
                RenderContext.gluUnProject(f, f4, 0.0f, floats, 0, activeProjectionMatrix.matrixData, activeProjectionMatrix.matrixDataOffset, viewportRect, 0, floats2, 0)
                RenderContext.gluUnProject(f, f4, 1.0f, floats, 0, activeProjectionMatrix.matrixData, activeProjectionMatrix.matrixDataOffset, viewportRect, 0, floats2, 3)
            }
        }
        renderContext.glObjWorldPopMatrix()
        val vector3 = LLVector3(floats2[0], floats2[1], floats2[2])
        val vector33 = LLVector3(floats2[3], floats2[4], floats2[5])
        var z = false
        val vertices = CollisionBox.getInstance().vertices
        var i = 0
        while (true) {
            if (i >= 12) {
                break
            }
            if (GLRayTrace.intersect_RayTriangle(vector3, vector33, vertices, i * 3) != null) {
                z = true
                break
            }
            i++
        }
        if (!z) return null
        val IntersectRay = drawablePrim.IntersectRay(vector3, vector33) ?: return null
        val intersectionDepth = GLRayTrace.getIntersectionDepth(renderContext, IntersectRay.intersectPoint, floats)
        return if (intersectionDepth >= f3) {
            ObjectIntersectInfo(IntersectRay, objInfo, intersectionDepth)
        } else null
    }

    fun TestOcclusion(renderContext: RenderContext, floats: FloatArray) {
        val worldMatrix = objInfo.worldMatrix ?: return
        if (occlusionQuery == null) {
            occlusionQuery = GLQuery(renderContext.glResourceManager)
        }
        if (isInvisible && invisibleFrames <= INVISIBLE_FRAMES_DISAPPEAR) {
            invisibleFrames++
            return
        }
        val occlusionQueryResult = occlusionQuery!!.getOcclusionQueryResult()
        if (occlusionQueryResult == GLQuery.OcclusionQueryResult.Invisible) {
            invisibleFrames = 0
            if (!isInvisible) {
                invisibleCount++
                if (invisibleCount > INVISIBLE_FRAMES_APPEAR) {
                    val checkFrustrumOcclusion = OpenJPEG.checkFrustrumOcclusion(
                        floats, worldMatrix,
                        objCoordsData[objCoordsScale],
                        objCoordsData[objCoordsScale + 1],
                        objCoordsData[objCoordsScale + 2]
                    )
                    if (checkFrustrumOcclusion == 0) {
                        invisibleCount = 0
                    } else {
                        Debug.Printf("Occlusion: object seriously invisible %s (frustrumTest %d)", this, checkFrustrumOcclusion)
                        isInvisible = true
                    }
                }
            }
        } else if (occlusionQueryResult == GLQuery.OcclusionQueryResult.Visible) {
            invisibleCount = 0
            if (isInvisible) {
                Debug.Printf("Occlusion: object visible again %s", this)
                isInvisible = false
            }
        }
        if (occlusionQuery!!.isQueryRunning()) {
            return
        }
        val f = objCoordsData[objCoordsScale] * 1.001f
        val f2 = objCoordsData[objCoordsScale + 1] * 1.001f
        val f3 = objCoordsData[objCoordsScale + 2] * 1.001f
        renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0)
        renderContext.glPushObjectScale(f, f2, f3)
        renderContext.boundingBox!!.OcclusionQuery(renderContext, occlusionQuery!!)
        renderContext.glPopObjectScale()
        renderContext.glObjWorldPopMatrix()
    }

    fun getObjectInfo(): SLObjectInfo = objInfo

    fun hasExtendedBones(): Boolean {
        return drawablePrim?.hasExtendedBones() ?: false
    }

    fun isRiggedMesh(): Boolean {
        return drawablePrim?.isRiggedMesh ?: false
    }

    fun setHoverText(@Nullable hoverText: HoverText?) {
        if (Objects.equal(this.hoverText, hoverText)) {
            return
        }
        if (hoverText == null) {
            drawableHoverText = null
        } else if (!hoverText.sameText(this.hoverText)) {
            drawableHoverText = DrawableHoverText(drawableStore.textTextureCache, hoverText.text(), 0)
        }
        this.hoverText = hoverText
    }

    fun setPrimDrawParams(primDrawParams: PrimDrawParams?) {
        var params = primDrawParams
        if (attachedTo != null && params != null) {
            params = params.withBakes(attachedTo.avatarBakes)
        }
        drawableStore.primCache.RequestResource(params!!, this)
        if (params.getVolumeParams()!!.isFlexible()) {
            flexibleInfo = PrimFlexibleInfo()
        } else {
            flexibleInfo = null
        }
    }

    companion object {
        private const val INVISIBLE_FRAMES_APPEAR = 10
        private const val INVISIBLE_FRAMES_DISAPPEAR = 10
    }
}
