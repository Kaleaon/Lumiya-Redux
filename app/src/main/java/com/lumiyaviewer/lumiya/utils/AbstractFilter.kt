package com.lumiyaviewer.lumiya.utils

/** Java-compatible predicate retained for recovered call sites. */
fun interface AbstractFilter<T> {
    fun passFilter(value: T): Boolean
}
