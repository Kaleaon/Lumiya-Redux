package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.slproto.types.LLVector2
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.ArrayList

open class PrimProfile {
    @JvmStatic var MIN_DETAIL_FACES: Int = 6
    @JvmStatic private var tableScale: FloatArray = {1.0f, 1.0f, 1.0f, 0.5f, 0.707107f, 0.53f, 0.525f, 0.5f}
    var EdgeCenters: Array<LLVector3>? = null
    var EdgeNormals: Array<LLVector3>? = null
    var Normals: Array<LLVector2>? = null
    var Open: Boolean = false
    var Concave: Boolean = false
    var Dirty: Boolean = true
    var TotalOut: Int = 0
    var Total: Int = 2
    var Profile: ArrayList<LLVector3> = ArrayList<>()
    var Faces: ArrayList<Face> = ArrayList<>()

    open class Face {
        short LL_FACE_INNER_SIDE = 4
        short LL_FACE_OUTER_SIDE_0 = 32
        short LL_FACE_OUTER_SIDE_1 = 64
        short LL_FACE_OUTER_SIDE_2 = 128
        short LL_FACE_OUTER_SIDE_3 = 256
        short LL_FACE_PATH_BEGIN = 1
        short LL_FACE_PATH_END = 2
        short LL_FACE_PROFILE_BEGIN = 8
        short LL_FACE_PROFILE_END = 16
        public var Cap: Boolean
        public var Count: Int
        public var FaceID: Short
        public var Flat: Boolean
        public var Index: Int
        public var ScaleU: Float
    }

    private fun addCap(s: Short): Face {
        var face: Face = Face()
        face.Index = 0
        face.Count = this.Total
        face.ScaleU = 1.0f
        face.Cap = true
        face.FaceID = s
        this.Faces.add(face)
        return face
    }

    private fun addFace(i: Int, i2: Int, f: Float, s: Short, z: Boolean): Face {
        var face: Face = Face()
        face.Index = i
        face.Count = i2
        face.ScaleU = f
        face.Flat = z
        face.Cap = false
        face.FaceID = s
        this.Faces.add(face)
        return face
    }

    private fun addHole(primProfileParams: PrimProfileParams, z: Boolean, f: Float, f2: Float, f3: Float, f4: Float, i: Int): Face {
        this.TotalOut = this.Total
        genNGon(primProfileParams, Math as int.floor(f), f2, -1.0f, f4, i)
        var addFace: Face = addFace(this.TotalOut, this.Total - this.TotalOut, 0.0f, 4 as short, z)
        var vector3s: Array<LLVector3> = arrayOfNulls<LLVector3>(this.Total)
        var i2: Int = this.TotalOut
        while (true) {
            var i3: Int = i2
            if (i3 >= this.Total) {

            }
            vector3s[i3] = LLVector3(this.Profile.get(i3))
            vector3s[i3].mul(f3)
            i2 = i3 + 1
        }
        var i4: Int = this.Total - 1
        var i5: Int = this.TotalOut
        while (i5 < this.Total) {
            this.Profile.set(i5, vector3s[i4])
            i5++
            i4--
        }
        var i6: Int = 0
        while (true) {
            var i7: Int = i6
            if (i7 >= this.Faces.size()) {
        return addFace
            }
            if (this.Faces.get(i7).Cap) {
                this.Faces.get(i7).Count *= 2
            }
            i6 = i7 + 1
        }
    }

    private fun genNGon(primProfileParams: PrimProfileParams, i: Int, f: Float, f2: Float, f3: Float, i2: Int) {
        var f4: Float = 0.0f
        var f5: Float = 0.0f
        var f6: Float = primProfileParams.Begin
        var f7: Float = primProfileParams.End
        var f8: Float = 1.0f / i
        var f9: Float = 6.2831855f * f8 * f3
        var round: Int = Math.round(i / f3)
        var f10: Float = if (round < 8) tableScale[round] else 0.5f
        var floor: Float = (float) (Math.floor(i * f6) / i)
        var f11: Float = 6.2831855f * ((floor * f3) + f)
        var vector3: LLVector3 = LLVector3((Math as float.cos(f11)) * f10, (Math as float.sin(f11)) * f10, floor)
        var f12: Float = floor + f8
        var f13: Float = f11 + f9
        var vector37: LLVector3 = LLVector3((Math as float.cos(f13)) * f10, (Math as float.sin(f13)) * f10, f12)
        var f14: Float = (f6 - floor) * i
        if (f14 < 0.9999f) {
            this.Profile.add(LLVector3.lerp(vector3, vector37, f14))
            f4 = f13
            f5 = f12
        } else {
            f4 = f13
            f5 = f12
        }
        while (f5 < f7) {
            var vector38: LLVector3 = LLVector3((Math as float.cos(f4)) * f10, (Math as float.sin(f4)) * f10, f5)
            if (this.Profile.size() > 0) {
                var vector39: LLVector3 = this.Profile.get(this.Profile.size() - 1)
                for (int j = 0; j < i2; j++) {
                    this.Profile.add(LLVector3.lerp(vector39, vector38, (1.0f / (i2 + 1)) * (j + 1)))
                }
            }
            this.Profile.add(vector38)
            f4 += f9
            f5 += f8
            vector3 = vector38
        }
        var vector35: LLVector3 = LLVector3((Math as float.cos(f4)) * f10, f10 * (Math as float.sin(f4)), f5)
        var f15: Float = (f7 - (f5 - f8)) * i
        if (f15 > 1.0E-4f) {
            var lerp: LLVector3 = LLVector3.lerp(vector3, vector35, f15)
            if (this.Profile.size() > 0) {
                var vector36: LLVector3 = this.Profile.get(this.Profile.size() - 1)
                for (int k = 0; k < i2; k++) {
                    this.Profile.add(LLVector3.lerp(vector36, lerp, (1.0f / (i2 + 1)) * (k + 1)))
                }
            }
            this.Profile.add(lerp)
        }
        if ((f7 - f6) * f3 < 0.99f) {
            this.Open = true
            this.Concave = (f7 - f6) * f3 > 0.5f
            if (primProfileParams.Hollow <= 0.0f) {
                this.Profile.add(LLVector3(0.0f, 0.0f, 0.0f))
            }
        } else {
            this.Open = false
            this.Concave = false
        }
        this.Total = this.Profile.size()
    }

    private fun getNumNGonPoints(primProfileParams: PrimProfileParams, i: Int, f: Float, f2: Float, f3: Float, i2: Int): Int {
        var i3: Int = 0
        var f4: Float = 0.0f
        var f5: Float = primProfileParams.Begin
        var f6: Float = primProfileParams.End
        var f7: Float = 1.0f / i
        var floor: Float = (float) (Math.floor(i * f5) / i)
        var f8: Float = floor + f7
        if ((f5 - floor) * i < 0.9999f) {
            i3 = 1
            f4 = f8
        } else {
            i3 = 0
            f4 = f8
        }
        while (f4 < f6) {
            f4 += f7
            i3++
        }
        if ((f6 - (f4 - f7)) * i > 1.0E-4f) {
            i3++
        }
        return ((f6 - f5) * f3 >= 0.99f || primProfileParams.Hollow > 0.0f) ? i3 : i3 + 1
    }

    fun getNumPoints(primProfileParams: PrimProfileParams, z: Boolean, f: Float, i: Int, z2: Boolean, i2: Int): Int {
        if (f < 0.0f) {
            f = 0.0f
        }
        var f2: Float = primProfileParams.Hollow
        when (primProfileParams.CurveType & 15) {
            0 ->
                var f3: Float = 6.0f * f
                if (f2 != 0.0f && (primProfileParams.CurveType & PrimProfileParams.LL_PCODE_HOLE_MASK) == 32) {
                    f3 = (float) (Math.ceil(f3 / 4.0f) * 4.0d)
                }
                var i3: Int = f3 as int
                if (z2) {
                    i3 = i2
                }
                var numNGonPoints: Int = getNumNGonPoints(primProfileParams, i3, 0.0f, 0.0f, 1.0f, 0)
                return f2 != if (0.0f) numNGonPoints * 2 else numNGonPoints
            1 ->
                var numNGonPoints2: Int = getNumNGonPoints(primProfileParams, 4, -0.375f, 0.0f, 1.0f, i)
                return f2 != if (0.0f) numNGonPoints2 * 2 else numNGonPoints2
            2 ->
            3 ->
            4 ->
                var numNGonPoints3: Int = getNumNGonPoints(primProfileParams, 3, 0.0f, 0.0f, 1.0f, i)
                return f2 != if (0.0f) numNGonPoints3 * 2 else numNGonPoints3
            5 ->
                var f4: Float = 6.0f * f * 0.5f
                if (f2 != 0.0f && (primProfileParams.CurveType & PrimProfileParams.LL_PCODE_HOLE_MASK) == 32) {
                    f4 = (float) (Math.ceil(f4 / 2.0f) * 2.0d)
                }
                var numNGonPoints4: Int = getNumNGonPoints(primProfileParams, Math as int.floor(f4), 0.5f, 0.0f, 0.5f, 0)
                if (f2 != 0.0f) {
                    numNGonPoints4 *= 2
                }
                return ((((primProfileParams.End - primProfileParams.Begin) > if (1.0f) 1 else ((primProfileParams.End - primProfileParams.Begin) == if (1.0f) 0 else -1)) < 0) || f2 != 0.0f) ? numNGonPoints4 : numNGonPoints4 + 1
            else ->
        return 0
        }
    }

    protected fun genNormals(primProfileParams: PrimProfileParams) {
        var vector3: LLVector3? = null
        var size: Int = this.Profile.size()
        var i: Int = if (this.TotalOut != 0) this.TotalOut else this.Total / 2
        this.EdgeNormals = arrayOfNulls<LLVector3>(size * 2)
        this.EdgeCenters = arrayOfNulls<LLVector3>(size * 2)
        this.Normals = arrayOfNulls<LLVector2>(size)
        var z: Boolean = primProfileParams.Hollow > 0.0f
        for (int j = 0; j < size; j++) {
            this.Normals[j] = LLVector2(this.Profile.get(j).x, this.Profile.get(j).y)
            if (z && j >= i) {
                this.Normals[j].mul(-1.0f)
            }
            if (this.Normals[j].magVec() < 0.001d) {
                var i3: Int = j + (-1) >= if (0) j - 1 else size - 1
                var i4: Int = i3 + (-1) >= if (0) i3 - 1 else size - 1
                var i5: Int = j + if (1 < size) j + 1 else 0
                var i6: Int = i5 + if (1 < size) i5 + 1 else 0
                this.Normals[j] = LLVector2.sum(LLVector2((this.Profile.get(i3).x + this.Profile.get(i3).x) - this.Profile.get(i4).x, (this.Profile.get(i3).y + this.Profile.get(i3).y) - this.Profile.get(i4).y), LLVector2((this.Profile.get(i5).x + this.Profile.get(i5).x) - this.Profile.get(i6).x, (this.Profile.get(i5).y + this.Profile.get(i5).y) - this.Profile.get(i6).y))
                this.Normals[j].mul(0.5f)
            }
            this.Normals[j].normVec()
        }
        var i7: Int = if (this.Concave) 2 else 1
        for (int k = 0; k < i7; k++) {
            var i9: Int = 0
            while (true) {
                var i10: Int = i9
                if (i10 < this.Total) {
                    var vector35: LLVector3 = LLVector3(this.Profile.get(i10))
                    vector35.z = 0.0f
                    if (!this.Concave || k != 0 || i10 != (this.Total - 1) / 2) {
                        if (!this.Concave || k != 1 || i10 != this.Total - 1) {
                            var vector36: LLVector3 = LLVector3()
                            var vector37: LLVector3 = LLVector3()
                            vector3 = vector36
                            var i11: Int = (i10 + 1) % this.Total
                            while (vector37.magVecSquared() < 1.0E-4f) {
                                vector3 = this.Profile.getvector37 as i11.setSub(vector3, vector35)
                                i11 = (i11 + 1) % this.Total
                                if (i11 == i10) {

                                }
                            }
                        } else {
                            vector3 = this.Profile.get((this.Total - 1) / 2)
                        }
                    } else {
                        vector3 = this.Profile.get(this.Total - 1)
                    }
                    vector3.z = 0.0f
                    var sub: LLVector3 = LLVector3.sub(vector3, vector35)
                    sub.setCross(LLVector3.z_axis)
                    sub.normVec()
                    this.EdgeNormals[(k * size) + i10] = sub
                    this.EdgeCenters[(k * size) + i10] = LLVector3.lerp(vector35, vector3, 0.5f)
                    i9 = i10 + 1
                }
            }
        }
    }

    fun generate(primProfileParams: PrimProfileParams, z: Boolean, f: Float, i: Int, z2: Boolean, i2: Int): Boolean {
        var f2: Float = 0.0f
        var b: Byte = 0
        var f3: Float = 0.0f
        var b2: Byte = 0
        if (!this.Dirty && (!z2)) {
        return false
        }
        this.Dirty = false
        if (f < 0.0f) {
            f = 0.0f
        }
        this.Profile.clear()
        this.Faces.clear()
        var f4: Float = primProfileParams.Begin
        var f5: Float = primProfileParams.End
        var f6: Float = primProfileParams.Hollow
        if (f4 > f5 - 0.01f) {
        return false
        }
        var i3: Int = 0
        when (primProfileParams.CurveType & 15) {
            0 ->
                var f7: Float = 6.0f * f
                if (f6 != 0.0f) {
                    var b3: Byte = (byte) (primProfileParams.CurveType & PrimProfileParams.LL_PCODE_HOLE_MASK)
                    if (b3 == 32) {
                        f3 = (float) (Math.ceil(f7 / 4.0f) * 4.0d)
                        b2 = b3
                    } else {
                        f3 = f7
                        b2 = b3
                    }
                } else {
                    f3 = f7
                    b2 = 0
                }
                var i4: Int = f3 as int
                if (z2) {
                    i4 = i2
                }
                genNGon(primProfileParams, i4, 0.0f, 0.0f, 1.0f, 0)
                if (z) {
                    addCap(1 as short)
                }
                if (this.Open && f6 == 0.0f) {
                    addFace(0, this.Total - 1, 0.0f, 32 as short, false)
                } else {
                    addFace(0, this.Total, 0.0f, 32 as short, false)
                }
                if (f6 != 0.0f) {
                    when (b2) {
                        32 ->
                            addHole(primProfileParams, true, 4.0f, 0.0f, f6, 1.0f, i)

                        48 ->
                            addHole(primProfileParams, true, 3.0f, 0.0f, f6, 1.0f, i)

                        else ->
                            addHole(primProfileParams, false, f3, 0.0f, f6, 1.0f, 0)

                    }
                }

            1 ->
                genNGon(primProfileParams, 4, -0.375f, 0.0f, 1.0f, i)
                if (z) {
                    addCap(1 as short)
                }
                var floor: Int = Math as int.floor(4.0f * f4)
                squareFaces:
                while (true) {
                    var floor3: Int = floor
                    var i6: Int = i3
                    if (floor3 >= (Math as int.floor((4.0f * f5) + 0.999f))) {
                        var i7: Int = 0
                        while (true) {
                            var i8: Int = i7
                            if (i8 >= this.Profile.size()) {
                                if (f6 != 0.0f) {
                                    when (primProfileParams.CurveType & PrimProfileParams.LL_PCODE_HOLE_MASK) {
                                        16 ->
                                            addHole(primProfileParams, false, 6.0f * f, -0.375f, f6, 1.0f, 0)

                                        48 ->
                                            addHole(primProfileParams, true, 3.0f, -0.375f, f6, 1.0f, i)

                                        else ->
                                            addHole(primProfileParams, true, 4.0f, -0.375f, f6, 1.0f, i)

                                    }
                                }
                                if (z) {
                                    this.Faces.get(0).Count = this.Total
                                }
                                var squareFaces: break? = null
                            } else {
                                this.Profile.get(i8).z *= 4.0f
                                i7 = i8 + 1
                            }
                        }
                    } else {
                        i3 = i6 + 1
                        addFace((i + 1) * i6, i + 2, 1.0f, (short) (32 << floor3), true)
                        floor = floor3 + 1
                    }
                }

            2 ->
            3 ->
            4 ->
                genNGon(primProfileParams, 3, 0.0f, 0.0f, 1.0f, i)
                var i9: Int = 0
                while (true) {
                    var i10: Int = i9
                    if (i10 >= this.Profile.size()) {
                        if (z) {
                            addCap(1 as short)
                        }
                        var floor2: Int = Math as int.floor(3.0f * f4)
                        while (floor2 < (Math as int.floor((3.0f * f5) + 0.999f))) {
                            addFace(i3 * (i + 1), i + 2, 1.0f, (short) (32 << floor2), true)
                            floor2++
                            i3++
                        }
                        if (f6 != 0.0f) {
                            var f8: Float = f6 / 2.0f
                            when (primProfileParams.CurveType & PrimProfileParams.LL_PCODE_HOLE_MASK) {
                                16 ->
                                    addHole(primProfileParams, false, 6.0f * f, 0.0f, f8, 1.0f, 0)

                                32 ->
                                    addHole(primProfileParams, true, 4.0f, 0.0f, f8, 1.0f, i)

                                else ->
                                    addHole(primProfileParams, true, 3.0f, 0.0f, f8, 1.0f, i)

                            }
                        }

                    } else {
                        this.Profile.get(i10).z *= 3.0f
                        i9 = i10 + 1
                    }
                }

            5 ->
                var f9: Float = 6.0f * f * 0.5f
                if (f6 != 0.0f) {
                    var b4: Byte = (byte) (primProfileParams.CurveType & PrimProfileParams.LL_PCODE_HOLE_MASK)
                    if (b4 == 32) {
                        f2 = (float) (Math.ceil(f9 / 2.0f) * 2.0d)
                        b = b4
                    } else {
                        f2 = f9
                        b = b4
                    }
                } else {
                    f2 = f9
                    b = 0
                }
                genNGon(primProfileParams, Math as int.floor(f2), 0.5f, 0.0f, 0.5f, 0)
                if (z) {
                    addCap(1 as short)
                }
                if (this.Open && f6 == 0.0f) {
                    addFace(0, this.Total - 1, 0.0f, 32 as short, false)
                } else {
                    addFace(0, this.Total, 0.0f, 32 as short, false)
                }
                if (f6 != 0.0f) {
                    when (b) {
                        32 ->
                            addHole(primProfileParams, true, 2.0f, 0.5f, f6, 0.5f, i)

                        48 ->
                            addHole(primProfileParams, true, 3.0f, 0.5f, f6, 0.5f, i)

                        else ->
                            addHole(primProfileParams, false, f2, 0.5f, f6, 0.5f, 0)

                    }
                }
                if (f5 - f4 >= 1.0f) {
                    if (f6 == 0.0f) {
                        this.Open = false
                        this.Profile.add(LLVector3(this.Profile.get(0)))
                        this.Total++

                    }
                } else {
                    this.Open = true

                }

        }
        if (z) {
            addCap(2 as short)
        }
        if (!this.Open) {
        return true
        }
        addFace(this.Total - 1, 2, 0.5f, 8 as short, true)
        if (f6 != 0.0f) {
            addFace(this.TotalOut - 1, 2, 0.5f, 16 as short, true)
        return true
        }
        addFace(this.Total - 2, 2, 0.5f, 16 as short, true)
        return true
    }
}
