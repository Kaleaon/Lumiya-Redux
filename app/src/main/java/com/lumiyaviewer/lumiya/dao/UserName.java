package com.lumiyaviewer.lumiya.dao;

import com.google.common.base.Objects;
import com.google.common.base.Strings;
import java.util.UUID;

public class UserName {
    private String displayName;
    private boolean isBadUUID;
    private String userName;
    private UUID uuid;

    public UserName() {
    }

    public UserName(UUID uuid) {
        this.uuid = uuid;
    }

    public UserName(UUID uuid, String userName, String displayName, boolean isBadUUID) {
        this.uuid = uuid;
        this.userName = userName;
        this.displayName = displayName;
        this.isBadUUID = isBadUUID;
    }

    public String getDisplayName() {
        return this.displayName;
    }

    public boolean getIsBadUUID() {
        return this.isBadUUID;
    }

    public String getUserName() {
        return this.userName;
    }

    public UUID getUuid() {
        return this.uuid;
    }

    public boolean isComplete() {
        if (this.isBadUUID) {
            return true;
        }
        if (Strings.isNullOrEmpty(this.userName)) {
            return false;
        }
        return !Strings.isNullOrEmpty(this.displayName);
    }

    public boolean mergeWith(UserName userName) {
        boolean z = false;
        if (userName.isBadUUID && (!this.isBadUUID)) {
            this.isBadUUID = true;
            return true;
        }
        if (this.isBadUUID) {
            return false;
        }
        if (!Strings.isNullOrEmpty(userName.userName) && (!Objects.equal(this.userName, userName.userName))) {
            this.userName = userName.userName;
            z = true;
        }
        if (Strings.isNullOrEmpty(userName.displayName) || !(!Objects.equal(this.displayName, userName.displayName))) {
            return z;
        }
        this.displayName = userName.displayName;
        return true;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public void setIsBadUUID(boolean isBadUUID) {
        this.isBadUUID = isBadUUID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUuid(UUID uuid) {
        this.uuid = uuid;
    }
}
