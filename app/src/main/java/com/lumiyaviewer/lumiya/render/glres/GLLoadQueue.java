package com.lumiyaviewer.lumiya.render.glres;

import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.res.collections.WeakQueue;
import javax.annotation.Nonnull;

public abstract class GLLoadQueue {
    final WeakQueue<GLLoadable> loadQueue = new WeakQueue<>();

    interface GLLoadHandler {
        void GLResourceLoaded(GLLoadable glLoadable);
    }

    interface GLLoadable {
        void GLCompleteLoad();

        int GLGetLoadSize();

        int GLLoad(RenderContext renderContext, GLLoadHandler glLoadHandler);
    }

    public abstract void RunLoadQueue(@Nonnull RenderContext renderContext);

    public void StopLoadQueue() {
        this.loadQueue.clear();
    }

    public void add(@Nonnull GLLoadable glLoadable) {
        this.loadQueue.offer(glLoadable);
    }

    public void remove(@Nonnull GLLoadable glLoadable) {
        this.loadQueue.remove(glLoadable);
    }
}
