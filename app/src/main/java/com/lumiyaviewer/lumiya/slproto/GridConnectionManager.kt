package com.lumiyaviewer.lumiya.slproto

import java.util.Map
import java.util.UUID
import java.util.WeakHashMap

open class GridConnectionManager {
    private static Object lock = Object()
    private static Map<UUID, SLGridConnection> connections = WeakHashMap()

    public static SLGridConnection getConnection(UUID uuid) {
        SLGridConnection gridConnection
        if (uuid == null) {
            return null
        }
        synchronized(lock) {
            gridConnection = connections.get(uuid)
        }
        return gridConnection
    }

    public static void removeConnection(UUID uuid, SLGridConnection gridConnection) {
        synchronized(lock) {
            if (connections.get(uuid) == gridConnection) {
                connections.remove(uuid)
            }
        }
    }

    public static void setConnection(UUID uuid, SLGridConnection gridConnection) {
        synchronized(lock) {
            connections.put(uuid, gridConnection)
        }
    }
}
