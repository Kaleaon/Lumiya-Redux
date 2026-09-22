package com.lumiyaviewer.lumiya.react;

import java.util.concurrent.Executor;
import javax.annotation.Nonnull;

/* loaded from: classes.dex */
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
    /* synthetic */ void m27lambda$com_lumiyaviewer_lumiya_react_AsyncRequestHandler_553(K obj) {
        this.baseHandler.onRequest(obj);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_AsyncRequestHandler_690, reason: not valid java name */
    /* synthetic */ void m28lambda$com_lumiyaviewer_lumiya_react_AsyncRequestHandler_690(K obj) {
        this.baseHandler.onRequestCancelled(obj);
    }

    @Override // com.lumiyaviewer.lumiya.react.RequestHandler
    public void onRequest(@Nonnull final K k) {
        this.executor.execute(() -> m27lambda$com_lumiyaviewer_lumiya_react_AsyncRequestHandler_553(k));
    }

    @Override // com.lumiyaviewer.lumiya.react.RequestHandler
    public void onRequestCancelled(@Nonnull final K k) {
        this.executor.execute(() -> m28lambda$com_lumiyaviewer_lumiya_react_AsyncRequestHandler_690(k));
    }
}
