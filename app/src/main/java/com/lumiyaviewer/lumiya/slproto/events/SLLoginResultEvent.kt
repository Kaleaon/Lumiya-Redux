package com.lumiyaviewer.lumiya.slproto.events

import java.util.UUID

class SLLoginResultEvent private constructor(
    @JvmField val success: Boolean,
    @JvmField val message: String,
    @JvmField val activeAgentUUID: UUID?,
    @JvmField val mfaRequired: Boolean
) {
    constructor(success: Boolean, message: String, activeAgentUUID: UUID?) :
        this(success, message, activeAgentUUID, false)

    companion object {
        @JvmStatic
        fun mfaChallenge(message: String, activeAgentUUID: UUID?): SLLoginResultEvent =
            SLLoginResultEvent(false, message, activeAgentUUID, true)
    }
}
