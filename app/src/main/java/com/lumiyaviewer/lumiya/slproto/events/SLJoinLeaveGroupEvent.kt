package com.lumiyaviewer.lumiya.slproto.events

import java.util.UUID

data class SLJoinLeaveGroupEvent(
    @JvmField val groupID: UUID,
    @JvmField val isJoin: Boolean,
    @JvmField val success: Boolean
)
