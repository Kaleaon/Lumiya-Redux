package com.lumiyaviewer.lumiya.react;

import java.util.concurrent.Executor;
import javax.annotation.Nonnull;

public class AsyncLimitsRequestHandler<K> extends AsyncRequestHandler<K> implements RequestHandlerLimits {
    private final boolean isCancellable;
    private final int maxRequests;
    private final long requestTimeout;

    public AsyncLimitsRequestHandler(@Nonnull Executor executor, @Nonnull RequestHandler<K> requestHandler, boolean isCancellable, int maxRequests, long requestTimeout) {
        super(executor, requestHandler);
        this.isCancellable = isCancellable;
        this.maxRequests = maxRequests;
        this.requestTimeout = requestTimeout;
    }

    @Override
    public int getMaxRequestsInFlight() {
        return this.maxRequests;
    }

    @Override
    public long getRequestTimeout() {
        return this.requestTimeout;
    }

    @Override
    public boolean isRequestCancellable() {
        return this.isCancellable;
    }
}
