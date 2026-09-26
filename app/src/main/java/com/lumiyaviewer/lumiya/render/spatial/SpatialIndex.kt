package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.terrain.TerrainData
import java.lang.ref.WeakReference

class SpatialIndex private constructor() {
    @Volatile
    private var indexHolder: WeakReference<Any>? = null

    @Volatile
    private var objectIndex: SpatialObjectIndex? = null

    private object InstanceHolder {
        val instance = SpatialIndex()
    }

    @Synchronized
    fun DisableObjectIndex(obj: Any?) {
        val currentObjectIndex = objectIndex
        val heldObject = indexHolder?.get()
        if (currentObjectIndex != null && (heldObject === obj || heldObject == null)) {
            currentObjectIndex.disableIndex()
        }
        indexHolder = null
        objectIndex = null
    }

    @Synchronized
    fun EnableObjectIndex(spatialObjectIndex: SpatialObjectIndex, obj: Any?): SpatialObjectIndex {
        objectIndex = spatialObjectIndex
        indexHolder = WeakReference(obj)
        return spatialObjectIndex
    }

    fun getDrawableAvatar(objectInfo: SLObjectInfo): DrawableAvatar? {
        return objectIndex?.getDrawableAvatar(objectInfo)
    }

    @Synchronized
    fun getObjectIndex(): SpatialObjectIndex? = objectIndex

    fun setAvatarCountLimit(avatarCountLimit: Int) {
        objectIndex?.setAvatarCountLimit(avatarCountLimit)
    }

    fun updateTerrainPatch(x: Int, y: Int, terrainData: TerrainData) {
        objectIndex?.updateTerrainPatch(x, y, terrainData)
    }

    companion object {
        @JvmStatic
        fun getInstance(): SpatialIndex = InstanceHolder.instance
    }
}
