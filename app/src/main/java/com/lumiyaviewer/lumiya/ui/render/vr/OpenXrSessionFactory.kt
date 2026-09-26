package com.lumiyaviewer.lumiya.ui.render.vr

import android.app.Activity

fun interface OpenXrSessionFactory {
    fun createSession(activity: Activity, listener: VrSession.Listener): VrSession
}
