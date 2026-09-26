package com.lumiyaviewer.lumiya.ui.render.vr

import android.app.Activity

open class CardboardRuntime : VrRuntime {
    override fun getRuntimeId(): String = ID
    override fun createSession(activity: Activity, listener: VrSession.Listener): VrSession =
        GvrVrSessionAdapter(activity, ID, listener, true)
    companion object { const val ID = "cardboard" }
}
