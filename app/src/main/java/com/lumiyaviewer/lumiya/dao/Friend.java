package com.lumiyaviewer.lumiya.dao;

import java.util.UUID;

public class Friend {
    public static final int GRANT_MAP_LOCATION = 2;
    public static final int GRANT_MODIFY_OBJECTS = 4;
    public static final int GRANT_ONLINE_STATUS = 1;
    private boolean isOnline;
    private int rightsGiven;
    private int rightsHas;
    private UUID uuid;

    public Friend() {
    }

    public Friend(UUID uuid) {
        this.uuid = uuid;
    }

    public Friend(UUID uuid, int rightsGiven, int rightsHas, boolean isOnline) {
        this.uuid = uuid;
        this.rightsGiven = rightsGiven;
        this.rightsHas = rightsHas;
        this.isOnline = isOnline;
    }

    public boolean getIsOnline() {
        return this.isOnline;
    }

    public int getRightsGiven() {
        return this.rightsGiven;
    }

    public int getRightsHas() {
        return this.rightsHas;
    }

    public UUID getUuid() {
        return this.uuid;
    }

    public void setIsOnline(boolean isOnline) {
        this.isOnline = isOnline;
    }

    public void setRightsGiven(int rightsGiven) {
        this.rightsGiven = rightsGiven;
    }

    public void setRightsHas(int rightsHas) {
        this.rightsHas = rightsHas;
    }

    public void setUuid(UUID uuid) {
        this.uuid = uuid;
    }
}
