package com.lumiyaviewer.lumiya.render.avatar

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3

class AvatarAnimationList(states: Collection<AvatarAnimationState>) {
    private val animations: ImmutableList<AvatarRunningAnimation>
    private val sequences: ImmutableList<AvatarRunningSequence>

    init {
        val runningAnimations = ArrayList<AvatarRunningAnimation>(states.size)
        val builder = ImmutableList.builder<AvatarRunningSequence>()
        for (state in states) {
            state.getRunningAnimations(builder, runningAnimations)
        }
        runningAnimations.sort()
        sequences = builder.build()
        animations = ImmutableList.copyOf(runningAnimations)
    }

    fun animate(
        avatarSkeleton: AvatarSkeleton,
        priorityRot: FloatArray,
        priorityPos: FloatArray,
        quaternions: Array<LLQuaternion>,
        positions: Array<LLVector3>
    ) {
        for (animation in animations) {
            animation.animate(avatarSkeleton, priorityRot, priorityPos, quaternions, positions)
        }
        for (i in priorityRot.indices) {
            val remaining = 1.0f - priorityRot[i]
            if (remaining > 0.01f && remaining < 1.0f) {
                val factor = 1.0f / remaining
                val quaternion = quaternions[i]
                quaternion.x *= factor
                quaternion.y *= factor
                quaternion.z *= factor
                quaternion.w = factor * quaternion.w
            }
        }
    }

    fun needAnimate(now: Long): Boolean {
        var result = false
        for (sequence in sequences) {
            result = sequence.needAnimate(now) or result
        }
        return result
    }
}
