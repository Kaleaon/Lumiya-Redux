package com.lumiyaviewer.lumiya.slproto.prims;

import com.lumiyaviewer.lumiya.slproto.types.LLVector3;

public class PrimMath {
    public static final float F_DEG_TO_RAD = 0.017453292f;
    public static final float F_PI = 3.1415927f;

    public static float lerp(float f, float f2, float f3) {
        return ((f2 - f) * f3) + f;
    }

    public static float[] lookAt(LLVector3 vector35, LLVector3 vector36, LLVector3 vector37) {
        LLVector3 sub = LLVector3.sub(vector36, vector35);
        sub.normVec();
        LLVector3 vector3 = new LLVector3(sub);
        vector3.setCross(vector37);
        return new float[]{vector3.x, vector37.x, -sub.x, 0.0f, vector3.y, vector37.y, -sub.y, 0.0f, vector3.z, vector37.z, -sub.z, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    }
}
