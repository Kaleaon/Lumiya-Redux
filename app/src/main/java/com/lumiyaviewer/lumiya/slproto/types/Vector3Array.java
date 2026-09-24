package com.lumiyaviewer.lumiya.slproto.types;

import android.opengl.Matrix;

public class Vector3Array extends VectorArray {
    public Vector3Array(int i) {
        super(3, i);
    }

    public Vector3Array(VectorArray vectorArray, int i) {
        super(vectorArray, i);
    }

    public final void MatrixScale(float[] floats, int i, int i2) {
        int i3 = this.offset + (this.numComponents * i2);
        Matrix.scaleM(floats, i, this.data[i3 + 0], this.data[i3 + 1], this.data[i3 + 2]);
    }

    public final void MatrixTranslate(float[] floats, int i, float[] floats2, int i2, int i3) {
        int i4 = this.offset + (this.numComponents * i3);
        Matrix.translateM(floats, i, floats2, i2, this.data[i4 + 0], this.data[i4 + 1], this.data[i4 + 2]);
    }

    public final void add(int i, LLVector3 vector3) {
        int i2 = this.offset + (this.numComponents * i);
        float[] data = this.data;
        int i3 = i2 + 0;
        data[i3] = data[i3] + vector3.x;
        float[] data2 = this.data;
        int i4 = i2 + 1;
        data2[i4] = data2[i4] + vector3.y;
        float[] data3 = this.data;
        int i5 = i2 + 2;
        data3[i5] = data3[i5] + vector3.z;
    }

    public final void addToVector(int i, LLVector3 vector3) {
        int i2 = this.offset + (this.numComponents * i);
        vector3.x += this.data[i2 + 0];
        vector3.y += this.data[i2 + 1];
        vector3.z = this.data[i2 + 2] + vector3.z;
    }

    public final void clear() {
        int offset = this.offset;
        for (int j = 0; j < this.length; j++) {
            this.data[offset + 0] = 0.0f;
            this.data[offset + 1] = 0.0f;
            this.data[offset + 2] = 0.0f;
            offset += this.numComponents;
        }
    }

    public final float distToPlane(int i, LLVector3 vector3, LLVector3 vector33) {
        int i2 = this.offset + (this.numComponents * i);
        float f = this.data[i2 + 0] - vector3.x;
        float f2 = this.data[i2 + 1] - vector3.y;
        float f3 = this.data[i2 + 2] - vector3.z;
        return (f3 * vector33.z) + (f * vector33.x) + (f2 * vector33.y);
    }

    public final void fill(int i, int i2, LLVector3 vector3) {
        int i3 = (this.numComponents * i) + this.offset;
        for (int j = 0; j < i2; j++) {
            this.data[i3 + 0] = vector3.x;
            this.data[i3 + 1] = vector3.y;
            this.data[i3 + 2] = vector3.z;
            i3 += this.numComponents;
        }
    }

    public final LLVector3 get(int i) {
        int i2 = this.offset + (this.numComponents * i);
        return new LLVector3(this.data[i2 + 0], this.data[i2 + 1], this.data[i2 + 2]);
    }

    public final void get(int i, LLVector3 vector3) {
        int i2 = this.offset + (this.numComponents * i);
        vector3.x = this.data[i2 + 0];
        vector3.y = this.data[i2 + 1];
        vector3.z = this.data[i2 + 2];
    }

    public final float getDistanceTo(int i, LLVector3 vector3) {
        int i2 = this.offset + (this.numComponents * i);
        float f = this.data[i2 + 0] - vector3.x;
        float f2 = this.data[i2 + 1] - vector3.y;
        float f3 = this.data[i2 + 2] - vector3.z;
        return (float) Math.sqrt((f3 * f3) + (f * f) + (f2 * f2));
    }

    public final float getMaxComponent(int i) {
        int i2 = (this.numComponents * i) + this.offset;
        float f = this.data[i2 + 0];
        if (this.data[i2 + 1] > f) {
            f = this.data[i2 + 1];
        }
        return this.data[i2 + 2] > f ? this.data[i2 + 2] : f;
    }

    public final void getSub(int i, int i2, LLVector3 vector3) {
        int i3 = this.offset + (this.numComponents * i);
        int i4 = this.offset + (this.numComponents * i2);
        vector3.x = this.data[i3 + 0] - this.data[i4 + 0];
        vector3.y = this.data[i3 + 1] - this.data[i4 + 1];
        vector3.z = this.data[i3 + 2] - this.data[i4 + 2];
    }

    public final void getSub(int i, Vector3Array vector3Array, int i2, LLVector3 vector3) {
        int i3 = this.offset + (this.numComponents * i);
        int i4 = vector3Array.offset + (vector3Array.numComponents * i2);
        vector3.x = this.data[i3 + 0] - vector3Array.data[i4 + 0];
        vector3.y = this.data[i3 + 1] - vector3Array.data[i4 + 1];
        vector3.z = this.data[i3 + 2] - vector3Array.data[i4 + 2];
    }

    public final void minMaxVector(int i, LLVector3 vector3, LLVector3 vector33) {
        int i2 = this.offset + (this.numComponents * i);
        float f = this.data[i2 + 0];
        float f2 = this.data[i2 + 1];
        float f3 = this.data[i2 + 2];
        if (vector3.x > f) {
            vector3.x = f;
        }
        if (vector33.x < f) {
            vector33.x = f;
        }
        if (vector3.y > f2) {
            vector3.y = f2;
        }
        if (vector33.y < f2) {
            vector33.y = f2;
        }
        if (vector3.z > f3) {
            vector3.z = f3;
        }
        if (vector33.z < f3) {
            vector33.z = f3;
        }
    }

    public final void minMaxVector(LLVector3 vector3, LLVector3 vector33) {
        int offset = this.offset;
        for (int j = 0; j < this.length; j++) {
            float f = this.data[offset + 0];
            float f2 = this.data[offset + 1];
            float f3 = this.data[offset + 2];
            if (vector3.x > f) {
                vector3.x = f;
            }
            if (vector33.x < f) {
                vector33.x = f;
            }
            if (vector3.y > f2) {
                vector3.y = f2;
            }
            if (vector33.y < f2) {
                vector33.y = f2;
            }
            if (vector3.z > f3) {
                vector3.z = f3;
            }
            if (vector33.z < f3) {
                vector33.z = f3;
            }
            offset += this.numComponents;
        }
    }

    public final void mul(int i, LLQuaternion quaternion) {
        int i2 = this.offset + (this.numComponents * i);
        float f = this.data[i2 + 0];
        float f2 = this.data[i2 + 1];
        float f3 = this.data[i2 + 2];
        float f4 = (((-quaternion.x) * f) - (quaternion.y * f2)) - (quaternion.z * f3);
        float f5 = ((quaternion.w * f) + (quaternion.y * f3)) - (quaternion.z * f2);
        float f6 = ((quaternion.w * f2) + (quaternion.z * f)) - (quaternion.x * f3);
        float f7 = ((f2 * quaternion.x) + (f3 * quaternion.w)) - (f * quaternion.y);
        this.data[i2 + 0] = ((((-f4) * quaternion.x) + (quaternion.w * f5)) - (quaternion.z * f6)) + (quaternion.y * f7);
        this.data[i2 + 1] = ((((-f4) * quaternion.y) + (quaternion.w * f6)) - (quaternion.x * f7)) + (quaternion.z * f5);
        this.data[i2 + 2] = (((f7 * quaternion.w) + ((-f4) * quaternion.z)) - (quaternion.y * f5)) + (quaternion.x * f6);
    }

    public final void set(int i, float f, float f2, float f3) {
        int i2 = this.offset + (this.numComponents * i);
        this.data[i2 + 0] = f;
        this.data[i2 + 1] = f2;
        this.data[i2 + 2] = f3;
    }

    public final void set(int i, LLVector3 vector3) {
        int i2 = this.offset + (this.numComponents * i);
        this.data[i2 + 0] = vector3.x;
        this.data[i2 + 1] = vector3.y;
        this.data[i2 + 2] = vector3.z;
    }

    public final void set(int i, Vector3Array vector3Array, int i2) {
        int i3 = this.offset + (this.numComponents * i);
        int i4 = vector3Array.offset + (vector3Array.numComponents * i2);
        this.data[i3 + 0] = vector3Array.data[i4 + 0];
        this.data[i3 + 1] = vector3Array.data[i4 + 1];
        this.data[i3 + 2] = vector3Array.data[i4 + 2];
    }

    public final void setAdd(int i, int i2) {
        int i3 = (this.numComponents * i) + this.offset;
        int i4 = (this.numComponents * i2) + this.offset;
        for (int j = 0; j < 3; j++) {
            float[] data = this.data;
            int i6 = i3 + j;
            data[i6] = data[i6] + this.data[i4 + j];
            this.data[i4 + j] = this.data[i3 + j];
        }
    }

    public final void subFromVector(LLVector3 vector3, int i) {
        int i2 = this.offset + (this.numComponents * i);
        vector3.x -= this.data[i2 + 0];
        vector3.y -= this.data[i2 + 1];
        vector3.z -= this.data[i2 + 2];
    }
}
