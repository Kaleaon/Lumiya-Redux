package com.lumiyaviewer.lumiya.slproto.avatar

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.render.avatar.AnimationSkeletonData
import com.lumiyaviewer.lumiya.slproto.types.LLVector3

open class SLSkeletonBone(val boneID: SLSkeletonBoneID, vector34: LLVector3, vector35: LLVector3, skeletonBones: Array<SLSkeletonBone>?, collisionVolumes: Array<SLSkeletonBone>?) {
    private val basePosition: LLVector3
    private val boneIndex: Int = boneID.ordinal()
    private val childBones: Array<SLSkeletonBone>? = skeletonBones
    private val collisionVolumes: Array<SLSkeletonBone>? = collisionVolumes
    private val defaultBasePosition: LLVector3
    private var globalBaseX: Float = 0.0f
    private var globalBaseY: Float = 0.0f
    private var globalBaseZ: Float = 0.0f
    private val offset: LLVector3 = LLVector3()
    private var parent: SLSkeletonBone? = null
    private val scale: LLVector3 = LLVector3(1.0f, 1.0f, 1.0f)
    private val usePosition: LLVector3
    private val globalMatrix: FloatArray = FloatArray(16)
    private val tempMatrix: FloatArray = FloatArray(16)

    init {
        this.basePosition = LLVector3(vector35)
        val vector3 = LLVector3(vector34)
        this.defaultBasePosition = LLVector3(this.basePosition)
        this.usePosition = if (boneID.isJoint) this.basePosition else vector3
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
        this.offset.add(vector3)
        this.scale.mul(vector33)
    }

    fun deformHierarchy(vector3: LLVector3, vector33: LLVector3) {
        this.offset.add(vector3)
        this.scale.mul(vector33)
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

    fun prepareSkeleton(skeletonBones: Array<SLSkeletonBone?>, i: Int): Int {
        var i2 = 0
        var i3 = i + 1
        skeletonBones[i] = this
        val parent = this.parent
        if (parent == null) {
            this.globalBaseX = this.defaultBasePosition.x
            this.globalBaseY = this.defaultBasePosition.y
            this.globalBaseZ = this.defaultBasePosition.z
        } else {
            this.globalBaseX = parent.globalBaseX + this.defaultBasePosition.x
            this.globalBaseY = parent.globalBaseY + this.defaultBasePosition.y
            this.globalBaseZ = parent.globalBaseZ + this.defaultBasePosition.z
        }
        val childBones = this.childBones
        if (childBones != null) {
            val length = childBones.size
            var i4 = 0
            while (i4 < length) {
                val prepareSkeleton = childBones[i4].prepareSkeleton(skeletonBones, i3)
                i4++
                i3 = prepareSkeleton
            }
        }
        val collisionVolumes = this.collisionVolumes
        if (collisionVolumes != null) {
            val length2 = collisionVolumes.size
            while (i2 < length2) {
                val prepareSkeleton2 = collisionVolumes[i2].prepareSkeleton(skeletonBones, i3)
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
        val f: Float
        val f2: Float
        val f3: Float
        val animatedIndex = this.boneID.animatedIndex
        val i2 = animatedIndex * 4
        val i3 = animatedIndex * 16
        if (animatedIndex >= 0) {
            val animOffsets = animationSkeletonData.getAnimOffsets()
            val f4 = animOffsets[i2 + 3]
            if (f4 > 0.0f) {
                val f5 = f4 * animOffsets[i2]
                val f6 = f4 * animOffsets[i2 + 1]
                val f7 = animOffsets[i2 + 2] * f4
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
        val parent = this.parent
        if (parent != null) {
            Matrix.translateM(this.tempMatrix, 0, parent.globalMatrix, 0, f3 + (this.usePosition.x * parent.scale.x) + this.offset.x, f2 + (this.usePosition.y * parent.scale.y) + this.offset.y, (this.usePosition.z * parent.scale.z) + this.offset.z + f)
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
