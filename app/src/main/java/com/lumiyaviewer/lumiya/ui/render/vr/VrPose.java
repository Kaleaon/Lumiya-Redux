package com.lumiyaviewer.lumiya.ui.render.vr;

public interface VrPose {
    void getQuaternion(float[] out, int offset);

    void getTranslation(float[] out, int offset);

    void getHeadView(float[] out, int offset);

    void getEulerAngles(float[] out, int offset);

    void getRightVector(float[] out, int offset);
}
