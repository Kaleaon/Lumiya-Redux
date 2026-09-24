package com.lumiyaviewer.lumiya.render.scene

/**
 * A change to the world scene, independent of any renderer.
 *
 * This is the seam between the protocol layer and the renderers described in
 * docs/modernization/viewer_gap_analysis_and_filament_plan.md §4.1: a
 * retained-mode renderer such as Filament consumes scene changes instead of
 * issuing draw calls. Stage F0 has the terrain and environment variants;
 * objects (F2) and avatars (F3) are added with the stages that render them.
 */
sealed class SceneDelta {

    /**
     * One 16 m x 16 m terrain patch. [heights] holds 17 x 17 samples at 1 m
     * spacing, row-major with rows along +Y: sample (col, row) is at region
     * position (patchX * 16 + col, patchY * 16 + row). Edge rows are shared
     * with the neighbouring patches, so patches join without cracks.
     */
    class TerrainPatch(
        val patchX: Int,
        val patchY: Int,
        val heights: FloatArray,
        val waterHeight: Float,
    ) : SceneDelta() {
        init {
            require(patchX in 0 until PATCHES_PER_EDGE && patchY in 0 until PATCHES_PER_EDGE) { "patch ($patchX, $patchY)" }
            require(heights.size == SAMPLES_PER_EDGE * SAMPLES_PER_EDGE) { "heights.size = ${heights.size}" }
        }

        val key: Int get() = patchY * PATCHES_PER_EDGE + patchX

        fun sameHeightsAs(other: TerrainPatch): Boolean =
            patchX == other.patchX && patchY == other.patchY &&
                waterHeight == other.waterHeight && heights.contentEquals(other.heights)

        companion object {
            const val PATCH_SIZE = 16
            const val SAMPLES_PER_EDGE = PATCH_SIZE + 1
            const val PATCHES_PER_EDGE = 16
        }
    }

    /**
     * Sky and sun, in linear RGB. Directions use region axes (X east, Y north,
     * Z up). [sunDirection] points from the scene towards the sun;
     * [sunColor] is black when the sun gives no light (the legacy renderer's
     * rule: the Windlight light is off within 0.1 of the horizon).
     */
    class Environment(
        val sunDirection: FloatArray,
        val sunColor: FloatArray,
        val ambientColor: FloatArray,
        val zenithColor: FloatArray,
        val horizonColor: FloatArray,
    ) : SceneDelta() {
        init {
            for (v in listOf(sunDirection, sunColor, ambientColor, zenithColor, horizonColor)) {
                require(v.size == 3) { "expected 3 components, got ${v.size}" }
            }
        }
    }
}
