package com.google.vr.cardboard;

import android.opengl.GLSurfaceView;
import android.os.Build;
import android.util.Log;
import java.nio.IntBuffer;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;

public class EglFactory implements GLSurfaceView.EGLContextFactory, GLSurfaceView.EGLWindowSurfaceFactory {
    private static final int EGL_CONTEXT_CLIENT_VERSION = 12440;
    private static final int EGL_CONTEXT_PRIORITY_HIGH = 12545;
    private static final int EGL_CONTEXT_PRIORITY_LEVEL = 12544;
    private static final int EGL_PROTECTED_CONTENT_EXT = 12992;
    private static final int MIN_REQUIRED_CONTEXT_CLIENT_VERSION = 2;
    private static final String TAG = "GvrEglFactory";
    private boolean usePriority = false;
    private boolean useProtected = false;
    private int eglContextClientVersion = 2;

    private boolean supportsProtectedContent(EGL10 egL10, EGLDisplay eglDisplay) {
        return egL10.eglQueryString(eglDisplay, 12373).contains("EGL_EXT_protected_content");
    }

    @Override
    public EGLContext createContext(EGL10 egL10, EGLDisplay eglDisplay, EGLConfig eglConfig) {
        IntBuffer allocate = IntBuffer.allocate(8);
        allocate.put(EGL_CONTEXT_CLIENT_VERSION);
        allocate.put(this.eglContextClientVersion);
        if (this.usePriority) {
            allocate.put(EGL_CONTEXT_PRIORITY_LEVEL);
            allocate.put(EGL_CONTEXT_PRIORITY_HIGH);
        }
        if (this.useProtected && supportsProtectedContent(egL10, eglDisplay)) {
            allocate.put(EGL_PROTECTED_CONTENT_EXT);
            allocate.put(1);
        }
        while (allocate.hasRemaining()) {
            allocate.put(12344);
        }
        EGLContext eglCreateContext = egL10.eglCreateContext(eglDisplay, eglConfig, EGL10.EGL_NO_CONTEXT, allocate.array());
        if (eglCreateContext != null || this.eglContextClientVersion <= 2) {
            return eglCreateContext;
        }
        Log.w(TAG, new StringBuilder(75).append("Failed to create EGL context with version ").append(this.eglContextClientVersion).append(", will try 2").toString());
        allocate.array()[1] = 2;
        return egL10.eglCreateContext(eglDisplay, eglConfig, EGL10.EGL_NO_CONTEXT, allocate.array());
    }

    @Override
    public EGLSurface createWindowSurface(EGL10 egL10, EGLDisplay eglDisplay, EGLConfig eglConfig, Object obj) {
        try {
            return egL10.eglCreateWindowSurface(eglDisplay, eglConfig, obj, (this.useProtected && supportsProtectedContent(egL10, eglDisplay)) ? new int[]{EGL_PROTECTED_CONTENT_EXT, 1, 12344} : null);
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "eglCreateWindowSurface", e);
            return null;
        }
    }

    @Override
    public void destroyContext(EGL10 egL10, EGLDisplay eglDisplay, EGLContext eglContext) {
        egL10.eglDestroyContext(eglDisplay, eglContext);
    }

    @Override
    public void destroySurface(EGL10 egL10, EGLDisplay eglDisplay, EGLSurface eglSurface) {
        egL10.eglDestroySurface(eglDisplay, eglSurface);
    }

    public void setEGLContextClientVersion(int eglContextClientVersion) {
        this.eglContextClientVersion = eglContextClientVersion;
    }

    public void setUsePriorityContext(boolean usePriority) {
        this.usePriority = usePriority;
    }

    public void setUseProtectedBuffers(boolean useProtected) {
        if (useProtected && Build.VERSION.SDK_INT < 17) {
            throw new RuntimeException("Protected buffer support requires EGL 1.4, available only on Jelly Bean MR1 and later.");
        }
        this.useProtected = useProtected;
    }
}
