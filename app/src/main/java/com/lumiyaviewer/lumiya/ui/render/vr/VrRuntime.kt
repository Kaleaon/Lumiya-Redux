package com.lumiyaviewer.lumiya.ui.render.vr

import android.app.Activity

interface VrRuntime {
    fun getRuntimeId(): String
    fun createSession(activity: Activity, listener: VrSession.Listener): VrSession
}
