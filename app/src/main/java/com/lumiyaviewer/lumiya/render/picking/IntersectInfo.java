package com.lumiyaviewer.lumiya.render.picking;

import android.opengl.Matrix;
import com.lumiyaviewer.lumiya.slproto.types.LLVector4;

public class IntersectInfo {
    public final int faceID;
    public final boolean faceKnown;
    public final LLVector4 intersectPoint;
    public final float s;
    public final float t;
    public final float u;
    public final float v;

    public IntersectInfo(IntersectInfo intersectInfo, float[] floats2, int i) {
        this.intersectPoint = intersectInfo.intersectPoint;
        this.faceID = intersectInfo.faceID;
        this.s = intersectInfo.s;
        this.t = intersectInfo.t;
        this.faceKnown = intersectInfo.faceKnown;
        if (!this.faceKnown) {
            this.u = intersectInfo.u;
            this.v = intersectInfo.v;
            return;
        }
        float[] floats = new float[8];
        floats[0] = this.s;
        floats[1] = this.t;
        floats[3] = 1.0f;
        Matrix.multiplyMV(floats, 4, floats2, i, floats, 0);
        this.u = floats[4];
        this.v = floats[5];
    }

    public IntersectInfo(LLVector4 intersectPoint) {
        this.intersectPoint = intersectPoint;
        this.faceID = 0;
        this.u = 0.0f;
        this.v = 0.0f;
        this.s = 0.0f;
        this.t = 0.0f;
        this.faceKnown = false;
    }

    public IntersectInfo(LLVector4 intersectPoint, int faceID, float f, float f2) {
        this.intersectPoint = intersectPoint;
        this.faceID = faceID;
        this.u = f;
        this.v = f2;
        this.s = f;
        this.t = f2;
        this.faceKnown = true;
    }
}
