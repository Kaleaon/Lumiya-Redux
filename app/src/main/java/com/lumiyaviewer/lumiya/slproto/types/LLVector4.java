package com.lumiyaviewer.lumiya.slproto.types;

public class LLVector4 {
    public static final float FP_MAG_THRESHOLD = 1.0E-7f;
    public float w;
    public float x;
    public float y;
    public float z;

    public LLVector4() {
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
        this.w = 0.0f;
    }

    public LLVector4(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = 0.0f;
    }

    public LLVector4(float x, float y, float z, float w) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    public LLVector4(LLVector3 vector3) {
        this.x = vector3.x;
        this.y = vector3.y;
        this.z = vector3.z;
        this.w = 0.0f;
    }

    public LLVector4(LLVector4 vector4) {
        this.x = vector4.x;
        this.y = vector4.y;
        this.z = vector4.z;
        this.w = vector4.w;
    }

    public static LLVector4 add(LLVector4 vector4, LLVector4 vector43) {
        return new LLVector4(vector4.x + vector43.x, vector4.y + vector43.y, vector4.z + vector43.z, vector4.w + vector43.w);
    }

    public static LLVector4 cross3(LLVector4 vector4, LLVector4 vector43) {
        return new LLVector4((vector4.y * vector43.z) - (vector4.z * vector43.y), (vector4.z * vector43.x) - (vector4.x * vector43.z), (vector4.x * vector43.y) - (vector4.y * vector43.x), 0.0f);
    }

    public static LLVector4 sub(LLVector4 vector4, LLVector4 vector43) {
        return new LLVector4(vector4.x - vector43.x, vector4.y - vector43.y, vector4.z - vector43.z, vector4.w - vector43.w);
    }

    public void add(LLVector4 vector4) {
        this.x += vector4.x;
        this.y += vector4.y;
        this.z += vector4.z;
        this.w += vector4.w;
    }

    public void clear() {
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
        this.w = 0.0f;
    }

    public float dot3(LLVector4 vector4) {
        return (this.x * vector4.x) + (this.y * vector4.y) + (this.z * vector4.z);
    }

    public void mul(float f) {
        this.x *= f;
        this.y *= f;
        this.z *= f;
        this.w *= f;
    }

    public float normalize3() {
        float sqrt = (float) Math.sqrt((this.x * this.x) + (this.y * this.y) + (this.z * this.z));
        if (sqrt > 1.0E-7f) {
            float f = 1.0f / sqrt;
            this.x *= f;
            this.y *= f;
            this.z = f * this.z;
        } else {
            this.x = 0.0f;
            this.y = 0.0f;
            this.z = 0.0f;
        }
        return sqrt;
    }

    public void set(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = 0.0f;
    }

    public void set(LLVector4 vector4) {
        this.x = vector4.x;
        this.y = vector4.y;
        this.z = vector4.z;
        this.w = vector4.w;
    }

    public void setMax(LLVector4 max) {
        this.x = Math.max(this.x, max.x);
        this.y = Math.max(this.y, max.y);
        this.z = Math.max(this.z, max.z);
        this.w = Math.max(this.w, max.w);
    }

    public void setMin(LLVector4 min) {
        this.x = Math.min(this.x, min.x);
        this.y = Math.min(this.y, min.y);
        this.z = Math.min(this.z, min.z);
        this.w = Math.min(this.w, min.w);
    }

    public String toString() {
        return String.format("(%f, %f, %f)", Float.valueOf(this.x), Float.valueOf(this.y), Float.valueOf(this.z));
    }
}
