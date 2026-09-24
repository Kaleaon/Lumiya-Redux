package com.lumiyaviewer.lumiya.slproto.types;

public class LLVector2 {
    public static final float FP_MAG_THRESHOLD = 1.0E-7f;
    public float x;
    public float y;

    public LLVector2() {
        this.x = 0.0f;
        this.y = 0.0f;
    }

    public LLVector2(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public LLVector2(LLVector2 vector2) {
        this.x = vector2.x;
        this.y = vector2.y;
    }

    public static LLVector2 sub(LLVector2 vector2, LLVector2 vector23) {
        return new LLVector2(vector2.x - vector23.x, vector2.y - vector23.y);
    }

    public static LLVector2 sum(LLVector2 vector2, LLVector2 vector23) {
        return new LLVector2(vector2.x + vector23.x, vector2.y + vector23.y);
    }

    public void add(LLVector2 vector2) {
        this.x += vector2.x;
        this.y += vector2.y;
    }

    public float dot(LLVector2 vector2) {
        return (this.x * vector2.x) + (this.y * vector2.y);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof LLVector2)) {
            return false;
        }
        LLVector2 vector2 = (LLVector2) obj;
        return this.x == vector2.x && this.y == vector2.y;
    }

    public int hashCode() {
        return Float.floatToIntBits(this.x) + Float.floatToIntBits(this.y);
    }

    public float magVec() {
        return (float) Math.sqrt((this.x * this.x) + (this.y * this.y));
    }

    public void mul(float f) {
        this.x *= f;
        this.y *= f;
    }

    public float normVec() {
        float sqrt = (float) Math.sqrt((this.x * this.x) + (this.y * this.y));
        if (sqrt > 1.0E-7f) {
            float f = 1.0f / sqrt;
            this.x *= f;
            this.y = f * this.y;
        } else {
            this.x = 0.0f;
            this.y = 0.0f;
        }
        return sqrt;
    }

    public void set(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public void setMax(LLVector2 max) {
        this.x = Math.max(this.x, max.x);
        this.y = Math.max(this.y, max.y);
    }

    public void setMin(LLVector2 min) {
        this.x = Math.min(this.x, min.x);
        this.y = Math.min(this.y, min.y);
    }

    public String toString() {
        return String.format("(%f, %f)", Float.valueOf(this.x), Float.valueOf(this.y));
    }
}
