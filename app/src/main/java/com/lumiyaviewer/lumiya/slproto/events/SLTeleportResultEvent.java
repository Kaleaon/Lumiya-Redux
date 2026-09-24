package com.lumiyaviewer.lumiya.slproto.events;

public class SLTeleportResultEvent {
    public String message;
    public boolean success;

    public SLTeleportResultEvent(boolean success, String message) {
        this.success = success;
        this.message = message;
    }
}
