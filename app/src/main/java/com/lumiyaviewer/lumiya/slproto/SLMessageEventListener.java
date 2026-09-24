package com.lumiyaviewer.lumiya.slproto;

public interface SLMessageEventListener {

    public static abstract class SLMessageBaseEventListener implements SLMessageEventListener {
        @Override
        public void onMessageAcknowledged(SLMessage message) {
        }

        @Override
        public void onMessageTimeout(SLMessage message) {
        }
    }

    void onMessageAcknowledged(SLMessage message);

    void onMessageTimeout(SLMessage message);
}
