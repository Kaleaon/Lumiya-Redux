package com.lumiyaviewer.lumiya.slproto.types;

import java.nio.ByteBuffer;

public class LLQuaternion {

    public static final float FP_MAG_THRESHOLD = 1.0E-7f;
    private float[] inverseMatrix;
    private float[] matrix;
    public float w;
    public float x;
    public float y;
    public float z;

    public enum Order {
        XYZ,
        YZX,
        ZXY,
        XZY,
        YXZ,
        ZYX;

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static Order[] valuesCustom() {
            return values();
        }
    }

    public LLQuaternion() {
        this.matrix = null;
        this.inverseMatrix = null;
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
        this.w = 1.0f;
    }

    public LLQuaternion(float x, float y, float z, float w) {
        this.matrix = null;
        this.inverseMatrix = null;
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    public LLQuaternion(LLQuaternion quaternion) {
        this.matrix = null;
        this.inverseMatrix = null;
        this.x = quaternion.x;
        this.y = quaternion.y;
        this.z = quaternion.z;
        this.w = quaternion.w;
    }

    public LLQuaternion(float[] floats) {
        this.matrix = null;
        this.inverseMatrix = null;
        float f = floats[0] + 1.0f + floats[5] + floats[10];
        if (f > 0.5f) {
            float sqrt = (float) (Math.sqrt(f) * 2.0d);
            this.x = (floats[9] - floats[6]) / sqrt;
            this.y = (floats[2] - floats[8]) / sqrt;
            this.z = (floats[4] - floats[1]) / sqrt;
            this.w = sqrt * 0.25f;
            return;
        }
        if (floats[0] > floats[5] && floats[0] > floats[10]) {
            float sqrt2 = (float) (Math.sqrt(((floats[0] + 1.0f) - floats[5]) - floats[10]) * 2.0d);
            this.x = 0.25f * sqrt2;
            this.y = (floats[4] + floats[1]) / sqrt2;
            this.z = (floats[2] + floats[8]) / sqrt2;
            this.w = (floats[9] - floats[6]) / sqrt2;
            return;
        }
        if (floats[5] > floats[10]) {
            float sqrt3 = (float) (Math.sqrt(((floats[5] + 1.0f) - floats[0]) - floats[10]) * 2.0d);
            this.x = (floats[4] + floats[1]) / sqrt3;
            this.y = 0.25f * sqrt3;
            this.z = (floats[9] + floats[6]) / sqrt3;
            this.w = (floats[2] - floats[8]) / sqrt3;
            return;
        }
        float sqrt4 = (float) (Math.sqrt(((floats[10] + 1.0f) - floats[0]) - floats[5]) * 2.0d);
        this.x = (floats[2] + floats[8]) / sqrt4;
        this.y = (floats[9] + floats[6]) / sqrt4;
        this.z = 0.25f * sqrt4;
        this.w = (floats[4] - floats[1]) / sqrt4;
    }

    public static LLQuaternion fromEuler(float f, float f2, float f3) {
        double cos = Math.cos(f / 2.0f);
        double sin = Math.sin(f / 2.0f);
        double cos2 = Math.cos(f2 / 2.0f);
        double sin2 = Math.sin(f2 / 2.0f);
        double cos3 = Math.cos(f3 / 2.0f);
        double sin3 = Math.sin(f3 / 2.0f);
        double d = cos * cos2;
        double d2 = sin * sin2;
        return new LLQuaternion((float) ((sin * cos2 * cos3) + (cos * sin2 * sin3)), (float) (((cos * sin2) * cos3) - ((sin * cos2) * sin3)), (float) ((d * sin3) + (d2 * cos3)), (float) ((d * cos3) - (d2 * sin3)));
    }

    public static LLQuaternion lerp(LLQuaternion quaternion, LLQuaternion quaternion2, float f) {
        return new LLQuaternion(quaternion.x + ((quaternion2.x - quaternion.x) * f), quaternion.y + ((quaternion2.y - quaternion.y) * f), quaternion.z + ((quaternion2.z - quaternion.z) * f), quaternion.w + ((quaternion2.w - quaternion.w) * f));
    }

    public static LLQuaternion mayaQ(float xRot, float yRot, float zRot, Order order) {
        final float DEG_TO_RAD = 0.017453292f;
        LLQuaternion xQ = new LLQuaternion();
        LLQuaternion yQ = new LLQuaternion();
        LLQuaternion quaternion = new LLQuaternion();
        xQ.setQuat(xRot * DEG_TO_RAD, new LLVector3(1.0f, 0.0f, 0.0f));
        yQ.setQuat(yRot * DEG_TO_RAD, new LLVector3(0.0f, 1.0f, 0.0f));
        quaternion.setQuat(zRot * DEG_TO_RAD, new LLVector3(0.0f, 0.0f, 1.0f));
        LLQuaternion tmp = new LLQuaternion();
        LLQuaternion ret = new LLQuaternion();
        switch (order) {
            case XYZ:
                tmp.setMul(xQ, yQ);
                ret.setMul(tmp, quaternion);
                break;
            case YZX:
                tmp.setMul(yQ, quaternion);
                ret.setMul(tmp, xQ);
                break;
            case ZXY:
                tmp.setMul(quaternion, xQ);
                ret.setMul(tmp, yQ);
                break;
            case XZY:
                tmp.setMul(xQ, quaternion);
                ret.setMul(tmp, yQ);
                break;
            case YXZ:
                tmp.setMul(yQ, xQ);
                ret.setMul(tmp, quaternion);
                break;
            case ZYX:
                tmp.setMul(quaternion, yQ);
                ret.setMul(tmp, xQ);
                break;
        }
        return ret;
    }

    public static LLQuaternion parseFloatVec3(ByteBuffer byteBuffer) {
        float f = byteBuffer.getFloat();
        float f2 = byteBuffer.getFloat();
        float f3 = byteBuffer.getFloat();
        float f4 = 1.0f - (((f * f) + (f2 * f2)) + (f3 * f3));
        return new LLQuaternion(f, f2, f3, f4 > 0.0f ? (float) Math.sqrt(f4) : 0.0f);
    }

    public static LLQuaternion parseU16Vec3(ByteBuffer byteBuffer, float f, float f2) {
        return new LLQuaternion(LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2), LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2), LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2), LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2));
    }

    public static LLQuaternion parseU8Vec3(ByteBuffer byteBuffer, float f, float f2) {
        return new LLQuaternion(LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2), LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2), LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2), LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2));
    }

    public static LLQuaternion shortestArc(LLVector3 vector35, LLVector3 vector36) {
        LLVector3 vector3 = new LLVector3(vector35);
        LLVector3 vector37 = new LLVector3(vector36);
        float normVec = vector3.normVec();
        float normVec2 = vector37.normVec();
        if (normVec < 1.0E-7f || normVec2 < 1.0E-7f) {
            return new LLQuaternion();
        }
        LLVector3 cross = LLVector3.cross(vector3, vector37);
        float dot = vector3.dot(vector37);
        if (dot > 0.9999999f) {
            return new LLQuaternion();
        }
        if (dot >= -0.9999999f) {
            float acos = (float) Math.acos(dot);
            LLQuaternion quaternion = new LLQuaternion();
            quaternion.setQuat(acos, cross);
            return quaternion;
        }
        LLVector3 vector38 = new LLVector3(vector3);
        vector38.mul(vector3.x / vector3.dot(vector3));
        LLVector3 vector39 = new LLVector3(1.0f, 0.0f, 0.0f);
        vector39.sub(vector38);
        if (vector39.normVec() < 1.0E-7f) {
            vector39.set(0.0f, 0.0f, 1.0f);
        }
        return new LLQuaternion(vector39.x, vector39.y, vector39.z, 0.0f);
    }

    public static LLQuaternion unpackFromVector3(LLVector3 vector3) {
        float magVecSquared = 1.0f - vector3.magVecSquared();
        return new LLQuaternion(vector3.x, vector3.y, vector3.z, magVecSquared > 0.0f ? (float) Math.sqrt(magVecSquared) : 0.0f);
    }

    public void addMul(LLQuaternion quaternion, float f) {
        this.x += quaternion.x * f;
        this.y += quaternion.y * f;
        this.z += quaternion.z * f;
        this.w += quaternion.w * f;
    }

    public LLQuaternion conjQuat() {
        return new LLQuaternion(this.x * (-1.0f), this.y * (-1.0f), this.z * (-1.0f), this.w);
    }

    public float getAngleAxis(LLVector3 vector3) {
        float w = this.w;
        if (w > 1.0f) {
            w = 1.0f;
        }
        float f2 = w >= -1.0f ? w : -1.0f;
        float sqrt = (float) Math.sqrt(1.0f - (f2 * f2));
        float f3 = Math.abs(sqrt) < 5.0E-4f ? 1.0f : 1.0f / sqrt;
        float acos = ((float) Math.acos(f2)) * 2.0f;
        if (acos > 3.1415927f) {
            vector3.x = (-this.x) * f3;
            vector3.y = (-this.y) * f3;
            vector3.z = f3 * (-this.z);
            return 6.2831855f - acos;
        }
        vector3.x = this.x * f3;
        vector3.y = this.y * f3;
        vector3.z = f3 * this.z;
        return acos;
    }

    public void getInverseMatrix(float[] floats, int i) {
        float f = this.x * this.x;
        float f2 = this.y * this.y;
        float f3 = this.z * this.z;
        float f4 = (-this.x) * (-this.y);
        float f5 = (-this.x) * (-this.z);
        float f6 = (-this.y) * (-this.z);
        float f7 = this.w * (-this.x);
        float f8 = this.w * (-this.y);
        float f9 = this.w * (-this.z);
        floats[i + 0] = 1.0f - ((f2 + f3) * 2.0f);
        floats[i + 1] = (f4 - f9) * 2.0f;
        floats[i + 2] = (f5 + f8) * 2.0f;
        floats[i + 3] = 0.0f;
        floats[i + 4] = (f4 + f9) * 2.0f;
        floats[i + 5] = 1.0f - ((f3 + f) * 2.0f);
        floats[i + 6] = (f6 - f7) * 2.0f;
        floats[i + 7] = 0.0f;
        floats[i + 8] = (f5 - f8) * 2.0f;
        floats[i + 9] = (f6 + f7) * 2.0f;
        floats[i + 10] = 1.0f - ((f + f2) * 2.0f);
        floats[i + 11] = 0.0f;
        floats[i + 12] = 0.0f;
        floats[i + 13] = 0.0f;
        floats[i + 14] = 0.0f;
        floats[i + 15] = 1.0f;
    }

    public float[] getInverseMatrix() {
        if (this.inverseMatrix != null) {
            return this.inverseMatrix;
        }
        float f = this.x * this.x;
        float f2 = this.y * this.y;
        float f3 = this.z * this.z;
        float f4 = (-this.x) * (-this.y);
        float f5 = (-this.x) * (-this.z);
        float f6 = (-this.y) * (-this.z);
        float f7 = this.w * (-this.x);
        float f8 = this.w * (-this.y);
        float f9 = this.w * (-this.z);
        this.inverseMatrix = new float[]{1.0f - ((f2 + f3) * 2.0f), (f4 - f9) * 2.0f, (f5 + f8) * 2.0f, 0.0f, (f4 + f9) * 2.0f, 1.0f - ((f3 + f) * 2.0f), (f6 - f7) * 2.0f, 0.0f, (f5 - f8) * 2.0f, (f6 + f7) * 2.0f, 1.0f - ((f + f2) * 2.0f), 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
        return this.inverseMatrix;
    }

    public float[] getMatrix() {
        if (this.matrix != null) {
            return this.matrix;
        }
        float f = this.x * this.x;
        float f2 = this.y * this.y;
        float f3 = this.z * this.z;
        float f4 = this.x * this.y;
        float f5 = this.x * this.z;
        float f6 = this.y * this.z;
        float f7 = this.w * this.x;
        float f8 = this.w * this.y;
        float f9 = this.w * this.z;
        this.matrix = new float[]{1.0f - ((f2 + f3) * 2.0f), (f4 - f9) * 2.0f, (f5 + f8) * 2.0f, 0.0f, (f4 + f9) * 2.0f, 1.0f - ((f3 + f) * 2.0f), (f6 - f7) * 2.0f, 0.0f, (f5 - f8) * 2.0f, (f6 + f7) * 2.0f, 1.0f - ((f + f2) * 2.0f), 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
        return this.matrix;
    }

    public float normalize() {
        float sqrt = (float) Math.sqrt((this.x * this.x) + (this.y * this.y) + (this.z * this.z) + (this.w * this.w));
        if (sqrt <= 1.0E-7f) {
            this.x = 0.0f;
            this.y = 0.0f;
            this.z = 0.0f;
            this.w = 1.0f;
        } else if (Math.abs(1.0f - sqrt) > 1.0E-6f) {
            float f = 1.0f / sqrt;
            this.x *= f;
            this.y *= f;
            this.z *= f;
            this.w = f * this.w;
        }
        this.matrix = null;
        this.inverseMatrix = null;
        return sqrt;
    }

    public void set(LLQuaternion quaternion) {
        this.x = quaternion.x;
        this.y = quaternion.y;
        this.z = quaternion.z;
        this.w = quaternion.w;
        this.matrix = null;
        this.inverseMatrix = null;
    }

    public void setIdentity() {
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
        this.w = 1.0f;
    }

    public void setLerp(LLQuaternion quaternion, float f, LLQuaternion quaternion2, float f2) {
        this.x = (quaternion.x * f) + (quaternion2.x * f2);
        this.y = (quaternion.y * f) + (quaternion2.y * f2);
        this.z = (quaternion.z * f) + (quaternion2.z * f2);
        this.w = (quaternion.w * f) + (quaternion2.w * f2);
        this.matrix = null;
        this.inverseMatrix = null;
    }

    public void setMul(LLQuaternion quaternion, LLQuaternion quaternion2) {
        this.x = (((quaternion2.w * quaternion.x) + (quaternion2.x * quaternion.w)) + (quaternion2.y * quaternion.z)) - (quaternion2.z * quaternion.y);
        this.y = (((quaternion2.w * quaternion.y) + (quaternion2.y * quaternion.w)) + (quaternion2.z * quaternion.x)) - (quaternion2.x * quaternion.z);
        this.z = (((quaternion2.w * quaternion.z) + (quaternion2.z * quaternion.w)) + (quaternion2.x * quaternion.y)) - (quaternion2.y * quaternion.x);
        this.w = (((quaternion2.w * quaternion.w) - (quaternion2.x * quaternion.x)) - (quaternion2.y * quaternion.y)) - (quaternion2.z * quaternion.z);
        this.matrix = null;
        this.inverseMatrix = null;
    }

    public void setQuat(float f, float f2, float f3, float f4) {
        LLVector3 vector3 = new LLVector3(f2, f3, f4);
        vector3.normVec();
        float f5 = 0.5f * f;
        float cos = (float) Math.cos(f5);
        float sin = (float) Math.sin(f5);
        this.x = vector3.x * sin;
        this.y = vector3.y * sin;
        this.z = vector3.z * sin;
        this.w = cos;
        normalize();
        this.matrix = null;
        this.inverseMatrix = null;
    }

    public void setQuat(float f, LLVector3 vector33) {
        LLVector3 vector3 = new LLVector3(vector33);
        vector3.normVec();
        float f2 = 0.5f * f;
        float cos = (float) Math.cos(f2);
        float sin = (float) Math.sin(f2);
        this.x = vector3.x * sin;
        this.y = vector3.y * sin;
        this.z = vector3.z * sin;
        this.w = cos;
        normalize();
        this.matrix = null;
        this.inverseMatrix = null;
    }

    public void setRaw(float x, float y, float z, float w) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    public void setZero() {
        this.x = 0.0f;
        this.y = 0.0f;
        this.z = 0.0f;
        this.w = 0.0f;
    }

    public String toString() {
        return String.format("(%.2f, %.2f, %.2f, %.2f)", Float.valueOf(this.x), Float.valueOf(this.y), Float.valueOf(this.z), Float.valueOf(this.w));
    }
}
