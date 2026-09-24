package com.google.vr.ndk.base;

import android.content.Context;
import android.opengl.EGL14;
import android.opengl.GLDebugHelper;
import android.opengl.GLSurfaceView;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import java.io.Writer;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGL11;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;

public class GvrSurfaceView extends SurfaceView implements SurfaceHolder.Callback2 {
    public static final int DEBUG_CHECK_GL_ERROR = 1;
    public static final int DEBUG_LOG_GL_CALLS = 2;
    private static final boolean LOG_ATTACH_DETACH = false;
    private static final boolean LOG_EGL = false;
    private static final boolean LOG_PAUSE_RESUME = false;
    private static final boolean LOG_RENDERER = false;
    private static final boolean LOG_RENDERER_DRAW_FRAME = false;
    private static final boolean LOG_SURFACE = false;
    private static final boolean LOG_THREADS = false;
    public static final int RENDERMODE_CONTINUOUSLY = 1;
    public static final int RENDERMODE_WHEN_DIRTY = 0;
    public static final int SWAPMODE_MANUAL = 2;
    public static final int SWAPMODE_QUEUED = 0;
    public static final int SWAPMODE_SINGLE = 1;
    private static final String TAG = "GvrSurfaceView";
    private int mDebugFlags;
    private boolean mDetached;
    private GLSurfaceView.EGLConfigChooser mEGLConfigChooser;
    private int mEGLContextClientVersion;
    private GLSurfaceView.EGLContextFactory mEGLContextFactory;
    private GLSurfaceView.EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private GLThread mGLThread;
    private GLWrapper mGLWrapper;
    private boolean mPreserveEGLContextOnPause;
    private GLSurfaceView.Renderer mRenderer;
    private final WeakReference<GvrSurfaceView> mThisWeakRef;

    private abstract class BaseConfigChooser implements GLSurfaceView.EGLConfigChooser {
        protected int[] mConfigSpec;

        public BaseConfigChooser(int[] iArr) {
            this.mConfigSpec = filterConfigSpec(iArr);
        }

        private int[] filterConfigSpec(int[] iArr) {
            if (GvrSurfaceView.this.mEGLContextClientVersion != 2 && GvrSurfaceView.this.mEGLContextClientVersion != 3) {
                return iArr;
            }
            int length = iArr.length;
            int[] iArr2 = new int[length + 2];
            System.arraycopy(iArr, 0, iArr2, 0, length - 1);
            iArr2[length - 1] = 12352;
            if (GvrSurfaceView.this.mEGLContextClientVersion != 2) {
                iArr2[length] = 64;
            } else {
                iArr2[length] = 4;
            }
            iArr2[length + 1] = 12344;
            return iArr2;
        }

        @Override
        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
            int[] iArr = new int[1];
            if (!egl10.eglChooseConfig(eGLDisplay, this.mConfigSpec, null, 0, iArr)) {
                throw new IllegalArgumentException("eglChooseConfig failed");
            }
            int i = iArr[0];
            if (i <= 0) {
                throw new IllegalArgumentException("No configs match configSpec");
            }
            EGLConfig[] eGLConfigArr = new EGLConfig[i];
            if (!egl10.eglChooseConfig(eGLDisplay, this.mConfigSpec, eGLConfigArr, i, iArr)) {
                throw new IllegalArgumentException("eglChooseConfig#2 failed");
            }
            EGLConfig chooseConfig = chooseConfig(egl10, eGLDisplay, eGLConfigArr);
            if (chooseConfig != null) {
                return chooseConfig;
            }
            throw new IllegalArgumentException("No config chosen");
        }

        abstract EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr);
    }

    private class ComponentSizeChooser extends BaseConfigChooser {
        protected int mAlphaSize;
        protected int mBlueSize;
        protected int mDepthSize;
        protected int mGreenSize;
        protected int mRedSize;
        protected int mStencilSize;
        private int[] mValue;

        public ComponentSizeChooser(int i, int i2, int i3, int i4, int i5, int i6) {
            super(new int[]{12324, i, 12323, i2, 12322, i3, 12321, i4, 12325, i5, 12326, i6, 12344});
            this.mValue = new int[1];
            this.mRedSize = i;
            this.mGreenSize = i2;
            this.mBlueSize = i3;
            this.mAlphaSize = i4;
            this.mDepthSize = i5;
            this.mStencilSize = i6;
        }

        private int findConfigAttrib(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, int i, int i2) {
            return !egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, i, this.mValue) ? i2 : this.mValue[0];
        }

        @Override
        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr) {
            for (EGLConfig eGLConfig : eGLConfigArr) {
                int findConfigAttrib = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12325, 0);
                int findConfigAttrib2 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12326, 0);
                if (findConfigAttrib >= this.mDepthSize && findConfigAttrib2 >= this.mStencilSize) {
                    int findConfigAttrib3 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12324, 0);
                    int findConfigAttrib4 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12323, 0);
                    int findConfigAttrib5 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12322, 0);
                    int findConfigAttrib6 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12321, 0);
                    if (findConfigAttrib3 == this.mRedSize && findConfigAttrib4 == this.mGreenSize && findConfigAttrib5 == this.mBlueSize && findConfigAttrib6 == this.mAlphaSize) {
                        return eGLConfig;
                    }
                }
            }
            return null;
        }
    }

    private class DefaultContextFactory implements GLSurfaceView.EGLContextFactory {
        private static final int EGL_CONTEXT_CLIENT_VERSION = 12440;

        private DefaultContextFactory() {
        }

        @Override
        public EGLContext createContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig) {
            int[] iArr = {EGL_CONTEXT_CLIENT_VERSION, GvrSurfaceView.this.mEGLContextClientVersion, 12344};
            EGLContext eGLContext = EGL10.EGL_NO_CONTEXT;
            if (GvrSurfaceView.this.mEGLContextClientVersion == 0) {
                iArr = null;
            }
            return egl10.eglCreateContext(eGLDisplay, eGLConfig, eGLContext, iArr);
        }

        @Override
        public void destroyContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLContext eGLContext) {
            if (egl10.eglDestroyContext(eGLDisplay, eGLContext)) {
                return;
            }
            String valueOf = String.valueOf(eGLDisplay);
            String valueOf2 = String.valueOf(eGLContext);
            Log.e("DefaultContextFactory", new StringBuilder(String.valueOf(valueOf).length() + 18 + String.valueOf(valueOf2).length()).append("display:").append(valueOf).append(" context: ").append(valueOf2).toString());
            EglHelper.throwEglException("eglDestroyContex", egl10.eglGetError());
        }
    }

    private static class DefaultWindowSurfaceFactory implements GLSurfaceView.EGLWindowSurfaceFactory {
        private DefaultWindowSurfaceFactory() {
        }

        @Override
        public EGLSurface createWindowSurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, Object obj) {
            try {
                return egl10.eglCreateWindowSurface(eGLDisplay, eGLConfig, obj, null);
            } catch (IllegalArgumentException e) {
                Log.e(GvrSurfaceView.TAG, "eglCreateWindowSurface", e);
                return null;
            }
        }

        @Override
        public void destroySurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLSurface eGLSurface) {
            egl10.eglDestroySurface(eGLDisplay, eGLSurface);
        }
    }

    private static class EglHelper {
        public static final int EGL_FRONT_BUFFER_AUTO_REFRESH = 12620;
        EGL10 mEgl;
        EGLConfig mEglConfig;
        EGLContext mEglContext;
        EGLDisplay mEglDisplay;
        EGLSurface mEglSurface;
        private WeakReference<GvrSurfaceView> mGvrSurfaceViewWeakRef;

        public EglHelper(WeakReference<GvrSurfaceView> weakReference) {
            this.mGvrSurfaceViewWeakRef = weakReference;
        }

        private void destroySurfaceImp() {
            if (this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                return;
            }
            this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            GvrSurfaceView gvrSurfaceView = this.mGvrSurfaceViewWeakRef.get();
            if (gvrSurfaceView != null) {
                gvrSurfaceView.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
            }
            this.mEglSurface = null;
        }

        public static String formatEglError(String str, int i) {
            String valueOf = String.valueOf(getErrorString(i));
            return new StringBuilder(String.valueOf(str).length() + 9 + String.valueOf(valueOf).length()).append(str).append(" failed: ").append(valueOf).toString();
        }

        private static String getErrorString(int i) {
            switch (i) {
                case 12288:
                    return "EGL_SUCCESS";
                case 12289:
                    return "EGL_NOT_INITIALIZED";
                case 12290:
                    return "EGL_BAD_ACCESS";
                case 12291:
                    return "EGL_BAD_ALLOC";
                case 12292:
                    return "EGL_BAD_ATTRIBUTE";
                case 12293:
                    return "EGL_BAD_CONFIG";
                case 12294:
                    return "EGL_BAD_CONTEXT";
                case 12295:
                    return "EGL_BAD_CURRENT_SURFACE";
                case 12296:
                    return "EGL_BAD_DISPLAY";
                case 12297:
                    return "EGL_BAD_MATCH";
                case 12298:
                    return "EGL_BAD_NATIVE_PIXMAP";
                case 12299:
                    return "EGL_BAD_NATIVE_WINDOW";
                case 12300:
                    return "EGL_BAD_PARAMETER";
                case 12301:
                    return "EGL_BAD_SURFACE";
                case 12302:
                    return "EGL_CONTEXT_LOST";
                default:
                    return getHex(i);
            }
        }

        private static String getHex(int i) {
            String valueOf = String.valueOf(Integer.toHexString(i));
            return valueOf.length() == 0 ? new String("0x") : "0x".concat(valueOf);
        }

        public static void logEglErrorAsWarning(String str, String str2, int i) {
            Log.w(str, formatEglError(str2, i));
        }

        private void throwEglException(String str) {
            throwEglException(str, this.mEgl.eglGetError());
        }

        public static void throwEglException(String str, int i) {
            throw new RuntimeException(formatEglError(str, i));
        }

        GL createGL() {
            GL gl = this.mEglContext.getGL();
            GvrSurfaceView gvrSurfaceView = this.mGvrSurfaceViewWeakRef.get();
            if (gvrSurfaceView == null) {
                return gl;
            }
            if (gvrSurfaceView.mGLWrapper != null) {
                gl = gvrSurfaceView.mGLWrapper.wrap(gl);
            }
            if ((gvrSurfaceView.mDebugFlags & 3) != 0) {
                return GLDebugHelper.wrap(gl, (gvrSurfaceView.mDebugFlags & 1) != 0 ? 1 : 0, (gvrSurfaceView.mDebugFlags & 2) == 0 ? null : new LogWriter());
            }
            return gl;
        }

        public boolean createSurface() {
            if (this.mEgl == null) {
                throw new RuntimeException("egl not initialized");
            }
            if (this.mEglDisplay == null) {
                throw new RuntimeException("eglDisplay not initialized");
            }
            if (this.mEglConfig == null) {
                throw new RuntimeException("mEglConfig not initialized");
            }
            destroySurfaceImp();
            GvrSurfaceView gvrSurfaceView = this.mGvrSurfaceViewWeakRef.get();
            if (gvrSurfaceView == null) {
                this.mEglSurface = null;
            } else {
                this.mEglSurface = gvrSurfaceView.mEGLWindowSurfaceFactory.createWindowSurface(this.mEgl, this.mEglDisplay, this.mEglConfig, gvrSurfaceView.getHolder());
            }
            if (this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                if (this.mEgl.eglGetError() == 12299) {
                    Log.e("EglHelper", "createWindowSurface returned EGL_BAD_NATIVE_WINDOW.");
                }
                return false;
            }
            if (this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext)) {
                return true;
            }
            logEglErrorAsWarning("EGLHelper", "eglMakeCurrent", this.mEgl.eglGetError());
            return false;
        }

        public void destroySurface() {
            destroySurfaceImp();
        }

        public void finish() {
            if (this.mEglContext != null) {
                GvrSurfaceView gvrSurfaceView = this.mGvrSurfaceViewWeakRef.get();
                if (gvrSurfaceView != null) {
                    gvrSurfaceView.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext);
                }
                this.mEglContext = null;
            }
            if (this.mEglDisplay == null) {
                return;
            }
            this.mEgl.eglTerminate(this.mEglDisplay);
            this.mEglDisplay = null;
        }

        public void setEglSurfaceAttrib(int i, int i2) {
            if (Build.VERSION.SDK_INT < 17) {
                Log.e("EglHelper", "Cannot call eglSurfaceAttrib. API version is too low.");
            } else {
                if (EGL14.eglSurfaceAttrib(EGL14.eglGetCurrentDisplay(), EGL14.eglGetCurrentSurface(12377), i, i2)) {
                    return;
                }
                Log.e("EglHelper", new StringBuilder(66).append("eglSurfaceAttrib() failed. attribute=").append(i).append(" value=").append(i2).toString());
            }
        }

        public void start() {
            this.mEgl = (EGL10) EGLContext.getEGL();
            this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (this.mEglDisplay == EGL10.EGL_NO_DISPLAY) {
                throw new RuntimeException("eglGetDisplay failed");
            }
            if (!this.mEgl.eglInitialize(this.mEglDisplay, new int[2])) {
                throw new RuntimeException("eglInitialize failed");
            }
            GvrSurfaceView gvrSurfaceView = this.mGvrSurfaceViewWeakRef.get();
            if (gvrSurfaceView != null) {
                this.mEglConfig = gvrSurfaceView.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
                this.mEglContext = gvrSurfaceView.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig);
            } else {
                this.mEglConfig = null;
                this.mEglContext = null;
            }
            if (this.mEglContext == null || this.mEglContext == EGL10.EGL_NO_CONTEXT) {
                this.mEglContext = null;
                throwEglException("createContext");
            }
            this.mEglSurface = null;
        }

        public int swap() {
            if (this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface)) {
                return 12288;
            }
            return this.mEgl.eglGetError();
        }
    }

    static class GLThread extends Thread {
        private EglHelper mEglHelper;
        private boolean mExited;
        private boolean mFinishedCreatingEglSurface;
        private WeakReference<GvrSurfaceView> mGvrSurfaceViewWeakRef;
        private boolean mHasSurface;
        private boolean mHaveEglContext;
        private boolean mHaveEglSurface;
        private boolean mPaused;
        private boolean mRenderComplete;
        private boolean mRequestPaused;
        private boolean mShouldExit;
        private boolean mShouldReleaseEglContext;
        private boolean mSurfaceIsBad;
        private boolean mWaitingForSurface;
        private ArrayList<Runnable> mEventQueue = new ArrayList<>();
        private boolean mSizeChanged = true;
        private final GLThreadManager mGLThreadManager = new GLThreadManager();
        private int mWidth = 0;
        private int mHeight = 0;
        private boolean mRequestRender = true;
        private int mRenderMode = 1;
        private int mRequestedSwapMode = 0;
        private boolean mWantRenderNotification = false;

        private static class GLThreadManager {
            private static final String TAG = "GLThreadManager";

            private GLThreadManager() {
            }

            public void releaseEglContextLocked(GLThread gLThread) {
                notifyAll();
            }

            public synchronized void threadExiting(GLThread gLThread) {
                gLThread.mExited = true;
                notifyAll();
            }
        }

        GLThread(WeakReference<GvrSurfaceView> weakReference) {
            this.mGvrSurfaceViewWeakRef = weakReference;
        }

        /**
         * The render thread's main loop (AOSP GLSurfaceView.GLThread.guardedRun,
         * with Google VR's swap-mode handling).
         *
         * <p>Under the manager lock it waits until the view is ready to draw,
         * creating or releasing the EGL context and surface as the pause,
         * surface and size state requires; it then leaves the lock to run queued
         * events, create the surface and GL interface, call the renderer and
         * swap. When {@link #mRequestedSwapMode} changes, the EGL surface is
         * switched between back-buffered (SWAPMODE_QUEUED) and front-buffered
         * auto-refresh (SWAPMODE_SINGLE) rendering; in single-buffer mode no
         * swap is needed once the mode is in effect.</p>
         *
         * <p>Written by hand from the original bytecode: no decompiler could
         * structure this method.</p>
         */
        private void guardedRun() throws InterruptedException {
            this.mEglHelper = new EglHelper(this.mGvrSurfaceViewWeakRef);
            this.mHaveEglContext = false;
            this.mHaveEglSurface = false;
            this.mWantRenderNotification = false;
            GL10 gl = null;
            boolean createEglContext = false;
            boolean createEglSurface = false;
            boolean createGlInterface = false;
            boolean lostEglContext = false;
            boolean sizeChanged = false;
            boolean wantRenderNotification = false;
            boolean doRenderNotification = false;
            boolean askedToReleaseEglContext = false;
            int width = 0;
            int height = 0;
            int swapMode = SWAPMODE_QUEUED;
            boolean swapModeChanged = false;
            Runnable event = null;
            try {
                while (true) {
                    synchronized (this.mGLThreadManager) {
                        while (true) {
                            if (this.mShouldExit) {
                                return;
                            }
                            if (!this.mEventQueue.isEmpty()) {
                                event = this.mEventQueue.remove(0);
                                break;
                            }
                            boolean pausing = false;
                            if (this.mPaused != this.mRequestPaused) {
                                pausing = this.mRequestPaused;
                                this.mPaused = this.mRequestPaused;
                                this.mGLThreadManager.notifyAll();
                            }
                            if (this.mShouldReleaseEglContext) {
                                stopEglSurfaceLocked();
                                stopEglContextLocked();
                                this.mShouldReleaseEglContext = false;
                                askedToReleaseEglContext = true;
                            }
                            if (lostEglContext) {
                                stopEglSurfaceLocked();
                                stopEglContextLocked();
                                lostEglContext = false;
                            }
                            if (pausing && this.mHaveEglSurface) {
                                stopEglSurfaceLocked();
                            }
                            if (pausing && this.mHaveEglContext) {
                                GvrSurfaceView view = this.mGvrSurfaceViewWeakRef.get();
                                boolean preserveEglContext = view != null && view.mPreserveEGLContextOnPause;
                                if (!preserveEglContext) {
                                    stopEglContextLocked();
                                }
                            }
                            if (!this.mHasSurface && !this.mWaitingForSurface) {
                                if (this.mHaveEglSurface) {
                                    stopEglSurfaceLocked();
                                }
                                this.mWaitingForSurface = true;
                                this.mSurfaceIsBad = false;
                                this.mGLThreadManager.notifyAll();
                            }
                            if (this.mHasSurface && this.mWaitingForSurface) {
                                this.mWaitingForSurface = false;
                                this.mGLThreadManager.notifyAll();
                            }
                            if (doRenderNotification) {
                                this.mWantRenderNotification = false;
                                doRenderNotification = false;
                                this.mRenderComplete = true;
                                this.mGLThreadManager.notifyAll();
                            }
                            if (readyToDraw()) {
                                if (!this.mHaveEglContext) {
                                    if (askedToReleaseEglContext) {
                                        askedToReleaseEglContext = false;
                                    } else {
                                        try {
                                            this.mEglHelper.start();
                                        } catch (RuntimeException e) {
                                            this.mGLThreadManager.releaseEglContextLocked(this);
                                            throw e;
                                        }
                                        this.mHaveEglContext = true;
                                        createEglContext = true;
                                        this.mGLThreadManager.notifyAll();
                                    }
                                }
                                if (this.mHaveEglContext && !this.mHaveEglSurface) {
                                    this.mHaveEglSurface = true;
                                    createEglSurface = true;
                                    createGlInterface = true;
                                    sizeChanged = true;
                                }
                                if (this.mHaveEglSurface) {
                                    if (this.mSizeChanged) {
                                        sizeChanged = true;
                                        width = this.mWidth;
                                        height = this.mHeight;
                                        this.mWantRenderNotification = true;
                                        createEglSurface = true;
                                        this.mSizeChanged = false;
                                    }
                                    this.mRequestRender = false;
                                    this.mGLThreadManager.notifyAll();
                                    if (this.mWantRenderNotification) {
                                        wantRenderNotification = true;
                                    }
                                    swapModeChanged = this.mRequestedSwapMode != swapMode;
                                    swapMode = this.mRequestedSwapMode;
                                    break;
                                }
                            }
                            this.mGLThreadManager.wait();
                        }
                    }

                    if (event != null) {
                        event.run();
                        event = null;
                        continue;
                    }
                    if (createEglSurface) {
                        if (!this.mEglHelper.createSurface()) {
                            synchronized (this.mGLThreadManager) {
                                this.mFinishedCreatingEglSurface = true;
                                this.mSurfaceIsBad = true;
                                this.mGLThreadManager.notifyAll();
                            }
                            continue;
                        }
                        synchronized (this.mGLThreadManager) {
                            this.mFinishedCreatingEglSurface = true;
                            this.mGLThreadManager.notifyAll();
                        }
                        createEglSurface = false;
                        // A new surface starts with the default (back-buffered) attributes.
                        swapMode = SWAPMODE_QUEUED;
                    }
                    if (createGlInterface) {
                        gl = (GL10) this.mEglHelper.createGL();
                        createGlInterface = false;
                    }
                    if (createEglContext) {
                        GvrSurfaceView view = this.mGvrSurfaceViewWeakRef.get();
                        if (view != null) {
                            TraceCompat.beginSection("onSurfaceCreated");
                            try {
                                view.mRenderer.onSurfaceCreated(gl, this.mEglHelper.mEglConfig);
                            } finally {
                                TraceCompat.endSection();
                            }
                        }
                        createEglContext = false;
                    }
                    if (sizeChanged) {
                        GvrSurfaceView view = this.mGvrSurfaceViewWeakRef.get();
                        if (view != null) {
                            TraceCompat.beginSection("onSurfaceChanged");
                            try {
                                view.mRenderer.onSurfaceChanged(gl, width, height);
                            } finally {
                                TraceCompat.endSection();
                            }
                        }
                        sizeChanged = false;
                    }
                    if (swapModeChanged) {
                        // EGL_RENDER_BUFFER: EGL_SINGLE_BUFFER draws straight to the display.
                        this.mEglHelper.setEglSurfaceAttrib(EGL14.EGL_RENDER_BUFFER,
                                swapMode == SWAPMODE_SINGLE ? EGL14.EGL_SINGLE_BUFFER : EGL14.EGL_BACK_BUFFER);
                        this.mEglHelper.setEglSurfaceAttrib(EglHelper.EGL_FRONT_BUFFER_AUTO_REFRESH,
                                swapMode == SWAPMODE_SINGLE ? 1 : 0);
                    }
                    GvrSurfaceView view = this.mGvrSurfaceViewWeakRef.get();
                    if (view != null) {
                        TraceCompat.beginSection("onDrawFrame");
                        try {
                            view.mRenderer.onDrawFrame(gl);
                        } finally {
                            TraceCompat.endSection();
                        }
                    }
                    if (swapModeChanged || swapMode == SWAPMODE_QUEUED) {
                        int swapError = this.mEglHelper.swap();
                        switch (swapError) {
                            case EGL10.EGL_SUCCESS:
                                break;
                            case EGL11.EGL_CONTEXT_LOST:
                                lostEglContext = true;
                                break;
                            default:
                                EglHelper.logEglErrorAsWarning("GLThread", "eglSwapBuffers", swapError);
                                if (swapMode == SWAPMODE_QUEUED) {
                                    synchronized (this.mGLThreadManager) {
                                        this.mSurfaceIsBad = true;
                                        this.mGLThreadManager.notifyAll();
                                    }
                                }
                                break;
                        }
                    }
                    if (wantRenderNotification) {
                        doRenderNotification = true;
                        wantRenderNotification = false;
                    }
                }
            } finally {
                synchronized (this.mGLThreadManager) {
                    stopEglSurfaceLocked();
                    stopEglContextLocked();
                }
            }
        }

        private boolean readyToDraw() {
            return !this.mPaused && this.mHasSurface && !this.mSurfaceIsBad && this.mWidth > 0 && this.mHeight > 0 && (this.mRequestRender || this.mRenderMode == 1);
        }

        private void stopEglContextLocked() {
            if (this.mHaveEglContext) {
                this.mEglHelper.finish();
                this.mHaveEglContext = false;
                this.mGLThreadManager.releaseEglContextLocked(this);
            }
        }

        private void stopEglSurfaceLocked() {
            if (this.mHaveEglSurface) {
                this.mHaveEglSurface = false;
                this.mEglHelper.destroySurface();
            }
        }

        public boolean ableToDraw() {
            return this.mHaveEglContext && this.mHaveEglSurface && readyToDraw();
        }

        public int getRenderMode() {
            int i;
            synchronized (this.mGLThreadManager) {
                i = this.mRenderMode;
            }
            return i;
        }

        public int getSwapMode() {
            int i;
            synchronized (this.mGLThreadManager) {
                i = this.mRequestedSwapMode;
            }
            return i;
        }

        public void onPause() {
            synchronized (this.mGLThreadManager) {
                this.mRequestPaused = true;
                this.mGLThreadManager.notifyAll();
                while (!this.mExited && !this.mPaused) {
                    try {
                        this.mGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onResume() {
            synchronized (this.mGLThreadManager) {
                this.mRequestPaused = false;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                this.mGLThreadManager.notifyAll();
                while (!this.mExited && this.mPaused && !this.mRenderComplete) {
                    try {
                        this.mGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onWindowResize(int i, int i2) {
            synchronized (this.mGLThreadManager) {
                this.mWidth = i;
                this.mHeight = i2;
                this.mSizeChanged = true;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                if (Thread.currentThread() != this) {
                    this.mGLThreadManager.notifyAll();
                    while (!this.mExited && !this.mPaused && !this.mRenderComplete && ableToDraw()) {
                        try {
                            this.mGLThreadManager.wait();
                        } catch (InterruptedException e) {
                            Thread.currentThread().interrupt();
                        }
                    }
                }
            }
        }

        public void queueEvent(Runnable runnable) {
            if (runnable == null) {
                throw new IllegalArgumentException("r must not be null");
            }
            synchronized (this.mGLThreadManager) {
                this.mEventQueue.add(runnable);
                this.mGLThreadManager.notifyAll();
            }
        }

        public void requestExitAndWait() {
            synchronized (this.mGLThreadManager) {
                this.mShouldExit = true;
                this.mGLThreadManager.notifyAll();
                while (!this.mExited) {
                    try {
                        this.mGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void requestReleaseEglContextLocked() {
            this.mShouldReleaseEglContext = true;
            this.mGLThreadManager.notifyAll();
        }

        public void requestRender() {
            synchronized (this.mGLThreadManager) {
                this.mRequestRender = true;
                this.mGLThreadManager.notifyAll();
            }
        }

        public void requestRenderAndWait() {
            synchronized (this.mGLThreadManager) {
                if (Thread.currentThread() != this) {
                    this.mWantRenderNotification = true;
                    this.mRequestRender = true;
                    this.mRenderComplete = false;
                    this.mGLThreadManager.notifyAll();
                    while (!this.mExited && !this.mPaused && !this.mRenderComplete && ableToDraw()) {
                        try {
                            this.mGLThreadManager.wait();
                        } catch (InterruptedException e) {
                            Thread.currentThread().interrupt();
                        }
                    }
                }
            }
        }

        @Override
        public void run() {
            setName(new StringBuilder(29).append("GLThread ").append(getId()).toString());
            try {
                guardedRun();
            } catch (InterruptedException e) {
            } finally {
                this.mGLThreadManager.threadExiting(this);
            }
        }

        public void setRenderMode(int i) {
            if (i < 0 || i > 1) {
                throw new IllegalArgumentException("renderMode");
            }
            synchronized (this.mGLThreadManager) {
                this.mRenderMode = i;
                this.mGLThreadManager.notifyAll();
            }
        }

        public void setSwapMode(int i) {
            if (i < 0 || i > 2) {
                throw new IllegalArgumentException("swapMode");
            }
            synchronized (this.mGLThreadManager) {
                this.mRequestedSwapMode = i;
                this.mGLThreadManager.notifyAll();
            }
        }

        public void surfaceCreated() {
            synchronized (this.mGLThreadManager) {
                this.mHasSurface = true;
                this.mFinishedCreatingEglSurface = false;
                this.mGLThreadManager.notifyAll();
                while (this.mWaitingForSurface && !this.mFinishedCreatingEglSurface && !this.mExited) {
                    try {
                        this.mGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void surfaceDestroyed() {
            synchronized (this.mGLThreadManager) {
                this.mHasSurface = false;
                this.mGLThreadManager.notifyAll();
                while (!this.mWaitingForSurface && !this.mExited) {
                    try {
                        this.mGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }
    }

    public interface GLWrapper {
        GL wrap(GL gl);
    }

    static class LogWriter extends Writer {
        private StringBuilder mBuilder = new StringBuilder();

        LogWriter() {
        }

        private void flushBuilder() {
            if (this.mBuilder.length() <= 0) {
                return;
            }
            Log.v(GvrSurfaceView.TAG, this.mBuilder.toString());
            this.mBuilder.delete(0, this.mBuilder.length());
        }

        @Override
        public void close() {
            flushBuilder();
        }

        @Override
        public void flush() {
            flushBuilder();
        }

        @Override
        public void write(char[] cArr, int i, int i2) {
            for (int i3 = 0; i3 < i2; i3++) {
                char c = cArr[i + i3];
                if (c != '\n') {
                    this.mBuilder.append(c);
                } else {
                    flushBuilder();
                }
            }
        }
    }

    private class SimpleEGLConfigChooser extends ComponentSizeChooser {
        public SimpleEGLConfigChooser(boolean z) {
            super(8, 8, 8, 0, !z ? 0 : 16, 0);
        }
    }

    public GvrSurfaceView(Context context) {
        super(context);
        this.mThisWeakRef = new WeakReference<>(this);
        init();
    }

    public GvrSurfaceView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mThisWeakRef = new WeakReference<>(this);
        init();
    }

    private void checkRenderThreadState() {
        if (this.mGLThread != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
    }

    private void init() {
        getHolder().addCallback(this);
    }

    protected void finalize() throws Throwable {
        try {
            if (this.mGLThread != null) {
                this.mGLThread.requestExitAndWait();
            }
        } finally {
            super.finalize();
        }
    }

    public int getDebugFlags() {
        return this.mDebugFlags;
    }

    public boolean getPreserveEGLContextOnPause() {
        return this.mPreserveEGLContextOnPause;
    }

    public int getRenderMode() {
        return this.mGLThread.getRenderMode();
    }

    @Override
    protected void onAttachedToWindow() {
        int renderMode;
        int swapMode;
        super.onAttachedToWindow();
        if (this.mDetached && this.mRenderer != null) {
            if (this.mGLThread == null) {
                swapMode = 0;
                renderMode = 1;
            } else {
                renderMode = this.mGLThread.getRenderMode();
                swapMode = this.mGLThread.getSwapMode();
            }
            this.mGLThread = new GLThread(this.mThisWeakRef);
            if (renderMode != 1) {
                this.mGLThread.setRenderMode(renderMode);
            }
            if (swapMode != 0) {
                this.mGLThread.setSwapMode(swapMode);
            }
            this.mGLThread.start();
        }
        this.mDetached = false;
    }

    @Override
    protected void onDetachedFromWindow() {
        if (this.mGLThread != null) {
            this.mGLThread.requestExitAndWait();
        }
        this.mDetached = true;
        super.onDetachedFromWindow();
    }

    public void onPause() {
        this.mGLThread.onPause();
    }

    public void onResume() {
        this.mGLThread.onResume();
    }

    public void queueEvent(Runnable runnable) {
        this.mGLThread.queueEvent(runnable);
    }

    public void requestRender() {
        this.mGLThread.requestRender();
    }

    public void setDebugFlags(int i) {
        this.mDebugFlags = i;
    }

    public void setEGLConfigChooser(int i, int i2, int i3, int i4, int i5, int i6) {
        setEGLConfigChooser(new ComponentSizeChooser(i, i2, i3, i4, i5, i6));
    }

    public void setEGLConfigChooser(GLSurfaceView.EGLConfigChooser eGLConfigChooser) {
        checkRenderThreadState();
        this.mEGLConfigChooser = eGLConfigChooser;
    }

    public void setEGLConfigChooser(boolean z) {
        setEGLConfigChooser(new SimpleEGLConfigChooser(z));
    }

    public void setEGLContextClientVersion(int i) {
        checkRenderThreadState();
        this.mEGLContextClientVersion = i;
    }

    public void setEGLContextFactory(GLSurfaceView.EGLContextFactory eGLContextFactory) {
        checkRenderThreadState();
        this.mEGLContextFactory = eGLContextFactory;
    }

    public void setEGLWindowSurfaceFactory(GLSurfaceView.EGLWindowSurfaceFactory eGLWindowSurfaceFactory) {
        checkRenderThreadState();
        this.mEGLWindowSurfaceFactory = eGLWindowSurfaceFactory;
    }

    public void setGLWrapper(GLWrapper gLWrapper) {
        this.mGLWrapper = gLWrapper;
    }

    public void setPreserveEGLContextOnPause(boolean z) {
        this.mPreserveEGLContextOnPause = z;
    }

    public void setRenderMode(int i) {
        this.mGLThread.setRenderMode(i);
    }

    public void setRenderer(GLSurfaceView.Renderer renderer) {
        checkRenderThreadState();
        if (this.mEGLConfigChooser == null) {
            this.mEGLConfigChooser = new SimpleEGLConfigChooser(true);
        }
        if (this.mEGLContextFactory == null) {
            this.mEGLContextFactory = new DefaultContextFactory();
        }
        if (this.mEGLWindowSurfaceFactory == null) {
            this.mEGLWindowSurfaceFactory = new DefaultWindowSurfaceFactory();
        }
        this.mRenderer = renderer;
        this.mGLThread = new GLThread(this.mThisWeakRef);
        this.mGLThread.start();
    }

    public void setSwapMode(int i) {
        if (i == 1 && Build.VERSION.SDK_INT < 17) {
            Log.e(TAG, "setSwapMode(SWAPMODE_SINGLE) requires Jellybean MR1 (EGL14 dependency)");
        } else {
            this.mGLThread.setSwapMode(i);
        }
    }

    @Override
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
        this.mGLThread.onWindowResize(i2, i3);
    }

    @Override
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        this.mGLThread.surfaceCreated();
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        this.mGLThread.surfaceDestroyed();
    }

    @Override
    public void surfaceRedrawNeeded(SurfaceHolder surfaceHolder) {
        this.mGLThread.requestRenderAndWait();
    }
}
