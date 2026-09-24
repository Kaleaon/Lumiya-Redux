package com.lumiyaviewer.lumiya.react;

import com.lumiyaviewer.lumiya.react.RequestForwarder;
import com.lumiyaviewer.lumiya.react.Subscription;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class RequestForwarder<Kup, Tup, Kdown, Tdown> implements RequestHandler<Kup> {

    @Nullable
    private final Executor executor;

    @Nonnull
    private final ResultHandler<Kup, Tup> resultHandler;

    @Nonnull
    private final Subscribable<Kdown, Tdown> subscribable;
    private final Object lock = new Object();
    private final Map<Kup, RequestForwarder<Kup, Tup, Kdown, Tdown>.DownstreamSubscription> subscriptions = new HashMap();

    class DownstreamSubscription implements Subscription.OnData<Tdown>, Subscription.OnError, UnsubscribableOne {
        private final Kup key;
        private final Subscription<Kdown, Tdown> subscription;

        private DownstreamSubscription(Kup kup, Kdown kdown) {
            this.key = kup;
            this.subscription = RequestForwarder.this.subscribable.subscribe(kdown, RequestForwarder.this.executor, this, this);
        }

            /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_RequestForwarder$DownstreamSubscription_827, reason: not valid java name */
        /* synthetic */ void m40x317e7a9e(Tdown obj) {
            RequestForwarder.this.processResultInternal(this.key, obj);
        }

        @Override
        public void onData(final Tdown tdown) {
            if (RequestForwarder.this.executor != null) {
                RequestForwarder.this.executor.execute(() -> m40x317e7a9e(tdown));
            } else {
                RequestForwarder.this.processResultInternal(this.key, tdown);
            }
        }

        @Override
        public void onError(Throwable th) {
            RequestForwarder.this.resultHandler.onResultError(this.key, th);
        }

        @Override
        public void unsubscribe() {
            this.subscription.unsubscribe();
        }
    }

    public RequestForwarder(@Nonnull RequestSource<Kup, Tup> requestSource, @Nonnull Subscribable<Kdown, Tdown> subscribable, @Nullable Executor executor) {
        this.executor = executor;
        this.subscribable = subscribable;
        this.resultHandler = requestSource.attachRequestHandler(this);
    }

    /* renamed from: processRequestInternal, reason: merged with bridge method [inline-methods] */
    public void m39lambda$com_lumiyaviewer_lumiya_react_RequestForwarder_2672(@Nonnull Kup kup) {
        RequestForwarder<Kup, Tup, Kdown, Tdown>.DownstreamSubscription put;
        RequestForwarder<Kup, Tup, Kdown, Tdown>.DownstreamSubscription downstreamSubscription = new DownstreamSubscription(kup, getDownstreamKey(kup));
        synchronized (this.lock) {
            put = this.subscriptions.put(kup, downstreamSubscription);
        }
        if (put != null) {
            put.unsubscribe();
        }
    }

    public void processResultInternal(@Nonnull Kup kup, @Nullable Tdown tdown) {
        this.resultHandler.onResultData(kup, processResult(tdown));
    }

    protected abstract Kdown getDownstreamKey(@Nonnull Kup kup);

    @Override
    public void onRequest(@Nonnull final Kup kup) {
        if (this.executor != null) {
            this.executor.execute(() -> m39lambda$com_lumiyaviewer_lumiya_react_RequestForwarder_2672(kup));
        } else {
            m39lambda$com_lumiyaviewer_lumiya_react_RequestForwarder_2672(kup);
        }
    }

    @Override
    public void onRequestCancelled(@Nonnull Kup kup) {
        RequestForwarder<Kup, Tup, Kdown, Tdown>.DownstreamSubscription remove;
        synchronized (this.lock) {
            remove = this.subscriptions.remove(kup);
        }
        if (remove != null) {
            remove.unsubscribe();
        }
    }

    protected abstract Tup processResult(@Nullable Tdown tdown);
}
