package com.lumiyaviewer.lumiya.slproto;

public interface SLMessageEventListener {

    public static abstract class SLMessageBaseEventListener implements SLMessageEventListener {
        @Override
        public void onMessageAcknowledged(SLMessage sLMessage) {
        }

        @Override
        public void onMessageTimeout(SLMessage sLMessage) {
        }
    }

    void onMessageAcknowledged(SLMessage sLMessage);

    void onMessageTimeout(SLMessage sLMessage);
}
