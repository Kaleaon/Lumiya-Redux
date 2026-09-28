package com.lumiyaviewer.lumiya.slproto.avatar

import com.lumiyaviewer.lumiya.render.avatar.AnimationSkeletonData
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.EnumMap

open class SLSkeleton {
    var rootBone: SLSkeletonBone? = null
    var bones: MutableMap<SLSkeletonBoneID, SLSkeletonBone> = EnumMap(SLSkeletonBoneID::class.java)
    var jointMatrix: FloatArray = FloatArray(SLSkeletonBoneID.VALUES.size * 16)
    var jointWorldMatrix: FloatArray = FloatArray((SLSkeletonBoneID.VALUES.size + 47) * 16)
    private var updateBones: Array<SLSkeletonBone?> = arrayOfNulls(SLSkeletonBoneID.VALUES.size)

    fun UpdateGlobalPositions(animationSkeletonData: AnimationSkeletonData) {
        for (skeletonBone in this.updateBones) {
            skeletonBone?.updateGlobalPos(animationSkeletonData, this.jointMatrix, this.jointWorldMatrix)
        }
    }

    protected fun applyJointTranslations(meshJointTranslations: MeshJointTranslations) {
        for (entry in this.bones.entries) {
            val floats: FloatArray? = meshJointTranslations.jointTranslations[entry.key]
            if (floats != null) {
                entry.value.setPositionOverride(LLVector3(floats[0], floats[1], floats[2]))
            }
        }
    }

    fun getBodySize(): Float {
        val skeletonBone: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mPelvis]
        val skeletonBone2: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mSkull]
        val skeletonBone3: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mHead]
        val skeletonBone4: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mNeck]
        val skeletonBone5: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mChest]
        val skeletonBone6: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mTorso]
        if (skeletonBone == null || skeletonBone2 == null || skeletonBone3 == null || skeletonBone4 == null || skeletonBone5 == null || skeletonBone6 == null) {
            return 0.0f
        }
        return ((skeletonBone.getScaleZ() * skeletonBone6.getPositionZ()) + (skeletonBone4.getPositionZ() * skeletonBone5.getScaleZ()) + getPelvisToFoot() + (Math.sqrt(2.0).toFloat() * skeletonBone2.getPositionZ() * skeletonBone3.getScaleZ()) + (skeletonBone3.getPositionZ() * skeletonBone4.getScaleZ()) + (skeletonBone5.getPositionZ() * skeletonBone6.getScaleZ()))
    }

    fun getPelvisToFoot(): Float {
        val skeletonBone: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mPelvis]
        val skeletonBone2: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mHipLeft]
        val skeletonBone3: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mKneeLeft]
        val skeletonBone4: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mAnkleLeft]
        val skeletonBone5: SLSkeletonBone? = this.bones[SLSkeletonBoneID.mFootLeft]
        if (skeletonBone == null || skeletonBone2 == null || skeletonBone3 == null || skeletonBone4 == null || skeletonBone5 == null) {
            return 0.0f
        }
        return (((skeletonBone.getScaleZ() * skeletonBone2.getPositionZ()) - (skeletonBone2.getScaleZ() * skeletonBone3.getPositionZ())) - (skeletonBone4.getPositionZ() * skeletonBone3.getScaleZ())) - (skeletonBone5.getPositionZ() * skeletonBone4.getScaleZ())
    }

    protected fun prepareSkeleton() {
        this.rootBone?.prepareSkeleton(this.updateBones, 0)
    }
}
