package com.lumiyaviewer.lumiya.slproto.users.events;

import java.util.UUID;

public class EventUserOnlineStatusChanged {
    public final UUID agentUUID;
    public final boolean isOnline;
    public final UUID userUUID;

    public EventUserOnlineStatusChanged(UUID uuid, UUID userUUID, boolean isOnline) {
        this.agentUUID = uuid;
        this.userUUID = userUUID;
        this.isOnline = isOnline;
    }
}
