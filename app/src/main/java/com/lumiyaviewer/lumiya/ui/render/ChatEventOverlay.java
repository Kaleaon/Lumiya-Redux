package com.lumiyaviewer.lumiya.ui.render;

import android.widget.TextView;

/* loaded from: classes.dex */
class ChatEventOverlay {
    final TextView textView;
    final long timestamp;

    ChatEventOverlay(long j, TextView textView) {
        this.timestamp = j;
        this.textView = textView;
    }
}
