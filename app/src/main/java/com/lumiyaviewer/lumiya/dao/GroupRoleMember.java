package com.lumiyaviewer.lumiya.dao;

import java.util.UUID;

public class GroupRoleMember {
    private UUID groupID;
    private UUID requestID;
    private UUID roleID;
    private UUID userID;

    public GroupRoleMember() {
    }

    public GroupRoleMember(UUID uuid, UUID requestID, UUID roleID, UUID userID) {
        this.groupID = uuid;
        this.requestID = requestID;
        this.roleID = roleID;
        this.userID = userID;
    }

    public UUID getGroupID() {
        return this.groupID;
    }

    public UUID getRequestID() {
        return this.requestID;
    }

    public UUID getRoleID() {
        return this.roleID;
    }

    public UUID getUserID() {
        return this.userID;
    }

    public void setGroupID(UUID uuid) {
        this.groupID = uuid;
    }

    public void setRequestID(UUID uuid) {
        this.requestID = uuid;
    }

    public void setRoleID(UUID uuid) {
        this.roleID = uuid;
    }

    public void setUserID(UUID uuid) {
        this.userID = uuid;
    }
}
