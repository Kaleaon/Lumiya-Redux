package com.lumiyaviewer.lumiya.utils

open class InlineList<T : InlineListEntry<T>> {
    private var first: T? = null

    open fun addEntry(t: T) {
        val list = t.list
        if (list !== this) {
            list?.removeEntry(t)
            t.next = this.first
            t.prev = null
            this.first?.prev = t
            this.first = t
            t.list = this
        }
    }

    fun getFirst(): T? = first

    fun removeEntry(t: T) {
        if (t.list === this) {
            val next = t.next
            val prev = t.prev
            if (prev != null) {
                prev.next = next
            } else {
                this.first = next
            }
            next?.prev = prev
            t.prev = null
            t.next = null
            t.list = null
        }
    }

    open fun requestEntryRemoval(t: T) {
    }
}
