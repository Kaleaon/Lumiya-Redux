package com.lumiyaviewer.lumiya.ui.render.vr;

public interface VrEye {
    int TYPE_LEFT = 0;
    int TYPE_RIGHT = 1;

    int getType();

    void getViewport(int[] out, int offset);

    float[] getPerspective(float near, float far);

    boolean isProjectionChanged();
}
