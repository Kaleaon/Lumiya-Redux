package com.lumiyaviewer.lumiya.utils

/** Supplies either the normal or alternate view of a list. */
interface HasList<V> {
    fun getList(alternate: Boolean): List<V>
}
