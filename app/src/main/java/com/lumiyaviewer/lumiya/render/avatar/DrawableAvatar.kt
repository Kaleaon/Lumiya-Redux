package com.lumiyaviewer.lumiya.render.avatar

import android.opengl.GLES11
import android.opengl.GLES20
import android.opengl.Matrix
import com.google.common.collect.ArrayListMultimap
import com.google.common.collect.Multimap
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.DrawableObject
import com.lumiyaviewer.lumiya.render.DrawableStore
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.picking.CollisionBox
import com.lumiyaviewer.lumiya.render.picking.GLRayTrace
import com.lumiyaviewer.lumiya.render.picking.IntersectInfo
import com.lumiyaviewer.lumiya.render.picking.IntersectPickable
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo
import com.lumiyaviewer.lumiya.render.spatial.DrawEntryList
import com.lumiyaviewer.lumiya.render.spatial.DrawListEntry
import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry
import com.lumiyaviewer.lumiya.render.spatial.DrawListPrimEntry
import com.lumiyaviewer.lumiya.render.spatial.FrustrumPlanes
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor
import com.lumiyaviewer.lumiya.slproto.avatar.MeshIndex
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.avatar.SLBaseAvatar
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBone
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.prims.AvatarBakes
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.utils.IdentityMatrix
import com.lumiyaviewer.lumiya.utils.LinkedTreeNode
import java.util.Collections
import java.util.EnumMap
import java.util.IdentityHashMap
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicInteger
import java.util.concurrent.atomic.AtomicReference

class DrawableAvatar(
    drawableStore: DrawableStore,
    uuid: UUID,
    objectAvatarInfo: SLObjectAvatarInfo,
    private val avatarUUID: UUID?,
    initialAnimations: Map<UUID, AnimationSequenceInfo>?
) : DrawableAvatarStub(drawableStore, uuid, objectAvatarInfo),
    IntersectPickable,
    DrawEntryList.EntryRemovalListener {

    @Volatile
    var isFocalAvatar: Boolean = false

    private var lastAnimationUpdateTimeMs: Long = 0L
    private var wasOffscreen: Boolean = true

    private val animationLock = Any()

    /** The wearer's bakes, for Bakes on Mesh faces on attachments. Null until appearance arrives. */
    @Volatile
    var avatarBakes: AvatarBakes? = null
        private set

    private val animationSkeletonData = AnimationSkeletonData()
    private val animations: MutableMap<UUID, AvatarAnimationState> = HashMap()

    @Volatile
    private var animationsInitialized = false
    private val deadAttachmentsList: MutableSet<DrawListEntry> = Collections.newSetFromMap(IdentityHashMap())
    private val deadAttachmentsLock = Any()
    private val displayedHUDid = AtomicInteger()

    @Volatile
    private var drawableAttachmentList: DrawableAttachments = DrawableAttachments()
    private val drawableAttachments = DrawEntryList(this)

    @Volatile
    var drawableHUD: DrawableHUD? = null
        private set

    private var headPosition: LLVector3? = null
    private var jointMatrixUpdated = false
    private val localAviWorldMatrix = FloatArray(16)
    private val parts: Map<MeshIndex, DrawableAvatarPart>
    private var pelvisTranslateX = 0.0f
    private var pelvisTranslateY = 0.0f
    private var pelvisTranslateZ = 0.0f
    private val riggedMeshes: MutableSet<DrawableObject> = Collections.newSetFromMap(ConcurrentHashMap())

    @Volatile
    private var runningAnimations: AvatarAnimationList? = null

    @Volatile
    private var shapeParams: AvatarShapeParams? = null
    private val shapeParamsUpdate = Runnable { doShapeParamsUpdate() }

    @Volatile
    private var skeleton: AvatarSkeleton? = null
    private val updateAttachmentsRunnable = Runnable { processUpdateAttachments() }
    private val updatedSkeleton = AtomicReference<AvatarSkeleton?>(null)

    init {
        val baseAvatar = SLBaseAvatar.getInstance()
        val partsMap = EnumMap<MeshIndex, DrawableAvatarPart>(MeshIndex::class.java)
        for (meshIndex in MeshIndex.VALUES) {
            val entry = baseAvatar.getMeshEntry(meshIndex)
            partsMap[meshIndex] = DrawableAvatarPart(
                avatarUUID!!, entry.textureFaceIndex,
                entry.polyMesh, drawableStore.hasGL20
            )
        }
        parts = partsMap

        synchronized(animationLock) {
            if (initialAnimations != null) {
                for (seqInfo in initialAnimations.values) {
                    animations[seqInfo.animationID] = AvatarAnimationState(seqInfo, this)
                }
            }
            animationsInitialized = true
            updateRunningAnimations()
        }
        updateAttachments()
    }

    private fun drawParts(renderContext: RenderContext) {
        val avatarSkeleton = skeleton ?: return
        val pelvisToFoot = if (avatarObject.parentID == 0) {
            ((-avatarSkeleton.getBodySize()) / 2.0f) + avatarSkeleton.getPelvisToFoot() + avatarSkeleton.getPelvisOffset()
        } else {
            0.0f
        }
        pelvisTranslateX = -avatarSkeleton.rootBone!!.getPositionX()
        pelvisTranslateY = -avatarSkeleton.rootBone!!.getPositionY()
        pelvisTranslateZ = pelvisToFoot + (-avatarSkeleton.rootBone!!.getPositionZ())
        renderContext.glObjWorldTranslatef(pelvisTranslateX, pelvisTranslateY, pelvisTranslateZ)
        renderContext.objWorldMatrix.getMatrix(localAviWorldMatrix, 0)
        glPrepare(renderContext, avatarSkeleton.jointMatrix)

        for (meshIndex in MeshIndex.VALUES) {
            val part = parts[meshIndex]!!
            val bone: SLSkeletonBone? = when (meshIndex) {
                MeshIndex.MESH_ID_EYEBALL_LEFT -> avatarSkeleton.bones[SLSkeletonBoneID.mEyeLeft]
                MeshIndex.MESH_ID_EYEBALL_RIGHT -> avatarSkeleton.bones[SLSkeletonBoneID.mEyeRight]
                else -> null
            }
            if (bone != null) {
                renderContext.glObjWorldPushAndMultMatrixf(bone.getGlobalMatrix(), 0)
            }
            part.GLDraw(renderContext, avatarSkeleton.jointMatrix, jointMatrixUpdated)
            if (bone != null) {
                renderContext.glObjWorldPopMatrix()
            }
        }

        val headBone = avatarSkeleton.bones[SLSkeletonBoneID.mHead]
        if (headBone != null) {
            renderContext.glObjWorldPushAndMultMatrixf(headBone.getGlobalMatrix(), 0)
            val matrixData = renderContext.objWorldMatrix.matrixData
            val offset = renderContext.objWorldMatrix.matrixDataOffset
            val x = matrixData[offset + 12]
            val y = matrixData[offset + 13]
            val z = matrixData[offset + 14]
            if (headPosition == null) {
                headPosition = LLVector3()
            }
            headPosition!!.set(x, y, z)
            renderContext.glObjWorldPopMatrix()
        }

        renderContext.curPrimProgram = null
        if (drawableAttachmentList.Draw(renderContext, avatarSkeleton, jointMatrixUpdated)) {
            drawableAttachmentList = DrawableAttachments(drawableAttachmentList)
        }
        jointMatrixUpdated = false
    }

    private fun glPrepare(renderContext: RenderContext, jointMatrix: FloatArray) {
        if (!renderContext.hasGL20) {
            GLES11.glMatrixMode(5890)
            GLES11.glLoadMatrixf(IdentityMatrix.getMatrix(), 0)
            GLES11.glMatrixMode(5888)
        } else {
            GLES20.glUseProgram(renderContext.avatarProgram!!.getHandle())
            GLES20.glUniform1i(renderContext.avatarProgram.sTexture, 0)
            GLES20.glUniform4f(renderContext.avatarProgram.uObjCoordScale, 1.0f, 1.0f, 1.0f, 1.0f)
            renderContext.glModelApplyMatrix(renderContext.avatarProgram.uMVPMatrix)
            renderContext.avatarProgram.SetupLighting(renderContext, renderContext.windlightPreset)
            GLES20.glUniformMatrix4fv(renderContext.avatarProgram.uJointMatrix, 133, false, jointMatrix, 0)
        }
    }

    private fun animate(avatarSkeleton: AvatarSkeleton): Boolean {
        val needForce = avatarSkeleton.needForceAnimate()
        val animList = runningAnimations ?: return false
        if (!animList.needAnimate(System.currentTimeMillis()) && !needForce) {
            return false
        }
        animationSkeletonData.animate(avatarSkeleton, animList)
        return true
    }

    private fun getRunningAnimations(): AvatarAnimationList {
        synchronized(animationLock) {
            return AvatarAnimationList(animations.values)
        }
    }

    /**
     * Rebuild the attachment draw lists from the avatar's child objects: world
     * attachments are grouped per attachment point, the one displayed HUD gets
     * a DrawableHUD, and dead attachments queued by other threads are removed.
     * Rigged meshes are re-collected; updateRiggedMeshes() runs when that set
     * changed.
     */
    private fun processUpdateAttachments() {
        val attachmentsByPoint: ArrayListMultimap<Int, DrawableObject> = ArrayListMultimap.create()
        val liveRiggedMeshes: MutableSet<DrawableObject> = Collections.newSetFromMap(IdentityHashMap())
        val displayedHUD = displayedHUDid.get()
        var hud: DrawableHUD? = null

        var child: LinkedTreeNode<SLObjectInfo>? = avatarObject.treeNode.getFirstChild()
        while (child != null) {
            val attachment = child.dataObject
            if (!attachment.isDead) {
                val attachmentPoint = attachment.attachmentID
                if (attachmentPoint in 0 until 56) {
                    val point = SLAttachmentPoint.attachmentPoints[attachmentPoint]
                    if (point != null) {
                        if (!point.isHUD) {
                            updateAttachmentParts(attachment, attachmentsByPoint, attachmentPoint)
                        } else if (displayedHUD == attachment.localID) {
                            hud = DrawableHUD(point, drawableAttachments, attachment, drawableStore, this)
                        }
                    }
                }
            }
            child = child.getNextChild()
        }

        val deadEntries: Array<DrawListEntry>?
        synchronized(deadAttachmentsLock) {
            if (deadAttachmentsList.isEmpty()) {
                deadEntries = null
            } else {
                deadEntries = deadAttachmentsList.toTypedArray()
                deadAttachmentsList.clear()
            }
        }

        var riggedMeshesChanged = false
        for (drawable in attachmentsByPoint.values()) {
            if (drawable.isRiggedMesh()) {
                if (riggedMeshes.add(drawable)) {
                    riggedMeshesChanged = true
                }
                liveRiggedMeshes.add(drawable)
            }
        }
        if (deadEntries != null) {
            for (dead in deadEntries) {
                drawableAttachments.removeEntry(dead)
                if (dead is DrawListPrimEntry) {
                    val drawable = dead.getDrawableObject()
                    if (drawable != null) {
                        liveRiggedMeshes.remove(drawable)
                        if (riggedMeshes.remove(drawable)) {
                            riggedMeshesChanged = true
                        }
                    }
                }
            }
        }
        for (drawable in riggedMeshes) {
            if (!liveRiggedMeshes.contains(drawable)) {
                riggedMeshes.remove(drawable)
                riggedMeshesChanged = true
            }
        }
        drawableHUD = hud
        drawableAttachmentList = DrawableAttachments(attachmentsByPoint)
        if (riggedMeshesChanged) {
            updateRiggedMeshes()
        }
    }

    private fun updateAttachmentParts(
        objectInfo: SLObjectInfo,
        multimap: Multimap<Int, DrawableObject>,
        attachmentPoint: Int
    ) {
        val drawListEntry = objectInfo.getDrawListEntry()
        drawableAttachments.addEntry(drawListEntry)
        if (drawListEntry is DrawListPrimEntry) {
            multimap.put(attachmentPoint, drawListEntry.getDrawableAttachment(drawableStore, this))
        }
        var firstChild: LinkedTreeNode<SLObjectInfo>? = objectInfo.treeNode.getFirstChild()
        while (firstChild != null) {
            val dataObject = firstChild.dataObject
            if (dataObject != null) {
                updateAttachmentParts(dataObject, multimap, attachmentPoint)
            }
            firstChild = firstChild.getNextChild()
        }
    }

    private fun updateRiggedMeshes() {
        PrimComputeExecutor.getInstance().execute(shapeParamsUpdate)
    }

    fun AnimationRemove(uuid: UUID) {
        val removed: Boolean
        synchronized(animationLock) {
            removed = animations.remove(uuid) != null
        }
        if (removed) updateRunningAnimations()
    }

    fun AnimationUpdate(animationSequenceInfo: AnimationSequenceInfo) {
        val uuid = animationSequenceInfo.animationID
        synchronized(animationLock) {
            val existing = animations[uuid]
            if (existing == null) {
                animations[uuid] = AvatarAnimationState(animationSequenceInfo, this)
            } else {
                existing.updateSequenceInfo(animationSequenceInfo)
            }
        }
        updateRunningAnimations()
    }

    fun Draw(renderContext: RenderContext) {
        val worldMatrix = getWorldMatrix(renderContext) ?: return
        try {
            renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0)
            drawParts(renderContext)
            renderContext.glObjWorldPopMatrix()
        } catch (e: Exception) {
            Debug.Warning(e)
        }
    }

    override fun DrawNameTag(renderContext: RenderContext) {
        val hoverText = drawableNameTag ?: return
        val hp = headPosition
        if (hp != null) {
            hoverText.DrawAtWorld(renderContext, hp.x, hp.y, hp.z, 0.5f, renderContext.projectionMatrix, false, 0)
        } else {
            super.DrawNameTag(renderContext)
        }
    }

    fun IsAnimationStopped(uuid: UUID): Boolean {
        synchronized(animationLock) {
            val state = animations[uuid]
            return state?.hasStopped() ?: false
        }
    }

    override fun PickObject(renderContext: RenderContext, x: Float, y: Float, minDepth: Float): ObjectIntersectInfo? {
        val worldMatrix = getWorldMatrix(renderContext) ?: return null
        val avatarSkeleton = skeleton ?: return null
        val viewportRect = renderContext.viewportRect
        val floats = FloatArray(32)
        val floats2 = FloatArray(6)
        val adjustedY = viewportRect[3] - y

        renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0)
        renderContext.glObjWorldTranslatef(pelvisTranslateX, pelvisTranslateY, pelvisTranslateZ)

        var result: ObjectIntersectInfo? = null
        for (bone in avatarSkeleton.bones.values) {
            if (bone.boneID.isJoint) continue
            renderContext.glObjWorldPushAndMultMatrixf(avatarSkeleton.jointWorldMatrix, bone.boneID.ordinal * 16)
            if (renderContext.hasGL20) {
                Matrix.scaleM(
                    floats, 0,
                    renderContext.objWorldMatrix.matrixData, renderContext.objWorldMatrix.matrixDataOffset,
                    1.0f, 1.0f, 1.0f
                )
                RenderContext.gluUnProject(
                    x, adjustedY, 0.0f, floats, 0,
                    renderContext.modelViewMatrix.matrixData, renderContext.modelViewMatrix.matrixDataOffset,
                    viewportRect, 0, floats2, 0
                )
                RenderContext.gluUnProject(
                    x, adjustedY, 1.0f, floats, 0,
                    renderContext.modelViewMatrix.matrixData, renderContext.modelViewMatrix.matrixDataOffset,
                    viewportRect, 0, floats2, 3
                )
            } else {
                Matrix.scaleM(
                    floats, 16,
                    renderContext.objWorldMatrix.matrixData, renderContext.objWorldMatrix.matrixDataOffset,
                    1.0f, 1.0f, 1.0f
                )
                Matrix.multiplyMM(
                    floats, 0,
                    renderContext.modelViewMatrix.matrixData, renderContext.modelViewMatrix.matrixDataOffset,
                    floats, 16
                )
                RenderContext.gluUnProject(
                    x, adjustedY, 0.0f, floats, 0,
                    renderContext.projectionMatrix.matrixData, renderContext.projectionMatrix.matrixDataOffset,
                    viewportRect, 0, floats2, 0
                )
                RenderContext.gluUnProject(
                    x, adjustedY, 1.0f, floats, 0,
                    renderContext.projectionMatrix.matrixData, renderContext.projectionMatrix.matrixDataOffset,
                    viewportRect, 0, floats2, 3
                )
            }
            renderContext.glObjWorldPopMatrix()

            val origin = LLVector3(floats2[0], floats2[1], floats2[2])
            val target = LLVector3(floats2[3], floats2[4], floats2[5])
            val vertices = CollisionBox.getInstance().vertices
            var rayHit: GLRayTrace.RayIntersectInfo? = null
            for (i in 0 until 12) {
                rayHit = GLRayTrace.intersect_RayTriangle(origin, target, vertices, i * 3)
                if (rayHit != null) break
            }
            if (rayHit != null) {
                val depth = GLRayTrace.getIntersectionDepth(renderContext, rayHit.intersectPoint, floats)
                if (depth >= minDepth) {
                    result = ObjectIntersectInfo(IntersectInfo(rayHit.intersectPoint), avatarObject, depth)
                    break
                }
            }
        }
        renderContext.glObjWorldPopMatrix()
        return result
    }

    fun getBoundingBox(renderContext: RenderContext, outBox: FloatArray) {
        val worldMatrix = getWorldMatrix(renderContext)
        if (worldMatrix == null) {
            outBox[0] = 0f; outBox[1] = 0f; outBox[2] = 0f
            outBox[3] = 0f; outBox[4] = 0f; outBox[5] = 0f
            return
        }
        val wx = worldMatrix[12]
        val wy = worldMatrix[13]
        val wz = worldMatrix[14]

        val halfWidth = 1.0f
        val height = skeleton?.getBodySize() ?: 2.0f
        val halfHeight = height / 2.0f

        outBox[0] = wx - halfWidth
        outBox[1] = wy - halfWidth
        outBox[2] = wz - halfHeight
        outBox[3] = wx + halfWidth
        outBox[4] = wy + halfWidth
        outBox[5] = wz + halfHeight
    }

    fun RunAnimationsThrottled(
        renderContext: RenderContext,
        frustrumPlanes: FrustrumPlanes?,
        cameraX: Float,
        cameraY: Float,
        cameraZ: Float,
        isFocal: Boolean
    ) {
        val avatarBox = FloatArray(6)
        getBoundingBox(renderContext, avatarBox)

        val isOffscreen = if (frustrumPlanes != null) {
            frustrumPlanes.testBoundingBox(avatarBox, null) == FrustrumPlanes.OUTSIDE
        } else {
            false
        }

        if (isOffscreen) {
            wasOffscreen = true
            return
        }

        val skel = skeleton
        if (wasOffscreen) {
            wasOffscreen = false
            skel?.setForceAnimate()
        }

        val worldMatrix = getWorldMatrix(renderContext)
        val wx = worldMatrix?.get(12) ?: 0f
        val wy = worldMatrix?.get(13) ?: 0f
        val wz = worldMatrix?.get(14) ?: 0f

        val dx = wx - cameraX
        val dy = wy - cameraY
        val dz = wz - cameraZ
        val distSq = dx * dx + dy * dy + dz * dz

        val effectiveFocal = isFocal || isFocalAvatar || avatarObject.isMyAvatar
        val minIntervalMs = if (effectiveFocal || distSq <= 400.0f) 16L else 66L

        val now = System.currentTimeMillis()
        val force = skel?.needForceAnimate() == true
        val elapsed = now - lastAnimationUpdateTimeMs

        if (!force && elapsed < minIntervalMs) {
            return
        }

        lastAnimationUpdateTimeMs = now
        RunAnimations()
    }

    fun RunAnimations() {
        val updated = updatedSkeleton.getAndSet(null)
        if (updated != null) {
            skeleton = updated
        }
        val skel = skeleton ?: return
        if (!animate(skel)) return
        skel.UpdateGlobalPositions(animationSkeletonData)
        jointMatrixUpdated = true
    }

    fun UpdateShapeParams(avatarShapeParams: AvatarShapeParams) {
        shapeParams = avatarShapeParams
        PrimComputeExecutor.getInstance().execute(shapeParamsUpdate)
    }

    fun UpdateTextures(avatarTextures: AvatarTextures) {
        for ((meshIndex, part) in parts) {
            part.setTexture(drawableStore.glTextureCache, avatarTextures.getTexture(part.faceIndex))
        }
        if (avatarUUID != null) {
            val bakes = avatarTextures.getBakes(avatarUUID)
            if (bakes != avatarBakes) {
                avatarBakes = bakes
                drawableAttachmentList.forEachObject(DrawableObject::refreshBakesOnMesh)
            }
        }
    }

    private fun doShapeParamsUpdate() {
        val params = shapeParams ?: return
        Debug.Printf("Avatar: shapeParamsUpdate: %d rigged meshes", riggedMeshes.size)
        val meshJointTranslations = MeshJointTranslations()
        var hasExtended = false
        for (drawable in riggedMeshes) {
            drawable.ApplyJointTranslations(meshJointTranslations)
            hasExtended = drawable.hasExtendedBones() or hasExtended
        }
        val newSkeleton = AvatarSkeleton(params, meshJointTranslations, hasExtended)
        updatedSkeleton.set(newSkeleton)
        for ((meshIndex, part) in parts) {
            part.setPartMorphParams(newSkeleton.getMorphParams(meshIndex)!!)
        }
    }

    override fun onEntryRemovalRequested(drawListEntry: DrawListEntry) {
        synchronized(deadAttachmentsLock) {
            deadAttachmentsList.add(drawListEntry)
        }
        updateAttachments()
    }

    fun onRiggedMeshReady(drawableObject: DrawableObject) {
        if (riggedMeshes.add(drawableObject)) {
            updateRiggedMeshes()
        }
    }

    fun setDisplayedHUDid(id: Int) {
        if (displayedHUDid.getAndSet(id) != id) {
            updateAttachments()
        }
    }

    fun updateAttachments() {
        PrimComputeExecutor.getInstance().execute(updateAttachmentsRunnable)
    }

    fun updateRunningAnimations() {
        if (animationsInitialized) {
            runningAnimations = getRunningAnimations()
            skeleton?.setForceAnimate()
        }
    }
}
