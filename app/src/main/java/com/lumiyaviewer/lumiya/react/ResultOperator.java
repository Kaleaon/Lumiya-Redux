package com.lumiyaviewer.lumiya.react;

import java.util.concurrent.Executor;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class ResultOperator<K, Tin, Tout> implements ResultHandler<K, Tin> {

    @Nullable
    private final Executor executor;

    @Nonnull
    private final ResultHandler<K, Tout> toHandler;

    public ResultOperator(@Nonnull ResultHandler<K, Tout> resultHandler) {
        this.toHandler = resultHandler;
        this.executor = null;
    }

    public ResultOperator(@Nonnull ResultHandler<K, Tout> resultHandler, @Nullable Executor executor) {
        this.toHandler = resultHandler;
        this.executor = executor;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_ResultOperator_1065, reason: not valid java name */
    /* synthetic */ void m46lambda$com_lumiyaviewer_lumiya_react_ResultOperator_1065(K k, Throwable th) {
        this.toHandler.onResultError(k, th);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: lambda$-com_lumiyaviewer_lumiya_react_ResultOperator_796, reason: not valid java name */
    /* synthetic */ void m47lambda$com_lumiyaviewer_lumiya_react_ResultOperator_796(K k, Tin tin) {
        this.toHandler.onResultData(k, onData(tin));
    }

    protected abstract Tout onData(Tin tin);

    @Override
    public void onResultData(@Nonnull final K k, final Tin tin) {
        if (this.executor != null) {
            this.executor.execute(() -> m47lambda$com_lumiyaviewer_lumiya_react_ResultOperator_796(k, tin));
        } else {
            this.toHandler.onResultData(k, onData(tin));
        }
    }

    @Override
    public void onResultError(@Nonnull final K k, final Throwable th) {
        if (this.executor != null) {
            this.executor.execute(() -> m46lambda$com_lumiyaviewer_lumiya_react_ResultOperator_1065(k, th));
        } else {
            this.toHandler.onResultError(k, th);
        }
    }
}
