package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.utils.InlineList

class MyAvatarTreeNode internal constructor(private val spatialTree: SpatialTree) : InlineList<DrawListEntry>() {

    fun addDrawables(drawList: DrawList) {
        var entry = first
        while (entry != null) {
            entry.addToDrawList(drawList)
            entry = entry.getNext()
        }
    }

    override fun addEntry(drawListEntry: DrawListEntry) {
        super.addEntry(drawListEntry)
        spatialTree.setDrawListChanged()
    }

    override fun removeEntry(drawListEntry: DrawListEntry) {
        super.removeEntry(drawListEntry)
        spatialTree.setDrawListChanged()
    }

    override fun requestEntryRemoval(drawListEntry: DrawListEntry) {
        spatialTree.spatialObjectIndex.requestEntryRemoval(drawListEntry)
    }
}
