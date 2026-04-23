package com.lumiyaviewer.lumiya.render.backend.filament;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.types.CameraParams;

/* loaded from: classes.dex */
public class FilamentCameraSyncBridge {
    private float heading;
    private float tilt;
    private final float[] worldPosition = new float[3];

    public void syncFrom(CameraParams cameraParams) {
        this.heading = cameraParams.getHeading();
        this.tilt = cameraParams.getTilt();
        this.worldPosition[0] = cameraParams.getPosition().x;
        this.worldPosition[1] = cameraParams.getPosition().y;
        this.worldPosition[2] = cameraParams.getPosition().z;
        Debug.Printf("FilamentBridge: cameraSync pos=(%.2f, %.2f, %.2f), heading=%.2f tilt=%.2f", Float.valueOf(this.worldPosition[0]), Float.valueOf(this.worldPosition[1]), Float.valueOf(this.worldPosition[2]), Float.valueOf(this.heading), Float.valueOf(this.tilt));
    }
}
