package com.lumiyaviewer.lumiya.render.spatial

open class SpatialListEntry<T>(@JvmField val data: T) {
    @JvmField internal var node: SpatialTreeNode? = null
    @JvmField internal var next: SpatialListEntry<T>? = null
    @JvmField internal var prev: SpatialListEntry<T>? = null
    fun getNext(): SpatialListEntry<T>? = next
}
