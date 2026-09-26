package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.utils.InlineList

class SpatialTree(
    private val numBins: Int,
    sizeX: Float,
    sizeY: Float,
    sizeZ: Float,
    val spatialObjectIndex: SpatialObjectIndex
) {
    private val bins = arrayOfNulls<SpatialTreeNode>(numBins)
    private val rootNode = SpatialTreeNode(this, sizeX, sizeY, sizeZ)
    private var drawDistance = 1.0f
    private var treeWalkNeeded = false
    private var drawListChanged = false
    private val depthBuf = FloatArray(1)
    private val myAvatarTreeNode = MyAvatarTreeNode(this)

    private fun getNodeForObject(drawListEntry: DrawListEntry): InlineList<DrawListEntry> {
        return if (drawListEntry is DrawListAvatarEntry && drawListEntry.objectAvatarInfo.isMyAvatar) {
            myAvatarTreeNode
        } else {
            rootNode.findNode(drawListEntry.boundingBox)
        }
    }

    private fun setEntryBin(spatialTreeNode: SpatialTreeNode, newBin: Int) {
        if (newBin != spatialTreeNode.depthBin) {
            if (spatialTreeNode.depthBin != INVALID_BIN) {
                if (spatialTreeNode.prevDepth != null) {
                    spatialTreeNode.prevDepth!!.nextDepth = spatialTreeNode.nextDepth
                } else {
                    bins[spatialTreeNode.depthBin] = spatialTreeNode.nextDepth
                }
                if (spatialTreeNode.nextDepth != null) {
                    spatialTreeNode.nextDepth!!.prevDepth = spatialTreeNode.prevDepth
                }
                spatialTreeNode.prevDepth = null
                spatialTreeNode.nextDepth = null
            }
            if (newBin != INVALID_BIN) {
                spatialTreeNode.nextDepth = bins[newBin]
                spatialTreeNode.prevDepth = null
                if (spatialTreeNode.nextDepth != null) {
                    spatialTreeNode.nextDepth!!.prevDepth = spatialTreeNode
                }
                bins[newBin] = spatialTreeNode
            }
            spatialTreeNode.depthBin = newBin
            if (spatialTreeNode.first != null) {
                setDrawListChanged()
            }
        }
    }

    fun addDrawables(drawList: DrawList) {
        Debug.Printf("SpatialTree: adding drawables.")
        myAvatarTreeNode.addDrawables(drawList)
        for (bin in bins) {
            var node = bin
            while (node != null) {
                node.addDrawables(drawList)
                node = node.nextDepth
            }
        }
        drawListChanged = false
    }

    fun isDrawListChanged(): Boolean = drawListChanged

    fun isTreeWalkNeeded(): Boolean = treeWalkNeeded

    fun removeEntry(spatialTreeNode: SpatialTreeNode) {
        setEntryBin(spatialTreeNode, INVALID_BIN)
    }

    fun removeObject(drawListEntry: DrawListEntry) {
        val list = drawListEntry.list
        list?.removeEntry(drawListEntry)
    }

    fun setDrawListChanged() {
        drawListChanged = true
    }

    fun setEntryDepth(spatialTreeNode: SpatialTreeNode, distance: Float) {
        val round = Math.round((numBins * distance) / drawDistance)
        setEntryBin(spatialTreeNode, when {
            round < 0 -> 0
            round >= numBins -> numBins - 1
            else -> round
        })
    }

    fun setTreeWalkNeeded() {
        treeWalkNeeded = true
    }

    fun updateObject(drawListEntry: DrawListEntry) {
        val nodeForObject = getNodeForObject(drawListEntry)
        val list = drawListEntry.list
        if (nodeForObject !== list && list != null) {
            list.removeEntry(drawListEntry)
        }
        nodeForObject.addEntry(drawListEntry)
    }

    fun walkTree(frustrumPlanes: FrustrumPlanes, drawDistance: Float) {
        Debug.Printf("SpatialTree: walkTree: starting to walk.")
        this.drawDistance = drawDistance
        rootNode.walkTree(frustrumPlanes, 1, depthBuf)
        treeWalkNeeded = false
    }

    companion object {
        const val INVALID_BIN = -1
    }
}
