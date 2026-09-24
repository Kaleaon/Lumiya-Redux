package com.lumiyaviewer.lumiya.render.glres;

import com.lumiyaviewer.lumiya.render.TextureMemoryTracker;
import java.lang.ref.PhantomReference;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.WeakHashMap;

public class GLResourceManager {
    private final ReferenceQueue<GLGenericResource> refQueue = new ReferenceQueue<>();
    private final Set<GLGenericResourceReference> refSet = Collections.synchronizedSet(Collections.newSetFromMap(new IdentityHashMap()));
    private final Object glCleanableLock = new Object();
    private final Set<GLCleanable> glCleanables = Collections.newSetFromMap(new WeakHashMap());

    public static abstract class GLGenericResourceReference extends PhantomReference<GLGenericResource> {
        public GLGenericResourceReference(GLGenericResource glGenericResource, GLResourceManager glResourceManager) {
            super(glGenericResource, glResourceManager.refQueue);
            glResourceManager.refSet.add(this);
        }

        public abstract void GLFree();
    }

    public static abstract class GLResourceReference extends GLGenericResourceReference {
        protected final int handle;

        public GLResourceReference(GLResource glResource, int handle, GLResourceManager glResourceManager) {
            super(glResource, glResourceManager);
            this.handle = handle;
            glResourceManager.refSet.add(this);
        }
    }

    public void Cleanup() {
        synchronized (this.glCleanableLock) {
            this.glCleanables.size();
        }
        while (true) {
            Reference<? extends GLGenericResource> poll = this.refQueue.poll();
            if (poll == null) {
                return;
            }
            if (poll instanceof GLGenericResourceReference) {
                ((GLGenericResourceReference) poll).GLFree();
                this.refSet.remove(poll);
            }
        }
    }

    public void Flush() {
        synchronized (this.glCleanableLock) {
            for (GLCleanable glCleanable : this.glCleanables) {
                if (glCleanable != null) {
                    glCleanable.GLCleanup();
                }
            }
            this.glCleanables.clear();
        }
        while (this.refQueue.poll() != null) {
        }
        this.refSet.clear();
        TextureMemoryTracker.releaseAllGLMemory();
    }

    public void addCleanable(GLCleanable glCleanable) {
        synchronized (this.glCleanableLock) {
            this.glCleanables.add(glCleanable);
        }
    }
}
