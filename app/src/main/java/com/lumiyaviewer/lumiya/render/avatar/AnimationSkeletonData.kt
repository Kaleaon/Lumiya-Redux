package com.lumiyaviewer.lumiya.render.avatar

import android.opengl.Matrix
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.Arrays

class AnimationSkeletonData {
    private val animPriorityRotArray = FloatArray(NUM_ANIMATED_BONES)
    private val animPriorityPosArray = FloatArray(NUM_ANIMATED_BONES)
    private val animRotArray = Array(NUM_ANIMATED_BONES) { LLQuaternion() }
    private val animPosArray = Array(NUM_ANIMATED_BONES) { LLVector3() }
    private var animMatrix = FloatArray(NUM_ANIMATED_BONES * 16)
    private var animMatrixSwap = FloatArray(NUM_ANIMATED_BONES * 16)
    private var animOffsets = FloatArray(NUM_ANIMATED_BONES * 4)
    private var animOffsetsSwap = FloatArray(NUM_ANIMATED_BONES * 4)

    init {
        for (i in 0 until NUM_ANIMATED_BONES) {
            Matrix.setIdentityM(animMatrix, i * 16)
        }
        Arrays.fill(animOffsets, 0.0f)
    }

    fun animate(avatarSkeleton: AvatarSkeleton, avatarAnimationList: AvatarAnimationList) {
        Arrays.fill(animPriorityRotArray, 1.0f)
        Arrays.fill(animPriorityPosArray, 1.0f)
        for (i in 0 until NUM_ANIMATED_BONES) {
            animRotArray[i].setZero()
            animPosArray[i].set(0.0f, 0.0f, 0.0f)
        }
        avatarAnimationList.animate(avatarSkeleton, animPriorityRotArray, animPriorityPosArray, animRotArray, animPosArray)
        for (j in 0 until NUM_ANIMATED_BONES) {
            animRotArray[j].getInverseMatrix(animMatrixSwap, j * 16)
            animOffsetsSwap[j * 4 + 0] = animPosArray[j].x
            animOffsetsSwap[j * 4 + 1] = animPosArray[j].y
            animOffsetsSwap[j * 4 + 2] = animPosArray[j].z
            animOffsetsSwap[j * 4 + 3] = 1.0f - animPriorityPosArray[j]
        }
        val matrixTemp = animMatrix
        animMatrix = animMatrixSwap
        animMatrixSwap = matrixTemp
        val offsetsTemp = animOffsets
        animOffsets = animOffsetsSwap
        animOffsetsSwap = offsetsTemp
    }

    fun getAnimMatrix(): FloatArray = animMatrix

    fun getAnimOffsets(): FloatArray = animOffsets

    companion object {
        private const val NUM_ANIMATED_BONES = 133
    }
}
