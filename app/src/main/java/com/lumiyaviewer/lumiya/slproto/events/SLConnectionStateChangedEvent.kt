package com.lumiyaviewer.lumiya.slproto.events

import com.lumiyaviewer.lumiya.slproto.SLGridConnection

data class SLConnectionStateChangedEvent(
    @JvmField val connectionState: SLGridConnection.ConnectionState
)
