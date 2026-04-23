package com.lumiyaviewer.lumiya.render.backend;

public final class RenderBackendFactory {
    private RenderBackendFactory() {
    }

    public static RenderBackend createBackend() {
        if (RenderBackendFlags.ENABLE_EXPERIMENTAL_BACKEND) {
            return new ExperimentalRenderBackend();
        }
        return new LegacyGlesBackend();
    }
}
