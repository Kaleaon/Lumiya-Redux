package com.lumiyaviewer.lumiya.slproto.events

import com.lumiyaviewer.lumiya.slproto.inventory.SLTaskInventory
import java.util.UUID

data class SLTaskInventoryReceivedEvent(
    @JvmField val taskID: UUID,
    @JvmField val taskInventory: SLTaskInventory
)
