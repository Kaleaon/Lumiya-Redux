package com.lumiyaviewer.lumiya.render.glres.buffers;

import android.opengl.GLES11;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker;
import com.lumiyaviewer.lumiya.render.glres.GLResource;
import com.lumiyaviewer.lumiya.render.glres.GLResourceManager;
import com.lumiyaviewer.rawbuffers.DirectByteBuffer;

public class GLBuffer extends GLResource {
    private static ThreadLocal<int[]> idBuffer = new ThreadLocal<int[]>() {
        @Override
        public int[] initialValue() {
            return new int[1];
        }
    };
    private final DirectByteBuffer rawBuffer;

    private static class GLResourceBufferReference extends GLResourceManager.GLResourceReference {
        private final DirectByteBuffer rawBuffer;

        public GLResourceBufferReference(GLResource glResource, int i, GLResourceManager glResourceManager, DirectByteBuffer directByteBuffer) {
            super(glResource, i, glResourceManager);
            this.rawBuffer = directByteBuffer;
        }

        @Override
        public void GLFree() {
            int[] ints = (int[]) GLBuffer.idBuffer.get();
            ints[0] = this.handle;
            Debug.Printf("GLBuffer: deleted buffer %d", Integer.valueOf(ints[0]));
            GLES11.glDeleteBuffers(1, ints, 0);
            if (this.rawBuffer != null) {
                TextureMemoryTracker.releaseBufferMemory(this.rawBuffer.getCapacity());
            }
        }
    }

    public GLBuffer(GLResourceManager glResourceManager, DirectByteBuffer directByteBuffer) {
        super(glResourceManager);
        this.rawBuffer = directByteBuffer;
        if (directByteBuffer != null) {
            TextureMemoryTracker.allocBufferMemory(directByteBuffer.getCapacity());
        }
        new GLResourceBufferReference(this, this.handle, glResourceManager, this.rawBuffer);
    }

    @Override
    protected int Allocate(GLResourceManager glResourceManager) {
        int[] ints = idBuffer.get();
        GLES11.glGenBuffers(1, ints, 0);
        Debug.Printf("GLBuffer: allocated buffer %d", Integer.valueOf(ints[0]));
        return ints[0];
    }
}
