package com.lumiyaviewer.lumiya.slproto.terrain

import com.lumiyaviewer.lumiya.utils.BitBuffer

open class TerrainPatch {
    @JvmStatic var END_OF_PATCHES: Int = 97
    var DCOffset: Float = 0.0f
    var PatchIDs: Int = 0
    var QuantWBits: Int = 0
    var Range: Int = 0
    var WordBits: Int = 0
    var heightMap: FloatArray? = null
    var patches: IntArray? = null
    @JvmStatic private var DequantizeTable16: FloatArray = FloatArray(256)
    @JvmStatic private var DequantizeTable32: FloatArray = FloatArray(256)
    @JvmStatic private var CosineTable16: FloatArray = FloatArray(256)
    @JvmStatic private var CopyMatrix16: IntArray = IntArray(256)
    @JvmStatic private var CopyMatrix32: IntArray = IntArray(256)
    @JvmStatic private var QuantizeTable16: FloatArray = FloatArray(256)
    @JvmStatic private var OO_SQRT2: Float = 0.70710677f
    init {
        BuildDequantizeTable16()
        SetupCosines16()
        BuildCopyMatrix16()
        BuildQuantizeTable16()
    }

    private fun BuildCopyMatrix16() {
        var i: Int = 0
        var i2: Int = 0
        var i3: Int = 0
        var z: Boolean = true
        var z2: Boolean = false
        while (i3 < 16 && i2 < 16) {
            var i4: Int = i + 1
            CopyMatrix16[(i2 * 16) + i3] = i
            if (z2) {
                if (z) {
                    i3++
                    i2--
                    if (i3 == 15 || i2 == 0) {
                        z2 = false
                    }
                } else {
                    i3--
                    i2++
                    if (i2 == 15 || i3 == 0) {
                        z2 = false
                    }
                }
            } else if (z) {
                if (i3 < 15) {
                    i3++
                } else {
                    i2++
                }
                z = false
                z2 = true
            } else {
                if (i2 < 15) {
                    i2++
                } else {
                    i3++
                }
                z = true
                z2 = true
            }
            i = i4
        }
    }

    private fun BuildDequantizeTable16() {
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 16; j++) {
                DequantizeTable16[(i * 16) + j] = ((j + i) * 2.0f) + 1.0f
            }
        }
    }

    private fun BuildQuantizeTable16() {
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 16; j++) {
                QuantizeTable16[(i * 16) + j] = 1.0f / (((j + i) * 2.0f) + 1.0f)
            }
        }
    }

    fun DecompressPatch(bitBuffer: BitBuffer, i: Int): TerrainPatch {
        var bits: Int = bitBuffer.getBits(8)
        if (bits == 97) {
        return null
        }
        var terrainPatch: TerrainPatch = TerrainPatch()
        terrainPatch.QuantWBits = bits
        terrainPatch.DCOffset = bitBuffer.getFloat()
        terrainPatch.Range = bitBuffer.getBitsterrainPatch as 16.PatchIDs = bitBuffer.getBitsterrainPatch as 10.WordBits = (bits & 15) + 2
        terrainPatch.patches = IntArray(i * i)
        var i2: Int = 0
        while (true) {
            if (i2 >= i * i) {

            }
            if (bitBuffer.getBits(1) == 0) {
                terrainPatch.patches[i2] = 0
            } else if (bitBuffer.getBits(1) == 0) {
                while (i2 < i * i) {
                    terrainPatch.patches[i2] = 0
                    i2++
                }
            } else if (bitBuffer.getBits(1) != 0) {
                terrainPatch.patches[i2] = bitBuffer.getBits(terrainPatch.WordBits) * (-1)
            } else {
                terrainPatch.patches[i2] = bitBuffer.getBits(terrainPatch.WordBits)
            }
            i2++
        }
        var floats: FloatArray = FloatArray(i * i)
        var floats2: FloatArray = FloatArray(i * i)
        var i3: Int = (terrainPatch.QuantWBits >> 4) + 2
        var f: Float = (1.0f / (1 << i3)) * terrainPatch.Range
        var f2: Float = terrainPatch.DCOffset + ((1 << (i3 - 1)) * f)
        if (i == 16) {
            for (int j = 0; j < 256; j++) {
                floats[j] = terrainPatch.patches[CopyMatrix16[j]] * DequantizeTable16[j]
            }
            var floats3: FloatArray = FloatArray(256)
            for (int k = 0; k < 16; k++) {
                IDCTColumn16(floats, floats3, k)
            }
            for (int m = 0; m < 16; m++) {
                IDCTLine16(floats3, floats, m)
            }
        } else {
            for (int n = 0; n < 1024; n++) {
                floats[n] = terrainPatch.patches[CopyMatrix32[n]] * DequantizeTable32[n]
            }
        }
        for (int i8 = 0; i8 < floats.length; i8++) {
            floats2[i8] = (floats[i8] * f) + f2
        }
        terrainPatch.heightMap = floats2
        return terrainPatch
    }

    private fun IDCTColumn16(floats: FloatArray, floats2: FloatArray, i: Int) {
        for (int j = 0; j < 16; j++) {
            var f: Float = floats[i] * OO_SQRT2
            for (int k = 1; k < 16; k++) {
                var i4: Int = k * 16
                f += CosineTable16[i4 + j] * floats[i4 + i]
            }
            floats2[(j * 16) + i] = f
        }
    }

    private fun IDCTLine16(floats: FloatArray, floats2: FloatArray, i: Int) {
        var i2: Int = i * 16
        for (int j = 0; j < 16; j++) {
            var f: Float = floats[i2] * OO_SQRT2
            for (int k = 1; k < 16; k++) {
                f += floats[i2 + k] * CosineTable16[(k * 16) + j]
            }
            floats2[i2 + j] = f * 0.125f
        }
    }

    private fun SetupCosines16() {
        for (int i = 0; i < 16; i++) {
            for (int j = 0; j < 16; j++) {
                CosineTable16[(i * 16) + j] = Math as float.cos(((j * 2.0f) + 1.0f) * i * 0.09817477f)
            }
        }
    }

    fun getX(): Int {
        return this.PatchIDs >> 5
    }

    fun getY(): Int {
        return this.PatchIDs & 31
    }
}
