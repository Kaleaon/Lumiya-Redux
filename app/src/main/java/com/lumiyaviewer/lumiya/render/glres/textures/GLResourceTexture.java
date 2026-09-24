package com.lumiyaviewer.lumiya.render.glres.textures;

import android.opengl.GLES11;
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker;
import com.lumiyaviewer.lumiya.render.glres.GLResource;
import com.lumiyaviewer.lumiya.render.glres.GLResourceManager;
import com.lumiyaviewer.lumiya.render.glres.GLSizedResource;

public class GLResourceTexture extends GLSizedResource {
    private static ThreadLocal<int[]> idBuffer = new ThreadLocal<int[]>() {
        @Override
        public int[] initialValue() {
            return new int[1];
        }
    };

    private static class GLResourceTexturesReference extends GLResourceManager.GLResourceReference {
        private final int loadedSize;

        public GLResourceTexturesReference(GLResource glResource, int i, GLResourceManager glResourceManager, int loadedSize) {
            super(glResource, i, glResourceManager);
            this.loadedSize = loadedSize;
            TextureMemoryTracker.allocTextureMemory(loadedSize);
        }

        @Override
        public void GLFree() {
            TextureMemoryTracker.releaseTextureMemory(this.loadedSize);
            int[] ints = (int[]) GLResourceTexture.idBuffer.get();
            ints[0] = this.handle;
            GLES11.glDeleteTextures(1, ints, 0);
        }
    }

    public GLResourceTexture(GLResourceManager glResourceManager, int i) {
        super(glResourceManager, i);
        new GLResourceTexturesReference(this, this.handle, glResourceManager, i);
    }

    @Override
    protected int Allocate(GLResourceManager glResourceManager) {
        int[] ints = idBuffer.get();
        GLES11.glGenTextures(1, ints, 0);
        return ints[0];
    }
}
