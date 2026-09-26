package com.lumiyaviewer.lumiya.ui.render.vr

class VrInputState(
    private val appButtonPressed: Boolean,
    private val touching: Boolean,
    private val touchX: Float,
    private val touchY: Float,
    private val connectionState: Int
) {
    fun isAppButtonPressed(): Boolean = appButtonPressed

    fun isTouching(): Boolean = touching

    fun getTouchX(): Float = touchX

    fun getTouchY(): Float = touchY

    fun getConnectionState(): Int = connectionState

    companion object {
        @JvmField
        val EMPTY = VrInputState(false, false, 0.0f, 0.0f, 0)
    }
}
