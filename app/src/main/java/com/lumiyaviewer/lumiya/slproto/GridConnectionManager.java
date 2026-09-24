package com.lumiyaviewer.lumiya.slproto;

import java.util.Map;
import java.util.UUID;
import java.util.WeakHashMap;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class GridConnectionManager {
    private static final Object lock = new Object();
    private static final Map<UUID, SLGridConnection> connections = new WeakHashMap();

    @Nullable
    public static SLGridConnection getConnection(@Nullable UUID uuid) {
        SLGridConnection gridConnection;
        if (uuid == null) {
            return null;
        }
        synchronized (lock) {
            gridConnection = connections.get(uuid);
        }
        return gridConnection;
    }

    public static void removeConnection(@Nonnull UUID uuid, SLGridConnection gridConnection) {
        synchronized (lock) {
            if (connections.get(uuid) == gridConnection) {
                connections.remove(uuid);
            }
        }
    }

    public static void setConnection(@Nonnull UUID uuid, SLGridConnection gridConnection) {
        synchronized (lock) {
            connections.put(uuid, gridConnection);
        }
    }
}
