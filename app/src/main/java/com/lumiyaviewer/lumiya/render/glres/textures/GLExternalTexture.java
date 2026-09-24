package com.lumiyaviewer.lumiya.render.glres.textures;

import android.annotation.TargetApi;
import android.graphics.Canvas;
import android.graphics.SurfaceTexture;
import android.opengl.GLES11;
import android.view.Surface;

@TargetApi(15)
public class GLExternalTexture {
    private final int handle;
    private final int height;
    private final SurfaceTexture.OnFrameAvailableListener onFrameAvailableListener = new SurfaceTexture.OnFrameAvailableListener() {
        @Override
        public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        }
    };
    private final Surface surface;
    private final SurfaceTexture surfaceTexture;
    private final int width;

    @TargetApi(15)
    public GLExternalTexture(int width, int height) {
        this.width = width;
        this.height = height;
        int[] ints = new int[1];
        GLES11.glGenTextures(1, ints, 0);
        this.handle = ints[0];
        bind();
        GLES11.glTexImage2D(36197, 0, 6408, width, height, 0, 6408, 5121, null);
        GLES11.glTexParameteri(36197, 10241, 9729);
        GLES11.glTexParameteri(36197, 10240, 9729);
        this.surfaceTexture = new SurfaceTexture(this.handle);
        this.surfaceTexture.setDefaultBufferSize(width, height);
        this.surfaceTexture.setOnFrameAvailableListener(this.onFrameAvailableListener);
        this.surface = new Surface(this.surfaceTexture);
    }

    @TargetApi(15)
    public void bind() {
        GLES11.glBindTexture(36197, this.handle);
    }

    public Canvas getCanvas() {
        return this.surface.lockCanvas(null);
    }

    public int getHeight() {
        return this.height;
    }

    public int getWidth() {
        return this.width;
    }

    public void postCanvas(Canvas canvas) {
        this.surface.unlockCanvasAndPost(canvas);
    }

    @TargetApi(15)
    public void release() {
        this.surface.release();
        this.surfaceTexture.release();
        GLES11.glDeleteTextures(1, new int[]{this.handle}, 0);
    }

    @TargetApi(11)
    public void update(float[] floats) {
        this.surfaceTexture.updateTexImage();
        this.surfaceTexture.getTransformMatrix(floats);
    }
}
