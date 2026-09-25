package com.lumiyaviewer.lumiya.render.glres;

import android.opengl.GLES30;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.glres.GLResourceManager;
import javax.annotation.Nonnull;

public class GLQuery extends GLResource {
    private static final int MIN_OCCLUSION_QUERY_FRAMES = 0;
    private static ThreadLocal<int[]> idQuery = new ThreadLocal<int[]>() {
        @Override
        public int[] initialValue() {
            return new int[1];
        }
    };
    private boolean isQueryRunning;

    @Nonnull
    private OcclusionQueryResult queryResult;
    private int queryStartedFrameCount;

    private static class GLQueryReference extends GLResourceManager.GLResourceReference {
        GLQueryReference(GLResource glResource, int i, GLResourceManager glResourceManager) {
            super(glResource, i, glResourceManager);
        }

        @Override
        public void GLFree() {
            int[] ints = (int[]) GLQuery.idQuery.get();
            ints[0] = this.handle;
            Debug.Printf("GLBuffer: deleted buffer %d", Integer.valueOf(ints[0]));
            GLES30.glDeleteQueries(1, ints, 0);
        }
    }

    public enum OcclusionQueryResult {
        NotReady,
        Visible,
        Invisible;

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static OcclusionQueryResult[] valuesCustom() {
            return values();
        }
    }

    public GLQuery(GLResourceManager glResourceManager) {
        super(glResourceManager);
        this.isQueryRunning = false;
        this.queryResult = OcclusionQueryResult.NotReady;
        this.queryStartedFrameCount = 0;
        new GLQueryReference(this, this.handle, glResourceManager);
    }

    @Override
    protected int Allocate(GLResourceManager glResourceManager) {
        int[] ints = idQuery.get();
        GLES30.glGenQueries(1, ints, 0);
        return ints[0];
    }

    public void BeginOcclusionQuery(RenderContext renderContext) {
        GLES30.glBeginQuery(35887, this.handle);
        this.isQueryRunning = true;
        this.queryResult = OcclusionQueryResult.NotReady;
        this.queryStartedFrameCount = renderContext.frameCount;
        renderContext.enqueueOcclusionQuery(this);
    }

    public void EndOcclusionQuery() {
        GLES30.glEndQuery(35887);
    }

    public boolean checkResult() {
        if (!this.isQueryRunning) {
            this.queryResult = OcclusionQueryResult.NotReady;
            return true;
        }
        int[] ints = idQuery.get();
        GLES30.glGetQueryObjectuiv(this.handle, 34919, ints, 0);
        if (ints[0] == 0) {
            return false;
        }
        this.isQueryRunning = false;
        GLES30.glGetQueryObjectuiv(this.handle, 34918, ints, 0);
        this.queryResult = ints[0] != 0 ? OcclusionQueryResult.Visible : OcclusionQueryResult.Invisible;
        return true;
    }

    @Nonnull
    public OcclusionQueryResult getOcclusionQueryResult() {
        return this.queryResult;
    }

    public boolean isQueryRunning() {
        return this.isQueryRunning;
    }
}
