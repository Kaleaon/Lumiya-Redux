package com.lumiyaviewer.lumiya.render.backend

/** Selects the renderer without exposing its rollout flag to callers. */
class RenderBackendFactory private constructor() {
    companion object {
        @JvmStatic
        fun createBackend(): RenderBackend =
            if (RenderBackendFlags.ENABLE_EXPERIMENTAL_BACKEND) {
                ExperimentalRenderBackend()
            } else {
                LegacyGlesBackend()
            }
    }
}
