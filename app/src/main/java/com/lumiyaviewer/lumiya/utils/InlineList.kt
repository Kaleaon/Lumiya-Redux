package com.lumiyaviewer.lumiya.utils

open class InlineList<T : InlineListEntry<T>> {
    private var first: T? = null

    open fun addEntry(t: T) {
        val list = t.getList()
        if (list !== this) {
            list?.removeEntry(t)
            t.setNext(this.first)
            t.setPrev(null)
            this.first?.setPrev(t)
            this.first = t
            t.setList(this)
        }
    }

    fun getFirst(): T? = first

    fun removeEntry(t: T) {
        if (t.getList() === this) {
            val next = t.getNext()
            val prev = t.getPrev()
            if (prev != null) {
                prev.setNext(next)
            } else {
                this.first = next
            }
            next?.setPrev(prev)
            t.setPrev(null)
            t.setNext(null)
            t.setList(null)
        }
    }

    open fun requestEntryRemoval(t: T) {
    }
}
