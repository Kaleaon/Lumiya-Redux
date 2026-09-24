package com.lumiyaviewer.lumiya.slproto.events;

import java.util.UUID;

public class SLLoginResultEvent {
    public final UUID activeAgentUUID;
    public final String message;
    public final boolean success;

    public SLLoginResultEvent(boolean success, String message, UUID uuid) {
        this.success = success;
        this.message = message;
        this.activeAgentUUID = uuid;
    }
}
