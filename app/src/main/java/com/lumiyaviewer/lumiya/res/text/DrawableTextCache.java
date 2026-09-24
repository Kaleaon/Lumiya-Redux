package com.lumiyaviewer.lumiya.res.text;

import com.lumiyaviewer.lumiya.res.ResourceManager;
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache;
import com.lumiyaviewer.lumiya.res.ResourceRequest;
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor;

public class DrawableTextCache extends ResourceMemoryCache<DrawableTextParams, DrawableTextBitmap> {
    private final int fontSize;

    private static class TextGenRequest extends ResourceRequest<DrawableTextParams, DrawableTextBitmap> implements Runnable {
        private final int fontSize;

        TextGenRequest(DrawableTextParams drawableTextParams, int fontSize, ResourceManager<DrawableTextParams, DrawableTextBitmap> resourceManager) {
            super(drawableTextParams, resourceManager);
            this.fontSize = fontSize;
        }

        @Override
        public void execute() {
            PrimComputeExecutor.getInstance().execute(this);
        }

        @Override
        public void run() {
            completeRequest(new DrawableTextBitmap(getParams(), this.fontSize));
        }
    }

    public DrawableTextCache(int fontSize) {
        this.fontSize = fontSize;
    }

    protected ResourceRequest<DrawableTextParams, DrawableTextBitmap> CreateNewRequest(DrawableTextParams drawableTextParams, ResourceManager<DrawableTextParams, DrawableTextBitmap> resourceManager) {
        return new TextGenRequest(drawableTextParams, this.fontSize, resourceManager);
    }
}
