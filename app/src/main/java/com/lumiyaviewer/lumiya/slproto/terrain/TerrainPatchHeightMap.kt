package com.lumiyaviewer.lumiya.slproto.terrain

import com.google.common.primitives.Floats
import java.util.Arrays

open class TerrainPatchHeightMap {
    private var hashCode: Int = 0
    private var heightMap: FloatArray? = null
    private var mapHeight: Int = 0
    private var mapWidth: Int = 0
    private var normalMap: FloatArray? = null
    private var waterHeight: Float = 0.0f

    constructor(waterHeight: Float, floats: FloatArray, floats2: FloatArray, mapWidth: Int, mapHeight: Int) {
        this.waterHeight = waterHeight
        this.mapWidth = mapWidth
        this.mapHeight = mapHeight
        this.heightMap = FloatArray(floats.length)
        System.arraycopy(floats, 0, this.heightMap, 0, floats.length)
        this.normalMap = FloatArray(floats2.length)
        System.arraycopy(floats2, 0, this.normalMap, 0, floats2.length)
        this.hashCode = getHashCode()
    }

    private fun getHashCode(): Int {
        return Float.floatToIntBits(this.waterHeight) + 0 + Arrays.hashCode(this.heightMap) + Arrays.hashCode(this.normalMap) + this.mapWidth + this.mapHeight
    }

    fun equals(obj: Any): Boolean {
        if (!(obj is TerrainPatchHeightMap)) {
        return false
        }
        var terrainPatchHeightMap: TerrainPatchHeightMap = obj as TerrainPatchHeightMap
        if (terrainPatchHeightMap.waterHeight == this.waterHeight && terrainPatchHeightMap.mapWidth == this.mapWidth && terrainPatchHeightMap.mapHeight == this.mapHeight && Arrays.equals(terrainPatchHeightMap.heightMap, this.heightMap)) {
            return Arrays.equals(terrainPatchHeightMap.normalMap, this.normalMap)
        }
        return false
    }

    fun getHeightArray(): FloatArray {
        return this.heightMap
    }

    fun getMapHeight(): Int {
        return this.mapHeight
    }

    fun getMapWidth(): Int {
        return this.mapWidth
    }

    fun getMaxHeight(): Float {
        return Floats.max(this.heightMap)
    }

    fun getMinHeight(): Float {
        return Floats.min(this.heightMap)
    }

    fun getNormalArray(): FloatArray {
        return this.normalMap
    }

    fun getWaterHeight(): Float {
        return this.waterHeight
    }

    fun hashCode(): Int {
        return this.hashCode
    }
}
