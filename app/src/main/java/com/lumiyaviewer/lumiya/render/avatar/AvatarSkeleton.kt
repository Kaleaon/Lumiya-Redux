package com.lumiyaviewer.lumiya.render.avatar

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.slproto.avatar.MeshIndex
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParams
import com.lumiyaviewer.lumiya.slproto.avatar.SLBaseAvatar
import com.lumiyaviewer.lumiya.slproto.avatar.SLDefaultSkeleton
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBone
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID
import com.lumiyaviewer.lumiya.slproto.avatar.SLVisualParamID
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.Arrays
import java.util.EnumMap
import java.util.concurrent.atomic.AtomicBoolean
import javax.annotation.Nonnull

class AvatarSkeleton(
    @Nonnull avatarShapeParams: AvatarShapeParams,
    @Nonnull meshJointTranslations: MeshJointTranslations,
    val hasExtendedBones: Boolean
) : SLDefaultSkeleton() {

    private val bodySize: Float
    private val pelvisOffset: Float
    private val pelvisToFoot: Float
    private val partMorphParams = EnumMap<MeshIndex, FloatArray>(MeshIndex::class.java)
    private val attachmentPoints = arrayOfNulls<AttachmentPoint>(NUM_ATTACHMENT_POINTS)
    private val forceAnimate = AtomicBoolean(true)
    private val animatedBones = arrayOfNulls<SLSkeletonBone>(NUM_ANIMATED_BONES)

    private class AttachmentPoint(
        val bone: SLSkeletonBone?,
        val point: SLAttachmentPoint
    ) {
        val matrix = FloatArray(16)
    }

    init {
        prepareSkeleton()
        for ((key, value) in bones.entries) {
            val animatedIndex = key.animatedIndex
            if (animatedIndex in 0 until NUM_ANIMATED_BONES) {
                animatedBones[animatedIndex] = value
            }
        }
        val enumMap = EnumMap<SLSkeletonBoneID, SLAvatarParams.SkeletonParamValue>(SLSkeletonBoneID::class.java)
        val baseAvatar = SLBaseAvatar.getInstance()
        applyJointTranslations(meshJointTranslations)
        pelvisOffset = meshJointTranslations.pelvisOffset
        for (meshIndex in MeshIndex.VALUES) {
            val floats = FloatArray(baseAvatar.getMeshEntry(meshIndex).polyMesh.numMorphs)
            Arrays.fill(floats, 0.0f)
            partMorphParams[meshIndex] = floats
        }
        for (skeletonBoneID in SLSkeletonBoneID.VALUES) {
            val paramValue = SLAvatarParams.SkeletonParamValue(LLVector3(), LLVector3())
            paramValue.scale.set(1.0f, 1.0f, 1.0f)
            paramValue.offset.set(0.0f, 0.0f, 0.0f)
            enumMap[skeletonBoneID] = paramValue
        }
        val paramCount = avatarShapeParams.paramCount
        for (j in 0 until paramCount) {
            val paramSet = SLAvatarParams.paramDefs[j]
            for (avatarParam in paramSet.params) {
                val paramValue = ((avatarShapeParams.getParamValue(j) * (avatarParam.maxValue - avatarParam.minValue)) / 255.0f) + avatarParam.minValue
                ApplyMorphParam(baseAvatar, enumMap, avatarParam, paramSet.name, paramValue)
                if (avatarParam.drivenParams != null) {
                    for (drivenParam in avatarParam.drivenParams) {
                        val paramSet2 = SLAvatarParams.paramByIDs[drivenParam.drivenID]
                        if (paramSet2 != null) {
                            for (avatarParam2 in paramSet2.params) {
                                ApplyMorphParam(baseAvatar, enumMap, avatarParam2, paramSet2.name,
                                    getDrivenWeight(paramValue, avatarParam, drivenParam, avatarParam2))
                            }
                        }
                    }
                }
            }
        }
        for (skeletonBoneID2 in SLSkeletonBoneID.VALUES) {
            bones[skeletonBoneID2].deformHierarchy(enumMap[skeletonBoneID2]!!.offset, enumMap[skeletonBoneID2]!!.scale)
        }
        pelvisToFoot = super.getPelvisToFoot()
        bodySize = super.getBodySize()

        for (i in 0 until NUM_ATTACHMENT_POINTS) {
            val attachmentPoint = SLAttachmentPoint.attachmentPoints[i]
            if (attachmentPoint != null && !attachmentPoint.isHUD) {
                val bone = attachmentPoint.bone
                if (bone != null) {
                    val skeletonBone = bones[bone]
                    if (skeletonBone != null) {
                        attachmentPoints[i] = AttachmentPoint(skeletonBone, attachmentPoint)
                    }
                } else {
                    attachmentPoints[i] = AttachmentPoint(null, attachmentPoint)
                }
            }
        }
        updateAttachmentMatrix()
    }

    private fun ApplyMorphParam(
        baseAvatar: SLBaseAvatar,
        map: Map<SLSkeletonBoneID, SLAvatarParams.SkeletonParamValue>,
        avatarParam: SLAvatarParams.AvatarParam,
        visualParamID: SLVisualParamID,
        value: Float
    ) {
        if (avatarParam.morph && avatarParam.meshIndex != null) {
            val floats = partMorphParams[avatarParam.meshIndex]
            if (floats != null) {
                val morphIndex = baseAvatar.getMeshEntry(avatarParam.meshIndex).polyMesh.getMorphIndex(visualParamID)
                if (morphIndex != -1) {
                    floats[morphIndex] = floats[morphIndex] + value
                }
            }
        }
        if (avatarParam.skeletonParams != null) {
            for ((key, paramDef) in avatarParam.skeletonParams.entries) {
                val paramValue = map[key] ?: continue
                if (paramDef.scale != null) {
                    paramValue.scale.mulWeighted(paramDef.scale, value)
                }
                if (paramDef.offset != null) {
                    paramValue.offset.addMul(paramDef.offset, value)
                }
            }
        }
    }

    private fun updateAttachmentMatrix() {
        val floats = FloatArray(16)
        for (i in 0 until NUM_ATTACHMENT_POINTS) {
            val attachmentPoint = attachmentPoints[i] ?: continue
            val bone = attachmentPoint.bone
            if (bone != null) {
                Matrix.translateM(floats, 0, bone.globalMatrix, 0,
                    attachmentPoint.point.position.x * bone.scaleX,
                    attachmentPoint.point.position.y * bone.scaleY,
                    attachmentPoint.point.position.z * bone.scaleZ)
                Matrix.multiplyMM(attachmentPoint.matrix, 0, floats, 0, attachmentPoint.point.rotation.inverseMatrix, 0)
            } else {
                Matrix.setIdentityM(floats, 0)
                Matrix.translateM(floats, 0, rootBone.positionX, rootBone.positionY, rootBone.positionZ)
                Matrix.translateM(floats, 0, attachmentPoint.point.position.x, attachmentPoint.point.position.y, attachmentPoint.point.position.z)
                Matrix.multiplyMM(attachmentPoint.matrix, 0, floats, 0, attachmentPoint.point.rotation.inverseMatrix, 0)
            }
            val nonHUDindex = SLAttachmentPoint.attachmentPoints[i].nonHUDindex
            if (nonHUDindex >= 0) {
                System.arraycopy(attachmentPoint.matrix, 0, jointWorldMatrix,
                    (nonHUDindex + SLSkeletonBoneID.VALUES.size) * 16, 16)
            }
        }
    }

    override fun UpdateGlobalPositions(animationSkeletonData: AnimationSkeletonData) {
        super.UpdateGlobalPositions(animationSkeletonData)
        updateAttachmentMatrix()
    }

    fun getAnimatedBone(index: Int): SLSkeletonBone? = animatedBones[index]

    internal fun getAttachmentMatrix(index: Int): FloatArray? {
        if (index < 0 || index >= attachmentPoints.size) return null
        return attachmentPoints[index]?.matrix
    }

    override fun getBodySize(): Float = bodySize

    internal fun getMorphParams(meshIndex: MeshIndex): FloatArray? = partMorphParams[meshIndex]

    internal fun getPelvisOffset(): Float = pelvisOffset

    override fun getPelvisToFoot(): Float = pelvisToFoot

    fun needForceAnimate(): Boolean = forceAnimate.getAndSet(false)

    fun setForceAnimate() {
        forceAnimate.set(true)
    }

    companion object {
        private const val NUM_ANIMATED_BONES = 133
        private const val NUM_ATTACHMENT_POINTS = 56

        @JvmStatic
        fun getDrivenWeight(
            value: Float,
            avatarParam: SLAvatarParams.AvatarParam,
            drivenParam: SLAvatarParams.DrivenParam,
            avatarParam2: SLAvatarParams.AvatarParam
        ): Float {
            val minValue = avatarParam.minValue
            val maxValue = avatarParam.maxValue
            val minValue2 = avatarParam2.minValue
            val maxValue2 = avatarParam2.maxValue
            if (value <= drivenParam.min1) {
                return if (drivenParam.min1 != drivenParam.max1 || drivenParam.min1 > minValue) minValue2 else maxValue2
            }
            if (value <= drivenParam.max1) {
                return ((maxValue2 - minValue2) * ((value - drivenParam.min1) / (drivenParam.max1 - drivenParam.min1))) + minValue2
            }
            if (value <= drivenParam.max2) {
                return maxValue2
            }
            if (value <= drivenParam.min2) {
                return maxValue2 + ((minValue2 - maxValue2) * ((value - drivenParam.max2) / (drivenParam.min2 - drivenParam.max2)))
            }
            return if (drivenParam.max2 < maxValue) minValue2 else maxValue2
        }
    }
}
