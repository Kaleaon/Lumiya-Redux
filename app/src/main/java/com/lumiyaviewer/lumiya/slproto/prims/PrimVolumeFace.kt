package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.slproto.prims.PrimPath
import com.lumiyaviewer.lumiya.slproto.types.LLVector2
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.Vector2Array
import com.lumiyaviewer.lumiya.slproto.types.Vector3Array
import com.lumiyaviewer.lumiya.slproto.types.VertexArray
import java.util.ArrayList

open class PrimVolumeFace {
    @JvmStatic var BOTTOM_MASK: Int = 1024
    @JvmStatic var CAP_MASK: Int = 2
    @JvmStatic var END_MASK: Int = 4
    @JvmStatic var FLAT_MASK: Int = 256
    @JvmStatic var HOLLOW_MASK: Int = 64
    @JvmStatic var INNER_MASK: Int = 16
    @JvmStatic var OPEN_MASK: Int = 128
    @JvmStatic var OUTER_MASK: Int = 32
    @JvmStatic var SIDE_MASK: Int = 8
    @JvmStatic var SINGLE_MASK: Int = 1
    @JvmStatic var TOP_MASK: Int = 512
    var BeginS: Int = 0
    var BeginT: Int = 0
    var Center: LLVector3? = null
    var Edge: IntArray? = null
    var ID: Int = 0
    var Indices: ShortArray? = null
    var Normals: Vector3Array? = null
    var NumIndices: Int = 0
    var NumS: Int = 0
    var NumT: Int = 0
    var NumVertices: Int = 0
    var Positions: Vector3Array? = null
    var TexCoords: Vector2Array? = null
    var TypeMask: Int = 0
    var vertexArray: VertexArray? = null
    var TexCoordExtents: Array<LLVector2> = {LLVector2(), LLVector2()}
    var Extents: Array<LLVector3> = {LLVector3(), LLVector3()}

    private fun createCap(primVolume: PrimVolume): Boolean {
        var i: Int = 0
        var z: Boolean = false
        var z2: Boolean = false
        if ((this.TypeMask & 64) == 0 && (this.TypeMask & 128) == 0 && primVolume.volumeParams.PathParams.Begin == 0.0f && primVolume.volumeParams.PathParams.End == 1.0f && primVolume.getProfileType() == 1 && primVolume.getPathType() == 16) {
            return createUnCutCubeCap(primVolume)
        }
        var vector3Array: Vector3Array = primVolume.Mesh
        var arrayList: ArrayList<LLVector3> = primVolume.Profile.Profile
        var size: Int = arrayList.size()
        var size2: Int = (arrayList.size() - 2) * 3
        if ((this.TypeMask & 64) == 0 && (this.TypeMask & 128) == 0) {
            resizeVertices(size + 1)
            resizeIndices(size2 + 3)
        } else {
            resizeVertices(size)
            resizeIndices(size2)
        }
        var size3: Int = (this.TypeMask & 512) != if primVolume as 0.Profile.Total * (primVolume.Path.Path.size() - 1) else this.BeginS
        var vector2: LLVector2 = LLVector2()
        var vector23: LLVector2 = LLVector2()
        var vector3: LLVector3 = this.Extents[0]
        var vector32: LLVector3 = this.Extents[1]
        var vector2Array: Vector2Array = this.TexCoords
        var vector3Array2: Vector3Array = this.Positions
        var vector3Array3: Vector3Array = this.Normals
        for (int j = 0; j < size; j++) {
            if ((this.TypeMask & 512) != 0) {
                vector2Array.set(j, 0.5f + arrayList.get(j).x, arrayList.get(j).y + 0.5f)
            } else {
                vector2Array.set(j, 0.5f + arrayList.get(j).x, 0.5f - arrayList.get(j).y)
            }
            vector3Array2.set(j, vector3Array, j + size3)
            if (j == 0) {
                vector3Array2.get(j, vector3)
                vector3Array2.get(j, vector32)
                vector2Array.get(j, vector2)
                vector2Array.get(j, vector23)
            } else {
                vector3Array2.minMaxVector(j, vector3, vector32)
                vector2Array.minMaxVector(j, vector2, vector23)
            }
        }
        this.Center = LLVector3this as vector3.Center.addthis as vector32.Center.mul(0.5f)
        var sum: LLVector2 = LLVector2.sum(vector2, vector23)
        sum.mul(0.5f)
        var vector33: LLVector3 = LLVector3(this.Center)
        var vector34: LLVector3 = LLVector3(this.Center)
        vector3Array2.subFromVector(vector33, 0)
        vector3Array2.subFromVector(vector34, 1)
        var cross: LLVector3 = (this.TypeMask & 512) != if LLVector3 as 0.cross(vector33, vector34) else LLVector3.cross(vector34, vector33)
        cross.normVec()
        if ((this.TypeMask & 64) == 0 && (this.TypeMask & 128) == 0) {
            vector3Array2.set(size, this.Center)
            vector2Array.set(size, sum.x, sum.y)
            i = size + 1
        } else {
            i = size
        }
        vector3Array3.fill(0, i, cross)
        if ((this.TypeMask & 64) == 0) {
            var i3: Int = 2
            var i4: Int = 1
            if ((this.TypeMask & 512) != 0) {
                i3 = 1
                i4 = 2
            }
            for (int k = 0; k < i - 2; k++) {
                this.Indices[k * 3] = (short) (i - 1)
                this.Indices[(k * 3) + i3] = k as short
                this.Indices[(k * 3) + i4] = (short) (k + 1)
            }
        return true
        }
        if ((this.TypeMask & 512) != 0) {
            var i6: Int = 0
            var i7: Int = i - 1
            var i8: Int = 0
            while (true) {
                var i9: Int = i8
                if (i7 - i6 <= 1) {
        return true
                }
                var vector35: LLVector3 = LLVector3(arrayList.get(i6))
                var vector36: LLVector3 = LLVector3(arrayList.get(i7))
                var vector37: LLVector3 = LLVector3(arrayList.get(i6 + 1))
                var vector38: LLVector3 = LLVector3(arrayList.get(i7 - 1))
                vector35.z = 0.0f
                vector36.z = 0.0f
                vector37.z = 0.0f
                vector38.z = 0.0f
                var f: Float = ((vector35.x * vector37.y) - (vector37.x * vector35.y)) + ((vector37.x * vector36.y) - (vector36.x * vector37.y)) + ((vector36.x * vector35.y) - (vector35.x * vector36.y))
                var f2: Float = ((vector35.x * vector38.y) - (vector38.x * vector35.y)) + ((vector38.x * vector37.y) - (vector37.x * vector38.y)) + ((vector37.x * vector35.y) - (vector35.x * vector37.y))
                var f3: Float = ((vector36.x * vector35.y) - (vector35.x * vector36.y)) + ((vector35.x * vector38.y) - (vector38.x * vector35.y)) + ((vector38.x * vector36.y) - (vector36.x * vector38.y))
                var f4: Float = ((vector36.x * vector37.y) - (vector37.x * vector36.y)) + ((vector37.x * vector38.y) - (vector38.x * vector37.y)) + ((vector38.x * vector36.y) - (vector36.x * vector38.y))
                var z3: Boolean = f >= 0.0f
                if (f4 < 0.0f) {
                    z3 = false
                }
                var z4: Boolean = f3 >= 0.0f
                if (f2 < 0.0f) {
                    z4 = false
                }
                if (!z3) {
                    z2 = false
                } else if (z4) {
                    z2 = LLVector3.sub(vector35, vector37).magVecSquared() < LLVector3.sub(vector36, vector38).magVecSquared()
                } else {
                    z2 = true
                }
                if (z2) {
                    var i10: Int = i9 + 1
                    this.Indices[i9] = i6 as short
                    var i11: Int = i10 + 1
                    this.Indices[i10] = (short) (i6 + 1)
                    i8 = i11 + 1
                    this.Indices[i11] = i7 as short
                    i6++
                } else {
                    var i12: Int = i9 + 1
                    this.Indices[i9] = i6 as short
                    var i13: Int = i12 + 1
                    this.Indices[i12] = (short) (i7 - 1)
                    i8 = i13 + 1
                    this.Indices[i13] = i7 as short
                    i7--
                }
            }
        } else {
            var i14: Int = 0
            var i15: Int = i - 1
            var i16: Int = 0
            while (true) {
                var i17: Int = i16
                if (i15 - i14 <= 1) {
        return true
                }
                var vector39: LLVector3 = LLVector3(arrayList.get(i14))
                var lLVector310: LLVector3 = LLVector3(arrayList.get(i15))
                var lLVector311: LLVector3 = LLVector3(arrayList.get(i14 + 1))
                var lLVector312: LLVector3 = LLVector3(arrayList.get(i15 - 1))
                vector39.z = 0.0f
                lLVector310.z = 0.0f
                lLVector311.z = 0.0f
                lLVector312.z = 0.0f
                var f5: Float = ((vector39.x * lLVector311.y) - (lLVector311.x * vector39.y)) + ((lLVector311.x * lLVector310.y) - (lLVector310.x * lLVector311.y)) + ((lLVector310.x * vector39.y) - (vector39.x * lLVector310.y))
                var f6: Float = ((vector39.x * lLVector312.y) - (lLVector312.x * vector39.y)) + ((lLVector312.x * lLVector311.y) - (lLVector311.x * lLVector312.y)) + ((lLVector311.x * vector39.y) - (vector39.x * lLVector311.y))
                var f7: Float = ((lLVector310.x * vector39.y) - (vector39.x * lLVector310.y)) + ((vector39.x * lLVector312.y) - (lLVector312.x * vector39.y)) + ((lLVector312.x * lLVector310.y) - (lLVector310.x * lLVector312.y))
                var f8: Float = ((lLVector310.x * lLVector311.y) - (lLVector311.x * lLVector310.y)) + ((lLVector311.x * lLVector312.y) - (lLVector312.x * lLVector311.y)) + ((lLVector312.x * lLVector310.y) - (lLVector310.x * lLVector312.y))
                var z5: Boolean = f5 >= 0.0f
                if (f8 < 0.0f) {
                    z5 = false
                }
                var z6: Boolean = f7 >= 0.0f
                if (f6 < 0.0f) {
                    z6 = false
                }
                if (!z5) {
                    z = false
                } else if (z6) {
                    z = LLVector3.sub(vector39, lLVector311).magVecSquared() < LLVector3.sub(lLVector310, lLVector312).magVecSquared()
                } else {
                    z = true
                }
                if (z) {
                    var i18: Int = i17 + 1
                    this.Indices[i17] = i14 as short
                    var i19: Int = i18 + 1
                    this.Indices[i18] = i15 as short
                    i16 = i19 + 1
                    this.Indices[i19] = (short) (i14 + 1)
                    i14++
                } else {
                    var i20: Int = i17 + 1
                    this.Indices[i17] = i14 as short
                    var i21: Int = i20 + 1
                    this.Indices[i20] = i15 as short
                    i16 = i21 + 1
                    this.Indices[i21] = (short) (i15 - 1)
                    i15--
                }
            }
        }
    }

    private fun createSide(primVolume: PrimVolume): Boolean {
        var i: Int = 0
        var i2: Int = 0
        var i3: Int = 0
        var i4: Int = 0
        var i5: Int = 0
        var z: Boolean = (this.TypeMask & 256) != 0
        var b: Byte = primVolume.volumeParams.SculptType
        var b2: Byte = (byte) (b & 7)
        var z2: Boolean = (b & 64) != 0
        var z3: Boolean = (b & Byte.MIN_VALUE) != 0
        var z4: if (Boolean = z2) !z3 else z3
        var vector3Array: Vector3Array = primVolume.Mesh
        var arrayList: ArrayList<LLVector3> = primVolume.Profile.Profile
        var arrayList2: ArrayList<PrimPath.PathPoint> = primVolume.Path.Path
        var i6: Int = primVolume.Profile.Total
        var i7: Int = (this.NumS - 1) * (this.NumT - 1) * 6
        resizeVertices(this.NumS * this.NumT)
        resizeIndicesthis as i7.Edge = IntArray(i7)
        var vector3Array2: Vector3Array = this.Positions
        var vector3Array3: Vector3Array = this.Normals
        var vector2Array: Vector2Array = this.TexCoords
        var floor: Int = Math as int.floor(arrayList.get(this.BeginS).z)
        var i8: Int = ((this.TypeMask & 16) == 0 || (this.TypeMask & 256) == 0 || this.NumS <= 2) ? this.NumS : this.NumS / 2
        var i9: Int = this.BeginT
        var i10: Int = 0
        while (true) {
            var i11: Int = i9
            if (i11 >= this.BeginT + this.NumT) {

            }
            var f: Float = arrayList2.get(i11).TexT
            var i12: Int = 0
            var i13: Int = i10
            while (i12 < i8) {
                var f2: Float = ((this.TypeMask & 4) != 0 || this.BeginS + i12 >= arrayList.size()) ? if (i12 != 0) 1.0f else 0.0f : !if arrayList as z.get(this.BeginS + i12).z else arrayList.get(this.BeginS + i12).z - floor
                if (z4) {
                    f2 = 1.0f - f2
                }
                var i14: Int = this.BeginS + if (i12 >= i6) this.BeginS + i12 + ((i11 - 1) * i6) else this.BeginS + i12 + (i6 * i11)
                vector3Array2.set(i13, vector3Array, i14)
                vector2Array.set(i13, f2, f)
                var i15: Int = i13 + 1
                if ((this.TypeMask & 16) == 0 || (this.TypeMask & 256) == 0 || this.NumS <= 2 || i12 <= 0) {
                    i5 = i15
                } else {
                    vector3Array2.set(i15, vector3Array, i14)
                    vector2Array.set(i15, f2, f)
                    i5 = i15 + 1
                }
                i12++
                i13 = i5
            }
            if ((this.TypeMask & 16) == 0 || (this.TypeMask & 256) == 0 || this.NumS <= 2) {
                i10 = i13
            } else {
                var i16: Int = (this.TypeMask & 128) != if (0) i8 - 1 else 0
                var i17: Int = this.BeginS + i16 + (i6 * i11)
                var f3: Float = this.BeginS + i16 < if (arrayList.size()) arrayList.get(i16 + this.BeginS).z - floor else i16 != if 1 as 0.0f else 0.0f
                vector3Array2.set(i13, vector3Array, i17)
                vector2Array.set(i13, f3, f)
                i10 = i13 + 1
            }
            i9 = i11 + 1
        }
        var vector3: LLVector3 = this.Extents[0]
        var vector39: LLVector3 = this.Extents[1]
        vector3Array2.get(0, vector3)
        vector3Array2.get(0, vector39)
        vector3Array2.minMaxVector(vector3, vector39)
        this.Center = LLVector3this as vector3.Center.addthis as vector39.Center.mul(0.5f)
        var i18: Int = 0
        var i19: Int = 0
        var z5: Boolean = (this.TypeMask & 256) != 0
        for (int j = 0; j < this.NumT - 1; j++) {
            for (int k = 0; k < this.NumS - 1; k++) {
                var i22: Int = i18 + 1
                this.Indices[i18] = (short) ((this.NumS * j) + k)
                var i23: Int = i22 + 1
                this.Indices[i22] = (short) (k + 1 + (this.NumS * (j + 1)))
                var i24: Int = i23 + 1
                this.Indices[i23] = (short) ((this.NumS * (j + 1)) + k)
                var i25: Int = i24 + 1
                this.Indices[i24] = (short) ((this.NumS * j) + k)
                var i26: Int = i25 + 1
                this.Indices[i25] = (short) (k + 1 + (this.NumS * j))
                i18 = i26 + 1
                this.Indices[i26] = (short) (k + 1 + (this.NumS * (j + 1)))
                var i27: Int = i19 + 1
                this.Edge[i19] = ((this.NumS - 1) * 2 * j) + (k * 2) + 1
                if (j < this.NumT - 2) {
                    this.Edge[i27] = ((this.NumS - 1) * 2 * (j + 1)) + (k * 2) + 1
                    i = i27 + 1
                } else if (this.NumT <= 3 || primVolume.Path.Open) {
                    this.Edge[i27] = -1
                    i = i27 + 1
                } else {
                    this.Edge[i27] = (k * 2) + 1
                    i = i27 + 1
                }
                if (k > 0) {
                    this.Edge[i] = ((((this.NumS - 1) * 2) * j) + (k * 2)) - 1
                    i2 = i + 1
                } else if (z5 || primVolume.Path.Open) {
                    this.Edge[i] = -1
                    i2 = i + 1
                } else {
                    this.Edge[i] = ((this.NumS - 1) * 2 * j) + ((this.NumS - 2) * 2) + 1
                    i2 = i + 1
                }
                if (j > 0) {
                    i3 = i2 + 1
                    this.Edge[i2] = ((this.NumS - 1) * 2 * (j - 1)) + (k * 2)
                } else if (this.NumT <= 3 || primVolume.Path.Open) {
                    i3 = i2 + 1
                    this.Edge[i2] = -1
                } else {
                    i3 = i2 + 1
                    this.Edge[i2] = ((this.NumS - 1) * 2 * (this.NumT - 2)) + (k * 2)
                }
                if (k < this.NumS - 2) {
                    i4 = i3 + 1
                    this.Edge[i3] = ((this.NumS - 1) * 2 * j) + ((k + 1) * 2)
                } else if (z5 || primVolume.Path.Open) {
                    i4 = i3 + 1
                    this.Edge[i3] = -1
                } else {
                    i4 = i3 + 1
                    this.Edge[i3] = (this.NumS - 1) * 2 * j
                }
                i19 = i4 + 1
                this.Edge[i4] = ((this.NumS - 1) * 2 * j) + (k * 2)
            }
        }
        this.Normals.clear()
        var vector3s: Array<LLVector3> = arrayOfNulls<LLVector3>(3)
        var sArr: ShortArray = ShortArray(3)
        for (int m = 0; m < 3; m++) {
            vector3s[m] = LLVector3()
        }
        var vector33: LLVector3 = LLVector3()
        var vector34: LLVector3 = LLVector3()
        for (int n = 0; n < this.NumIndices / 3; n++) {
            for (int i30 = 0; i30 < 3; i30++) {
                sArr[i30] = this.Indices[(n * 3) + i30]
                vector3Array2.get(sArr[i30], vector3s[i30])
            }
            vector33.setSub(vector3s[0], vector3s[1])
            vector34.setSub(vector3s[0], vector3s[2])
            vector33.setCross(vector34)
            for (int i31 = 0; i31 < 3; i31++) {
                this.Normals.add(sArr[i31], vector33)
            }
            this.Normals.add(sArr[(n & 1) + 1], vector33)
        }
        var vector35: LLVector3 = LLVector3()
        var vector36: LLVector3 = LLVector3()
        var vector37: LLVector3 = LLVector3()
        vector3Array2.get(0, vector36)
        vector3Array2.get(this.NumS * (this.NumT - 2), vector37)
        vector35.setSub(vector36, vector37)
        var z6: Boolean = vector35.dot(vector35) < 1.0E-6f
        vector3Array2.get(this.NumS - 1, vector36)
        vector3Array2.get(((this.NumS * (this.NumT - 2)) + this.NumS) - 1, vector37)
        vector35.setSub(vector36, vector37)
        var z7: Boolean = vector35.dot(vector35) < 1.0E-6f
        if (b2 == 0) {
            if (!primVolume.Path.Open) {
                for (int i32 = 0; i32 < this.NumS; i32++) {
                    vector3Array3.setAdd(i32, (this.NumS * (this.NumT - 1)) + i32)
                }
            }
            if (!primVolume.Path.Open && (!z6)) {
                for (int i33 = 0; i33 < this.NumT; i33++) {
                    vector3Array3.setAdd(this.NumS * i33, ((this.NumS * i33) + this.NumS) - 1)
                }
            }
            if (primVolume.getPathType() != 32 || (primVolume.getProfileType() & 15) != 5) {
        return true
            }
            if (z6) {
                for (int i34 = 0; i34 < this.NumT; i34++) {
                    vector3Array3.set(this.NumS * i34, 1.0f, 0.0f, 0.0f)
                }
            }
            if (!z7) {
        return true
            }
            for (int i35 = 0; i35 < this.NumT; i35++) {
                vector3Array3.set(((this.NumS * i35) + this.NumS) - 1, -1.0f, 0.0f, 0.0f)
            }
        return true
        }
        var z8: Boolean = b2 == 1
        var z9: Boolean = b2 == 1 || b2 == 2 || b2 == 4
        var z10: Boolean = b2 == 2
        if (z8) {
            var vector38: LLVector3 = LLVector3()
            for (int i36 = 0; i36 < this.NumS; i36++) {
                vector3Array3.addToVector(i36, vector38)
            }
            for (int i37 = 0; i37 < this.NumS; i37++) {
                vector3Array3.set(i37, vector38)
            }
            vector38.set(0.0f, 0.0f, 0.0f)
            for (int i38 = 0; i38 < this.NumS; i38++) {
                vector3Array3.addToVector((this.NumS * (this.NumT - 1)) + i38, vector38)
            }
            for (int i39 = 0; i39 < this.NumS; i39++) {
                vector3Array3.set((this.NumS * (this.NumT - 1)) + i39, vector38)
            }
        }
        if (z9) {
            for (int i40 = 0; i40 < this.NumT; i40++) {
                vector3Array3.setAdd(this.NumS * i40, ((this.NumS * i40) + this.NumS) - 1)
            }
        }
        if (!z10) {
        return true
        }
        for (int i41 = 0; i41 < this.NumS; i41++) {
            vector3Array3.setAdd(i41, (this.NumS * (this.NumT - 1)) + i41)
        }
        return true
    }

    private fun createUnCutCubeCap(primVolume: PrimVolume): Boolean {
        var i: Int = 0
        var vector3Array: Vector3Array = primVolume.Mesh
        var arrayList: ArrayList<LLVector3> = primVolume.Profile.Profile
        var i2: Int = primVolume.Profile.Total
        var size: Int = primVolume.Path.Path.size()
        var size2: Int = (arrayList.size() - 1) / 4
        var vector3: LLVector3 = this.Extents[0]
        var vector37: LLVector3 = this.Extents[1]
        var i3: Int = (this.TypeMask & 512) != if (0) i2 * (size - 1) else this.BeginS
        var vertexArray: VertexArray = VertexArray(4)
        var vector38: LLVector3 = LLVector3()
        var vertices: Vector3Array = vertexArray.getVertices()
        var texCoords: Vector2Array = vertexArray.getTexCoords()
        var i4: Int = 0
        while (true) {
            var i5: Int = i4
            if (i5 >= 4) {

            }
            vertices.set(i5, vector3Array, (size2 * i5) + i3)
            texCoords.set(i5, 0.5f + arrayList.get(size2 * i5).x, 0.5f - arrayList.get(size2 * i5).y)
            i4 = i5 + 1
        }
        var vector39: LLVector3 = LLVector3()
        vertices.getSub(1, 0, vector38)
        vertices.getSub(2, 1, vector39)
        vector38.setCrossvector38 as vector39.normVec()
        if ((this.TypeMask & 512) == 0) {
            vector38.mul(-1.0f)
        } else {
            texCoords.swap(0, 3)
            texCoords.swap(1, 2)
        }
        resizeVertices((size2 + 1) * (size2 + 1))
        var vector3Array2: Vector3Array = this.Positions
        var i6: Int = 0
        var vector35: LLVector3 = LLVector3()
        var vector36: LLVector3 = LLVector3()
        var vector2: LLVector2 = LLVector2()
        var vector23: LLVector2 = LLVector2()
        for (int j = 0; j < size2 + 1; j++) {
            for (int k = 0; k < size2 + 1; k++) {
                    this.vertexArray.LerpPlanarVertex(i6, vertexArray, 0, vertexArray, 1, vertexArray, 3, j / size2, k / size2, vector35, vector36, vector2, vector23)
                    this.vertexArray.getNormals().set(i6, vector38)
                    if (j == 0 && k == 0) {
                        vector3Array2.get(i6, vector3)
                        vector3Array2.get(i6, vector37)
                    } else {
                        vector3Array2.minMaxVector(i6, vector3, vector37)
                    }
                    i6++
            }
        }
        this.Center = LLVector3this as vector3.Center.addthis as vector37.Center.mul(0.5f)
        resizeIndices(size2 * size2 * 6)
        var sArr: ShortArray = this.Indices
        var sArr2: ShortArray = {0, 1, (short) (size2 + 1 + 1), (short) (size2 + 1 + 1), (short) (size2 + 1), 0}
        var i11: Int = 0
        var i12: Int = 0
        while (true) {
            var i13: Int = i12
            if (i13 >= size2) {
        return true
            }
            var i14: Int = 0
            while (i14 < size2) {
                if ((this.TypeMask & 512) != 0) {
                    i = i11
                    var i15: Int = 5
                    while (i15 >= 0) {
                        sArr[i] = (short) (((size2 + 1) * i14) + i13 + sArr2[i15])
                        i15--
                        i++
                    }
                } else {
                    i = i11
                    var i16: Int = 0
                    while (i16 < 6) {
                        sArr[i] = (short) (((size2 + 1) * i14) + i13 + sArr2[i16])
                        i16++
                        i++
                    }
                }
                i14++
                i11 = i
            }
            i12 = i13 + 1
        }
    }

    private fun resizeIndices(i: Int) {
        if (i != this.NumIndices) {
            if (i != 0) {
                this.Indices = ShortArray(i)
            } else {
                this.Indices = null
            }
            this.NumIndices = i
        }
    }

    private fun resizeVertices(i: Int) {
        if (this.NumVertices != i) {
            if (i != 0) {
                this.vertexArray = VertexArraythis as i.Positions = this.vertexArray.getVertices()
                this.Normals = this.vertexArray.getNormals()
                this.TexCoords = this.vertexArray.getTexCoords()
            } else {
                this.Positions = null
                this.Normals = null
                this.TexCoords = null
                this.vertexArray = null
            }
            this.NumVertices = i
        }
    }

    fun create(primVolume: PrimVolume): Boolean {
        var createCap: Boolean = (this.TypeMask & 2) != if (0) createCap(primVolume) else ((this.TypeMask & 4) == 0 && (this.TypeMask & 8) == 0) ? false : createSide(primVolume)
        if (createCap) {
            this.TexCoordExtents[0] = LLVector2(1.0f, 1.0f)
            this.TexCoordExtents[1] = LLVector2(0.0f, 0.0f)
            this.TexCoords.minMaxVector(this.TexCoordExtents[0], this.TexCoordExtents[1])
            this.TexCoordExtents[0].x = Math.max(0.0f, this.TexCoordExtents[0].x)
            this.TexCoordExtents[0].y = Math.max(0.0f, this.TexCoordExtents[0].y)
            this.TexCoordExtents[1].x = Math.min(1.0f, this.TexCoordExtents[1].x)
            this.TexCoordExtents[1].y = Math.min(1.0f, this.TexCoordExtents[1].y)
        }
        return createCap
    }
}
