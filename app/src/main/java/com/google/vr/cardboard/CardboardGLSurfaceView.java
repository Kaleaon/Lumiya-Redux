package com.google.vr.cardboard;

import android.content.Context;
import android.opengl.GLSurfaceView;
import android.util.AttributeSet;
import com.google.vr.ndk.base.GvrSurfaceView;
import java.util.ArrayList;

public class CardboardGLSurfaceView extends GvrSurfaceView {
    private static final String TAG = CardboardGLSurfaceView.class.getSimpleName();
    private final EglFactory eglFactory;
    private ArrayList<Runnable> eventQueueWhileDetached;
    private boolean isDetached;
    private boolean isRendererSet;
    private final DetachListener listener;

    public interface DetachListener {
        void onSurfaceViewDetachedFromWindow();
    }

    public CardboardGLSurfaceView(Context context, AttributeSet attributeSet, DetachListener detachListener) {
        super(context, attributeSet);
        this.listener = detachListener;
        this.eglFactory = new EglFactory();
        setEGLContextFactory(this.eglFactory);
        setEGLWindowSurfaceFactory(this.eglFactory);
    }

    public CardboardGLSurfaceView(Context context, DetachListener detachListener) {
        super(context);
        this.listener = detachListener;
        this.eglFactory = new EglFactory();
        setEGLContextFactory(this.eglFactory);
        setEGLWindowSurfaceFactory(this.eglFactory);
    }

    public boolean isDetached() {
        return this.isDetached;
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.isDetached = false;
        if (this.eventQueueWhileDetached == null) {
            return;
        }
        ArrayList<Runnable> arrayList = this.eventQueueWhileDetached;
        int size = arrayList.size();
        int i = 0;
        while (i < size) {
            Runnable runnable = arrayList.get(i);
            i++;
            super.queueEvent(runnable);
        }
        this.eventQueueWhileDetached.clear();
    }

    @Override
    protected void onDetachedFromWindow() {
        if (this.isRendererSet && this.listener != null) {
            this.listener.onSurfaceViewDetachedFromWindow();
        }
        super.onDetachedFromWindow();
        this.isDetached = true;
    }

    @Override
    public void onPause() {
        if (this.isRendererSet) {
            super.onPause();
        }
    }

    @Override
    public void onResume() {
        if (this.isRendererSet) {
            super.onResume();
        }
    }

    @Override
    public void queueEvent(Runnable runnable) {
        if (!this.isRendererSet) {
            runnable.run();
        } else {
            if (!this.isDetached) {
                super.queueEvent(runnable);
                return;
            }
            if (this.eventQueueWhileDetached == null) {
                this.eventQueueWhileDetached = new ArrayList<>();
            }
            this.eventQueueWhileDetached.add(runnable);
        }
    }

    @Override
    public void setEGLContextClientVersion(int i) {
        super.setEGLContextClientVersion(i);
        this.eglFactory.setEGLContextClientVersion(i);
    }

    @Override
    public void setRenderer(GLSurfaceView.Renderer renderer) {
        super.setRenderer(renderer);
        this.isRendererSet = true;
    }
}
