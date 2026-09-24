package com.lumiyaviewer.lumiya.slproto.events;

import java.util.UUID;

public class SLLoginResultEvent {
    public final UUID activeAgentUUID;
    public final String message;
    /** The grid asked for a multi-factor code; login can be retried with one. */
    public final boolean mfaRequired;
    public final boolean success;

    public SLLoginResultEvent(boolean success, String message, UUID uuid) {
        this(success, message, uuid, false);
    }

    private SLLoginResultEvent(boolean success, String message, UUID uuid, boolean mfaRequired) {
        this.success = success;
        this.message = message;
        this.activeAgentUUID = uuid;
        this.mfaRequired = mfaRequired;
    }

    public static SLLoginResultEvent mfaChallenge(String message, UUID uuid) {
        return new SLLoginResultEvent(false, message, uuid, true);
    }
}
