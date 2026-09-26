package com.lumiyaviewer.lumiya.ui.render.vr

interface VrEye {
    fun getType(): Int
    fun getViewport(out: IntArray, offset: Int)
    fun getPerspective(near: Float, far: Float): FloatArray
    fun isProjectionChanged(): Boolean

    companion object { const val TYPE_LEFT = 0; const val TYPE_RIGHT = 1 }
}
