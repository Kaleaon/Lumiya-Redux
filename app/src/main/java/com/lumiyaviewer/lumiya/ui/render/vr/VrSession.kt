package com.lumiyaviewer.lumiya.ui.render.vr

import android.view.View
import javax.microedition.khronos.egl.EGLConfig

interface VrSession {
    interface Renderer {
        fun onDrawEye(eye: VrEye)
        fun onFinishFrame()
        fun onNewFrame(pose: VrPose)
        fun onRendererShutdown()
        fun onSurfaceChanged(width: Int, height: Int)
        fun onSurfaceCreated(config: EGLConfig)
    }

    interface Listener {
        fun onApiStatusChanged(status: Int)
        fun onRecentered()
    }

    interface InputListener {
        fun onInputUpdated(inputState: VrInputState)
        fun onConnectionStateChanged(state: Int)
    }

    fun getView(): View
    fun setRenderer(renderer: Renderer)
    fun setOnTriggerListener(runnable: Runnable)
    fun setOnTouchListener(listener: View.OnTouchListener)
    fun setInputListener(listener: InputListener)
    fun onStart()
    fun onStop()
    fun onResume()
    fun onPause()
    fun onDestroy()
    fun recenterHeadTracker()
    fun getInterpupillaryDistance(): Float
    fun hasMagnet(): Boolean
}
