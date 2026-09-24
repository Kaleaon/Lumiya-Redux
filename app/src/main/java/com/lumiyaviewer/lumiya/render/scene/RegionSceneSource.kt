package com.lumiyaviewer.lumiya.render.scene

import com.lumiyaviewer.lumiya.slproto.terrain.TerrainData
import com.lumiyaviewer.lumiya.slproto.windlight.WindlightPreset
import kotlin.math.abs
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.sqrt

/** Builds [SceneDelta]s from the viewer's region state. */
object RegionSceneSource {

    /** Every terrain patch of the region whose heights are known. */
    @JvmStatic
    fun terrainDeltas(terrainData: TerrainData): List<SceneDelta.TerrainPatch> {
        val out = ArrayList<SceneDelta.TerrainPatch>()
        for (y in 0 until SceneDelta.TerrainPatch.PATCHES_PER_EDGE) {
            for (x in 0 until SceneDelta.TerrainPatch.PATCHES_PER_EDGE) {
                val info = terrainData.getPatchInfo(x, y) ?: continue
                val heightMap = info.heightMap
                if (heightMap.mapWidth != SceneDelta.TerrainPatch.SAMPLES_PER_EDGE ||
                    heightMap.mapHeight != SceneDelta.TerrainPatch.SAMPLES_PER_EDGE
                ) {
                    continue
                }
                out.add(SceneDelta.TerrainPatch(x, y, heightMap.heightArray.copyOf(), heightMap.waterHeight))
            }
        }
        return out
    }

    /**
     * Sky and sun from an (interpolated) Windlight preset. Windlight's
     * lightnorm is in GL axes; the legacy renderer lights prims along
     * (x, z, -y) of it (BasicPrimProgram.SetupLighting), so the direction
     * towards the sun is (-x, -z, y). Both renderers use the same mapping so
     * they can be compared image to image.
     */
    @JvmStatic
    fun environmentDelta(preset: WindlightPreset): SceneDelta.Environment {
        val ln = preset.lightnorm
        val sun = normalized(floatArrayOf(-ln[0], -ln[2], ln[1]))
        val sunLights = abs(ln[1]) > 0.1f
        return SceneDelta.Environment(
            sunDirection = sun,
            sunColor = if (sunLights) rgb(preset.sunlight_color) else floatArrayOf(0f, 0f, 0f),
            ambientColor = rgb(preset.ambient),
            zenithColor = rgb(preset.blue_density),
            horizonColor = rgb(preset.blue_horizon),
        )
    }

    /**
     * Rolling hills for when no region is loaded, so the screen can be
     * checked without logging in. Deterministic; heights 20-45 m around
     * water at 20 m.
     */
    @JvmStatic
    fun demoTerrain(): List<SceneDelta.TerrainPatch> {
        val n = SceneDelta.TerrainPatch.SAMPLES_PER_EDGE
        val out = ArrayList<SceneDelta.TerrainPatch>()
        for (py in 0 until SceneDelta.TerrainPatch.PATCHES_PER_EDGE) {
            for (px in 0 until SceneDelta.TerrainPatch.PATCHES_PER_EDGE) {
                val heights = FloatArray(n * n)
                for (row in 0 until n) {
                    for (col in 0 until n) {
                        val x = (px * 16 + col).toDouble()
                        val y = (py * 16 + row).toDouble()
                        val h = 30.0 + 8.0 * sin(x / 23.0) * cos(y / 31.0) + 4.0 * sin((x + y) / 11.0) +
                            6.0 * cos(x / 57.0 - y / 43.0)
                        heights[row * n + col] = h.toFloat()
                    }
                }
                out.add(SceneDelta.TerrainPatch(px, py, heights, 20f))
            }
        }
        return out
    }

    private fun rgb(v: FloatArray) = floatArrayOf(v[0], v[1], v[2])

    private fun normalized(v: FloatArray): FloatArray {
        val len = sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2])
        return if (len < 1e-6f) floatArrayOf(0f, 0f, 1f) else floatArrayOf(v[0] / len, v[1] / len, v[2] / len)
    }
}
