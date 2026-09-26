package com.lumiyaviewer.lumiya.slproto.users.events

import java.util.UUID

open class EventUserOnlineStatusChanged(
    @JvmField val agentUUID: UUID,
    @JvmField val userUUID: UUID,
    @JvmField val isOnline: Boolean,
)
