package com.lumiyaviewer.lumiya.slproto.events

import java.util.UUID

class SLLoginResultEvent private constructor(
    @JvmField val success: Boolean,
    @JvmField val message: String,
    @JvmField val activeAgentUUID: UUID,
    /** The grid asked for a multi-factor code; login can be retried with one. */
    @JvmField val mfaRequired: Boolean
) {
    constructor(success: Boolean, message: String, uuid: UUID) : this(success, message, uuid, false)

    companion object {
        @JvmStatic
        fun mfaChallenge(message: String, uuid: UUID): SLLoginResultEvent {
            return SLLoginResultEvent(false, message, uuid, true)
        }
    }
}
