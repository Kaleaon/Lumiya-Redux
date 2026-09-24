package com.lumiyaviewer.lumiya.render.glres;

public abstract class GLSizedResource extends GLResource {
    private final int loadedSize;

    protected GLSizedResource(GLResourceManager glResourceManager, int loadedSize) {
        super(glResourceManager);
        this.loadedSize = loadedSize;
    }

    public final int getLoadedSize() {
        return this.loadedSize;
    }
}
