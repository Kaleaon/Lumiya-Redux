package com.lumiyaviewer.lumiya.eventbus;

public abstract class EventRateLimiter {
    private final EventBus bus;
    private final long minInterval;
    private final Object lock = new Object();
    private volatile long lastTimeFired = 0;
    private volatile boolean isPending = false;

    protected EventRateLimiter(EventBus eventBus, long minInterval) {
        this.bus = eventBus;
        this.minInterval = minInterval;
    }

    public void fire() {
        synchronized (this.lock) {
            this.isPending = true;
        }
        firePending();
    }

    public void firePending() {
        boolean z = false;
        synchronized (this.lock) {
            if (this.isPending) {
                long currentTimeMillis = System.currentTimeMillis();
                if (currentTimeMillis >= this.lastTimeFired + this.minInterval) {
                    z = true;
                    this.isPending = false;
                    this.lastTimeFired = currentTimeMillis;
                }
            }
        }
        if (z) {
            onActualFire();
            Object eventToFire = getEventToFire();
            if (eventToFire == null || this.bus == null) {
                return;
            }
            this.bus.publish(eventToFire);
        }
    }

    protected abstract Object getEventToFire();

    protected void onActualFire() {
    }
}
