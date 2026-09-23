package com.google.vr.cardboard;

import com.google.common.logging.nano.Vr;
import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.view.Choreographer;
import android.view.Display;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public class DisplaySynchronizer implements Choreographer.FrameCallback {
    private static final boolean DEBUG = false;
    public static final long DISPLAY_ROTATION_REFRESH_INTERVAL_NANOS = TimeUnit.SECONDS.toNanos(1);
    private static final int INVALID_DISPLAY_ROTATION = -1;
    private static final float MIN_VALID_DISPLAY_REFRESH_RATE = 30.0f;
    private static final String TAG = "DisplaySynchronizer";
    private volatile Display display;
    private final FrameMonitor frameMonitor;
    private long nativeDisplaySynchronizer;
    private int displayRotationDegrees = -1;
    private long lastDisplayRotationUpdateTimeNanos = 0;

    public DisplaySynchronizer(Context context, Display display) {
        this.nativeDisplaySynchronizer = nativeCreate(getClass().getClassLoader(), context.getApplicationContext());
        if (this.nativeDisplaySynchronizer == 0) {
            throw new IllegalStateException("Native DisplaySynchronizer creation failed.");
        }
        setDisplay(display);
        this.frameMonitor = new FrameMonitor(this);
    }

    private void checkNativeDisplaySynchronizer() {
        if (this.nativeDisplaySynchronizer == 0) {
            throw new IllegalStateException("DisplaySynchronizer has already been shut down.");
        }
    }

    private void invalidateDisplayRotation() {
        this.displayRotationDegrees = -1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0034, code lost:
    
        if ((r8 - r7.lastDisplayRotationUpdateTimeNanos <= com.google.vr.cardboard.DisplaySynchronizer.DISPLAY_ROTATION_REFRESH_INTERVAL_NANOS) == false) goto L4;
     */
    @Override // android.view.Choreographer.FrameCallback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
     public void doFrame(long j) {
        checkNativeDisplaySynchronizer();
        if (this.displayRotationDegrees != -1) {
            if (!(j - this.lastDisplayRotationUpdateTimeNanos <= DISPLAY_ROTATION_REFRESH_INTERVAL_NANOS)) {
                switch (this.display.getRotation()) {
                    case 0:
                        this.displayRotationDegrees = 0;
                        break;
                    case 1:
                        this.displayRotationDegrees = 90;
                        break;
                    case 2:
                        this.displayRotationDegrees = Vr.VREvent.VrCore.ErrorCode.DON_DAYDREAM_APP_NOT_PRESENT;
                        break;
                    case 3:
                        this.displayRotationDegrees = 270;
                        break;
                    default:
                        Log.e(TAG, "Unknown display rotation, defaulting to 0");
                        this.displayRotationDegrees = 0;
                        break;
                }
                this.lastDisplayRotationUpdateTimeNanos = j;
            }
        }
        nativeUpdate(this.nativeDisplaySynchronizer, j, this.displayRotationDegrees);
    }

    protected void finalize() throws Throwable {
        try {
            if (this.nativeDisplaySynchronizer != 0) {
                Log.w(TAG, "DisplaySynchronizer.shutdown() should be called to ensure resource cleanup");
                nativeDestroy(this.nativeDisplaySynchronizer);
            }
        } finally {
            super.finalize();
        }
    }

    public Display getDisplay() {
        return this.display;
    }

    public long getNativeDisplaySynchronizer() {
        checkNativeDisplaySynchronizer();
        return this.nativeDisplaySynchronizer;
    }

    protected native long nativeCreate(ClassLoader classLoader, Context context);

    protected native void nativeDestroy(long j);

    protected native void nativeReset(long j, long j2, long j3);

    protected native void nativeUpdate(long j, long j2, int i);

    public void onConfigurationChanged() {
        invalidateDisplayRotation();
    }

    public void onPause() {
        this.frameMonitor.onPause();
    }

    public void onResume() {
        invalidateDisplayRotation();
        this.frameMonitor.onResume();
    }

    public void setDisplay(Display display) {
        checkNativeDisplaySynchronizer();
        this.display = display;
        invalidateDisplayRotation();
        float refreshRate = display.getRefreshRate();
        nativeReset(this.nativeDisplaySynchronizer, refreshRate >= MIN_VALID_DISPLAY_REFRESH_RATE ? (long) (TimeUnit.SECONDS.toNanos(1L) / refreshRate) : 0L, Build.VERSION.SDK_INT < 21 ? 0L : display.getAppVsyncOffsetNanos());
    }

    public void shutdown() {
        if (this.nativeDisplaySynchronizer != 0) {
            onPause();
            nativeDestroy(this.nativeDisplaySynchronizer);
            this.nativeDisplaySynchronizer = 0L;
        }
    }
}
