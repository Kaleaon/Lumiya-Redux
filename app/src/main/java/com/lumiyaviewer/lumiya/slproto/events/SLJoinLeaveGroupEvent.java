package com.lumiyaviewer.lumiya.slproto.events;

import java.util.UUID;

public class SLJoinLeaveGroupEvent {
    public final UUID groupID;
    public final boolean isJoin;
    public final boolean success;

    public SLJoinLeaveGroupEvent(UUID uuid, boolean isJoin, boolean success) {
        this.groupID = uuid;
        this.isJoin = isJoin;
        this.success = success;
    }
}
