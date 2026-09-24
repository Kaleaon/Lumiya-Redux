package com.google.vr.internal.controller;

import com.google.vr.cardboard.annotations.UsedByNative;
import com.google.vr.internal.controller.ServiceBridge;
import com.google.vr.vrcore.controller.api.ControllerAccelEvent;
import com.google.vr.vrcore.controller.api.ControllerButtonEvent;
import com.google.vr.vrcore.controller.api.ControllerEventPacket;
import com.google.vr.vrcore.controller.api.ControllerGyroEvent;
import com.google.vr.vrcore.controller.api.ControllerOrientationEvent;
import com.google.vr.vrcore.controller.api.ControllerTouchEvent;

@UsedByNative
public final class NativeCallbacks implements ServiceBridge.Callbacks {
    private boolean closed;
    private final long userData;

    @UsedByNative
    public NativeCallbacks(long userData) {
        this.userData = userData;
    }

    private final native void handleAccelEvent(long j, long j2, float f, float f2, float f3);

    private final native void handleButtonEvent(long j, long j2, int i, boolean z);

    private final native void handleControllerRecentered(long j, long j2, float f, float f2, float f3, float f4);

    private final native void handleGyroEvent(long j, long j2, float f, float f2, float f3);

    private final native void handleOrientationEvent(long j, long j2, float f, float f2, float f3, float f4);

    private final native void handleServiceConnected(long j, int i);

    private final native void handleServiceDisconnected(long j);

    private final native void handleServiceFailed(long j);

    private final native void handleServiceInitFailed(long j, int i);

    private final native void handleServiceUnavailable(long j);

    private final native void handleStateChanged(long j, int i, int i2);

    private final native void handleTouchEvent(long j, long j2, int i, float f, float f2);

    @UsedByNative
    public final synchronized void close() {
        this.closed = true;
    }

    @Override
    public final synchronized void onControllerEventPacket(ControllerEventPacket controllerEventPacket) {
        synchronized (this) {
            if (this.closed) {
                return;
            }
            for (int i = 0; !this.closed && i < controllerEventPacket.getAccelEventCount(); i++) {
                ControllerAccelEvent accelEvent = controllerEventPacket.getAccelEvent(i);
                handleAccelEvent(this.userData, accelEvent.timestampNanos, accelEvent.x, accelEvent.y, accelEvent.z);
            }
            for (int j = 0; !this.closed && j < controllerEventPacket.getButtonEventCount(); j++) {
                ControllerButtonEvent buttonEvent = controllerEventPacket.getButtonEvent(j);
                handleButtonEvent(this.userData, buttonEvent.timestampNanos, buttonEvent.button, buttonEvent.down);
            }
            for (int k = 0; !this.closed && k < controllerEventPacket.getGyroEventCount(); k++) {
                ControllerGyroEvent gyroEvent = controllerEventPacket.getGyroEvent(k);
                handleGyroEvent(this.userData, gyroEvent.timestampNanos, gyroEvent.x, gyroEvent.y, gyroEvent.z);
            }
            for (int m = 0; !this.closed && m < controllerEventPacket.getOrientationEventCount(); m++) {
                ControllerOrientationEvent orientationEvent = controllerEventPacket.getOrientationEvent(m);
                handleOrientationEvent(this.userData, orientationEvent.timestampNanos, orientationEvent.qx, orientationEvent.qy, orientationEvent.qz, orientationEvent.qw);
            }
            for (int n = 0; !this.closed && n < controllerEventPacket.getTouchEventCount(); n++) {
                ControllerTouchEvent touchEvent = controllerEventPacket.getTouchEvent(n);
                handleTouchEvent(this.userData, touchEvent.timestampNanos, touchEvent.action, touchEvent.x, touchEvent.y);
            }
        }
    }

    @Override
    public final synchronized void onControllerRecentered(ControllerOrientationEvent controllerOrientationEvent) {
        if (!this.closed) {
            handleControllerRecentered(this.userData, controllerOrientationEvent.timestampNanos, controllerOrientationEvent.qx, controllerOrientationEvent.qy, controllerOrientationEvent.qz, controllerOrientationEvent.qw);
        }
    }

    @Override
    public final synchronized void onControllerStateChanged(int i, int i2) {
        if (!this.closed) {
            handleStateChanged(this.userData, i, i2);
        }
    }

    @Override
    public final synchronized void onServiceConnected(int i) {
        if (!this.closed) {
            handleServiceConnected(this.userData, i);
        }
    }

    @Override
    public final synchronized void onServiceDisconnected() {
        if (!this.closed) {
            handleServiceDisconnected(this.userData);
        }
    }

    @Override
    public final synchronized void onServiceFailed() {
        if (!this.closed) {
            handleServiceFailed(this.userData);
        }
    }

    @Override
    public final synchronized void onServiceInitFailed(int i) {
        if (!this.closed) {
            handleServiceInitFailed(this.userData, i);
        }
    }

    @Override
    public final synchronized void onServiceUnavailable() {
        if (!this.closed) {
            handleServiceUnavailable(this.userData);
        }
    }
}
