package com.lumiyaviewer.lumiya.slproto.events

data class SLBalanceChangedEvent(
    @JvmField val oldBalanceValid: Boolean,
    @JvmField val oldBalance: Int,
    @JvmField val newBalance: Int
)
