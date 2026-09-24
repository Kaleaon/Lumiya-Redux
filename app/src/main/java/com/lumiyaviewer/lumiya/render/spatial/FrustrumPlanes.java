package com.lumiyaviewer.lumiya.render.spatial;

public class FrustrumPlanes {
    public static final int INSIDE = 1;
    public static final int INTERSECT = 0;
    private static final int NUM_PLANES = 6;
    public static final int OUTSIDE = -1;
    private final float[] params = new float[24];
    private final int[] pnIndex = new int[36];

    public FrustrumPlanes(float[] floats) {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= 6) {
                return;
            }
            initPlane(i2, floats, 2 - (i2 / 2), (i2 & 1) != 0 ? -1.0f : 1.0f);
            i = i2 + 1;
        }
    }

    private void initPlane(int i, float[] floats, int i2, float f) {
        int i3 = i * 4;
        for (int j = 0; j < 4; j++) {
            this.params[i3 + j] = floats[(j * 4) + 3] + (floats[(j * 4) + i2] * f);
        }
        float f2 = 0.0f;
        for (int k = 0; k < 3; k++) {
            float f3 = this.params[i3 + k];
            f2 += f3 * f3;
        }
        float sqrt = (float) Math.sqrt(f2);
        for (int m = 0; m < 4; m++) {
            float[] params = this.params;
            int i7 = i3 + m;
            params[i7] = params[i7] / sqrt;
        }
        for (int n = 0; n < 3; n++) {
            this.pnIndex[(i * 6) + n] = this.params[i3 + n] >= 0.0f ? n + 3 : n;
            this.pnIndex[(i * 6) + n + 3] = this.params[i3 + n] >= 0.0f ? n : n + 3;
        }
    }

    private float planeDistance(int i, int i2, float[] floats) {
        float f = 0.0f;
        for (int j = 0; j < 3; j++) {
            f += this.params[i + j] * floats[this.pnIndex[i2 + j]];
        }
        return this.params[i + 3] + f;
    }

    public int testBoundingBox(float[] floats, float[] floats2) {
        int i = 0;
        int i2 = 0;
        for (int j = 0; j < 6; j++) {
            if (planeDistance(i2, i, floats) < 0.0f) {
                return -1;
            }
            float planeDistance = planeDistance(i2, i + 3, floats);
            if (j == 0) {
                floats2[0] = planeDistance;
            }
            if (planeDistance < 0.0f) {
                return 0;
            }
            i2 += 4;
            i += 6;
        }
        return 1;
    }
}
