package com.lumiyaviewer.lumiya.slproto.https

import java.util.concurrent.ExecutorService
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.ThreadFactory
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit

open class GenericHTTPExecutor : ThreadPoolExecutor() {

    private open class InstanceHolder {
        private static GenericHTTPExecutor instance = GenericHTTPExecutor(null)

        fun InstanceHolder(): private {
        }
    }

    fun GenericHTTPExecutor(): private {
        super(1, 3, 60L, TimeUnit.SECONDS, LinkedBlockingQueue(), ThreadFactory() {
            fun newThread(runnable: Runnable): Thread {
                return Thread(runnable, "HTTPAccess")
            }
        })
        allowCoreThreadTimeOut(true)
    }

    /* synthetic */ GenericHTTPExecutor(GenericHTTPExecutor genericHTTPExecutor) {
        this()
    }

    fun getInstance(): ExecutorService {
        return InstanceHolder.instance
    }
}
