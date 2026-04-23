package com.lumiyaviewer.lumiya.render.caps;

import android.content.SharedPreferences;
import android.opengl.GLES10;
import android.opengl.GLES20;
import android.opengl.GLES30;
import android.os.Build;
import com.google.common.base.Strings;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.render.GPUDetection;
import java.util.Locale;
import javax.annotation.Nonnull;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;

public class GpuCapabilities {
    private static final String PREF_RENDER_TIER_PREFIX = "gpu_tier.";
    private static final String[] REQUIRED_EXTENSIONS = {"GL_OES_EGL_image_external"};

    public enum CompatibilityTier {
        TIER_A,
        TIER_B,
        TIER_C
    }

    public final String glVendor;
    public final String glRenderer;
    public final String glVersion;
    public final String glExtensions;
    public final String eglVersion;
    public final boolean requestedGl20;
    public final boolean contextCreatedEs3;
    public final boolean reportsEs11;
    public final boolean supportsEs3;
    public final boolean supportsVbo;
    public final boolean supportsUbo;
    public final boolean supportsExternalTexture;
    public final String missingRequiredExtensions;
    public final boolean isAngleRenderer;
    public final int maxTextureSize;
    public final int maxTextureUnits;
    public final int maxVertexUniformVectors;
    public final int maxUniformBlockSize;
    public final int maxVertexUniformBlocks;
    public final int maxFragmentUniformBlocks;
    public final boolean quirkDisableEs3Shaders;
    public final boolean quirkDisableAsyncLoadQueue;
    public final CompatibilityTier selectedTier;

    private GpuCapabilities(
            String glVendor,
            String glRenderer,
            String glVersion,
            String glExtensions,
            String eglVersion,
            boolean requestedGl20,
            boolean contextCreatedEs3,
            boolean reportsEs11,
            boolean supportsEs3,
            boolean supportsVbo,
            boolean supportsUbo,
            boolean supportsExternalTexture,
            String missingRequiredExtensions,
            boolean isAngleRenderer,
            int maxTextureSize,
            int maxTextureUnits,
            int maxVertexUniformVectors,
            int maxUniformBlockSize,
            int maxVertexUniformBlocks,
            int maxFragmentUniformBlocks,
            boolean quirkDisableEs3Shaders,
            boolean quirkDisableAsyncLoadQueue,
            CompatibilityTier selectedTier) {
        this.glVendor = glVendor;
        this.glRenderer = glRenderer;
        this.glVersion = glVersion;
        this.glExtensions = glExtensions;
        this.eglVersion = eglVersion;
        this.requestedGl20 = requestedGl20;
        this.contextCreatedEs3 = contextCreatedEs3;
        this.reportsEs11 = reportsEs11;
        this.supportsEs3 = supportsEs3;
        this.supportsVbo = supportsVbo;
        this.supportsUbo = supportsUbo;
        this.supportsExternalTexture = supportsExternalTexture;
        this.missingRequiredExtensions = missingRequiredExtensions;
        this.isAngleRenderer = isAngleRenderer;
        this.maxTextureSize = maxTextureSize;
        this.maxTextureUnits = maxTextureUnits;
        this.maxVertexUniformVectors = maxVertexUniformVectors;
        this.maxUniformBlockSize = maxUniformBlockSize;
        this.maxVertexUniformBlocks = maxVertexUniformBlocks;
        this.maxFragmentUniformBlocks = maxFragmentUniformBlocks;
        this.quirkDisableEs3Shaders = quirkDisableEs3Shaders;
        this.quirkDisableAsyncLoadQueue = quirkDisableAsyncLoadQueue;
        this.selectedTier = selectedTier;
    }

    public static boolean shouldAttemptEs3Context(boolean requestGl20) {
        return requestGl20 && Build.VERSION.SDK_INT >= 18;
    }

    @Nonnull
    public static GpuCapabilities probe(boolean requestGl20, boolean contextCreatedEs3) {
        String glVendor = Strings.nullToEmpty(GLES10.glGetString(GLES10.GL_VENDOR));
        String glRenderer = Strings.nullToEmpty(GLES10.glGetString(GLES10.GL_RENDERER));
        String glVersion = Strings.nullToEmpty(GLES10.glGetString(GLES10.GL_VERSION));
        String glExtensions = Strings.nullToEmpty(GLES10.glGetString(GLES10.GL_EXTENSIONS));
        String eglVersion = queryEglVersion();
        String rendererLower = glRenderer.toLowerCase(Locale.US);
        String vendorLower = glVendor.toLowerCase(Locale.US);

        boolean reportsEs11 = glVersion.contains("1.1");
        boolean supportsVbo = contextCreatedEs3 || glExtensions.contains("GL_ARB_vertex_buffer_object") || reportsEs11;
        boolean supportsExternalTexture = glExtensions.contains("GL_OES_EGL_image_external");
        String missingRequiredExtensions = missingExtensions(glExtensions);
        boolean isAngleRenderer = rendererLower.contains("angle") || vendorLower.contains("angle") || glVersion.toLowerCase(Locale.US).contains("angle");

        int[] value = new int[1];
        int maxTextureSize = safeGlInt(GLES20.GL_MAX_TEXTURE_SIZE, value);
        int maxTextureUnits = safeGlInt(GLES20.GL_MAX_TEXTURE_IMAGE_UNITS, value);
        int maxVertexUniformVectors = safeGlInt(GLES20.GL_MAX_VERTEX_UNIFORM_VECTORS, value);

        int majorVersion = 2;
        if (contextCreatedEs3) {
            majorVersion = safeGlInt(GLES30.GL_MAJOR_VERSION, value);
        }
        boolean supportsEs3 = contextCreatedEs3 && majorVersion >= 3;

        int maxUniformBlockSize = 0;
        int maxVertexUniformBlocks = 0;
        int maxFragmentUniformBlocks = 0;
        boolean supportsUbo = false;
        if (supportsEs3) {
            maxUniformBlockSize = safeGlInt(GLES30.GL_MAX_UNIFORM_BLOCK_SIZE, value);
            maxVertexUniformBlocks = safeGlInt(GLES30.GL_MAX_VERTEX_UNIFORM_BLOCKS, value);
            maxFragmentUniformBlocks = safeGlInt(GLES30.GL_MAX_FRAGMENT_UNIFORM_BLOCKS, value);
            supportsUbo = maxUniformBlockSize > 0 && maxVertexUniformBlocks > 0;
        }

        GPUDetection detection = new GPUDetection(glRenderer);
        boolean quirkDisableEs3Shaders = detection.detectedFamily.or("").equals(GPUDetection.GPU_FAMILY_ADRENO)
                && detection.detectedNumericVersion != GPUDetection.INVALID_VERSION
                && detection.detectedNumericVersion < 330;
        boolean quirkDisableAsyncLoadQueue = rendererLower.contains("tegra");

        CompatibilityTier persistedTier = getPersistedTier(glRenderer);
        CompatibilityTier selectedTier = chooseTier(requestGl20, supportsEs3, isAngleRenderer, supportsUbo, maxTextureSize, persistedTier, quirkDisableEs3Shaders);
        persistTier(glRenderer, selectedTier);

        Debug.AlwaysPrintf(
                "GPU Caps: EGL='%s' GLES='%s' renderer='%s' tier=%s es3=%b angle=%b ubo=%b tex=%d missingExt='%s' quirkEs3=%b quirkAsync=%b",
                eglVersion,
                glVersion,
                glRenderer,
                selectedTier,
                Boolean.valueOf(supportsEs3),
                Boolean.valueOf(isAngleRenderer),
                Boolean.valueOf(supportsUbo),
                Integer.valueOf(maxTextureSize),
                missingRequiredExtensions,
                Boolean.valueOf(quirkDisableEs3Shaders),
                Boolean.valueOf(quirkDisableAsyncLoadQueue));

        return new GpuCapabilities(
                glVendor,
                glRenderer,
                glVersion,
                glExtensions,
                eglVersion,
                requestGl20,
                contextCreatedEs3,
                reportsEs11,
                supportsEs3,
                supportsVbo,
                supportsUbo,
                supportsExternalTexture,
                missingRequiredExtensions,
                isAngleRenderer,
                maxTextureSize,
                maxTextureUnits,
                maxVertexUniformVectors,
                maxUniformBlockSize,
                maxVertexUniformBlocks,
                maxFragmentUniformBlocks,
                quirkDisableEs3Shaders,
                quirkDisableAsyncLoadQueue,
                selectedTier);
    }

    private static String missingExtensions(String extensions) {
        StringBuilder missing = new StringBuilder();
        for (String requiredExtension : REQUIRED_EXTENSIONS) {
            if (!extensions.contains(requiredExtension)) {
                if (missing.length() > 0) {
                    missing.append(' ');
                }
                missing.append(requiredExtension);
            }
        }
        return missing.toString();
    }

    private static CompatibilityTier chooseTier(boolean requestGl20, boolean supportsEs3, boolean isAngleRenderer, boolean supportsUbo, int maxTextureSize, CompatibilityTier persistedTier, boolean quirkDisableEs3Shaders) {
        if (persistedTier != null) {
            return persistedTier;
        }
        if (!requestGl20) {
            return CompatibilityTier.TIER_C;
        }
        if (supportsEs3 && (isAngleRenderer || (!quirkDisableEs3Shaders && supportsUbo && maxTextureSize >= 4096))) {
            return CompatibilityTier.TIER_A;
        }
        if (supportsEs3) {
            return CompatibilityTier.TIER_B;
        }
        return CompatibilityTier.TIER_C;
    }

    private static int safeGlInt(int pname, int[] tmp) {
        try {
            GLES20.glGetIntegerv(pname, tmp, 0);
            return tmp[0];
        } catch (Throwable th) {
            Debug.Warning(th);
            return 0;
        }
    }

    private static String queryEglVersion() {
        try {
            if (EGLContext.getEGL() instanceof EGL10) {
                EGL10 egl10 = (EGL10) EGLContext.getEGL();
                EGLDisplay display = egl10.eglGetCurrentDisplay();
                if (display != null && display != EGL10.EGL_NO_DISPLAY) {
                    String version = egl10.eglQueryString(display, EGL10.EGL_VERSION);
                    return Strings.nullToEmpty(version);
                }
            }
        } catch (Throwable th) {
            Debug.Warning(th);
        }
        return "";
    }

    private static String getTierPreferenceKey(String glRenderer) {
        String model = Build.MANUFACTURER + "_" + Build.MODEL;
        return PREF_RENDER_TIER_PREFIX + (model + "_" + Strings.nullToEmpty(glRenderer)).replace(' ', '_');
    }

    private static void persistTier(String glRenderer, CompatibilityTier tier) {
        SharedPreferences preferences = LumiyaApp.getDefaultSharedPreferences();
        preferences.edit().putString(getTierPreferenceKey(glRenderer), tier.name()).apply();
    }

    private static CompatibilityTier getPersistedTier(String glRenderer) {
        SharedPreferences preferences = LumiyaApp.getDefaultSharedPreferences();
        String tierName = preferences.getString(getTierPreferenceKey(glRenderer), null);
        if (tierName == null) {
            return null;
        }
        try {
            return CompatibilityTier.valueOf(tierName);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}
