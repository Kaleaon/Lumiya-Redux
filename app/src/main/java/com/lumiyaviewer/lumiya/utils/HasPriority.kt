package com.lumiyaviewer.lumiya.utils

/**
 * Supplies the queue priority used by the viewer's resource executors.
 *
 * Declaring this as a Kotlin property keeps the existing JVM `getPriority()`
 * contract, so recovered Java callers and implementations remain binary and
 * source compatible while new Kotlin code gets idiomatic property access.
 */
interface HasPriority {
    val priority: Int
}
