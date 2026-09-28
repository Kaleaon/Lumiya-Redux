package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.utils.InlineList

open class SpatialTreeNode : InlineList<DrawListEntry> {
    private var children: Array<SpatialTreeNode?>? = null
    var depthBin: Int = -1
    private val indexInParent: Int
    private val leaf: Boolean
    var nextDepth: SpatialTreeNode? = null
    private val parent: SpatialTreeNode?
    val position: FloatArray
    var prevDepth: SpatialTreeNode? = null
    private var singleChild: SpatialTreeNode? = null
    private val spatialTree: SpatialTree
    private val splitAxis: Int

    constructor(spatialTree: SpatialTree, f: Float, f2: Float, f3: Float) {
        this.spatialTree = spatialTree
        this.position = floatArrayOf(0.0f, 0.0f, 0.0f, f, f2, f3, 0.0f, 0.0f, 0.0f, f, f2, f3)
        this.leaf = false
        this.parent = null
        this.indexInParent = 0
        this.splitAxis = longestAxis()
    }

    constructor(spatialTreeNode: SpatialTreeNode, indexInParent: Int) {
        this.spatialTree = spatialTreeNode.spatialTree
        this.position = FloatArray(12)
        this.parent = spatialTreeNode
        this.indexInParent = indexInParent
        var z = true
        for (i2 in 0 until 3) {
            var f = spatialTreeNode.position[i2 + 6]
            var f2 = spatialTreeNode.position[i2 + 9] - f
            if (i2 == spatialTreeNode.splitAxis) {
                f2 /= MIN_SIZE
                f += (f2 / MIN_SIZE) * indexInParent
            }
            this.position[i2 + 6] = f
            this.position[i2 + 9] = f + f2
            this.position[i2] = (f2 / MIN_SIZE) + f
            this.position[i2 + 3] = f + (f2 / MIN_SIZE)
            if (f2 > MIN_SIZE) z = false
        }
        this.leaf = z
        this.splitAxis = longestAxis()
    }

    private fun enlargeForBoundingBox(z: Boolean, floats: FloatArray) {
        if (parent != null) {
            var z2 = false
            for (i in 0 until 3) {
                if (z || floats[i] < position[i]) {
                    position[i] = floats[i]
                    z2 = true
                }
                if (z || floats[i + 3] > position[i + 3]) {
                    position[i + 3] = floats[i + 3]
                    z2 = true
                }
            }
            if (z2) {
                spatialTree.setTreeWalkNeeded()
                parent.enlargeForBoundingBox(false, position)
            }
        }
    }

    private fun isEmpty(): Boolean {
        return getFirst() == null && children == null
    }

    private fun longestAxis(): Int {
        var i = 0
        var f = 0.0f
        var i2 = 0
        while (i < 3) {
            var f2 = position[i + 9] - position[i + 6]
            if (f2 > f) {
                i2 = i
            } else {
                f2 = f
            }
            i++
            f = f2
        }
        return i2
    }

    private fun removeFromParent() {
        spatialTree.removeEntry(this)
        if (parent == null || parent.children == null) {
            return
        }
        parent.children!![indexInParent] = null
        if (parent.singleChild === this) {
            parent.singleChild = null
            parent.children = null
            if (parent.isEmpty()) {
                parent.removeFromParent()
                return
            } else {
                parent.shrinkBoundingBox()
                return
            }
        }
        var i = 0
        var spatialTreeNode: SpatialTreeNode? = null
        while (true) {
            if (i >= 3) {
                break
            }
            if (parent.children!![i] != null) {
                if (spatialTreeNode != null) {
                    spatialTreeNode = null
                    break
                }
                spatialTreeNode = parent.children!![i]
            }
            i++
        }
        parent.singleChild = spatialTreeNode
        if (parent.getFirst() == null) {
            spatialTree.removeEntry(parent)
        }
        parent.shrinkBoundingBox()
    }

    private fun shrinkBoundingBox() {
        if (parent != null) {
            val floats = FloatArray(6)
            var first = getFirst()
            var z3 = false
            while (first != null) {
                for (i in 0 until 3) {
                    floats[i] = if (z3) Math.min(floats[i], first.boundingBox[i]) else first.boundingBox[i]
                    floats[i + 3] = if (z3) Math.max(floats[i + 3], first.boundingBox[i + 3]) else first.boundingBox[i + 3]
                }
                first = first.getNext()
                z3 = true
            }
            if (children != null) {
                for (spatialTreeNode in children!!) {
                    if (spatialTreeNode != null) {
                        for (j in 0 until 3) {
                            floats[j] = if (z3) Math.min(floats[j], spatialTreeNode.position[j]) else spatialTreeNode.position[j]
                            floats[j + 3] = if (z3) Math.max(floats[j + 3], spatialTreeNode.position[j + 3]) else spatialTreeNode.position[j + 3]
                        }
                        z3 = true
                    }
                }
            }
            if (z3) {
                var z2 = true
                var i4 = 0
                while (true) {
                    if (i4 >= 6) {
                        z2 = false
                        break
                    } else if (position[i4] != floats[i4]) {
                        break
                    } else {
                        i4++
                    }
                }
                if (z2) {
                    System.arraycopy(floats, 0, position, 0, 6)
                    parent.shrinkBoundingBox()
                    spatialTree.setTreeWalkNeeded()
                }
            }
        }
    }

    fun addDrawables(drawList: DrawList) {
        var first = getFirst()
        while (first != null) {
            first.addToDrawList(drawList)
            first = first.getNext()
        }
    }

    override fun addEntry(drawListEntry: DrawListEntry) {
        val z = getFirst() == null && children == null
        val z2 = singleChild != null
        if (drawListEntry.getList() === this) {
            shrinkBoundingBox()
            return
        }
        super.addEntry(drawListEntry)
        enlargeForBoundingBox(z, drawListEntry.boundingBox)
        if (z || z2) {
            spatialTree.setTreeWalkNeeded()
        }
        if (depthBin != -1) {
            spatialTree.setDrawListChanged()
        }
    }

    protected fun findNode(floats: FloatArray): SpatialTreeNode {
        if (leaf) {
            return this
        }
        var f2 = Float.POSITIVE_INFINITY
        var i3 = -1
        for (i2 in 0 until 3) {
            val f3 = (position[(splitAxis + 6) + 3] - position[splitAxis + 6]) / MIN_SIZE
            val f4 = position[splitAxis + 6] + ((f3 / MIN_SIZE) * i2)
            if (floats[splitAxis] < f4 || floats[splitAxis + 3] > f4 + f3) {
                // doesn't fit
            } else {
                val f = Math.abs(((f3 / MIN_SIZE) + f4) - ((floats[splitAxis] + floats[splitAxis + 3]) / MIN_SIZE))
                if (f < f2) {
                    f2 = f
                    i3 = i2
                }
            }
        }
        if (i3 == -1) {
            return this
        }
        var z = false
        if (children == null) {
            children = arrayOfNulls(3)
            z = true
        }
        if (children!![i3] == null) {
            children!![i3] = SpatialTreeNode(this, i3)
            if (z) {
                singleChild = children!![i3]
            } else {
                singleChild = null
            }
        }
        return children!![i3]!!.findNode(floats)
    }

    override fun removeEntry(drawListEntry: DrawListEntry) {
        super.removeEntry(drawListEntry)
        if (depthBin != -1) {
            spatialTree.setDrawListChanged()
        }
        if (getFirst() == null) {
            spatialTree.removeEntry(this)
            if (isEmpty()) {
                removeFromParent()
                return
            }
        }
        shrinkBoundingBox()
    }

    override fun requestEntryRemoval(drawListEntry: DrawListEntry) {
        spatialTree.spatialObjectIndex.requestEntryRemoval(drawListEntry)
    }

    fun walkTree(frustrumPlanes: FrustrumPlanes, i: Int, floats: FloatArray): Int {
        if (singleChild != null && getFirst() == null) {
            return singleChild!!.walkTree(frustrumPlanes, i, floats)
        }
        var testResult = i
        if (testResult != -1) {
            testResult = frustrumPlanes.testBoundingBox(position, floats)
        }
        val i2: Int
        if (testResult == -1) {
            spatialTree.removeEntry(this)
            i2 = 0
        } else {
            i2 = 1
            if (first != null) {
                spatialTree.setEntryDepth(this, floats[0])
            } else {
                spatialTree.removeEntry(this)
            }
        }
        var count = i2
        if (children != null) {
            for (spatialTreeNode in children!!) {
                if (spatialTreeNode != null) {
                    count += spatialTreeNode.walkTree(frustrumPlanes, testResult, floats)
                }
            }
        }
        return count
    }

    companion object {
        private const val MIN_SIZE = 2.0f
    }
}
