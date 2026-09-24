package com.lumiyaviewer.lumiya.slproto.events;

public class SLBakingProgressEvent {
    public boolean done;
    public boolean first;
    public int progress;

    public SLBakingProgressEvent(boolean first, boolean done, int progress) {
        this.first = first;
        this.done = done;
        this.progress = progress;
    }
}
