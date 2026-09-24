package com.lumiyaviewer.lumiya.slproto.types;

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDDouble;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap;
import java.nio.ByteBuffer;

public class LLVector3 {
    public static final float FP_MAG_THRESHOLD = 1.0E-7f;
    public float x;
    public float y;
    public float z;
    public static final LLVector3 z_axis = new LLVector3(0.0f, 0.0f, 1.0f);
    public static final LLVector3 Zero = new LLVector3(0.0f, 0.0f, 0.0f);

    public LLVector3() {
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
    }

    public LLVector3(float x, float y, float z) {
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public LLVector3(LLVector3 vector3) {
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
        this.x = vector3.x;
        this.y = vector3.y;
        this.z = vector3.z;
    }

    public static LLVector3 cross(LLVector3 vector3, LLVector3 vector33) {
        return new LLVector3((vector3.y * vector33.z) - (vector33.y * vector3.z), (vector3.z * vector33.x) - (vector33.z * vector3.x), (vector3.x * vector33.y) - (vector33.x * vector3.y));
    }

    public static LLVector3 lerp(LLVector3 vector3, LLVector3 vector33, float f) {
        return new LLVector3(vector3.x + ((vector33.x - vector3.x) * f), vector3.y + ((vector33.y - vector3.y) * f), vector3.z + ((vector33.z - vector3.z) * f));
    }

    public static LLVector3 parseFloatVec(ByteBuffer byteBuffer) {
        return new LLVector3(byteBuffer.getFloat(), byteBuffer.getFloat(), byteBuffer.getFloat());
    }

    public static LLVector3 parseU16Vec(ByteBuffer byteBuffer, float f, float f2, float f3, float f4) {
        return new LLVector3(LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2), LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2), LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f3, f4));
    }

    public static LLVector3 parseU8Vec(ByteBuffer byteBuffer, float f, float f2, float f3, float f4) {
        return new LLVector3(LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2), LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2), LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f3, f4));
    }

    public static LLVector3 scaleFromMatrix(float[] floats) {
        return new LLVector3((float) Math.sqrt((floats[0] * floats[0]) + (floats[1] * floats[1]) + (floats[2] * floats[2])), (float) Math.sqrt((floats[4] * floats[4]) + (floats[5] * floats[5]) + (floats[6] * floats[6])), (float) Math.sqrt((floats[8] * floats[8]) + (floats[9] * floats[9]) + (floats[10] * floats[10])));
    }

    public static LLVector3 sub(LLVector3 vector3, LLVector3 vector33) {
        return new LLVector3(vector3.x - vector33.x, vector3.y - vector33.y, vector3.z - vector33.z);
    }

    public void add(LLVector3 vector3) {
        this.x += vector3.x;
        this.y += vector3.y;
        this.z += vector3.z;
    }

    public void addMul(ImmutableVector immutableVector, float f) {
        this.x += immutableVector.x * f;
        this.y += immutableVector.y * f;
        this.z += immutableVector.z * f;
    }

    public void addMul(LLVector3 vector3, float f) {
        this.x += vector3.x * f;
        this.y += vector3.y * f;
        this.z += vector3.z * f;
    }

    public float dot(LLVector3 vector3) {
        return (this.x * vector3.x) + (this.y * vector3.y) + (this.z * vector3.z);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof LLVector3)) {
            return false;
        }
        LLVector3 vector3 = (LLVector3) obj;
        return this.x == vector3.x && this.y == vector3.y && this.z == vector3.z;
    }

    public float getDistanceTo(LLVector3 vector3) {
        float f = this.x - vector3.x;
        float f2 = this.y - vector3.y;
        float f3 = this.z - vector3.z;
        return (float) Math.sqrt((f * f) + (f2 * f2) + (f3 * f3));
    }

    public float getMax() {
        return Math.max(Math.max(this.x, this.y), this.z);
    }

    public LLVector3 getRotatedOffset(float f, float f2) {
        float f3 = (3.1415927f * f2) / 180.0f;
        return new LLVector3((((float) Math.cos(f3)) * f) + this.x, (((float) Math.sin(f3)) * f) + this.y, this.z);
    }

    public int hashCode() {
        return Float.floatToIntBits(this.x) + Float.floatToIntBits(this.y) + Float.floatToIntBits(this.z);
    }

    public boolean isZero() {
        return this.x == 0.0f && this.y == 0.0f && this.z == 0.0f;
    }

    public float magVec() {
        return (float) Math.sqrt((this.x * this.x) + (this.y * this.y) + (this.z * this.z));
    }

    public float magVecSquared() {
        return (this.x * this.x) + (this.y * this.y) + (this.z * this.z);
    }

    public void mul(float f) {
        this.x *= f;
        this.y *= f;
        this.z *= f;
    }

    public void mul(LLQuaternion quaternion) {
        float f = (((-quaternion.x) * this.x) - (quaternion.y * this.y)) - (quaternion.z * this.z);
        float f2 = ((quaternion.w * this.x) + (quaternion.y * this.z)) - (quaternion.z * this.y);
        float f3 = ((quaternion.w * this.y) + (quaternion.z * this.x)) - (quaternion.x * this.z);
        float f4 = ((quaternion.w * this.z) + (quaternion.x * this.y)) - (quaternion.y * this.x);
        this.x = ((((-f) * quaternion.x) + (quaternion.w * f2)) - (quaternion.z * f3)) + (quaternion.y * f4);
        this.y = ((((-f) * quaternion.y) + (quaternion.w * f3)) - (quaternion.x * f4)) + (quaternion.z * f2);
        this.z = ((((-f) * quaternion.z) + (f4 * quaternion.w)) - (f2 * quaternion.y)) + (quaternion.x * f3);
    }

    public void mul(LLVector3 vector3) {
        this.x *= vector3.x;
        this.y *= vector3.y;
        this.z *= vector3.z;
    }

    public void mulWeighted(ImmutableVector immutableVector, float f) {
        this.x *= (immutableVector.x * f) + 1.0f;
        this.y *= (immutableVector.y * f) + 1.0f;
        this.z *= (immutableVector.z * f) + 1.0f;
    }

    public void mulWeighted(LLVector3 vector3, float f) {
        this.x *= (vector3.x * f) + 1.0f;
        this.y *= (vector3.y * f) + 1.0f;
        this.z *= (vector3.z * f) + 1.0f;
    }

    public float normVec() {
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
    }

    public void set(LLVector3 vector3) {
        if (vector3 != null) {
            this.x = vector3.x;
            this.y = vector3.y;
            this.z = vector3.z;
        }
    }

    public void setAdd(LLVector3 vector3, LLVector3 vector33) {
        this.x = vector3.x + vector33.x;
        this.y = vector3.y + vector33.y;
        this.z = vector3.z + vector33.z;
    }

    public void setCross(LLVector3 cross) {
        float f = (this.y * cross.z) - (cross.y * this.z);
        float f2 = (this.z * cross.x) - (cross.z * this.x);
        float f3 = (this.x * cross.y) - (cross.x * this.y);
        this.x = f;
        this.y = f2;
        this.z = f3;
    }

    public void setLerp(LLVector3 vector3, float f, LLVector3 vector33, float f2) {
        this.x = (vector3.x * f) + (vector33.x * f2);
        this.y = (vector3.y * f) + (vector33.y * f2);
        this.z = (vector3.z * f) + (vector33.z * f2);
    }

    public void setLerp(LLVector3 vector3, LLVector3 vector33, float f) {
        this.x = vector3.x + ((vector33.x - vector3.x) * f);
        this.y = vector3.y + ((vector33.y - vector3.y) * f);
        this.z = vector3.z + ((vector33.z - vector3.z) * f);
    }

    public void setMul(LLVector3 vector3, float f) {
        this.x = vector3.x * f;
        this.y = vector3.y * f;
        this.z = vector3.z * f;
    }

    public void setMul(LLVector3 vector3, LLVector3 vector33) {
        this.x = vector3.x * vector33.x;
        this.y = vector3.y * vector33.y;
        this.z = vector3.z * vector33.z;
    }

    public void setSub(LLVector3 vector3, LLVector3 vector33) {
        this.x = vector3.x - vector33.x;
        this.y = vector3.y - vector33.y;
        this.z = vector3.z - vector33.z;
    }

    public void sub(LLVector3 vector3) {
        this.x -= vector3.x;
        this.y -= vector3.y;
        this.z -= vector3.z;
    }

    public LLSDNode toLLSD() {
        return new LLSDMap(new LLSDMap.LLSDMapEntry("X", new LLSDDouble(this.x)), new LLSDMap.LLSDMapEntry("Y", new LLSDDouble(this.y)), new LLSDMap.LLSDMapEntry("Z", new LLSDDouble(this.z)));
    }

    public String toString() {
        return String.format("(%f, %f, %f)", Float.valueOf(this.x), Float.valueOf(this.y), Float.valueOf(this.z));
    }
}
