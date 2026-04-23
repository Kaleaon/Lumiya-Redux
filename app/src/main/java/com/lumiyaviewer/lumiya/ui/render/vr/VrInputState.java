package com.lumiyaviewer.lumiya.ui.render.vr;

public final class VrInputState {
    public static final VrInputState EMPTY = new VrInputState(false, false, 0.0f, 0.0f, 0);

    private final boolean appButtonPressed;
    private final boolean touching;
    private final float touchX;
    private final float touchY;
    private final int connectionState;

    public VrInputState(boolean appButtonPressed, boolean touching, float touchX, float touchY, int connectionState) {
        this.appButtonPressed = appButtonPressed;
        this.touching = touching;
        this.touchX = touchX;
        this.touchY = touchY;
        this.connectionState = connectionState;
    }

    public boolean isAppButtonPressed() {
        return appButtonPressed;
    }

    public boolean isTouching() {
        return touching;
    }

    public float getTouchX() {
        return touchX;
    }

    public float getTouchY() {
        return touchY;
    }

    public int getConnectionState() {
        return connectionState;
    }
}
