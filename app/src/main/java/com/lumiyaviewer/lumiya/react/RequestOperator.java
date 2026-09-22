package com.lumiyaviewer.lumiya.react;

import java.util.concurrent.Executor;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/* loaded from: classes.dex */
public abstract class RequestOperator<K, T> implements RequestHandler<K> {

    @Nullable
    private final Executor executor;

    @Nonnull
    private final ResultHandler<K, T> resultHandler;

    @Nonnull
    private final RequestHandler<K> toHandler;

    public RequestOperator(@Nonnull RequestHandler<K> requestHandler, @Nonnull ResultHandler<K, T> resultHandler) {
        this.toHandler = requestHandler;
        this.resultHandler = resultHandler;
        this.executor = null;
    }

    public RequestOperator(@Nonnull RequestHandler<K> requestHandler, @Nonnull ResultHandler<K, T> resultHandler, @Nullable Executor executor) {
        this.toHandler = requestHandler;
        this.resultHandler = resultHandler;
        this.executor = executor;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_RequestOperator_1579, reason: not valid java name */
    /* synthetic */ void m41lambda$com_lumiyaviewer_lumiya_react_RequestOperator_1579(K obj) {
        this.toHandler.onRequestCancelled(obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_RequestOperator_996, reason: not valid java name */
    /* synthetic */ void m42lambda$com_lumiyaviewer_lumiya_react_RequestOperator_996(K obj) {
        T processRequest = processRequest(obj);
        if (processRequest != null) {
            this.resultHandler.onResultData(obj, processRequest);
        } else {
            this.toHandler.onRequest(obj);
        }
    }

    @Override // com.lumiyaviewer.lumiya.react.RequestHandler
    public void onRequest(@Nonnull final K k) {
        if (this.executor != null) {
            this.executor.execute(() -> m42lambda$com_lumiyaviewer_lumiya_react_RequestOperator_996(k));
            return;
        }
        T processRequest = processRequest(k);
        if (processRequest != null) {
            this.resultHandler.onResultData(k, processRequest);
        } else {
            this.toHandler.onRequest(k);
        }
    }

    @Override // com.lumiyaviewer.lumiya.react.RequestHandler
    public void onRequestCancelled(@Nonnull final K k) {
        if (this.executor != null) {
            this.executor.execute(() -> m41lambda$com_lumiyaviewer_lumiya_react_RequestOperator_1579(k));
        } else {
            this.toHandler.onRequestCancelled(k);
        }
    }

    protected abstract T processRequest(@Nonnull K k);
}
