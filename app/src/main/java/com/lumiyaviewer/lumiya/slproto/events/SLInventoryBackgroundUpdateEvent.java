package com.lumiyaviewer.lumiya.slproto.events;

public class SLInventoryBackgroundUpdateEvent {
    public final boolean backgroundUpdateActive;

    public SLInventoryBackgroundUpdateEvent(boolean backgroundUpdateActive) {
        this.backgroundUpdateActive = backgroundUpdateActive;
    }
}
