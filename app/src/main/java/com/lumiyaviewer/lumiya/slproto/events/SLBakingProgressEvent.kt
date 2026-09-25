package com.lumiyaviewer.lumiya.slproto.events

data class SLBakingProgressEvent(
    @JvmField var first: Boolean,
    @JvmField var done: Boolean,
    @JvmField var progress: Int
)
