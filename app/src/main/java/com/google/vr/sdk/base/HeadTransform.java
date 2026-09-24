package com.google.vr.sdk.base;

import android.opengl.Matrix;
import com.google.vr.cardboard.UsedByNative;

@UsedByNative
public class HeadTransform {
    private static final float GIMBAL_LOCK_EPSILON = 0.01f;
    private final float[] headView = new float[16];

    public HeadTransform() {
        Matrix.setIdentityM(this.headView, 0);
    }

    public void getEulerAngles(float[] floats, int i) {
        float f;
        float atan2;
        if (i + 3 > floats.length) {
            throw new IllegalArgumentException("Not enough space to write the result");
        }
        float asin = (float) Math.asin(this.headView[6]);
        if (Math.sqrt(1.0f - (this.headView[6] * this.headView[6])) >= 0.009999999776482582d) {
            f = (float) Math.atan2(-this.headView[2], this.headView[10]);
            atan2 = (float) Math.atan2(-this.headView[4], this.headView[5]);
        } else {
            f = 0.0f;
            atan2 = (float) Math.atan2(this.headView[1], this.headView[0]);
        }
        floats[i + 0] = -asin;
        floats[i + 1] = -f;
        floats[i + 2] = -atan2;
    }

    public void getForwardVector(float[] floats, int i) {
        if (i + 3 > floats.length) {
            throw new IllegalArgumentException("Not enough space to write the result");
        }
        for (int j = 0; j < 3; j++) {
            floats[j + i] = -this.headView[(j * 4) + 2];
        }
    }

    public void getHeadView(float[] floats, int i) {
        if (i + 16 > floats.length) {
            throw new IllegalArgumentException("Not enough space to write the result");
        }
        System.arraycopy(this.headView, 0, floats, i, 16);
    }

    @UsedByNative
    public float[] getHeadView() {
        return this.headView;
    }

    public void getQuaternion(float[] floats, int i) {
        float f;
        float f2;
        float f3;
        float f4;
        if (i + 4 > floats.length) {
            throw new IllegalArgumentException("Not enough space to write the result");
        }
        float[] headView = this.headView;
        if (headView[0] + headView[5] + headView[10] >= 0.0f) {
            float sqrt = (float) Math.sqrt((headView[0] + headView[5] + headView[10]) + 1.0f);
            f4 = 0.5f * sqrt;
            float f5 = 0.5f / sqrt;
            f2 = (headView[9] - headView[6]) * f5;
            f3 = (headView[2] - headView[8]) * f5;
            f = f5 * (headView[4] - headView[1]);
        } else if (headView[0] > headView[5] && headView[0] > headView[10]) {
            float sqrt2 = (float) Math.sqrt(((headView[0] + 1.0f) - headView[5]) - headView[10]);
            f2 = sqrt2 * 0.5f;
            float f6 = 0.5f / sqrt2;
            f3 = (headView[4] + headView[1]) * f6;
            f = (headView[2] + headView[8]) * f6;
            f4 = f6 * (headView[9] - headView[6]);
        } else if (headView[5] > headView[10]) {
            float sqrt3 = (float) Math.sqrt(((headView[5] + 1.0f) - headView[0]) - headView[10]);
            f3 = sqrt3 * 0.5f;
            float f7 = 0.5f / sqrt3;
            f2 = (headView[4] + headView[1]) * f7;
            f = (headView[9] + headView[6]) * f7;
            f4 = f7 * (headView[2] - headView[8]);
        } else {
            float sqrt4 = (float) Math.sqrt(((headView[10] + 1.0f) - headView[0]) - headView[5]);
            f = sqrt4 * 0.5f;
            float f8 = 0.5f / sqrt4;
            f2 = (headView[2] + headView[8]) * f8;
            f3 = (headView[9] + headView[6]) * f8;
            f4 = f8 * (headView[4] - headView[1]);
        }
        floats[i + 0] = f2;
        floats[i + 1] = f3;
        floats[i + 2] = f;
        floats[i + 3] = f4;
    }

    public void getRightVector(float[] floats, int i) {
        if (i + 3 > floats.length) {
            throw new IllegalArgumentException("Not enough space to write the result");
        }
        for (int j = 0; j < 3; j++) {
            floats[j + i] = this.headView[j * 4];
        }
    }

    public void getTranslation(float[] floats, int i) {
        if (i + 3 > floats.length) {
            throw new IllegalArgumentException("Not enough space to write the result");
        }
        for (int j = 0; j < 3; j++) {
            floats[j + i] = this.headView[j + 12];
        }
    }

    public void getUpVector(float[] floats, int i) {
        if (i + 3 > floats.length) {
            throw new IllegalArgumentException("Not enough space to write the result");
        }
        for (int j = 0; j < 3; j++) {
            floats[j + i] = this.headView[(j * 4) + 1];
        }
    }
}
