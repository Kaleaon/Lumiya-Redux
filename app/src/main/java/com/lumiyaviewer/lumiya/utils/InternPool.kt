package com.lumiyaviewer.lumiya.utils

import java.lang.ref.WeakReference
import java.util.WeakHashMap

open class InternPool<T> {
    private val pool = WeakHashMap<T, WeakReference<T>>()
    @Synchronized fun intern(value: T): T {
        pool[value]?.get()?.let { return it }
        pool[value] = WeakReference(value)
        return value
    }
}
