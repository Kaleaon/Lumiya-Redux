package com.lumiyaviewer.lumiya.res.executors

import com.lumiyaviewer.lumiya.GlobalOptions
import java.util.concurrent.PriorityBlockingQueue

class HTTPFetchExecutor private constructor() : WeakExecutor(
    "ResourceHTTPFetch",
    GlobalOptions.getInstance().maxTextureDownloads,
    PriorityBlockingQueue()
) {
    private object InstanceHolder {
        @JvmField
        val Instance = HTTPFetchExecutor()
    }

    companion object {
        @JvmStatic
        fun getInstance(): HTTPFetchExecutor = InstanceHolder.Instance
    }
}
