package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.utils.InlineList
import com.lumiyaviewer.lumiya.utils.InlineListEntry

abstract class DrawListEntry : InlineListEntry<DrawListEntry> {
    @JvmField
    val boundingBox = FloatArray(6)

    @Volatile
    private var list: InlineList<DrawListEntry>? = null
    private var next: DrawListEntry? = null
    private var prev: DrawListEntry? = null

    abstract fun addToDrawList(drawList: DrawList)

    override fun getList(): InlineList<DrawListEntry>? = list

    override fun getNext(): DrawListEntry? = next

    override fun getPrev(): DrawListEntry? = prev

    override fun requestEntryRemoval() {
        list?.requestEntryRemoval(this)
    }

    override fun setList(list: InlineList<DrawListEntry>?) {
        this.list = list
    }

    override fun setNext(next: DrawListEntry?) {
        this.next = next
    }

    override fun setPrev(previous: DrawListEntry?) {
        this.prev = previous
    }
}
