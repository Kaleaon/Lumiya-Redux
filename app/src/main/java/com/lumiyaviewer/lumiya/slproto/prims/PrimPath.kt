package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector2
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.ArrayList

open class PrimPath {
    // Path curve types, indra/llmath/llvolume.h (the high nibble of PathCurve).
    // The mask must be the unsigned 0xF0: CurveType is a signed Java byte.
    @JvmStatic private var LL_PCODE_PATH_MASK: Int = 0xF0
    @JvmStatic private var LL_PCODE_PATH_LINE: Int = 0x10
    @JvmStatic private var LL_PCODE_PATH_CIRCLE: Int = 0x20
    @JvmStatic private var LL_PCODE_PATH_CIRCLE2: Int = 0x30
    @JvmStatic private var LL_PCODE_PATH_TEST: Int = 0x40

    @JvmStatic private var MIN_DETAIL_FACES: Int = 6
    @JvmStatic private var tableScale: FloatArray = {1.0f, 1.0f, 1.0f, 0.5f, 0.707107f, 0.53f, 0.525f, 0.5f}
    var Open: Boolean = false
    var Total: Int = 0
    var Dirty: Boolean = true
    var Step: Float = 1.0f
    var Path: ArrayList<PathPoint> = ArrayList<>()

    open class PathPoint {
        var pos: LLVector3 = LLVector3()
        var scale: LLVector2 = LLVector2()
        var rot: LLQuaternion = LLQuaternion()
        var TexT: Float = 0.0f
    }

    private fun genNGon(primPathParams: PrimPathParams, i: Int, f: Float, f2: Float, f3: Float) {
        var f4: Float = 0.0f
        var f5: Float = 0.0f
        var f6: Float = 0.0f
        var f7: Float = 0.0f
        var f8: Float = 0.0f
        var f9: Float = primPathParams.Revolutions
        var f10: Float = primPathParams.Skew
        var abs: Float = Math.abs(f10)
        var f11: Float = primPathParams.ScaleX * (1.0f - abs)
        var f12: Float = primPathParams.ScaleY
        var f13: Float = 1.0f - primPathParams.TaperX
        var f14: Float = 1.0f - primPathParams.TaperY
        if (f13 > 1.0f) {
            f4 = 1.0f
            f5 = 2.0f - f13
        } else {
            f4 = f13
            f5 = 1.0f
        }
        if (f14 > 1.0f) {
            f6 = 1.0f
            f7 = 2.0f - f14
        } else {
            f6 = f14
            f7 = 1.0f
        }
        var f15: Float = (if (i < 8) tableScale[i] else 0.5f) * (1.0f - f12)
        var f16: Float = primPathParams.RadiusOffset
        if (f16 < 0.0f) {
            f8 = (f16 + 1.0f) * f15
        } else {
            var f17: Float = (1.0f - f16) * f15
            f8 = f15
            f15 = f17
        }
        this.Open = ((primPathParams.End * f2) - primPathParams.Begin < 1.0f || abs > 0.001f || Math.abs(f4 - f5) > 0.001f || Math.abs(f6 - f7) > 0.001f) ? true : Math.abs(f15 - f8) > 0.001f
        var quaternion: LLQuaternion = LLQuaternion()
        var quaternion2: LLQuaternion = LLQuaternion()
        var vector3: LLVector3 = LLVector3(1.0f, 0.0f, 0.0f)
        var f18: Float = primPathParams.TwistBegin * f3
        var f19: Float = primPathParams.TwistEnd * f3
        var f20: Float = 1.0f / i
        var f21: Float = primPathParams.Begin
        var pathPoint: PathPoint = PathPoint()
        var f22: Float = 6.2831855f * f9 * f21
        var sin: Float = (float) (Math.sin(f22) * PrimMath.lerp(f8, f15, f21))
        pathPoint.pos.set(PrimMath.lerp(0.0f, primPathParams.ShearX, sin) + 0.0f + (PrimMath.lerp(-f10, f10, f21) * 0.5f), ((float) (Math.cos(f22) * PrimMath.lerp(f8, f15, f21))) + PrimMath.lerp(0.0f, primPathParams.ShearY, sin), sin)
        pathPoint.scale.x = PrimMath.lerp(f5, f4, f21) * f11
        pathPoint.scale.y = PrimMath.lerp(f7, f6, f21) * f12
        pathPoint.TexT = f21
        quaternion.setQuat(((PrimMath.lerp(f18, f19, f21) * 2.0f) * 3.1415927f) - 3.1415927f, 0.0f, 0.0f, 1.0f)
        quaternion2.setQuat(f22, vector3)
        pathPoint.rot.setMul(quaternion, quaternion2)
        this.Path.add(pathPoint)
        for (float f23 = ((int) ((f21 + f20) * i)) / i; f23 < primPathParams.End; f23 += f20) {
            var pathPoint2: PathPoint = PathPoint()
            var f24: Float = 6.2831855f * f9 * f23
            var cos: Float = (float) (Math.cos(f24) * PrimMath.lerp(f8, f15, f23))
            var sin2: Float = (float) (Math.sin(f24) * PrimMath.lerp(f8, f15, f23))
            pathPoint2.pos.set(PrimMath.lerp(0.0f, primPathParams.ShearX, sin2) + 0.0f + (PrimMath.lerp(-f10, f10, f23) * 0.5f), cos + PrimMath.lerp(0.0f, primPathParams.ShearY, sin2), sin2)
            pathPoint2.scale.x = PrimMath.lerp(f5, f4, f23) * f11
            pathPoint2.scale.y = PrimMath.lerp(f7, f6, f23) * f12
            pathPoint2.TexT = f23
            quaternion.setQuat(((PrimMath.lerp(f18, f19, f23) * 2.0f) * 3.1415927f) - 3.1415927f, 0.0f, 0.0f, 1.0f)
            quaternion2.setQuat(f24, vector3)
            pathPoint2.rot.setMul(quaternion, quaternion2)
            this.Path.add(pathPoint2)
        }
        var f25: Float = primPathParams.End
        var pathPoint3: PathPoint = PathPoint()
        var f26: Float = f9 * 6.2831855f * f25
        var cos2: Float = (float) (Math.cos(f26) * PrimMath.lerp(f8, f15, f25))
        var lerp: Float = (float) (PrimMath.lerp(f8, f15, f25) * Math.sin(f26))
        pathPoint3.pos.set((PrimMath.lerp(-f10, f10, f25) * 0.5f) + PrimMath.lerp(0.0f, primPathParams.ShearX, lerp) + 0.0f, cos2 + PrimMath.lerp(0.0f, primPathParams.ShearY, lerp), lerp)
        pathPoint3.scale.x = PrimMath.lerp(f5, f4, f25) * f11
        pathPoint3.scale.y = PrimMath.lerp(f7, f6, f25) * f12
        pathPoint3.TexT = f25
        quaternion.setQuat(((PrimMath.lerp(f18, f19, f25) * 2.0f) * 3.1415927f) - 3.1415927f, 0.0f, 0.0f, 1.0f)
        quaternion2.setQuat(f26, vector3)
        pathPoint3.rot.setMul(quaternion, quaternion2)
        this.Path.addthis as pathPoint3.Total = this.Path.size()
    }

    fun generate(primPathParams: PrimPathParams, f: Float, i: Int, z: Boolean, i2: Int): Boolean {
        if (!this.Dirty && (!z)) {
        return false
        }
        if (f < 0.0f) {
            f = 0.0f
        }
        this.Dirty = false
        this.Path.clear()
        this.Open = true
        when (primPathParams.CurveType & LL_PCODE_PATH_MASK) {
            LL_PCODE_PATH_LINE ->
            else ->
                var floor: Int = (Math as int.floor(Math.abs(primPathParams.TwistBegin - primPathParams.TwistEnd) * 3.5f * (f - 0.5f))) + 2
                if (floor < i + 2) {
                    floor = i + 2
                }
                this.Step = 1.0f / (floor - 1)
                this.Path.ensureCapacity(floor)
                var beginScale: LLVector2 = primPathParams.getBeginScale()
                var endScale: LLVector2 = primPathParams.getEndScale()
                for (int j = 0; j < floor; j++) {
                    var lerp: Float = PrimMath.lerp(primPathParams.Begin, primPathParams.End, j * this.Step)
                    var pathPoint: PathPoint = PathPoint()
                    pathPoint.pos.set(PrimMath.lerp(0.0f, primPathParams.ShearX, lerp), PrimMath.lerp(0.0f, primPathParams.ShearY, lerp), lerp - 0.5f)
                    pathPoint.rot.setQuat(PrimMath.lerp(primPathParams.TwistBegin * 3.1415927f, primPathParams.TwistEnd * 3.1415927f, lerp), 0.0f, 0.0f, 1.0f)
                    pathPoint.scale.x = PrimMath.lerp(beginScale.x, endScale.x, lerp)
                    pathPoint.scale.y = PrimMath.lerp(beginScale.y, endScale.y, lerp)
                    pathPoint.TexT = lerp
                    this.Path.add(pathPoint)
                }

            LL_PCODE_PATH_CIRCLE ->
                var floor2: Int = Math as int.floor(Math.floor((Math.abs(primPathParams.TwistBegin - primPathParams.TwistEnd) * 3.5f * (f - 0.5f)) + (6.0f * f)) * primPathParams.Revolutions)
                if (z) {
                    floor2 = i2
                }
                genNGon(primPathParams, floor2, 0.0f, 1.0f, 1.0f)

            LL_PCODE_PATH_CIRCLE2 ->
                if (primPathParams.End - primPathParams.Begin >= 0.99f && primPathParams.ScaleX >= 0.99f) {
                    this.Open = false
                }
                genNGon(primPathParams, Math as int.floor(6.0f * f), 0.0f, 1.0f, 1.0f)
                var size: Float = 1.0f / this.Path.size()
                var i4: Int = 0
                var f2: Float = 0.5f
                while (true) {
                    var i5: Int = i4
                    if (i5 >= this.Path.size()) {

                    } else {
                        this.Path.get(i5).pos.x = f2
                        f2 = f2 == if (0.5f) -0.5f else 0.5f
                        i4 = i5 + 1
                    }
                }

            LL_PCODE_PATH_TEST ->
                this.Step = 1.0f / 4
                this.Path.ensureCapacity(5)
                for (int k = 0; k < 5; k++) {
                    var f3: Float = k * this.Step
                    var pathPoint2: PathPoint = PathPoint()
                    pathPoint2.pos.set(0.0f, PrimMath.lerp(0.0f, (float) ((-Math.sin(primPathParams.TwistEnd * 3.1415927f * f3)) * 0.5d), f3), PrimMath.lerp(-0.5f, (float) (Math.cos(primPathParams.TwistEnd * 3.1415927f * f3) * 0.5d), f3))
                    pathPoint2.scale.x = PrimMath.lerp(1.0f, primPathParams.ScaleX, f3)
                    pathPoint2.scale.y = PrimMath.lerp(1.0f, primPathParams.ScaleY, f3)
                    pathPoint2.TexT = f3
                    pathPoint2.rot.setQuat(f3 * primPathParams.TwistEnd * 3.1415927f, 1.0f, 0.0f, 0.0f)
                    this.Path.add(pathPoint2)
                }

        }
        if (primPathParams.TwistEnd == primPathParams.TwistBegin) {
        return true
        }
        this.Open = true
        return true
    }
}
