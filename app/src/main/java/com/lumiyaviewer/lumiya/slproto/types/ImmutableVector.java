package com.lumiyaviewer.lumiya.slproto.types;

import android.annotation.SuppressLint;
import javax.annotation.Nullable;

public class ImmutableVector {
    public final float x;
    public final float y;
    public final float z;

    public ImmutableVector(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public ImmutableVector(LLVector3 vector3) {
        this.x = vector3.x;
        this.y = vector3.y;
        this.z = vector3.z;
    }

    public float distanceTo(float f, float f2, float f3) {
        float f4 = f - this.x;
        float f5 = f2 - this.y;
        float f6 = f3 - this.z;
        return (float) Math.sqrt((f4 * f4) + (f5 * f5) + (f6 * f6));
    }

    public float distanceTo(@Nullable ImmutableVector immutableVector) {
        if (immutableVector == null) {
            return Float.NaN;
        }
        float f = this.x - immutableVector.x;
        float f2 = this.y - immutableVector.y;
        float f3 = this.z - immutableVector.z;
        return (float) Math.sqrt((f * f) + (f2 * f2) + (f3 * f3));
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ImmutableVector)) {
            return false;
        }
        ImmutableVector immutableVector = (ImmutableVector) obj;
        return this.x == immutableVector.x && this.y == immutableVector.y && this.z == immutableVector.z;
    }

    public float getDistanceTo(@Nullable LLVector3 vector3) {
        if (vector3 == null) {
            return Float.NaN;
        }
        float f = this.x - vector3.x;
        float f2 = this.y - vector3.y;
        float f3 = this.z - vector3.z;
        return (float) Math.sqrt((f * f) + (f2 * f2) + (f3 * f3));
    }

    public float getX() {
        return this.x;
    }

    public float getY() {
        return this.y;
    }

    public float getZ() {
        return this.z;
    }

    public int hashCode() {
        return Float.floatToRawIntBits(this.x) + Float.floatToRawIntBits(this.y) + Float.floatToRawIntBits(this.z);
    }

    @SuppressLint({"DefaultLocale"})
    public String toString() {
        return String.format("(%f,%f,%f)", Float.valueOf(this.x), Float.valueOf(this.y), Float.valueOf(this.z));
    }
}
