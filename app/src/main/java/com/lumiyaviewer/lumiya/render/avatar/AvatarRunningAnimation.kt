package com.lumiyaviewer.lumiya.render.avatar

import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3

internal class AvatarRunningAnimation(
    private val sequence: AvatarRunningSequence,
    private val jointSet: AnimationData.AnimationJointSet
) : Comparable<AvatarRunningAnimation> {

    fun animate(
        avatarSkeleton: AvatarSkeleton,
        floats: FloatArray,
        floats2: FloatArray,
        quaternions: Array<LLQuaternion>,
        vector3s: Array<LLVector3>
    ) {
        jointSet.animate(avatarSkeleton, sequence, floats, floats2, quaternions, vector3s)
    }

    override fun compareTo(other: AvatarRunningAnimation): Int {
        val priority = other.jointSet.priority - jointSet.priority
        if (priority != 0) {
            return priority
        }
        val sequenceOrder = other.sequence.sequenceID - sequence.sequenceID
        if (sequenceOrder != 0) {
            return sequenceOrder
        }
        return 0
    }

    companion object {
        /**
         * Pure ordering rule mirrored independently of the Android/GL avatar
         * types: higher joint-set priority sorts first, ties broken by higher
         * sequence id first (both descending, matching the original
         * `other - this` comparator).
         */
        @JvmStatic
        fun compare(priorityA: Int, sequenceIdA: Int, priorityB: Int, sequenceIdB: Int): Int {
            val priority = priorityB - priorityA
            if (priority != 0) {
                return priority
            }
            return sequenceIdB - sequenceIdA
        }
    }
}
