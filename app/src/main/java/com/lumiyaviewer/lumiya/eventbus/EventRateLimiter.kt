package com.lumiyaviewer.lumiya.eventbus

abstract class EventRateLimiter(
    private val bus: EventBus?,
    private val minInterval: Long
) {
    private val lock = Any()

    @Volatile
    private var lastTimeFired: Long = 0

    @Volatile
    private var isPending: Boolean = false

    fun fire() {
        synchronized(lock) {
            isPending = true
        }
        firePending()
    }

    fun firePending() {
        var shouldFire = false
        synchronized(lock) {
            if (isPending) {
                val currentTimeMillis = System.currentTimeMillis()
                if (currentTimeMillis >= lastTimeFired + minInterval) {
                    shouldFire = true
                    isPending = false
                    lastTimeFired = currentTimeMillis
                }
            }
        }
        if (shouldFire) {
            onActualFire()
            val eventToFire = getEventToFire() ?: return
            bus?.publish(eventToFire)
        }
    }

    protected abstract fun getEventToFire(): Any?

    protected open fun onActualFire() {}
}
