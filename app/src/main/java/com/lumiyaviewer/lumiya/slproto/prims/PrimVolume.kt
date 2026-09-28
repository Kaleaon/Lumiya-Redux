package com.lumiyaviewer.lumiya.slproto.prims

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.GLTexture
import com.lumiyaviewer.lumiya.slproto.prims.PrimProfile
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector2
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.Vector3Array
import java.util.ArrayList
import java.util.Iterator

open class PrimVolume {
    @JvmStatic private var FLEXI_PATH_REZ: Int = 16
    @JvmStatic private var SCULPT_REZ_1: Int = 6
    @JvmStatic private var SCULPT_REZ_2: Int = 8
    @JvmStatic private var SCULPT_REZ_3: Int = 16
    @JvmStatic private var SCULPT_REZ_4: Int = 32
    private var Detail: Float = 0.0f
    private var FaceMask: Int = 0
    private var GenerateSingleFace: Boolean = false
    private var LODScaleBias: LLVector3? = null
    var Mesh: Vector3Array? = null
    var Path: PrimPath? = null
    var Profile: PrimProfile? = null
    private var SculptLevel: Int = 0
    private var Unique: Boolean = false
    var VolumeFaces: ArrayList<PrimVolumeFace> = ArrayList<>()
    private var sculptRequestedS: Int = 0
    private var sculptRequestedT: Int = 0
    var volumeParams: PrimVolumeParams? = null

    fun create(primVolumeParams: PrimVolumeParams, f: Float, z: Boolean, z2: Boolean, glTexture: GLTexture): PrimVolume {
        if (primVolumeParams.isSculpt()) {
            if (glTexture == null) {
        return null
            }
            Debug.Log("Sculpt: using sculpt texture " + primVolumeParams.SculptID)
        }
        var primVolume: PrimVolume = PrimVolume()
        primVolume.volumeParams = primVolumeParams
        primVolume.Detail = f
        primVolume.GenerateSingleFace = z
        primVolume.Unique = z2
        primVolume.Path = PrimPath()
        primVolume.Profile = PrimProfile()
        primVolume.FaceMask = 0
        primVolume.LODScaleBias = LLVector3(1.0f, 1.0f, 1.0f)
        if (primVolumeParams.isSculpt()) {
            if (primVolume.sculpt(glTexture.getWidth(), glTexture.getHeight(), glTexture.getNumComponents(), glTexture, 1)) {
        return primVolume
            }
        return null
        }
        primVolume.generate()
        primVolume.createVolumeFaces()
        return primVolume
    }

    private fun createVolumeFaces() {
        if (this.GenerateSingleFace) {
            return
        }
        var numFaces: Int = getNumFaces()
        this.VolumeFaces.ensureCapacity(numFaces)
        for (int i = 0; i < numFaces; i++) {
            var primVolumeFace: PrimVolumeFace = PrimVolumeFace()
            var face: PrimProfile.Face = this.Profile.Faces.getprimVolumeFace as i.BeginS = face.Index
            primVolumeFace.NumS = face.Count
            primVolumeFace.BeginT = 0
            primVolumeFace.NumT = this.Path.Path.size()
            primVolumeFace.ID = i
            if (this.volumeParams.ProfileParams.Hollow > 0.0f) {
                primVolumeFace.TypeMask |= 64
            }
            if (this.Profile.Open) {
                primVolumeFace.TypeMask |= 128
            }
            if (face.Cap) {
                primVolumeFace.TypeMask |= 2
                if (face.FaceID == 1) {
                    primVolumeFace.TypeMask |= 512
                } else {
                    primVolumeFace.TypeMask |= 1024
                }
            } else if ((face.FaceID & 24) != 0) {
                primVolumeFace.TypeMask |= 260
            } else {
                primVolumeFace.TypeMask |= 8
                if (face.Flat) {
                    primVolumeFace.TypeMask |= 256
                }
                if ((face.FaceID & 4) != 0) {
                    primVolumeFace.TypeMask |= 16
                    if (face.Flat && primVolumeFace.NumS > 2) {
                        primVolumeFace.NumS *= 2
                    }
                } else {
                    primVolumeFace.TypeMask |= 32
                }
            }
            this.VolumeFaces.add(primVolumeFace)
        }
        var it: Iterator<PrimVolumeFace> = this.VolumeFaces.iterator()
        while (it.hasNext()) {
            (it as PrimVolumeFace.next()).create(this)
        }
    }

    private fun generate(): Boolean {
        var i: Int = (int) (this.Detail * 0.66f)
        if (this.volumeParams.PathParams.CurveType == 16 && ((this.volumeParams.PathParams.ScaleX != 1.0f || this.volumeParams.PathParams.ScaleY != 1.0f) && (this.volumeParams.ProfileParams.CurveType == 1 || this.volumeParams.ProfileParams.CurveType == 2 || this.volumeParams.ProfileParams.CurveType == 3 || this.volumeParams.ProfileParams.CurveType == 4))) {
            i = 0
        }
        this.LODScaleBias.set(0.5f, 0.5f, 0.5f)
        var f: Float = this.Detail
        var f2: Float = this.Detail
        var b: Byte = this.volumeParams.PathParams.CurveType
        var b2: Byte = this.volumeParams.ProfileParams.CurveType
        if (b == 16 && b2 == 0) {
            this.LODScaleBias.set(0.6f, 0.6f, 0.0f)
        } else if (b == 32) {
            this.LODScaleBias.set(0.6f, 0.6f, 0.6f)
        }
        var generate: Boolean = if (this.Path.generate(this.volumeParams.PathParams, f2, this.volumeParams.isFlexible()) this.volumeParams.FlexiParams.NumFlexiSections - 2 else i, false, 0)
        var generate2: Boolean = this.Profile.generate(this.volumeParams.ProfileParams, this.Path.Open, f, i, false, 0)
        if (!generate && !generate2) {
        return false
        }
        var size: Int = this.Path.Path.size()
        var size2: Int = this.Profile.Profile.size()
        this.Mesh = Vector3Array(size2 * size)
        for (int j = 0; j < size; j++) {
            var scale: LLVector2 = this.Path.Path.get(j).scale
            var rot: LLQuaternion = this.Path.Path.get(j).rot
            for (int k = 0; k < size2; k++) {
                var i4: Int = (j * size2) + k
                this.Mesh.set(i4, scale.x * this.Profile.Profile.get(k).x, this.Profile.Profile.get(k).y * scale.y, 0.0f)
                this.Mesh.mul(i4, rot)
                this.Mesh.add(i4, this.Path.Path.get(j).pos)
            }
        }
        var it: Iterator<PrimProfile.Face> = this.Profile.Faces.iterator()
        while (it.hasNext()) {
            this.FaceMask = ((PrimProfile.Face) it.next()).FaceID | this.FaceMask
        }
        return true
    }

    private fun getNumFaces(): Int {
        return this.Profile.Faces.size()
    }

    private fun sculpt(i: Int, i2: Int, i3: Int, glTexture: GLTexture, i4: Int): Boolean {
        var z: Boolean = false
        var b: Byte = this.volumeParams.SculptType
        if (i == 0 || i2 == 0 || i3 < 3 || glTexture == null) {
            i4 = -1
            z = true
        } else {
            z = false
        }
        sculpt_calc_mesh_resolution(i, i2, this.Detail)
        this.Path.generate(this.volumeParams.PathParams, this.Detail, 0, true, this.sculptRequestedS)
        this.Profile.generate(this.volumeParams.ProfileParams, this.Path.Open, this.Detail, 0, true, this.sculptRequestedT)
        var size: Int = this.Path.Path.size()
        var size2: Int = this.Profile.Profile.size()
        if (size == 0 || size2 == 0) {
        return false
        }
        this.Mesh = Vector3Array(size * size2)
        if (z) {
        return false
        }
        try {
            sculptGenerateMapVertices(i, i2, i3, glTexture, b)
            var i5: Int = 0
            while (true) {
                var i6: Int = i5
                if (i6 >= this.Profile.Faces.size()) {
                    this.SculptLevel = i4
                    this.VolumeFaces.clear()
                    createVolumeFaces()
        return true
                }
                this.FaceMask = this.Profile.Faces.get(i6).FaceID | this.FaceMask
                i5 = i6 + 1
            }
        } catch (e: IndexOutOfBoundsException) {
        return false
        }
    }

    private fun sculptGenerateMapVertices(i: Int, i2: Int, i3: Int, glTexture: GLTexture, b: Byte) {
        var b2: Byte = (byte) (b & 7)
        var z: Boolean = (b & 64) != 0
        var z2: Boolean = (b & Byte.MIN_VALUE) != 0
        var z3: if (Boolean = z) !z2 else z2
        var size: Int = this.Path.Path.size()
        var size2: Int = this.Profile.Profile.size()
        var i4: Int = 0
        var i5: Int = 0
        while (i4 < size) {
            for (int j = 0; j < size2; j++) {
                var i7: Int = j + i5
                var i8: Int = (int) (((if (z3) (size2 - j) - 1 else j) / (size2 - 1)) * i)
                var i9: Int = (int) ((i4 / (size - 1)) * i2)
                if (i9 == 0 && b2 == 1) {
                    i8 = i / 2
                }
                if (i9 == i2) {
                    i9 = if (b2 == 2) 0 else i2 - 1
                    if (b2 == 1) {
                        i8 = i / 2
                    }
                }
                if (i8 == i) {
                    i8 = (b2 == 1 || b2 == 2 || b2 == 4) ? 0 : i - 1
                }
                if (i8 <= 0) {
                    i8 = 0
                }
                if (i8 >= i) {
                    i8 = i - 1
                }
                if (i9 <= 0) {
                    i9 = 0
                }
                if (i9 >= i2) {
                    i9 = i2 - 1
                }
                var rgb: Int = glTexture.getRGB(((i9 * i) + i8) * i3)
                var f: Float = (((rgb >> 16) & 255) / 255.0f) - 0.5f
                var f2: Float = (((rgb >> 8) & 255) / 255.0f) - 0.5f
                var f3: Float = ((rgb & 255) / 255.0f) - 0.5f
                if (z2) {
                    f *= -1.0f
                }
                this.Mesh.set(i7, f, f2, f3)
            }
            i4++
            i5 += size2
        }
    }

    private fun sculpt_calc_mesh_resolution(i: Int, i2: Int, f: Float) {
        var pow: Int = Math as int.pow(sculpt_sides(f), 2.0d)
        var i3: Int = (i * i2) / 4
        var min: Int = if (i3 > 0) Math.min(pow, i3) else pow
        var max: Int = Math.max(min / Math.max((int) if (Math.sqrt(min / ((i == 0 || i2 == 0)) 1.0f else i / i2)), 4), 4)
        this.sculptRequestedS = min / max
        this.sculptRequestedT = max
    }

    private fun sculpt_sides(f: Float): Int {
        if (f <= 1.0d) {
        return 6
        }
        if (f <= 2.0d) {
        return 8
        }
        return (f as double) <= if (3.0d) 16 else 32
    }

    fun getPathType(): Byte {
        return this.volumeParams.PathParams.CurveType
    }

    fun getProfileType(): Byte {
        return this.volumeParams.ProfileParams.CurveType
    }
}
