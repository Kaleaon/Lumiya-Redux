package com.lumiyaviewer.lumiya.dao;

import android.content.Context;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo;
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatterItemViewBuilder;
import java.util.UUID;

public class User implements ChatterDisplayInfo {
    private boolean badUUID;
    private String displayName;
    private Long id;
    private boolean isFriend;
    private int rightsGiven;
    private int rightsHas;
    private String userName;
    private UUID uuid;

    public User() {
    }

    public User(Long id) {
        this.id = id;
    }

    public User(Long id, UUID uuid, String userName, String displayName, boolean badUUID, boolean isFriend, int rightsGiven, int rightsHas) {
        this.id = id;
        this.uuid = uuid;
        this.userName = userName;
        this.displayName = displayName;
        this.badUUID = badUUID;
        this.isFriend = isFriend;
        this.rightsGiven = rightsGiven;
        this.rightsHas = rightsHas;
    }

    @Override
    public void buildView(Context context, ChatterItemViewBuilder chatterItemViewBuilder, UserManager userManager) {
        chatterItemViewBuilder.setLabel(this.displayName);
        chatterItemViewBuilder.setThumbnailChatterID(getChatterID(userManager), this.displayName);
    }

    public boolean getBadUUID() {
        return this.badUUID;
    }

    @Override
    public ChatterID getChatterID(UserManager userManager) {
        return ChatterID.getUserChatterID(userManager.getUserID(), this.uuid);
    }

    @Override
    public String getDisplayName() {
        return this.displayName;
    }

    public Long getId() {
        return this.id;
    }

    public boolean getIsFriend() {
        return this.isFriend;
    }

    public int getRightsGiven() {
        return this.rightsGiven;
    }

    public int getRightsHas() {
        return this.rightsHas;
    }

    public String getUserName() {
        return this.userName;
    }

    public UUID getUuid() {
        return this.uuid;
    }

    public boolean nameNeedsFetching() {
        if (this.userName == null || this.displayName == null) {
            return !this.badUUID;
        }
        return false;
    }

    public void setBadUUID(boolean badUUID) {
        this.badUUID = badUUID;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setIsFriend(boolean isFriend) {
        this.isFriend = isFriend;
    }

    public void setRightsGiven(int rightsGiven) {
        this.rightsGiven = rightsGiven;
    }

    public void setRightsHas(int rightsHas) {
        this.rightsHas = rightsHas;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUuid(UUID uuid) {
        this.uuid = uuid;
    }
}
