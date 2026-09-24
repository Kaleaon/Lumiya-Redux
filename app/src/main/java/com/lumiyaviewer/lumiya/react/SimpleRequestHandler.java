package com.lumiyaviewer.lumiya.react;

import javax.annotation.Nonnull;

public abstract class SimpleRequestHandler<K> implements RequestHandler<K> {
    @Override
    public void onRequestCancelled(@Nonnull K k) {
    }
}
