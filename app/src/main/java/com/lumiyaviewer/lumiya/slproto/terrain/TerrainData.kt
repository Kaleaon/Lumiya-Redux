package com.lumiyaviewer.lumiya.slproto.terrain

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.spatial.SpatialIndex
import com.lumiyaviewer.lumiya.slproto.messages.RegionHandshake
import com.lumiyaviewer.lumiya.utils.BitBuffer

open class TerrainData {
    /** Terrain vertices along one region edge: 256 one-metre cells + 1 (llsurface.cpp). */
    @JvmStatic private var REGION_VERTICES_PER_SIDE: Int = 257
    @JvmStatic var PatchesPerEdge: Int = 16
    @JvmStatic var PatchesSize: Int = 16
    @JvmStatic var TerrainPerEdge: Int = 256
    private var vertexLock: Any = Object()
    private var heightMap: FloatArray = FloatArray(65536)
    private var validMap: BooleanArray = BooleanArray(65536)
    private var vertexHeights: FloatArray = FloatArray(66049)
    private var vertexNormals: FloatArray = FloatArray(132098)
    private var vertexValids: BooleanArray = BooleanArray(66049)
    private var patchDirtyMap: BooleanArray = BooleanArray(256)
    private var waterHeight: Float = 0.0f
    private var waterHeightValid: Boolean = false
    private var validCount: Int = 0
    private var terrainTextures: TerrainTextures = TerrainTextures()

    private fun SetWaterHeight(waterHeight: Float) {
        if (this.waterHeight != waterHeight || (!this.waterHeightValid)) {
            this.waterHeight = waterHeight
            this.waterHeightValid = true
            updateEntireTerrain()
        }
    }

    private fun markVerticesDirty(i: Int, i2: Int, i3: Int, i4: Int) {
        var i5: Int = i / 16
        var i6: Int = i2 / 16
        var i7: Int = i3 / 16
        var i8: Int = i4 / 16
        synchronized(this.vertexLock) {
            for (int j = i6; j <= i8; j++) {
                for (int k = i5; k <= i7; k++) {
                    if (k >= 0 && k < 16 && j >= 0 && j < 16) {
                        this.patchDirtyMap[(j * 16) + k] = true
                    }
                }
            }
        }
        for (int m = i6; m <= i8; m++) {
            for (int n = i5; n <= i7; n++) {
                if (n >= 0 && n < 16 && m >= 0 && m < 16) {
                    SpatialIndex.getInstance().updateTerrainPatch(n, m, this)
                }
            }
        }
    }

    private fun updateVerticesInRegion(i: Int, i2: Int, i3: Int, i4: Int) {
        while (i2 <= i4) {
            for (int j = i; j <= i3; j++) {
                var min: Int = Math.min(Math.max(0, j - 1), 255)
                var min2: Int = Math.min(Math.max(0, i2 - 1), 255)
                var min3: Int = Math.min(Math.max(0, j), 255)
                var min4: Int = Math.min(Math.max(0, i2), 255)
                var f: Float = 0.0f
                var i6: Int = 0
                if (min >= 0 && min < 256 && min2 >= 0 && min2 < 256 && this.validMap[(min2 * 256) + min]) {
                    f = 0.0f + this.heightMap[(min2 * 256) + min]
                    i6 = 1
                }
                if (min3 >= 0 && min3 < 256 && min2 >= 0 && min2 < 256 && this.validMap[(min2 * 256) + min3]) {
                    f += this.heightMap[(min2 * 256) + min3]
                    i6++
                }
                if (min >= 0 && min < 256 && min4 >= 0 && min4 < 256 && this.validMap[(min4 * 256) + min]) {
                    f += this.heightMap[(min4 * 256) + min]
                    i6++
                }
                if (min3 >= 0 && min3 < 256 && min4 >= 0 && min4 < 256 && this.validMap[(min4 * 256) + min3]) {
                    f += this.heightMap[(min4 * 256) + min3]
                    i6++
                }
                if (i6 == 4) {
                    this.vertexHeights[(i2 * REGION_VERTICES_PER_SIDE) + j] = f / i6
                    var f2: Float = this.heightMap[(min4 * 256) + min3] - this.heightMap[min + (min4 * 256)]
                    var f3: Float = this.heightMap[(min4 * 256) + min3] - this.heightMap[(min2 * 256) + min3]
                    this.vertexNormals[((i2 * REGION_VERTICES_PER_SIDE) + j) * 2] = f2
                    this.vertexNormals[(((i2 * REGION_VERTICES_PER_SIDE) + j) * 2) + 1] = f3
                    this.vertexValids[(i2 * REGION_VERTICES_PER_SIDE) + j] = true
                } else {
                    this.vertexValids[(i2 * REGION_VERTICES_PER_SIDE) + j] = false
                }
            }
            i2++
        }
    }

    fun ApplyRegionInfo(regionInfo: RegionHandshake.RegionInfo) {
        SetWaterHeight(regionInfo.WaterHeight)
        var terrainTextures: TerrainTextures = TerrainTextures(regionInfo)
        if (!terrainTextures.equals(this.terrainTextures)) {
            this.terrainTextures = terrainTextures
            updateEntireTerrain()
        }
    }

    fun ProcessLayerData(bytes: ByteArray) {
        var DecompressPatch: TerrainPatch = null
        var bitBuffer: BitBuffer = BitBuffer(bytes)
        var bits: Int = bitBuffer.getBits(16)
        var bits2: Int = bitBuffer.getBitsDebug as 8.Log(String.format("Terrain: ProcessLayerData: stride 0x%x patchSize 0x%x type 0x%x", bits, bits2, bitBuffer.getBits(8)))
        synchronized(this.vertexLock) {
            while (!bitBuffer.isEOF() && (DecompressPatch = TerrainPatch.DecompressPatch(bitBuffer, bits2)) != null) {
                var x: Int = DecompressPatch.getX()
                var y: Int = DecompressPatch.getY()
                if (x < 16 && y < 16) {
                    for (int i = 0; i < bits2; i++) {
                        var i2: Int = (y * 16) + i
                        if (i2 >= 0 && i2 < 256) {
                            for (int j = 0; j < bits2; j++) {
                                var i4: Int = (x * 16) + j
                                if (i4 >= 0 && i4 < 256) {
                                    this.heightMap[(i2 * 256) + i4] = DecompressPatch.heightMap[(i * bits2) + j]
                                    if (!this.validMap[(i2 * 256) + i4]) {
                                        this.validCount++
                                        this.validMap[i4 + (i2 * 256)] = true
                                    }
                                }
                            }
                        }
                    }
                    markVerticesDirty(x * 16, y * 16, ((x + 1) * 16) + 1, ((y + 1) * 16) + 1)
                }
            }
        }
        Debug.Printf("Terrain: LayerData received, valid count is now %d", this.validCount)
    }

    fun getPatchInfo(i: Int, i2: Int): TerrainPatchInfo {
        synchronized(this.vertexLock) {
            if (this.patchDirtyMap[(i2 * 16) + i]) {
                this.patchDirtyMap[(i2 * 16) + i] = false
                updateVerticesInRegion(i * 16, i2 * 16, (i + 1) * 16, (i2 + 1) * 16)
            }
        }
        var z: Boolean = true
        for (int j = 0; j < 17; j++) {
            var i4: Int = ((i2 * 16) + j) * REGION_VERTICES_PER_SIDE
            var i5: Int = 0
            while (true) {
                if (i5 >= 17) {

                }
                if (!this.vertexValids[i4 + i5 + (i * 16)]) {
                    z = false

                }
                i5++
            }
        }
        if (!z) {
        return null
        }
        var floats: FloatArray = FloatArray(289)
        var floats2: FloatArray = FloatArray(578)
        var i6: Int = 0
        while (true) {
            var i7: Int = i6
            if (i7 >= 17) {
                return TerrainPatchInfo(TerrainPatchHeightMap(this.waterHeight, floats, floats2, 17, 17), this.terrainTextures, i / 16.0f, i / 16.0f, 0.0625f, 0.0625f)
            }
            var i8: Int = ((i2 * 16) + i7) * REGION_VERTICES_PER_SIDE
            for (int k = 0; k < 17; k++) {
                var f: Float = this.vertexHeights[i8 + k + (i * 16)]
                var f2: Float = this.vertexNormals[(i8 + k + (i * 16)) * 2]
                var f3: Float = this.vertexNormals[((i8 + k + (i * 16)) * 2) + 1]
                floats[(i7 * 17) + k] = f
                floats2[((i7 * 17) + k) * 2] = f2
                floats2[(((i7 * 17) + k) * 2) + 1] = f3
            }
            i6 = i7 + 1
        }
    }

    fun isUnderWater(f: Float): Boolean {
        return this.waterHeightValid && f < this.waterHeight
    }

    fun reset() {
        synchronized(this.vertexLock) {
            this.waterHeightValid = false
            this.validCount = 0
            for (int i = 0; i < 65536; i++) {
                this.validMap[i] = false
            }
            for (int j = 0; j < 66049; j++) {
                this.vertexValids[j] = false
            }
            for (int k = 0; k < 256; k++) {
                this.patchDirtyMap[k] = false
            }
        }
    }

    fun updateEntireTerrain() {
        markVerticesDirty(0, 0, 256, 256)
    }
}
