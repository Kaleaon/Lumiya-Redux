package com.lumiyaviewer.lumiya.slproto

import java.util.Map
import java.util.UUID
import java.util.WeakHashMap

open class GridConnectionManager {
    private Object lock = Object()
    private Map<UUID, SLGridConnection> connections = WeakHashMap()

    SLGridConnection getConnection(UUID uuid) {
        SLGridConnection gridConnection
        if (uuid == null) {
            return null
        }
        synchronized(lock) {
            gridConnection = connections.get(uuid)
        }
        return gridConnection
    }

    void removeConnection(UUID uuid, SLGridConnection gridConnection) {
        synchronized(lock) {
            if (connections.get(uuid) == gridConnection) {
                connections.remove(uuid)
            }
        }
    }

    void setConnection(UUID uuid, SLGridConnection gridConnection) {
        synchronized(lock) {
            connections.put(uuid, gridConnection)
        }
    }
}
