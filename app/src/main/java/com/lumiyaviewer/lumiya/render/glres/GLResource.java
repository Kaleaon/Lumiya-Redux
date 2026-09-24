package com.lumiyaviewer.lumiya.render.glres;

public abstract class GLResource implements GLGenericResource {
    public final int handle;

    public GLResource(GLResourceManager glResourceManager) {
        this.handle = Allocate(glResourceManager);
    }

    protected abstract int Allocate(GLResourceManager glResourceManager);
}
