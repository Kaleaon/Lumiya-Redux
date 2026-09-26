package com.lumiyaviewer.lumiya.ui.render.vr

interface VrPose {
    fun getQuaternion(out: FloatArray, offset: Int)
    fun getTranslation(out: FloatArray, offset: Int)
    fun getHeadView(out: FloatArray, offset: Int)
    fun getEulerAngles(out: FloatArray, offset: Int)
    fun getRightVector(out: FloatArray, offset: Int)
}
