package com.lumiyaviewer.lumiya.slproto.types;

public class Vector2Array extends VectorArray {
    public Vector2Array(int i) {
        super(2, i);
    }

    public Vector2Array(VectorArray vectorArray, int i) {
        super(vectorArray, i);
    }

    public final void add(int i, LLVector2 vector2) {
        int i2 = this.offset + (this.numComponents * i);
        float[] data = this.data;
        int i3 = i2 + 0;
        data[i3] = data[i3] + vector2.x;
        float[] data2 = this.data;
        int i4 = i2 + 1;
        data2[i4] = data2[i4] + vector2.y;
    }

    public final void addToVector(int i, LLVector2 vector2) {
        int i2 = this.offset + (this.numComponents * i);
        vector2.x += this.data[i2 + 0];
        vector2.y = this.data[i2 + 1] + vector2.y;
    }

    public final void get(int i, LLVector2 vector2) {
        int i2 = this.offset + (this.numComponents * i);
        vector2.x = this.data[i2 + 0];
        vector2.y = this.data[i2 + 1];
    }

    public final void getSub(int i, Vector2Array vector2Array, int i2, LLVector2 vector2) {
        int i3 = this.offset + (this.numComponents * i);
        int i4 = vector2Array.offset + (vector2Array.numComponents * i2);
        vector2.x = this.data[i3 + 0] - vector2Array.data[i4 + 0];
        vector2.y = this.data[i3 + 1] - vector2Array.data[i4 + 1];
    }

    public final void minMaxVector(int i, LLVector2 vector2, LLVector2 vector23) {
        int i2 = this.offset + (this.numComponents * i);
        float f = this.data[i2 + 0];
        float f2 = this.data[i2 + 1];
        if (vector2.x > f) {
            vector2.x = f;
        }
        if (vector23.x < f) {
            vector23.x = f;
        }
        if (vector2.y > f2) {
            vector2.y = f2;
        }
        if (vector23.y < f2) {
            vector23.y = f2;
        }
    }

    public final void minMaxVector(LLVector2 vector2, LLVector2 vector23) {
        int offset = this.offset;
        for (int j = 0; j < this.length; j++) {
            float f = this.data[offset + 0];
            float f2 = this.data[offset + 1];
            if (vector2.x > f) {
                vector2.x = f;
            }
            if (vector23.x < f) {
                vector23.x = f;
            }
            if (vector2.y > f2) {
                vector2.y = f2;
            }
            if (vector23.y < f2) {
                vector23.y = f2;
            }
            offset += this.numComponents;
        }
    }

    public final void set(int i, float f, float f2) {
        int i2 = this.offset + (this.numComponents * i);
        this.data[i2 + 0] = f;
        this.data[i2 + 1] = f2;
    }

    public void swap(int i, int i2) {
        int i3 = (this.numComponents * i) + this.offset;
        int i4 = (this.numComponents * i2) + this.offset;
        for (int j = 0; j < 2; j++) {
            float f = this.data[i3 + j];
            this.data[i3 + j] = this.data[i4 + j];
            this.data[i4 + j] = f;
        }
    }
}
