package com.lumiyaviewer.lumiya.slproto.terrain

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.messages.RegionHandshake
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.Arrays
import java.util.UUID

open class TerrainTextures {
    @JvmStatic private var defaultTerrainTextures: Array<UUID> = {UUID.fromString("0bc58228-74a0-7e83-89bc-5c23464bcec5"), UUID.fromString("63338ede-0037-c4fd-855b-015d77112fc8"), UUID.fromString("303cd381-8560-7579-23f1-f0a880799740"), UUID.fromString("53a2f406-4895-1d13-d541-d2e3b86bc19c")}
    private var terrainHeightRange: FloatArray? = null
    private var terrainStartHeight: FloatArray? = null
    private var textureIDs: Array<UUID>? = null

    constructor() {
        this.terrainStartHeight = FloatArraythis as 4.terrainHeightRange = FloatArraythis as 4.textureIDs = arrayOfNulls<UUID>System as 4.arraycopy(defaultTerrainTextures, 0, this.textureIDs, 0, 4)
    }

    constructor(regionInfo: RegionHandshake.RegionInfo) {
        this.terrainStartHeight = FloatArraythis as 4.terrainHeightRange = FloatArray(4)
        var uuidArr: Array<UUID> = arrayOfNulls<UUID>(4)
        uuidArr[0] = regionInfo.TerrainDetail0
        uuidArr[1] = regionInfo.TerrainDetail1
        uuidArr[2] = regionInfo.TerrainDetail2
        uuidArr[3] = regionInfo.TerrainDetail3
        for (int i = 0; i < 4; i++) {
            Debug.Printf("Terrain: texture[%d] = %s", i, uuidArr[i].toString())
            if (uuidArr[i] == null || uuidArr[i].equals(UUIDPool.ZeroUUID)) {
                uuidArr[i] = defaultTerrainTextures[i]
            }
        }
        this.textureIDs = uuidArr
        this.terrainStartHeight[0] = regionInfo.TerrainStartHeight00
        this.terrainStartHeight[1] = regionInfo.TerrainStartHeight01
        this.terrainStartHeight[2] = regionInfo.TerrainStartHeight10
        this.terrainStartHeight[3] = regionInfo.TerrainStartHeight11
        this.terrainHeightRange[0] = regionInfo.TerrainHeightRange00
        this.terrainHeightRange[1] = regionInfo.TerrainHeightRange01
        this.terrainHeightRange[2] = regionInfo.TerrainHeightRange10
        this.terrainHeightRange[3] = regionInfo.TerrainHeightRange11
    }

    private fun bilinearCorners(floats: FloatArray, f: Float, f2: Float): Float {
        return (((floats[0] * f) + (floats[1] * (1.0f - f))) * f2) + (((floats[2] * f) + (floats[3] * (1.0f - f))) * (1.0f - f2))
    }

    fun equals(obj: Any): Boolean {
        if (!(obj is TerrainTextures)) {
        return false
        }
        var terrainTextures: TerrainTextures = obj as TerrainTextures
        if (Arrays.equals(this.textureIDs, terrainTextures.textureIDs) && Arrays.equals(this.terrainStartHeight, terrainTextures.terrainStartHeight)) {
            return Arrays.equals(this.terrainHeightRange, terrainTextures.terrainHeightRange)
        }
        return false
    }

    fun getNeededLayerMask(floats: FloatArray): Int {
        var i: Int = 0
        for (f in floats) {
            var floor: Int = Math as int.floor(f)
            i |= 1 << floor
            if (f - floor != 0.0f) {
                i |= 1 << (floor + 1)
            }
        }
        return i & 15
    }

    fun getTextureHeightMap(floats2: FloatArray, i: Int, i2: Int, f: Float, f2: Float, f3: Float, f4: Float): FloatArray {
        var floats: FloatArray = FloatArray(i * i2)
        for (int j = 0; j < i2; j++) {
            var f5: Float = j / (i2 - 1)
            for (int k = 0; k < i; k++) {
                var f6: Float = k / (i - 1)
                floats[(j * i) + k] = Math.min(3.0f, Math.max(0.0f, ((floats2[(j * i) + k] - bilinearCorners(this.terrainStartHeight, (f6 * f3) + f, (f5 * f4) + f2)) * 4.0f) / bilinearCorners(this.terrainHeightRange, (f6 * f3) + f, (f5 * f4) + f2)))
            }
        }
        return floats
    }

    fun getTextureUUID(i: Int): UUID {
        return this.textureIDs[i]
    }

    fun hashCode(): Int {
        return Arrays.hashCode(this.textureIDs) + Arrays.hashCode(this.terrainStartHeight) + Arrays.hashCode(this.terrainHeightRange)
    }
}
