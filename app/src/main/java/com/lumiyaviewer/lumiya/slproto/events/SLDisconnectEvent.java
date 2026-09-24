package com.lumiyaviewer.lumiya.slproto.events;

public class SLDisconnectEvent {
    public final String message;
    public final boolean normalDisconnect;

    public SLDisconnectEvent(boolean normalDisconnect, String message) {
        this.normalDisconnect = normalDisconnect;
        this.message = message;
    }
}
