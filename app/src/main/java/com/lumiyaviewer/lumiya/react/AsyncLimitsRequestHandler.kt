package com.lumiyaviewer.lumiya.react

import java.util.concurrent.Executor

class AsyncLimitsRequestHandler<K>(
    executor: Executor,
    requestHandler: RequestHandler<K>,
    private val isCancellable: Boolean,
    private val maxRequests: Int,
    private val requestTimeout: Long
) : AsyncRequestHandler<K>(executor, requestHandler), RequestHandlerLimits {

    override fun getMaxRequestsInFlight(): Int = maxRequests

    override fun getRequestTimeout(): Long = requestTimeout

    override fun isRequestCancellable(): Boolean = isCancellable
}
