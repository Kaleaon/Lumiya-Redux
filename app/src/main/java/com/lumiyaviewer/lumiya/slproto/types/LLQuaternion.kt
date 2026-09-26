package com.lumiyaviewer.lumiya.slproto.types

import java.nio.ByteBuffer
import kotlin.math.abs
import kotlin.math.acos
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.sqrt

class LLQuaternion {

    private var matrix: FloatArray? = null
    private var inverseMatrix: FloatArray? = null
    var w: Float = 1.0f
    var x: Float = 0.0f
    var y: Float = 0.0f
    var z: Float = 0.0f

    enum class Order {
        XYZ, YZX, ZXY, XZY, YXZ, ZYX
    }

    constructor()

    constructor(x: Float, y: Float, z: Float, w: Float) {
        this.x = x
        this.y = y
        this.z = z
        this.w = w
    }

    constructor(quaternion: LLQuaternion) {
        this.x = quaternion.x
        this.y = quaternion.y
        this.z = quaternion.z
        this.w = quaternion.w
    }

    constructor(floats: FloatArray) {
        val f = floats[0] + 1.0f + floats[5] + floats[10]
        if (f > 0.5f) {
            val sqrt = (sqrt(f.toDouble()) * 2.0).toFloat()
            this.x = (floats[9] - floats[6]) / sqrt
            this.y = (floats[2] - floats[8]) / sqrt
            this.z = (floats[4] - floats[1]) / sqrt
            this.w = sqrt * 0.25f
            return
        }
        if (floats[0] > floats[5] && floats[0] > floats[10]) {
            val sqrt2 = (sqrt((((floats[0] + 1.0f) - floats[5]) - floats[10]).toDouble()) * 2.0).toFloat()
            this.x = 0.25f * sqrt2
            this.y = (floats[4] + floats[1]) / sqrt2
            this.z = (floats[2] + floats[8]) / sqrt2
            this.w = (floats[9] - floats[6]) / sqrt2
            return
        }
        if (floats[5] > floats[10]) {
            val sqrt3 = (sqrt((((floats[5] + 1.0f) - floats[0]) - floats[10]).toDouble()) * 2.0).toFloat()
            this.x = (floats[4] + floats[1]) / sqrt3
            this.y = 0.25f * sqrt3
            this.z = (floats[9] + floats[6]) / sqrt3
            this.w = (floats[2] - floats[8]) / sqrt3
            return
        }
        val sqrt4 = (sqrt((((floats[10] + 1.0f) - floats[0]) - floats[5]).toDouble()) * 2.0).toFloat()
        this.x = (floats[2] + floats[8]) / sqrt4
        this.y = (floats[9] + floats[6]) / sqrt4
        this.z = 0.25f * sqrt4
        this.w = (floats[4] - floats[1]) / sqrt4
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
        var w = this.w
        if (w > 1.0f) {
            w = 1.0f
        }
        val f2 = if (w >= -1.0f) w else -1.0f
        val sqrtVal = sqrt((1.0f - (f2 * f2)).toDouble()).toFloat()
        val f3 = if (abs(sqrtVal) < 5.0E-4f) 1.0f else 1.0f / sqrtVal
        val angleAcos = acos(f2.toDouble()).toFloat() * 2.0f
        if (angleAcos > 3.1415927f) {
            vector3.x = (-this.x) * f3
            vector3.y = (-this.y) * f3
            vector3.z = f3 * (-this.z)
            return 6.2831855f - angleAcos
        }
        vector3.x = this.x * f3
        vector3.y = this.y * f3
        vector3.z = f3 * this.z
        return angleAcos
    }

    fun getInverseMatrix(floats: FloatArray, i: Int) {
        val f = this.x * this.x
        val f2 = this.y * this.y
        val f3 = this.z * this.z
        val f4 = (-this.x) * (-this.y)
        val f5 = (-this.x) * (-this.z)
        val f6 = (-this.y) * (-this.z)
        val f7 = this.w * (-this.x)
        val f8 = this.w * (-this.y)
        val f9 = this.w * (-this.z)
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
        this.inverseMatrix?.let { return it }
        val f = this.x * this.x
        val f2 = this.y * this.y
        val f3 = this.z * this.z
        val f4 = (-this.x) * (-this.y)
        val f5 = (-this.x) * (-this.z)
        val f6 = (-this.y) * (-this.z)
        val f7 = this.w * (-this.x)
        val f8 = this.w * (-this.y)
        val f9 = this.w * (-this.z)
        val computed = floatArrayOf(
            1.0f - ((f2 + f3) * 2.0f), (f4 - f9) * 2.0f, (f5 + f8) * 2.0f, 0.0f,
            (f4 + f9) * 2.0f, 1.0f - ((f3 + f) * 2.0f), (f6 - f7) * 2.0f, 0.0f,
            (f5 - f8) * 2.0f, (f6 + f7) * 2.0f, 1.0f - ((f + f2) * 2.0f), 0.0f,
            0.0f, 0.0f, 0.0f, 1.0f
        )
        this.inverseMatrix = computed
        return computed
    }

    fun getMatrix(): FloatArray {
        this.matrix?.let { return it }
        val f = this.x * this.x
        val f2 = this.y * this.y
        val f3 = this.z * this.z
        val f4 = this.x * this.y
        val f5 = this.x * this.z
        val f6 = this.y * this.z
        val f7 = this.w * this.x
        val f8 = this.w * this.y
        val f9 = this.w * this.z
        val computed = floatArrayOf(
            1.0f - ((f2 + f3) * 2.0f), (f4 - f9) * 2.0f, (f5 + f8) * 2.0f, 0.0f,
            (f4 + f9) * 2.0f, 1.0f - ((f3 + f) * 2.0f), (f6 - f7) * 2.0f, 0.0f,
            (f5 - f8) * 2.0f, (f6 + f7) * 2.0f, 1.0f - ((f + f2) * 2.0f), 0.0f,
            0.0f, 0.0f, 0.0f, 1.0f
        )
        this.matrix = computed
        return computed
    }

    fun normalize(): Float {
        val sqrtVal = sqrt(((this.x * this.x) + (this.y * this.y) + (this.z * this.z) + (this.w * this.w)).toDouble()).toFloat()
        if (sqrtVal <= 1.0E-7f) {
            this.x = 0.0f
            this.y = 0.0f
            this.z = 0.0f
            this.w = 1.0f
        } else if (abs(1.0f - sqrtVal) > 1.0E-6f) {
            val f = 1.0f / sqrtVal
            this.x *= f
            this.y *= f
            this.z *= f
            this.w = f * this.w
        }
        this.matrix = null
        this.inverseMatrix = null
        return sqrtVal
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
        val vector3 = LLVector3(f2, f3, f4)
        vector3.normVec()
        val f5 = 0.5f * f
        val cosVal = cos(f5.toDouble()).toFloat()
        val sinVal = sin(f5.toDouble()).toFloat()
        this.x = vector3.x * sinVal
        this.y = vector3.y * sinVal
        this.z = vector3.z * sinVal
        this.w = cosVal
        normalize()
        this.matrix = null
        this.inverseMatrix = null
    }

    fun setQuat(f: Float, vector33: LLVector3) {
        val vector3 = LLVector3(vector33)
        vector3.normVec()
        val f2 = 0.5f * f
        val cosVal = cos(f2.toDouble()).toFloat()
        val sinVal = sin(f2.toDouble()).toFloat()
        this.x = vector3.x * sinVal
        this.y = vector3.y * sinVal
        this.z = vector3.z * sinVal
        this.w = cosVal
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

    override fun toString(): String {
        return String.format("(%.2f, %.2f, %.2f, %.2f)", this.x, this.y, this.z, this.w)
    }

    companion object {
        const val FP_MAG_THRESHOLD: Float = 1.0E-7f

        @JvmStatic
        fun fromEuler(f: Float, f2: Float, f3: Float): LLQuaternion {
            val cosVal = cos((f / 2.0f).toDouble())
            val sinVal = sin((f / 2.0f).toDouble())
            val cos2 = cos((f2 / 2.0f).toDouble())
            val sin2 = sin((f2 / 2.0f).toDouble())
            val cos3 = cos((f3 / 2.0f).toDouble())
            val sin3 = sin((f3 / 2.0f).toDouble())
            val d = cosVal * cos2
            val d2 = sinVal * sin2
            return LLQuaternion(
                ((sinVal * cos2 * cos3) + (cosVal * sin2 * sin3)).toFloat(),
                (((cosVal * sin2) * cos3) - ((sinVal * cos2) * sin3)).toFloat(),
                ((d * sin3) + (d2 * cos3)).toFloat(),
                ((d * cos3) - (d2 * sin3)).toFloat()
            )
        }

        @JvmStatic
        fun lerp(quaternion: LLQuaternion, quaternion2: LLQuaternion, f: Float): LLQuaternion {
            return LLQuaternion(
                quaternion.x + ((quaternion2.x - quaternion.x) * f),
                quaternion.y + ((quaternion2.y - quaternion.y) * f),
                quaternion.z + ((quaternion2.z - quaternion.z) * f),
                quaternion.w + ((quaternion2.w - quaternion.w) * f)
            )
        }

        @JvmStatic
        fun mayaQ(xRot: Float, yRot: Float, zRot: Float, order: Order): LLQuaternion {
            val degToRad = 0.017453292f
            val xQ = LLQuaternion()
            val yQ = LLQuaternion()
            val quaternion = LLQuaternion()
            xQ.setQuat(xRot * degToRad, LLVector3(1.0f, 0.0f, 0.0f))
            yQ.setQuat(yRot * degToRad, LLVector3(0.0f, 1.0f, 0.0f))
            quaternion.setQuat(zRot * degToRad, LLVector3(0.0f, 0.0f, 1.0f))
            val tmp = LLQuaternion()
            val ret = LLQuaternion()
            when (order) {
                Order.XYZ -> {
                    tmp.setMul(xQ, yQ)
                    ret.setMul(tmp, quaternion)
                }
                Order.YZX -> {
                    tmp.setMul(yQ, quaternion)
                    ret.setMul(tmp, xQ)
                }
                Order.ZXY -> {
                    tmp.setMul(quaternion, xQ)
                    ret.setMul(tmp, yQ)
                }
                Order.XZY -> {
                    tmp.setMul(xQ, quaternion)
                    ret.setMul(tmp, yQ)
                }
                Order.YXZ -> {
                    tmp.setMul(yQ, xQ)
                    ret.setMul(tmp, quaternion)
                }
                Order.ZYX -> {
                    tmp.setMul(quaternion, yQ)
                    ret.setMul(tmp, xQ)
                }
            }
            return ret
        }

        @JvmStatic
        fun parseFloatVec3(byteBuffer: ByteBuffer): LLQuaternion {
            val f = byteBuffer.getFloat()
            val f2 = byteBuffer.getFloat()
            val f3 = byteBuffer.getFloat()
            val f4 = 1.0f - (((f * f) + (f2 * f2)) + (f3 * f3))
            return LLQuaternion(f, f2, f3, if (f4 > 0.0f) sqrt(f4.toDouble()).toFloat() else 0.0f)
        }

        @JvmStatic
        fun parseU16Vec3(byteBuffer: ByteBuffer, f: Float, f2: Float): LLQuaternion {
            return LLQuaternion(
                LLTersePacking.U16_to_float(byteBuffer.getShort().toInt() and 65535, f, f2),
                LLTersePacking.U16_to_float(byteBuffer.getShort().toInt() and 65535, f, f2),
                LLTersePacking.U16_to_float(byteBuffer.getShort().toInt() and 65535, f, f2),
                LLTersePacking.U16_to_float(byteBuffer.getShort().toInt() and 65535, f, f2)
            )
        }

        @JvmStatic
        fun parseU8Vec3(byteBuffer: ByteBuffer, f: Float, f2: Float): LLQuaternion {
            return LLQuaternion(
                LLTersePacking.U8_to_float(byteBuffer.get().toInt() and 0xFF, f, f2),
                LLTersePacking.U8_to_float(byteBuffer.get().toInt() and 0xFF, f, f2),
                LLTersePacking.U8_to_float(byteBuffer.get().toInt() and 0xFF, f, f2),
                LLTersePacking.U8_to_float(byteBuffer.get().toInt() and 0xFF, f, f2)
            )
        }

        @JvmStatic
        fun shortestArc(vector35: LLVector3, vector36: LLVector3): LLQuaternion {
            val vector3 = LLVector3(vector35)
            val vector37 = LLVector3(vector36)
            val normVec = vector3.normVec()
            val normVec2 = vector37.normVec()
            if (normVec < 1.0E-7f || normVec2 < 1.0E-7f) {
                return LLQuaternion()
            }
            val cross = LLVector3.cross(vector3, vector37)
            val dot = vector3.dot(vector37)
            if (dot > 0.9999999f) {
                return LLQuaternion()
            }
            if (dot >= -0.9999999f) {
                val angleAcos = acos(dot.toDouble()).toFloat()
                val quaternion = LLQuaternion()
                quaternion.setQuat(angleAcos, cross)
                return quaternion
            }
            val vector38 = LLVector3(vector3)
            vector38.mul(vector3.x / vector3.dot(vector3))
            val vector39 = LLVector3(1.0f, 0.0f, 0.0f)
            vector39.sub(vector38)
            if (vector39.normVec() < 1.0E-7f) {
                vector39.set(0.0f, 0.0f, 1.0f)
            }
            return LLQuaternion(vector39.x, vector39.y, vector39.z, 0.0f)
        }

        @JvmStatic
        fun unpackFromVector3(vector3: LLVector3): LLQuaternion {
            val magVecSquared = 1.0f - vector3.magVecSquared()
            return LLQuaternion(vector3.x, vector3.y, vector3.z, if (magVecSquared > 0.0f) sqrt(magVecSquared.toDouble()).toFloat() else 0.0f)
        }
    }
}
