package com.lumiyaviewer.lumiya.dao;

import java.util.UUID;

public class GroupMember {
    private long agentPowers;
    private int contribution;
    private UUID groupID;
    private boolean isOwner;
    private String onlineStatus;
    private UUID requestID;
    private String title;
    private UUID userID;

    public GroupMember() {
    }

    public GroupMember(UUID uuid, UUID requestID, UUID userID, int contribution, String onlineStatus, long agentPowers, String title, boolean isOwner) {
        this.groupID = uuid;
        this.requestID = requestID;
        this.userID = userID;
        this.contribution = contribution;
        this.onlineStatus = onlineStatus;
        this.agentPowers = agentPowers;
        this.title = title;
        this.isOwner = isOwner;
    }

    public long getAgentPowers() {
        return this.agentPowers;
    }

    public int getContribution() {
        return this.contribution;
    }

    public UUID getGroupID() {
        return this.groupID;
    }

    public boolean getIsOwner() {
        return this.isOwner;
    }

    public String getOnlineStatus() {
        return this.onlineStatus;
    }

    public UUID getRequestID() {
        return this.requestID;
    }

    public String getTitle() {
        return this.title;
    }

    public UUID getUserID() {
        return this.userID;
    }

    public void setAgentPowers(long agentPowers) {
        this.agentPowers = agentPowers;
    }

    public void setContribution(int contribution) {
        this.contribution = contribution;
    }

    public void setGroupID(UUID uuid) {
        this.groupID = uuid;
    }

    public void setIsOwner(boolean isOwner) {
        this.isOwner = isOwner;
    }

    public void setOnlineStatus(String onlineStatus) {
        this.onlineStatus = onlineStatus;
    }

    public void setRequestID(UUID uuid) {
        this.requestID = uuid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setUserID(UUID uuid) {
        this.userID = uuid;
    }
}
