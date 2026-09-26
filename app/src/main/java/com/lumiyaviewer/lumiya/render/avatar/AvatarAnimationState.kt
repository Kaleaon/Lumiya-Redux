package com.lumiyaviewer.lumiya.render.avatar

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.anim.AnimationCache
import java.lang.ref.WeakReference
import javax.annotation.Nonnull
import javax.annotation.Nullable

class AvatarAnimationState(
    @Nonnull sequenceInfo: AnimationSequenceInfo,
    @Nonnull drawableAvatar: DrawableAvatar
) : ResourceConsumer {

    @Volatile
    private var animationData: AnimationData? = null

    @Nullable
    @Volatile
    private var animationPair: AnimationPair? = null

    @Nonnull
    private val drawableAvatar: WeakReference<DrawableAvatar> = WeakReference(drawableAvatar)

    @Nonnull
    @Volatile
    var sequenceInfo: AnimationSequenceInfo = sequenceInfo
        private set

    private class AnimationPair(
        @Nonnull animationSequenceInfo: AnimationSequenceInfo,
        @Nonnull animationData: AnimationData
    ) {
        @Nullable
        val runningAnimation: AvatarRunningSequence?

        @Nullable
        val stoppingAnimation: AvatarRunningSequence?

        init {
            runningAnimation = if (animationSequenceInfo.sequenceID != 0) {
                AvatarRunningSequence(
                    animationData, animationSequenceInfo.sequenceID,
                    animationSequenceInfo.runningSince, -1L,
                    animationSequenceInfo.dontEaseIn
                )
            } else null

            stoppingAnimation = if (animationSequenceInfo.stoppingSequenceID != 0) {
                AvatarRunningSequence(
                    animationData, animationSequenceInfo.stoppingSequenceID,
                    animationSequenceInfo.stoppingRunningSince,
                    animationSequenceInfo.stoppingEasingOutSince,
                    animationSequenceInfo.dontEaseIn
                )
            } else null
        }

        fun getRunningAnimations(
            builder: ImmutableList.Builder<AvatarRunningSequence>,
            collection: MutableCollection<AvatarRunningAnimation>
        ) {
            runningAnimation?.let {
                builder.add(it)
                it.getRunningAnimations(collection)
            }
            stoppingAnimation?.let {
                builder.add(it)
                it.getRunningAnimations(collection)
            }
        }

        fun hasStopped(): Boolean {
            if (runningAnimation != null) return false
            return stoppingAnimation?.hasStopped() ?: true
        }
    }

    init {
        AnimationCache.getInstance().RequestResource(sequenceInfo.animationID, this)
    }

    override fun OnResourceReady(obj: Any?, z: Boolean) {
        if (obj is AnimationData) {
            animationData = obj
            drawableAvatar.get()?.updateRunningAnimations()
        } else if (obj == null) {
            animationData = null
        }
    }

    internal fun getRunningAnimations(
        builder: ImmutableList.Builder<AvatarRunningSequence>,
        collection: MutableCollection<AvatarRunningAnimation>
    ) {
        var pair = animationPair
        if (pair == null && animationData != null) {
            pair = AnimationPair(sequenceInfo, animationData!!)
            animationPair = pair
        }
        pair?.getRunningAnimations(builder, collection)
    }

    internal fun hasStopped(): Boolean = animationPair?.hasStopped() ?: false

    internal fun updateSequenceInfo(@Nonnull animationSequenceInfo: AnimationSequenceInfo) {
        sequenceInfo = animationSequenceInfo
        animationPair = null
    }
}
