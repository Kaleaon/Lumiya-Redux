package com.lumiyaviewer.lumiya.res.executors

import java.util.concurrent.ScheduledThreadPoolExecutor

class ResourceCleanupExecutor : ScheduledThreadPoolExecutor(
    1,
    { runnable -> Thread(runnable, "ResourceCleanup") }
) {
    private object InstanceHolder {
        @JvmField
        val Instance = ResourceCleanupExecutor()
    }

    companion object {
        @JvmStatic
        fun getInstance(): ResourceCleanupExecutor = InstanceHolder.Instance
    }
}
