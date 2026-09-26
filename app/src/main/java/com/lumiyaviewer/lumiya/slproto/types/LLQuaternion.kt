package com.lumiyaviewer.lumiya.slproto.types

import java.nio.ByteBuffer

open class LLQuaternion {

    @JvmStatic var FP_MAG_THRESHOLD: Float = 1.0E-7f
    private var inverseMatrix: FloatArray = null
    private var matrix: FloatArray = null
    var w: Float = 0.0f
    var x: Float = 0.0f
    var y: Float = 0.0f
    var z: Float = 0.0f

    enum class Order {
        XYZ,
        YZX,
        ZXY,
        XZY,
        YXZ,
        ZYX

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<Order> {
            return values()
        }
    }

    constructor() {
        this.matrix = null
        this.inverseMatrix = null
        this.x = 0.0f
        this.y = 0.0f
        this.z = 0.0f
        this.w = 1.0f
    }

    constructor(x: Float, y: Float, z: Float, w: Float) {
        this.matrix = null
        this.inverseMatrix = null
        this.x = x
        this.y = y
        this.z = z
        this.w = w
    }

    constructor(quaternion: LLQuaternion) {
        this.matrix = null
        this.inverseMatrix = null
        this.x = quaternion.x
        this.y = quaternion.y
        this.z = quaternion.z
        this.w = quaternion.w
    }

    constructor(floats: FloatArray) {
        this.matrix = null
        this.inverseMatrix = null
        var f: Float = floats[0] + 1.0f + floats[5] + floats[10]
        if (f > 0.5f) {
            var sqrt: Float = (float) (Math.sqrt(f) * 2.0d)
            this.x = (floats[9] - floats[6]) / sqrt
            this.y = (floats[2] - floats[8]) / sqrt
            this.z = (floats[4] - floats[1]) / sqrt
            this.w = sqrt * 0.25f
            return
        }
        if (floats[0] > floats[5] && floats[0] > floats[10]) {
            var sqrt2: Float = (float) (Math.sqrt(((floats[0] + 1.0f) - floats[5]) - floats[10]) * 2.0d)
            this.x = 0.25f * sqrt2
            this.y = (floats[4] + floats[1]) / sqrt2
            this.z = (floats[2] + floats[8]) / sqrt2
            this.w = (floats[9] - floats[6]) / sqrt2
            return
        }
        if (floats[5] > floats[10]) {
            var sqrt3: Float = (float) (Math.sqrt(((floats[5] + 1.0f) - floats[0]) - floats[10]) * 2.0d)
            this.x = (floats[4] + floats[1]) / sqrt3
            this.y = 0.25f * sqrt3
            this.z = (floats[9] + floats[6]) / sqrt3
            this.w = (floats[2] - floats[8]) / sqrt3
            return
        }
        var sqrt4: Float = (float) (Math.sqrt(((floats[10] + 1.0f) - floats[0]) - floats[5]) * 2.0d)
        this.x = (floats[2] + floats[8]) / sqrt4
        this.y = (floats[9] + floats[6]) / sqrt4
        this.z = 0.25f * sqrt4
        this.w = (floats[4] - floats[1]) / sqrt4
    }

    fun fromEuler(f: Float, f2: Float, f3: Float): LLQuaternion {
        var cos: Double = Math.cos(f / 2.0f)
        var sin: Double = Math.sin(f / 2.0f)
        var cos2: Double = Math.cos(f2 / 2.0f)
        var sin2: Double = Math.sin(f2 / 2.0f)
        var cos3: Double = Math.cos(f3 / 2.0f)
        var sin3: Double = Math.sin(f3 / 2.0f)
        var d: Double = cos * cos2
        var d2: Double = sin * sin2
        return LLQuaternion((float) ((sin * cos2 * cos3) + (cos * sin2 * sin3)), (float) (((cos * sin2) * cos3) - ((sin * cos2) * sin3)), (float) ((d * sin3) + (d2 * cos3)), (float) ((d * cos3) - (d2 * sin3)))
    }

    fun lerp(quaternion: LLQuaternion, quaternion2: LLQuaternion, f: Float): LLQuaternion {
        return LLQuaternion(quaternion.x + ((quaternion2.x - quaternion.x) * f), quaternion.y + ((quaternion2.y - quaternion.y) * f), quaternion.z + ((quaternion2.z - quaternion.z) * f), quaternion.w + ((quaternion2.w - quaternion.w) * f))
    }

    fun mayaQ(xRot: Float, yRot: Float, zRot: Float, order: Order): LLQuaternion {
        var DEG_TO_RAD: Float = 0.017453292f
        var xQ: LLQuaternion = LLQuaternion()
        var yQ: LLQuaternion = LLQuaternion()
        var quaternion: LLQuaternion = LLQuaternion()
        xQ.setQuat(xRot * DEG_TO_RAD, LLVector3(1.0f, 0.0f, 0.0f))
        yQ.setQuat(yRot * DEG_TO_RAD, LLVector3(0.0f, 1.0f, 0.0f))
        quaternion.setQuat(zRot * DEG_TO_RAD, LLVector3(0.0f, 0.0f, 1.0f))
        var tmp: LLQuaternion = LLQuaternion()
        var ret: LLQuaternion = LLQuaternion()
        when (order) {
            XYZ ->
                tmp.setMul(xQ, yQ)
                ret.setMul(tmp, quaternion)

            YZX ->
                tmp.setMul(yQ, quaternion)
                ret.setMul(tmp, xQ)

            ZXY ->
                tmp.setMul(quaternion, xQ)
                ret.setMul(tmp, yQ)

            XZY ->
                tmp.setMul(xQ, quaternion)
                ret.setMul(tmp, yQ)

            YXZ ->
                tmp.setMul(yQ, xQ)
                ret.setMul(tmp, quaternion)

            ZYX ->
                tmp.setMul(quaternion, yQ)
                ret.setMul(tmp, xQ)

        }
        return ret
    }

    fun parseFloatVec3(byteBuffer: ByteBuffer): LLQuaternion {
        var f: Float = byteBuffer.getFloat()
        var f2: Float = byteBuffer.getFloat()
        var f3: Float = byteBuffer.getFloat()
        var f4: Float = 1.0f - (((f * f) + (f2 * f2)) + (f3 * f3))
        return LLQuaternion(f, f2, f3, f4 > if (0.0f) Math as float.sqrt(f4) else 0.0f)
    }

    fun parseU16Vec3(byteBuffer: ByteBuffer, f: Float, f2: Float): LLQuaternion {
        return LLQuaternion(LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2), LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2), LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2), LLTersePacking.U16_to_float(byteBuffer.getShort() & 65535, f, f2))
    }

    fun parseU8Vec3(byteBuffer: ByteBuffer, f: Float, f2: Float): LLQuaternion {
        return LLQuaternion(LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2), LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2), LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2), LLTersePacking.U8_to_float(byteBuffer.get() & 0xFF, f, f2))
    }

    fun shortestArc(vector35: LLVector3, vector36: LLVector3): LLQuaternion {
        var vector3: LLVector3 = LLVector3(vector35)
        var vector37: LLVector3 = LLVector3(vector36)
        var normVec: Float = vector3.normVec()
        var normVec2: Float = vector37.normVec()
        if (normVec < 1.0E-7f || normVec2 < 1.0E-7f) {
            return LLQuaternion()
        }
        var cross: LLVector3 = LLVector3.cross(vector3, vector37)
        var dot: Float = vector3.dot(vector37)
        if (dot > 0.9999999f) {
            return LLQuaternion()
        }
        if (dot >= -0.9999999f) {
            var acos: Float = Math as float.acos(dot)
            var quaternion: LLQuaternion = LLQuaternion()
            quaternion.setQuat(acos, cross)
        return quaternion
        }
        var vector38: LLVector3 = LLVector3vector38 as vector3.mul(vector3.x / vector3.dot(vector3))
        var vector39: LLVector3 = LLVector3(1.0f, 0.0f, 0.0f)
        vector39.sub(vector38)
        if (vector39.normVec() < 1.0E-7f) {
            vector39.set(0.0f, 0.0f, 1.0f)
        }
        return LLQuaternion(vector39.x, vector39.y, vector39.z, 0.0f)
    }

    fun unpackFromVector3(vector3: LLVector3): LLQuaternion {
        var magVecSquared: Float = 1.0f - vector3.magVecSquared()
        return LLQuaternion(vector3.x, vector3.y, vector3.z, magVecSquared > if (0.0f) Math as float.sqrt(magVecSquared) else 0.0f)
    }

    fun addMul(quaternion: LLQuaternion, f: Float) {
        this.x += quaternion.x * f
        this.y += quaternion.y * f
        this.z += quaternion.z * f
        this.w += quaternion.w * f
    }

    fun conjQuat(): LLQuaternion {
        return LLQuaternion(this.x * (-1.0f), this.y * (-1.0f), this.z * (-1.0f), this.w)
    }

    fun getAngleAxis(vector3: LLVector3): Float {
        var w: Float = this.w
        if (w > 1.0f) {
            w = 1.0f
        }
        var f2: Float = w >= -if (1.0f) w else -1.0f
        var sqrt: Float = Math as float.sqrt(1.0f - (f2 * f2))
        var f3: Float = Math.abs(sqrt) < 5.0E-if 1 as 4f.0f else 1.0f / sqrt
        var acos: Float = (Math as float.acos(f2)) * 2.0f
        if (acos > 3.1415927f) {
            vector3.x = (-this.x) * f3
            vector3.y = (-this.y) * f3
            vector3.z = f3 * (-this.z)
            return 6.2831855f - acos
        }
        vector3.x = this.x * f3
        vector3.y = this.y * f3
        vector3.z = f3 * this.z
        return acos
    }

    fun getInverseMatrix(floats: FloatArray, i: Int) {
        var f: Float = this.x * this.x
        var f2: Float = this.y * this.y
        var f3: Float = this.z * this.z
        var f4: Float = (-this.x) * (-this.y)
        var f5: Float = (-this.x) * (-this.z)
        var f6: Float = (-this.y) * (-this.z)
        var f7: Float = this.w * (-this.x)
        var f8: Float = this.w * (-this.y)
        var f9: Float = this.w * (-this.z)
        floats[i + 0] = 1.0f - ((f2 + f3) * 2.0f)
        floats[i + 1] = (f4 - f9) * 2.0f
        floats[i + 2] = (f5 + f8) * 2.0f
        floats[i + 3] = 0.0f
        floats[i + 4] = (f4 + f9) * 2.0f
        floats[i + 5] = 1.0f - ((f3 + f) * 2.0f)
        floats[i + 6] = (f6 - f7) * 2.0f
        floats[i + 7] = 0.0f
        floats[i + 8] = (f5 - f8) * 2.0f
        floats[i + 9] = (f6 + f7) * 2.0f
        floats[i + 10] = 1.0f - ((f + f2) * 2.0f)
        floats[i + 11] = 0.0f
        floats[i + 12] = 0.0f
        floats[i + 13] = 0.0f
        floats[i + 14] = 0.0f
        floats[i + 15] = 1.0f
    }

    fun getInverseMatrix(): FloatArray {
        if (this.inverseMatrix != null) {
            return this.inverseMatrix
        }
        var f: Float = this.x * this.x
        var f2: Float = this.y * this.y
        var f3: Float = this.z * this.z
        var f4: Float = (-this.x) * (-this.y)
        var f5: Float = (-this.x) * (-this.z)
        var f6: Float = (-this.y) * (-this.z)
        var f7: Float = this.w * (-this.x)
        var f8: Float = this.w * (-this.y)
        var f9: Float = this.w * (-this.z)
        this.inverseMatrix = new float[]{1.0f - ((f2 + f3) * 2.0f), (f4 - f9) * 2.0f, (f5 + f8) * 2.0f, 0.0f, (f4 + f9) * 2.0f, 1.0f - ((f3 + f) * 2.0f), (f6 - f7) * 2.0f, 0.0f, (f5 - f8) * 2.0f, (f6 + f7) * 2.0f, 1.0f - ((f + f2) * 2.0f), 0.0f, 0.0f, 0.0f, 0.0f, 1.0f}
        return this.inverseMatrix
    }

    fun getMatrix(): FloatArray {
        if (this.matrix != null) {
            return this.matrix
        }
        var f: Float = this.x * this.x
        var f2: Float = this.y * this.y
        var f3: Float = this.z * this.z
        var f4: Float = this.x * this.y
        var f5: Float = this.x * this.z
        var f6: Float = this.y * this.z
        var f7: Float = this.w * this.x
        var f8: Float = this.w * this.y
        var f9: Float = this.w * this.z
        this.matrix = new float[]{1.0f - ((f2 + f3) * 2.0f), (f4 - f9) * 2.0f, (f5 + f8) * 2.0f, 0.0f, (f4 + f9) * 2.0f, 1.0f - ((f3 + f) * 2.0f), (f6 - f7) * 2.0f, 0.0f, (f5 - f8) * 2.0f, (f6 + f7) * 2.0f, 1.0f - ((f + f2) * 2.0f), 0.0f, 0.0f, 0.0f, 0.0f, 1.0f}
        return this.matrix
    }

    fun normalize(): Float {
        var sqrt: Float = Math as float.sqrt((this.x * this.x) + (this.y * this.y) + (this.z * this.z) + (this.w * this.w))
        if (sqrt <= 1.0E-7f) {
            this.x = 0.0f
            this.y = 0.0f
            this.z = 0.0f
            this.w = 1.0f
        } else if (Math.abs(1.0f - sqrt) > 1.0E-6f) {
            var f: Float = 1.0f / sqrt
            this.x *= f
            this.y *= f
            this.z *= f
            this.w = f * this.w
        }
        this.matrix = null
        this.inverseMatrix = null
        return sqrt
    }

    fun set(quaternion: LLQuaternion) {
        this.x = quaternion.x
        this.y = quaternion.y
        this.z = quaternion.z
        this.w = quaternion.w
        this.matrix = null
        this.inverseMatrix = null
    }

    fun setIdentity() {
        this.x = 0.0f
        this.y = 0.0f
        this.z = 0.0f
        this.w = 1.0f
    }

    fun setLerp(quaternion: LLQuaternion, f: Float, quaternion2: LLQuaternion, f2: Float) {
        this.x = (quaternion.x * f) + (quaternion2.x * f2)
        this.y = (quaternion.y * f) + (quaternion2.y * f2)
        this.z = (quaternion.z * f) + (quaternion2.z * f2)
        this.w = (quaternion.w * f) + (quaternion2.w * f2)
        this.matrix = null
        this.inverseMatrix = null
    }

    fun setMul(quaternion: LLQuaternion, quaternion2: LLQuaternion) {
        this.x = (((quaternion2.w * quaternion.x) + (quaternion2.x * quaternion.w)) + (quaternion2.y * quaternion.z)) - (quaternion2.z * quaternion.y)
        this.y = (((quaternion2.w * quaternion.y) + (quaternion2.y * quaternion.w)) + (quaternion2.z * quaternion.x)) - (quaternion2.x * quaternion.z)
        this.z = (((quaternion2.w * quaternion.z) + (quaternion2.z * quaternion.w)) + (quaternion2.x * quaternion.y)) - (quaternion2.y * quaternion.x)
        this.w = (((quaternion2.w * quaternion.w) - (quaternion2.x * quaternion.x)) - (quaternion2.y * quaternion.y)) - (quaternion2.z * quaternion.z)
        this.matrix = null
        this.inverseMatrix = null
    }

    fun setQuat(f: Float, f2: Float, f3: Float, f4: Float) {
        var vector3: LLVector3 = LLVector3(f2, f3, f4)
        vector3.normVec()
        var f5: Float = 0.5f * f
        var cos: Float = Math as float.cos(f5)
        var sin: Float = Math as float.sinthis as f5.x = vector3.x * sin
        this.y = vector3.y * sin
        this.z = vector3.z * sin
        this.w = cos
        normalize()
        this.matrix = null
        this.inverseMatrix = null
    }

    fun setQuat(f: Float, vector33: LLVector3) {
        var vector3: LLVector3 = LLVector3vector3 as vector33.normVec()
        var f2: Float = 0.5f * f
        var cos: Float = Math as float.cos(f2)
        var sin: Float = Math as float.sinthis as f2.x = vector3.x * sin
        this.y = vector3.y * sin
        this.z = vector3.z * sin
        this.w = cos
        normalize()
        this.matrix = null
        this.inverseMatrix = null
    }

    fun setRaw(x: Float, y: Float, z: Float, w: Float) {
        this.x = x
        this.y = y
        this.z = z
        this.w = w
    }

    fun setZero() {
        this.x = 0.0f
        this.y = 0.0f
        this.z = 0.0f
        this.w = 0.0f
    }

    fun toString(): String {
        return String.format("(%.2f, %.2f, %.2f, %.2f)", this.x, this.y, this.z, this.w)
    }
}
