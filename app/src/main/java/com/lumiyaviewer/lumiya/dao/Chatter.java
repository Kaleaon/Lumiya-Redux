package com.lumiyaviewer.lumiya.dao;

import java.util.UUID;

public class Chatter {
    private boolean active;
    private Long id;
    private Long lastMessageID;
    private UUID lastSessionID;
    private boolean muted;
    private int type;
    private int unreadCount;
    private UUID uuid;

    public Chatter() {
    }

    public Chatter(Long id) {
        this.id = id;
    }

    public Chatter(Long id, int type, UUID uuid, boolean active, boolean muted, int unreadCount, Long lastMessageID, UUID lastSessionID) {
        this.id = id;
        this.type = type;
        this.uuid = uuid;
        this.active = active;
        this.muted = muted;
        this.unreadCount = unreadCount;
        this.lastMessageID = lastMessageID;
        this.lastSessionID = lastSessionID;
    }

    public boolean getActive() {
        return this.active;
    }

    public Long getId() {
        return this.id;
    }

    public Long getLastMessageID() {
        return this.lastMessageID;
    }

    public UUID getLastSessionID() {
        return this.lastSessionID;
    }

    public boolean getMuted() {
        return this.muted;
    }

    public int getType() {
        return this.type;
    }

    public int getUnreadCount() {
        return this.unreadCount;
    }

    public UUID getUuid() {
        return this.uuid;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setLastMessageID(Long lastMessageID) {
        this.lastMessageID = lastMessageID;
    }

    public void setLastSessionID(UUID uuid) {
        this.lastSessionID = uuid;
    }

    public void setMuted(boolean muted) {
        this.muted = muted;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setUnreadCount(int unreadCount) {
        this.unreadCount = unreadCount;
    }

    public void setUuid(UUID uuid) {
        this.uuid = uuid;
    }
}
