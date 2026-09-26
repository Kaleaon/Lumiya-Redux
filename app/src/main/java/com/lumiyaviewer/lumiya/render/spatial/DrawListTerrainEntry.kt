package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.render.terrain.DrawableTerrainPatch
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainPatchInfo
import java.lang.ref.WeakReference

class DrawListTerrainEntry(
    private var patchInfo: TerrainPatchInfo,
    private val patchX: Int,
    private val patchY: Int
) : DrawListEntry() {
    @Volatile
    private var drawablePatch: WeakReference<DrawableTerrainPatch>? = null

    init {
        updatePatchInfo(patchInfo)
    }

    override fun addToDrawList(drawList: DrawList) {
        var drawableTerrainPatch = drawablePatch?.get()
        if (drawableTerrainPatch == null) {
            drawableTerrainPatch = DrawableTerrainPatch(
                drawList.drawableStore.terrainGeometryCache,
                drawList.drawableStore.glTerrainTextureCache,
                patchInfo,
                patchX,
                patchY
            )
            drawablePatch = WeakReference(drawableTerrainPatch)
        }
        drawList.terrain.add(drawableTerrainPatch)
    }

    fun updatePatchInfo(terrainPatchInfo: TerrainPatchInfo) {
        patchInfo = terrainPatchInfo
        val bounds = computeBoundingBox(patchX, patchY, terrainPatchInfo.minHeight, terrainPatchInfo.maxHeight)
        bounds.copyInto(boundingBox)
        drawablePatch = null
    }

    companion object {
        private const val PATCH_SIZE = 16

        /**
         * Pure terrain-patch bounding box computation, independent of any
         * Android/GL state: the world-space AABB of a 16x16 terrain patch
         * given its grid coordinates and height range.
         */
        @JvmStatic
        fun computeBoundingBox(patchX: Int, patchY: Int, minHeight: Float, maxHeight: Float): FloatArray = floatArrayOf(
            (patchX * PATCH_SIZE).toFloat(),
            (patchY * PATCH_SIZE).toFloat(),
            minHeight,
            ((patchX + 1) * PATCH_SIZE).toFloat(),
            ((patchY + 1) * PATCH_SIZE).toFloat(),
            maxHeight
        )
    }
}
