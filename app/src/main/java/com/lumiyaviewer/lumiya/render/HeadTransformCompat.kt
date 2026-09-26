package com.lumiyaviewer.lumiya.render

open class HeadTransformCompat {
    @JvmField var lastYaw = 0.0f
    @JvmField var neutralYaw = 0.0f
    @JvmField var pitchDegrees = 0.0f
    @JvmField var useButtonsYaw = 0.0f
    @JvmField var yawDegrees = 0.0f
    @JvmField val rotationQuat = FloatArray(4)
    @JvmField val translationVector = FloatArray(4)
    @JvmField val headTransformMatrix = FloatArray(16)
    @JvmField val rightVectorRaw = FloatArray(4)
    @JvmField val rightVector = FloatArray(4)
    @JvmField val eulerAngles = FloatArray(3)
    @JvmField var neutralYawValid = false
    @JvmField var viewExtraYaw = 0.0f
}
