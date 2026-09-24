package com.lumiyaviewer.lumiya.react;

import java.util.concurrent.Executor;
import javax.annotation.Nonnull;

public class AsyncRequestHandler<K> implements RequestHandler<K> {

    @Nonnull
    private final RequestHandler<K> baseHandler;

    @Nonnull
    private final Executor executor;

    public AsyncRequestHandler(@Nonnull Executor executor, @Nonnull RequestHandler<K> requestHandler) {
        this.executor = executor;
        this.baseHandler = requestHandler;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_AsyncRequestHandler_553, reason: not valid java name */
    /* synthetic */ void m27lambda$com_lumiyaviewer_lumiya_react_AsyncRequestHandler_553(K k) {
        this.baseHandler.onRequest(k);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_AsyncRequestHandler_690, reason: not valid java name */
    /* synthetic */ void m28lambda$com_lumiyaviewer_lumiya_react_AsyncRequestHandler_690(K k) {
        this.baseHandler.onRequestCancelled(k);
    }

    @Override
    public void onRequest(@Nonnull final K k) {
        this.executor.execute(() -> m27lambda$com_lumiyaviewer_lumiya_react_AsyncRequestHandler_553(k));
    }

    @Override
    public void onRequestCancelled(@Nonnull final K k) {
        this.executor.execute(() -> m28lambda$com_lumiyaviewer_lumiya_react_AsyncRequestHandler_690(k));
    }
}
