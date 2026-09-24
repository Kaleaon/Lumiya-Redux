package com.lumiyaviewer.lumiya.react;

import java.util.concurrent.Executor;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class RequestProcessor<K, Tup, Tdown> implements RequestHandler<K>, RequestSource<K, Tdown>, ResultHandler<K, Tdown>, Refreshable<K> {

    @Nullable
    private final Executor executor;

    @Nullable
    private RequestHandler<K> requestHandler;

    @Nonnull
    private final ResultHandler<K, Tup> resultHandler;

    public RequestProcessor(@Nonnull RequestSource<K, Tup> requestSource, @Nullable Executor executor) {
        this.executor = executor;
        this.resultHandler = requestSource.attachRequestHandler(this);
    }

    /* renamed from: processRequestInternal, reason: merged with bridge method [inline-methods] */
    public void processRequestInternal(@Nonnull K k) {
        Tup processRequest = processRequest(k);
        if (processRequest != null) {
            this.resultHandler.onResultData(k, processRequest);
        }
        if (isRequestComplete(k, processRequest) || this.requestHandler == null) {
            return;
        }
        this.requestHandler.onRequest(k);
    }

    /* renamed from: requestUpdateInternal, reason: merged with bridge method [inline-methods] */
    public void requestUpdateInternal(@Nonnull K k) {
        if (this.requestHandler != null) {
            this.requestHandler.onRequest(k);
        }
    }

    @Override
    public ResultHandler<K, Tdown> attachRequestHandler(@Nonnull RequestHandler<K> requestHandler) {
        this.requestHandler = requestHandler;
        return this;
    }

    @Override
    public void detachRequestHandler(@Nonnull RequestHandler<K> requestHandler) {
        if (this.requestHandler == requestHandler) {
            this.requestHandler = null;
        }
    }

    protected boolean isRequestComplete(@Nonnull K k, Tup tup) {
        return tup != null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_RequestProcessor_2159, reason: not valid java name */
    /* synthetic */ void m44lambda$com_lumiyaviewer_lumiya_react_RequestProcessor_2159(Object obj, Object obj2) {
        this.resultHandler.onResultData((K) obj, processResult((K) obj, (Tdown) obj2));
    }

    @Override
    public void onRequest(@Nonnull final K k) {
        if (this.executor != null) {
            this.executor.execute(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    RequestProcessor.this.processRequestInternal(k);
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        } else {
            processRequestInternal(k);
        }
    }

    @Override
    public void onRequestCancelled(@Nonnull K k) {
        if (this.requestHandler != null) {
            this.requestHandler.onRequestCancelled(k);
        }
    }

    @Override
    public void onResultData(@Nonnull final K k, final Tdown tdown) {
        if (this.executor != null) {
            this.executor.execute(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    RequestProcessor.this.m44lambda$com_lumiyaviewer_lumiya_react_RequestProcessor_2159(k, tdown);
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        } else {
            this.resultHandler.onResultData(k, processResult(k, tdown));
        }
    }

    @Override
    public void onResultError(@Nonnull K k, Throwable th) {
        this.resultHandler.onResultError(k, th);
    }

    @Nullable
    protected abstract Tup processRequest(@Nonnull K k);

    protected abstract Tup processResult(@Nonnull K k, Tdown tdown);

    @Override
    public void requestUpdate(final K k) {
        if (this.executor != null) {
            this.executor.execute(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    RequestProcessor.this.requestUpdateInternal(k);
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
        } else {
            requestUpdateInternal(k);
        }
    }
}
