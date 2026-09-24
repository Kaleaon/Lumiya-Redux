package com.google.vr.sdk.controller;

import java.util.Locale;

public class Orientation {
    public float w;
    public float x;
    public float y;
    public float z;

    Orientation() {
        set(0.0f, 0.0f, 0.0f, 1.0f);
    }

    Orientation(float f, float f2, float f3, float f4) {
        set(f, f2, f3, f4);
    }

    void multiply(Orientation orientation) {
        float x = this.x;
        float y = this.y;
        float z = this.z;
        float w = this.w;
        this.x = (((orientation.w * x) + (orientation.x * w)) + (orientation.z * y)) - (orientation.y * z);
        this.y = (((orientation.w * y) + (orientation.y * w)) + (orientation.x * z)) - (orientation.z * x);
        this.z = (((orientation.w * z) + (orientation.z * w)) + (orientation.y * x)) - (orientation.x * y);
        this.w = (((w * orientation.w) - (x * orientation.x)) - (y * orientation.y)) - (orientation.z * z);
    }

    void set(float x, float y, float z, float w) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    void set(Orientation orientation) {
        set(orientation.x, orientation.y, orientation.z, orientation.w);
    }

    public String toAxisAngleString() {
        float degrees = (float) Math.toDegrees(Math.acos(this.w) * 2.0d);
        float sqrt = (float) Math.sqrt(1.0f - (this.w * this.w));
        return String.format(Locale.US, "(%5.2f, %5.2f, %5.2f), %3.0f°", Float.valueOf(sqrt > 0.0f ? this.x / sqrt : 0.0f), Float.valueOf(sqrt > 0.0f ? this.y / sqrt : 0.0f), Float.valueOf(sqrt > 0.0f ? this.z / sqrt : 0.0f), Float.valueOf(degrees));
    }

    float[] toEulerAngles(float[] floats) {
        float f = (this.z * this.y) + (this.x * this.w);
        if (Math.abs(f) < 0.4999f) {
            floats[0] = (float) Math.asin(f * 2.0f);
            floats[1] = (float) Math.atan2(((this.y * 2.0f) * this.w) - ((this.z * 2.0f) * this.x), (1.0f - ((this.y * 2.0f) * this.y)) - ((this.x * 2.0f) * this.x));
            floats[2] = (float) Math.atan2(((this.z * 2.0f) * this.w) - ((this.y * 2.0f) * this.x), (1.0f - ((this.z * 2.0f) * this.z)) - ((this.x * 2.0f) * this.x));
        } else {
            floats[0] = (float) Math.copySign(1.5707963267948966d, f);
            floats[1] = (float) (Math.copySign(2.0f, f) * Math.atan2(this.z, this.w));
            floats[2] = 0.0f;
        }
        return floats;
    }

    public float[] toRotationMatrix(float[] floats) {
        floats[0] = (1.0f - ((this.y * 2.0f) * this.y)) - ((this.z * 2.0f) * this.z);
        floats[1] = (this.x * 2.0f * this.y) + (this.z * 2.0f * this.w);
        floats[2] = ((this.x * 2.0f) * this.z) - ((this.y * 2.0f) * this.w);
        floats[3] = 0.0f;
        floats[4] = ((this.x * 2.0f) * this.y) - ((this.z * 2.0f) * this.w);
        floats[5] = (1.0f - ((this.x * 2.0f) * this.x)) - ((this.z * 2.0f) * this.z);
        floats[6] = (this.y * 2.0f * this.z) + (this.x * 2.0f * this.w);
        floats[7] = 0.0f;
        floats[8] = (this.x * 2.0f * this.z) + (this.y * 2.0f * this.w);
        floats[9] = ((this.y * 2.0f) * this.z) - ((this.x * 2.0f) * this.w);
        floats[10] = (1.0f - ((this.x * 2.0f) * this.x)) - ((this.y * 2.0f) * this.y);
        floats[11] = 0.0f;
        floats[12] = 0.0f;
        floats[13] = 0.0f;
        floats[14] = 0.0f;
        floats[15] = 1.0f;
        return floats;
    }

    public String toString() {
        return String.format(Locale.US, "%5.2fi %5.2fj %5.2fk %5.2f", Float.valueOf(this.x), Float.valueOf(this.y), Float.valueOf(this.z), Float.valueOf(this.w));
    }
}
