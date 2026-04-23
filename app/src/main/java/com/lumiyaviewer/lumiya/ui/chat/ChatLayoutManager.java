package com.lumiyaviewer.lumiya.ui.chat;

import android.content.Context;
import android.graphics.PointF;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.LinearSmoothScroller;
import androidx.recyclerview.widget.RecyclerView;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import javax.annotation.Nonnull;

/* loaded from: classes.dex */
public class ChatLayoutManager extends LinearLayoutManager {
    private static final float SMOOTH_SCROLL_FAST_SPEED = 20.0f;
    private static final float SMOOTH_SCROLL_SPEED = 1000.0f;

    @Nonnull
    private final SmoothScroller fastSmoothScroller;
    private boolean isFast;

    @Nonnull
    private final SmoothScroller smoothScroller;

    private abstract class SmoothScroller extends LinearSmoothScroller {
        private final float scrollDp;

        public SmoothScroller(Context context) {
            super(context);
            this.scrollDp = 200.0f;
        }

        @Override // androidx.recyclerview.widget.LinearSmoothScroller
        protected float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
            return getScrollMs() / TypedValue.applyDimension(1, 200.0f, displayMetrics);
        }

        @Override // androidx.recyclerview.widget.LinearSmoothScroller
        public PointF computeScrollVectorForPosition(int i) {
            return ChatLayoutManager.this.computeScrollVectorForPosition(i);
        }

        protected abstract float getScrollMs();
    }

    public ChatLayoutManager(Context context, int i, boolean z) {
        super(context, i, z);
        this.isFast = false;
        this.smoothScroller = new SmoothScroller(this, context) { // from class: com.lumiyaviewer.lumiya.ui.chat.ChatLayoutManager.1
            @Override // com.lumiyaviewer.lumiya.ui.chat.ChatLayoutManager.SmoothScroller
            protected float getScrollMs() {
                return ChatLayoutManager.SMOOTH_SCROLL_SPEED;
            }
        };
        this.fastSmoothScroller = new SmoothScroller(this, context) { // from class: com.lumiyaviewer.lumiya.ui.chat.ChatLayoutManager.2
            @Override // com.lumiyaviewer.lumiya.ui.chat.ChatLayoutManager.SmoothScroller
            protected float getScrollMs() {
                return 20.0f;
            }
        };
    }

    public void setScrollMode(boolean z) {
        this.isFast = z;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void smoothScrollToPosition(RecyclerView recyclerView, RecyclerView.State state, int i) {
        SmoothScroller smoothScroller = this.isFast ? this.fastSmoothScroller : this.smoothScroller;
        smoothScroller.setTargetPosition(i);
        startSmoothScroll(smoothScroller);
    }
}
