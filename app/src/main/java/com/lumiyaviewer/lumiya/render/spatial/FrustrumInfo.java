package com.lumiyaviewer.lumiya.render.spatial;

import android.opengl.Matrix;
import java.util.Arrays;

public class FrustrumInfo {
    public final float[] mvpMatrix;
    public final float viewDistance;
    public final float viewX;
    public final float viewY;
    public final float viewZ;

    public FrustrumInfo(float viewX, float viewY, float viewZ, float viewDistance, float[] floats, int i) {
        this.viewX = viewX;
        this.viewY = viewY;
        this.viewZ = viewZ;
        this.viewDistance = viewDistance;
        this.mvpMatrix = new float[16];
        System.arraycopy(floats, i, this.mvpMatrix, 0, 16);
    }

    public FrustrumInfo(float viewX, float viewY, float viewZ, float viewDistance, float[] floats, int i, float[] floats2, int i2) {
        this.viewX = viewX;
        this.viewY = viewY;
        this.viewZ = viewZ;
        this.viewDistance = viewDistance;
        this.mvpMatrix = new float[16];
        Matrix.multiplyMM(this.mvpMatrix, 0, floats2, i2, floats, i);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FrustrumInfo)) {
            return false;
        }
        FrustrumInfo frustrumInfo = (FrustrumInfo) obj;
        return frustrumInfo.viewX == this.viewX && frustrumInfo.viewY == this.viewY && frustrumInfo.viewZ == this.viewZ && frustrumInfo.viewDistance == this.viewDistance && Arrays.equals(this.mvpMatrix, frustrumInfo.mvpMatrix);
    }

    public int hashCode() {
        return Float.floatToIntBits(this.viewX) + 0 + Float.floatToIntBits(this.viewY) + Float.floatToIntBits(this.viewZ) + Float.floatToIntBits(this.viewDistance) + Arrays.hashCode(this.mvpMatrix);
    }
}
