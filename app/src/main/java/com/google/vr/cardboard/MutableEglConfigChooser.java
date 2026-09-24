package com.google.vr.cardboard;

import android.opengl.GLSurfaceView;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;

public class MutableEglConfigChooser implements GLSurfaceView.EGLConfigChooser {
    private static final int EGL_MUTABLE_RENDER_BUFFER_BIT = 4096;
    private static final int EGL_OPENGL_ES3_BIT_KHR = 64;
    private boolean forceMutableBuffer;

    public MutableEglConfigChooser() {
        this.forceMutableBuffer = true;
    }

    public MutableEglConfigChooser(boolean forceMutableBuffer) {
        this.forceMutableBuffer = true;
        this.forceMutableBuffer = forceMutableBuffer;
    }

    private static EGLConfig chooseConfig(EGL10 egL10, EGLDisplay eglDisplay, EGLConfig[] eglConfigs, boolean z) {
        for (EGLConfig eglConfig : eglConfigs) {
            int findConfigAttrib = findConfigAttrib(egL10, eglDisplay, eglConfig, 12325, 0);
            int configAttrib = findConfigAttrib(egL10, eglDisplay, eglConfig, 12326, 0);
            int configAttrib2 = findConfigAttrib(egL10, eglDisplay, eglConfig, 12324, 0);
            int configAttrib3 = findConfigAttrib(egL10, eglDisplay, eglConfig, 12323, 0);
            int configAttrib4 = findConfigAttrib(egL10, eglDisplay, eglConfig, 12322, 0);
            int configAttrib5 = findConfigAttrib(egL10, eglDisplay, eglConfig, 12339, 0);
            if (configAttrib2 == 8 && configAttrib3 == 8 && configAttrib4 == 8 && findConfigAttrib == 0 && configAttrib == 0 && !(z && (configAttrib5 & 4096) == 0)) {
                return eglConfig;
            }
        }
        return null;
    }

    private static int findConfigAttrib(EGL10 egL10, EGLDisplay eglDisplay, EGLConfig eglConfig, int i, int i2) {
        int[] ints = new int[1];
        return !egL10.eglGetConfigAttrib(eglDisplay, eglConfig, i, ints) ? i2 : ints[0];
    }

    @Override
    public EGLConfig chooseConfig(EGL10 egL10, EGLDisplay eglDisplay) {
        int[] ints = {12324, 8, 12323, 8, 12322, 8, 12321, 0, 12325, 0, 12326, 0, 12352, 64, 12339, 4100, 12344};
        int[] ints2 = new int[1];
        if (!egL10.eglChooseConfig(eglDisplay, ints, null, 0, ints2) && this.forceMutableBuffer) {
            throw new IllegalArgumentException("eglChooseConfig failed");
        }
        ints[15] = 4;
        if (!egL10.eglChooseConfig(eglDisplay, ints, null, 0, ints2)) {
            throw new IllegalArgumentException("eglChooseConfig failed");
        }
        int i = ints2[0];
        if (i <= 0) {
            throw new IllegalArgumentException("No configs match configSpec");
        }
        EGLConfig[] eglConfigs = new EGLConfig[i];
        if (!egL10.eglChooseConfig(eglDisplay, ints, eglConfigs, i, ints2)) {
            throw new IllegalArgumentException("eglChooseConfig#2 failed");
        }
        EGLConfig chooseConfig = chooseConfig(egL10, eglDisplay, eglConfigs, this.forceMutableBuffer);
        if (chooseConfig != null) {
            return chooseConfig;
        }
        throw new IllegalArgumentException("No config chosen");
    }
}
