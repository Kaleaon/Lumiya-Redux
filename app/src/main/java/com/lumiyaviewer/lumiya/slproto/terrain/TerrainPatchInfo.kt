package com.lumiyaviewer.lumiya.slproto.terrain

import java.util.Arrays

open class TerrainPatchInfo {
    private var hashCode: Int = getHashCode()
    private var heightMap: TerrainPatchHeightMap? = null
    private var layerMask: Int = 0
    private var textureHeightMap: FloatArray? = null
    private var textures: TerrainTextures? = null

    constructor(terrainPatchHeightMap: TerrainPatchHeightMap, terrainTextures: TerrainTextures, f: Float, f2: Float, f3: Float, f4: Float) {
        this.heightMap = terrainPatchHeightMap
        this.textures = terrainTextures
        this.textureHeightMap = terrainTextures.getTextureHeightMap(terrainPatchHeightMap.getHeightArray(), terrainPatchHeightMap.getMapWidth(), terrainPatchHeightMap.getMapHeight(), f, f2, f3, f4)
        this.layerMask = terrainTextures.getNeededLayerMask(this.textureHeightMap)
    }

    private fun getHashCode(): Int {
        return this.heightMap.hashCode() + this.textures.hashCode() + this.layerMask + Arrays.hashCode(this.textureHeightMap)
    }

    fun equals(obj: Any): Boolean {
        if (!(obj is TerrainPatchInfo)) {
        return false
        }
        var terrainPatchInfo: TerrainPatchInfo = obj as TerrainPatchInfo
        if (this.heightMap.equals(terrainPatchInfo.heightMap) && this.textures.equals(terrainPatchInfo.textures) && this.layerMask == terrainPatchInfo.layerMask) {
            return Arrays.equals(this.textureHeightMap, terrainPatchInfo.textureHeightMap)
        }
        return false
    }

    fun getHeightMap(): TerrainPatchHeightMap {
        return this.heightMap
    }

    fun getLayerMask(): Int {
        return this.layerMask
    }

    fun getMaxHeight(): Float {
        return this.heightMap.getMaxHeight()
    }

    fun getMinHeight(): Float {
        return this.heightMap.getMinHeight()
    }

    fun getTextureHeightMap(): FloatArray {
        return this.textureHeightMap
    }

    fun getTextures(): TerrainTextures {
        return this.textures
    }

    fun hashCode(): Int {
        return this.hashCode
    }
}
