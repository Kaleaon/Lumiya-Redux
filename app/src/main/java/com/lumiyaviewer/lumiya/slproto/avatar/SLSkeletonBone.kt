package com.lumiyaviewer.lumiya.slproto.avatar

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.render.avatar.AnimationSkeletonData
import com.lumiyaviewer.lumiya.slproto.types.LLVector3

open class SLSkeletonBone {
    private var basePosition: LLVector3 = null
    var boneID: SLSkeletonBoneID = null
    private var boneIndex: Int = 0
    private var childBones: Array<SLSkeletonBone> = null
    private var collisionVolumes: Array<SLSkeletonBone> = null
    private var defaultBasePosition: LLVector3 = null
    private var globalBaseX: Float = 0.0f
    private var globalBaseY: Float = 0.0f
    private var globalBaseZ: Float = 0.0f
    private var offset: LLVector3 = null
    private var parent: SLSkeletonBone = null
    private var scale: LLVector3 = null
    private var usePosition: LLVector3 = null
    private var globalMatrix: FloatArray = FloatArray(16)
    private var tempMatrix: FloatArray = FloatArray(16)

    constructor(skeletonBoneID: SLSkeletonBoneID, vector34: LLVector3, vector35: LLVector3, skeletonBones: Array<SLSkeletonBone>, collisionVolumes: Array<SLSkeletonBone>) {
        this.boneID = skeletonBoneID
        this.boneIndex = skeletonBoneID.ordinal()
        this.basePosition = LLVector3(vector35)
        var vector3: LLVector3 = LLVector3this as vector34.defaultBasePosition = LLVector3(this.basePosition)
        this.offset = LLVector3()
        this.scale = LLVector3(1.0f, 1.0f, 1.0f)
        this.childBones = skeletonBones
        this.collisionVolumes = collisionVolumes
        this.usePosition = if (skeletonBoneID.isJoint) this.basePosition else vector3
        this.parent = null
        this.globalBaseX = 0.0f
        this.globalBaseY = 0.0f
        this.globalBaseZ = 0.0f
        if (skeletonBones != null) {
            for (skeletonBone in skeletonBones) {
                skeletonBone.parent = this
            }
        }
        if (collisionVolumes != null) {
            for (skeletonBone2 in collisionVolumes) {
                skeletonBone2.parent = this
            }
        }
    }

    fun deform(vector3: LLVector3, vector33: LLVector3) {
        this.offset.addthis as vector3.scale.mul(vector33)
    }

    fun deformHierarchy(vector3: LLVector3, vector33: LLVector3) {
        this.offset.addthis as vector3.scale.mul(vector33)
        if (this.collisionVolumes != null) {
            for (skeletonBone in this.collisionVolumes) {
                skeletonBone.deform(vector3, vector33)
            }
        }
    }

    fun getBasePosition(): LLVector3 {
        return this.basePosition
    }

    fun getGlobalMatrix(): FloatArray {
        return this.globalMatrix
    }

    fun getPositionX(): Float {
        return this.basePosition.x + this.offset.x
    }

    fun getPositionY(): Float {
        return this.basePosition.y + this.offset.y
    }

    fun getPositionZ(): Float {
        return this.basePosition.z + this.offset.z
    }

    fun getScaleX(): Float {
        return this.scale.x
    }

    fun getScaleY(): Float {
        return this.scale.y
    }

    fun getScaleZ(): Float {
        return this.scale.z
    }

    fun prepareSkeleton(skeletonBones: Array<SLSkeletonBone>, i: Int): Int {
        var i2: Int = 0
        var i3: Int = i + 1
        skeletonBones[i] = this
        if (this.parent == null) {
            this.globalBaseX = this.defaultBasePosition.x
            this.globalBaseY = this.defaultBasePosition.y
            this.globalBaseZ = this.defaultBasePosition.z
        } else {
            this.globalBaseX = this.parent.globalBaseX + this.defaultBasePosition.x
            this.globalBaseY = this.parent.globalBaseY + this.defaultBasePosition.y
            this.globalBaseZ = this.parent.globalBaseZ + this.defaultBasePosition.z
        }
        if (this.childBones != null) {
            var childBones: Array<SLSkeletonBone> = this.childBones
            var length: Int = childBones.length
            var i4: Int = 0
            while (i4 < length) {
                var prepareSkeleton: Int = childBones[i4].prepareSkeleton(skeletonBones, i3)
                i4++
                i3 = prepareSkeleton
            }
        }
        if (this.collisionVolumes != null) {
            var collisionVolumes: Array<SLSkeletonBone> = this.collisionVolumes
            var length2: Int = collisionVolumes.length
            while (i2 < length2) {
                var prepareSkeleton2: Int = collisionVolumes[i2].prepareSkeleton(skeletonBones, i3)
                i2++
                i3 = prepareSkeleton2
            }
        }
        return i3
    }

    fun setPositionOverride(positionOverride: LLVector3) {
        this.basePosition.set(positionOverride)
    }

    fun updateGlobalPos(animationSkeletonData: AnimationSkeletonData, floats: FloatArray, floats2: FloatArray) {
        var f: Float = 0.0f
        var f2: Float = 0.0f
        var f3: Float = 0.0f
        var animatedIndex: Int = this.boneID.animatedIndex
        var i2: Int = animatedIndex * 4
        var i3: Int = animatedIndex * 16
        if (animatedIndex >= 0) {
            var animOffsets: FloatArray = animationSkeletonData.getAnimOffsets()
            var f4: Float = animOffsets[i2 + 3]
            if (f4 > 0.0f) {
                var f5: Float = f4 * animOffsets[i2]
                var f6: Float = f4 * animOffsets[i2 + 1]
                var f7: Float = animOffsets[i2 + 2] * f4
                f2 = f6
                f3 = f5
                f = f7
            } else {
                f = 0.0f
                f2 = 0.0f
                f3 = 0.0f
            }
        } else {
            f = 0.0f
            f2 = 0.0f
            f3 = 0.0f
        }
        if (this.parent != null) {
            Matrix.translateM(this.tempMatrix, 0, this.parent.globalMatrix, 0, f3 + (this.usePosition.x * this.parent.scale.x) + this.offset.x, f2 + (this.usePosition.y * this.parent.scale.y) + this.offset.y, (this.usePosition.z * this.parent.scale.z) + this.offset.z + f)
        } else {
            Matrix.setIdentityM(this.tempMatrix, 0)
            Matrix.translateM(this.tempMatrix, 0, this.usePosition.x + this.offset.x + f3, this.usePosition.y + this.offset.y + f2, f + this.usePosition.z + this.offset.z)
        }
        if (animatedIndex >= 0) {
            Matrix.multiplyMM(this.globalMatrix, 0, this.tempMatrix, 0, animationSkeletonData.getAnimMatrix(), i3)
        } else {
            System.arraycopy(this.tempMatrix, 0, this.globalMatrix, 0, 16)
        }
        Matrix.scaleM(floats2, this.boneIndex * 16, this.globalMatrix, 0, this.scale.x, this.scale.y, this.scale.z)
        Matrix.translateM(floats, this.boneIndex * 16, floats2, this.boneIndex * 16, -this.globalBaseX, -this.globalBaseY, -this.globalBaseZ)
    }
}
