package com.lumiyaviewer.lumiya.dao;

import java.util.UUID;

public class GroupRoleMemberList {
    private UUID groupID;
    private boolean mustRevalidate;
    private UUID requestID;

    public GroupRoleMemberList() {
    }

    public GroupRoleMemberList(UUID uuid) {
        this.groupID = uuid;
    }

    public GroupRoleMemberList(UUID uuid, UUID requestID, boolean mustRevalidate) {
        this.groupID = uuid;
        this.requestID = requestID;
        this.mustRevalidate = mustRevalidate;
    }

    public UUID getGroupID() {
        return this.groupID;
    }

    public boolean getMustRevalidate() {
        return this.mustRevalidate;
    }

    public UUID getRequestID() {
        return this.requestID;
    }

    public void setGroupID(UUID uuid) {
        this.groupID = uuid;
    }

    public void setMustRevalidate(boolean mustRevalidate) {
        this.mustRevalidate = mustRevalidate;
    }

    public void setRequestID(UUID uuid) {
        this.requestID = uuid;
    }
}
