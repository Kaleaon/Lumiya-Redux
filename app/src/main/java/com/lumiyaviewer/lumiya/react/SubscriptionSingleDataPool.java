package com.lumiyaviewer.lumiya.react;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class SubscriptionSingleDataPool<T> extends SubscriptionGenericDataPool<SubscriptionSingleKey, T> {
    private final SubscriptionList<SubscriptionSingleKey, T> entry = new SubscriptionList<>();

    public static SubscriptionSingleKey getSingleDataKey() {
        return SubscriptionSingleKey.Value;
    }

    public T getData() {
        return this.entry.getData();
    }

    @Override
    @Nullable
    public SubscriptionList<SubscriptionSingleKey, T> getExistingSubscriptions(@Nonnull SubscriptionSingleKey subscriptionSingleKey) {
        return this.entry;
    }

    public SubscriptionSingleKey getKey() {
        return SubscriptionSingleKey.Value;
    }

    @Override
    @Nonnull
    public SubscriptionList<SubscriptionSingleKey, T> getSubscriptions(@Nonnull SubscriptionSingleKey subscriptionSingleKey) {
        return this.entry;
    }
}
