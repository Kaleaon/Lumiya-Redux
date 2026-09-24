package com.lumiyaviewer.lumiya.ui.render;

import android.widget.TextView;

class ChatEventOverlay {
    final TextView textView;
    final long timestamp;

    ChatEventOverlay(long timestamp, TextView textView) {
        this.timestamp = timestamp;
        this.textView = textView;
    }
}
