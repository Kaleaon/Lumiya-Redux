package com.lumiyaviewer.lumiya.render.glres;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.glres.GLLoadQueue;
import com.lumiyaviewer.lumiya.render.glres.GLSizedResource;
import com.lumiyaviewer.lumiya.res.ResourceConsumer;
import com.lumiyaviewer.lumiya.res.ResourceManager;
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache;
import com.lumiyaviewer.lumiya.res.ResourceRequest;

public abstract class GLResourceCache<ResourceParams, RawType, ResourceType extends GLSizedResource> extends ResourceMemoryCache<ResourceParams, ResourceType> {
    private final GLLoadQueue loadQueue;

    private class LoadRequest<Raw extends RawType> extends ResourceRequest<ResourceParams, ResourceType> implements GLLoadQueue.GLLoadable, ResourceConsumer {
        private volatile boolean finalResult;
        private volatile boolean loadedFinal;
        private volatile ResourceType loadedResource;
        private volatile Raw rawResource;

        public LoadRequest(ResourceParams resourceparams, ResourceManager<ResourceParams, ResourceType> resourceManager) {
            super(resourceparams, resourceManager);
        }

        @Override
        public void GLCompleteLoad() {
            ResourceType resourcetype;
            boolean z;
            synchronized (this) {
                resourcetype = this.loadedResource;
                z = this.loadedFinal;
            }
            if (z) {
                completeRequest(resourcetype);
            } else {
                intermediateResult(resourcetype);
            }
        }

        @Override
        public int GLGetLoadSize() {
            Raw raw;
            synchronized (this) {
                raw = this.rawResource;
            }
            if (raw != null) {
                return GLResourceCache.this.GetResourceSize(raw);
            }
            return 0;
        }

        @Override
        public int GLLoad(RenderContext renderContext, GLLoadQueue.GLLoadHandler gLLoadHandler) {
            Raw raw;
            boolean z;
            synchronized (this) {
                raw = this.rawResource;
                z = this.finalResult;
            }
            ResourceType resourcetype = (ResourceType) GLResourceCache.this.LoadResource(getParams(), raw, renderContext);
            int loadedSize = resourcetype != null ? resourcetype.getLoadedSize() : 0;
            synchronized (this) {
                this.loadedResource = resourcetype;
                this.loadedFinal = z;
            }
            if (resourcetype != null) {
                gLLoadHandler.GLResourceLoaded(this);
            }
            return loadedSize;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override
        public void OnResourceReady(Object obj, boolean z) {
            if (obj != null) {
                try {
                    synchronized (this) {
                        this.rawResource = (Raw) obj;
                        this.finalResult = !z;
                    }
                    GLResourceCache.this.loadQueue.add(this);
                } catch (ClassCastException e) {
                    Debug.Warning(e);
                    completeRequest(null);
                }
            } else {
                completeRequest(null);
            }
            GLResourceCache.this.collectReferences();
        }

        @Override
        public void cancelRequest() {
            GLResourceCache.this.loadQueue.remove(this);
            GLResourceCache.this.CancelRawResource(this);
            super.cancelRequest();
        }

        @Override
        public void execute() {
            GLResourceCache.this.RequestRawResource(getParams(), this);
        }
    }

    protected GLResourceCache(GLLoadQueue gLLoadQueue) {
        this.loadQueue = gLLoadQueue;
    }

    protected abstract void CancelRawResource(ResourceConsumer resourceConsumer);

    @Override
    protected ResourceRequest<ResourceParams, ResourceType> CreateNewRequest(ResourceParams resourceparams, ResourceManager<ResourceParams, ResourceType> resourceManager) {
        return new LoadRequest(resourceparams, resourceManager);
    }

    protected abstract int GetResourceSize(RawType rawtype);

    protected abstract ResourceType LoadResource(ResourceParams resourceparams, RawType rawtype, RenderContext renderContext);

    protected abstract void RequestRawResource(ResourceParams resourceparams, ResourceConsumer resourceConsumer);
}
