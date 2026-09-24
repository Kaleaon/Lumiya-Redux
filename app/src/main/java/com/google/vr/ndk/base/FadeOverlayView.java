package com.google.vr.ndk.base;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.view.animation.AnimationUtils;

class FadeOverlayView extends View {
    static final long AUTO_FADE_DURATION_MILLIS = 350;
    static final long AUTO_FADE_START_DELAY_MILLIS = 1000;
    private static final int BACKGROUND_COLOR = -16777216;
    private static final boolean DEBUG = true;
    private static final int MSG_AUTO_FADE = 77337733;
    private static final String TAG = "FadeOverlayView";
    private final Handler autoFadeHandler;
    private long fadeDurationMillis;
    private long fadeStartTimeMillis;
    private int fadeType;
    private final Runnable fadeUpdateRunnable;
    private boolean visible;

    public FadeOverlayView(Context context) {
        super(context);
        this.fadeType = 0;
        this.fadeUpdateRunnable = new Runnable() {
            @Override
            public void run() {
                FadeOverlayView.this.updateFade();
            }
        };
        this.autoFadeHandler = new Handler(Looper.getMainLooper()) {
            @Override
            public void handleMessage(Message message) {
                if (message.what != FadeOverlayView.MSG_AUTO_FADE) {
                    super.handleMessage(message);
                } else {
                    FadeOverlayView.this.startFade(1, FadeOverlayView.AUTO_FADE_DURATION_MILLIS);
                }
            }
        };
        setBackgroundColor(-16777216);
    }

    private void endFade() {
        if (this.fadeType != 0) {
            setVisibility(this.fadeType != 2 ? View.GONE : View.VISIBLE);
            setAlpha(this.fadeType != 2 ? 0.0f : 1.0f);
            removeCallbacks(this.fadeUpdateRunnable);
            this.fadeType = 0;
            Log.d(TAG, ".endFade");
        }
    }

    private void removeFadeCallbacks() {
        this.autoFadeHandler.removeMessages(MSG_AUTO_FADE);
        removeCallbacks(this.fadeUpdateRunnable);
    }

    public void updateFade() {
        long currentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis() - this.fadeStartTimeMillis;
        float f = currentAnimationTimeMillis / this.fadeDurationMillis;
        if (this.fadeType != 2) {
            f = 1.0f - f;
        }
        setAlpha(Math.min(Math.max(f, 0.0f), 1.0f));
        if (!(currentAnimationTimeMillis >= this.fadeDurationMillis) && getVisibility() != 0) {
            setVisibility(View.VISIBLE);
        }
        if (currentAnimationTimeMillis >= this.fadeDurationMillis) {
            endFade();
        } else {
            postOnAnimation(this.fadeUpdateRunnable);
        }
    }

    public void flushAutoFade(long j) {
        Log.d(TAG, ".flushAutoFade");
        if (this.autoFadeHandler.hasMessages(MSG_AUTO_FADE)) {
            this.autoFadeHandler.removeMessages(MSG_AUTO_FADE);
            this.autoFadeHandler.sendEmptyMessageDelayed(MSG_AUTO_FADE, j);
        }
    }

    int getFadeType() {
        return this.fadeType;
    }

    boolean isVisible() {
        return this.visible;
    }

    public void onInvisible() {
        if (this.visible) {
            this.visible = false;
            if (isEnabled()) {
                removeFadeCallbacks();
                this.fadeType = 2;
                endFade();
            }
        }
    }

    public void onVisible() {
        if (this.visible && getAlpha() == 0.0f) {
            return;
        }
        this.visible = DEBUG;
        if (isEnabled()) {
            this.autoFadeHandler.removeMessages(MSG_AUTO_FADE);
            this.autoFadeHandler.sendEmptyMessageDelayed(MSG_AUTO_FADE, AUTO_FADE_START_DELAY_MILLIS);
        }
    }

    @Override
    public void setEnabled(boolean enabled) {
        if (isEnabled() != enabled) {
            super.setEnabled(enabled);
            if (enabled) {
                return;
            }
            removeFadeCallbacks();
            this.fadeType = 1;
            endFade();
        }
    }

    public void startFade(int fadeType, long fadeDurationMillis) {
        Log.d(TAG, new StringBuilder(23).append(".startFade: ").append(fadeType).toString());
        if (!isEnabled()) {
            Log.w(TAG, "Ignoring fade request while disabled.");
            return;
        }
        if (!this.visible) {
            Log.w(TAG, "Ignoring fade request while invisible.");
            return;
        }
        removeFadeCallbacks();
        this.fadeType = fadeType;
        this.fadeDurationMillis = fadeDurationMillis;
        this.fadeStartTimeMillis = AnimationUtils.currentAnimationTimeMillis();
        updateFade();
    }
}
