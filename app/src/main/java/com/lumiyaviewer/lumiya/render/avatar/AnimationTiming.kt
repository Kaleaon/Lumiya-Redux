package com.lumiyaviewer.lumiya.render.avatar

open class AnimationTiming {
    @JvmField var runningTime = 0.0f
    @JvmField var inAnimationTime = 0.0f
    @JvmField var inFactor = 0.0f
    @JvmField var outFactor = 1.0f

    fun hasStopped(): Boolean = outFactor <= 0.0f
}
