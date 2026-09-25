package com.lumiyaviewer.lumiya.slproto.events

data class SLTeleportResultEvent(
    @JvmField var success: Boolean,
    @JvmField var message: String
)
