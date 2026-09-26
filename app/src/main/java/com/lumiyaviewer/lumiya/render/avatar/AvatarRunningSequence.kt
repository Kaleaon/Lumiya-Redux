package com.lumiyaviewer.lumiya.render.avatar

import com.google.common.collect.ImmutableList

internal open class AvatarRunningSequence(
    private val animationData: AnimationData,
    @JvmField val sequenceID: Int,
    private val runningSince: Long,
    private val stoppingSince: Long,
    private val dontEaseIn: Boolean
) : AnimationTiming() {
    private val runningAnimations: ImmutableList<AvatarRunningAnimation> =
        animationData.createRunningAnimations(this)

    fun getAnimationPriority(): Int = animationData.priority

    fun getRunningAnimations(collection: MutableCollection<AvatarRunningAnimation>) {
        collection.addAll(runningAnimations)
    }

    fun needAnimate(now: Long): Boolean =
        animationData.updateAnimationTiming(now, runningSince, stoppingSince, dontEaseIn, this)
}
