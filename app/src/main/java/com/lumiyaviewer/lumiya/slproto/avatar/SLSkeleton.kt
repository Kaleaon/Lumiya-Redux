package com.lumiyaviewer.lumiya.slproto.avatar

import com.lumiyaviewer.lumiya.render.avatar.AnimationSkeletonData
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.EnumMap
import java.util.Iterator
import java.util.Map

open class SLSkeleton {
    var rootBone: SLSkeletonBone = null
    var bones: MutableMap<SLSkeletonBoneID, SLSkeletonBone> = EnumMap(SLSkeletonBoneID.class)
    var jointMatrix: FloatArray = FloatArray(SLSkeletonBoneID.VALUES.length * 16)
    var jointWorldMatrix: FloatArray = FloatArray((SLSkeletonBoneID.VALUES.length + 47) * 16)
    private var updateBones: Array<SLSkeletonBone> = arrayOfNulls<SLSkeletonBone>(SLSkeletonBoneID.VALUES.length)

    fun UpdateGlobalPositions(animationSkeletonData: AnimationSkeletonData) {
        for (skeletonBone in this.updateBones) {
            skeletonBone.updateGlobalPos(animationSkeletonData, this.jointMatrix, this.jointWorldMatrix)
        }
    }

    protected fun applyJointTranslations(meshJointTranslations: MeshJointTranslations) {
        Iterator<Map.Entry<SLSkeletonBoneID, SLSkeletonBone>> it = this.bones.entrySet().iterator()
        while (it.hasNext()) {
            var entry: Map.Entry = (Map.Entry) it.next()
            var floats: FloatArray = meshJointTranslations.jointTranslations.get(entry.getKey())
            if (floats != null) {
                (entry as SLSkeletonBone.getValue()).setPositionOverride(LLVector3(floats[0], floats[1], floats[2]))
            }
        }
    }

    fun getBodySize(): Float {
        var skeletonBone: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mPelvis)
        var skeletonBone2: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mSkull)
        var skeletonBone3: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mHead)
        var skeletonBone4: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mNeck)
        var skeletonBone5: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mChest)
        var skeletonBone6: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mTorso)
        if (skeletonBone == null || skeletonBone2 == null || skeletonBone3 == null || skeletonBone4 == null || skeletonBone5 == null || skeletonBone6 == null) {
            return 0.0f
        }
        return (float) ((skeletonBone.getScaleZ() * skeletonBone6.getPositionZ()) + (skeletonBone4.getPositionZ() * skeletonBone5.getScaleZ()) + getPelvisToFoot() + (Math.sqrt(2.0d) * skeletonBone2.getPositionZ() * skeletonBone3.getScaleZ()) + (skeletonBone3.getPositionZ() * skeletonBone4.getScaleZ()) + (skeletonBone5.getPositionZ() * skeletonBone6.getScaleZ()))
    }

    fun getPelvisToFoot(): Float {
        var skeletonBone: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mPelvis)
        var skeletonBone2: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mHipLeft)
        var skeletonBone3: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mKneeLeft)
        var skeletonBone4: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mAnkleLeft)
        var skeletonBone5: SLSkeletonBone = this.bones.get(SLSkeletonBoneID.mFootLeft)
        if (skeletonBone == null || skeletonBone2 == null || skeletonBone3 == null || skeletonBone4 == null || skeletonBone5 == null) {
            return 0.0f
        }
        return (((skeletonBone.getScaleZ() * skeletonBone2.getPositionZ()) - (skeletonBone2.getScaleZ() * skeletonBone3.getPositionZ())) - (skeletonBone4.getPositionZ() * skeletonBone3.getScaleZ())) - (skeletonBone5.getPositionZ() * skeletonBone4.getScaleZ())
    }

    protected fun prepareSkeleton() {
        this.rootBone.prepareSkeleton(this.updateBones, 0)
    }
}
