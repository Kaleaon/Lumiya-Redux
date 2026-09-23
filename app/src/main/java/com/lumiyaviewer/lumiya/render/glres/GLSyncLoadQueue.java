package com.lumiyaviewer.lumiya.render.glres;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker;
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue;
import javax.annotation.Nonnull;

/* loaded from: classes.dex */
public class GLSyncLoadQueue extends GLLoadQueue implements GLLoadQueue.GLLoadHandler {
    private static final int MAX_LOADS_PER_FRAME = 16;
    private static final int MAX_SIZE_PER_FRAME = 4194304;
    private static final int WAIT_FRAMES_AFTER_LOAD = 3;
    private int framesWait = 0;

    @Override // com.lumiyaviewer.lumiya.render.glres.GLLoadQueue.GLLoadHandler
    public void GLResourceLoaded(GLLoadQueue.GLLoadable gLLoadable) {
        gLLoadable.GLCompleteLoad();
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x005b, code lost:
    
        r3 = r1;
        r1 = r0;
     */
    @Override // com.lumiyaviewer.lumiya.render.glres.GLLoadQueue
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void RunLoadQueue(@Nonnull RenderContext renderContext) {
        GLLoadQueue.GLLoadable gLLoadablePoll;
        if (this.framesWait != 0) {
            this.framesWait--;
            return;
        }
        int i = 0;
        int i2 = 0;
        while (true) {
            if (!TextureMemoryTracker.canAllocateMemory(0) || (gLLoadablePoll = this.loadQueue.poll()) == null) {
                break;
            }
            if (!TextureMemoryTracker.canAllocateMemory(gLLoadablePoll.GLGetLoadSize())) {
                TextureMemoryTracker.stall();
                this.loadQueue.add(gLLoadablePoll);
                break;
            }
            int iGLLoad = gLLoadablePoll.GLLoad(renderContext, this) + i;
            this.framesWait = 3;
            int i3 = i2 + 1;
            if (i3 >= 16 || iGLLoad >= 4194304) {
                break;
            }
            i2 = i3;
            i = iGLLoad;
        }
        if (i2 != 0) {
            Debug.Printf("waitForMemory: loadedCount %d, size %d", Integer.valueOf(i2), Integer.valueOf(i));
        }
    }
}
