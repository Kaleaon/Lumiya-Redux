package com.lumiyaviewer.lumiya.render.caps

import android.opengl.GLES10
import android.opengl.GLES20
import android.opengl.GLES30
import android.os.Build
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.render.GPUDetection
import java.util.Locale
import javax.annotation.Nonnull
import javax.microedition.khronos.egl.EGL10
import javax.microedition.khronos.egl.EGLContext

class GpuCapabilities private constructor(
    val glVendor: String,
    val glRenderer: String,
    val glVersion: String,
    val glExtensions: String,
    val eglVersion: String,
    val requestedGl20: Boolean,
    val contextCreatedEs3: Boolean,
    val reportsEs11: Boolean,
    val supportsEs3: Boolean,
    val supportsVbo: Boolean,
    val supportsUbo: Boolean,
    val supportsExternalTexture: Boolean,
    val missingRequiredExtensions: String,
    val isAngleRenderer: Boolean,
    val maxTextureSize: Int,
    val maxTextureUnits: Int,
    val maxVertexUniformVectors: Int,
    val maxUniformBlockSize: Int,
    val maxVertexUniformBlocks: Int,
    val maxFragmentUniformBlocks: Int,
    val quirkDisableEs3Shaders: Boolean,
    val quirkDisableAsyncLoadQueue: Boolean,
    val selectedTier: CompatibilityTier
) {

    enum class CompatibilityTier {
        TIER_A,
        TIER_B,
        TIER_C
    }

    companion object {
        private const val PREF_RENDER_TIER_PREFIX = "gpu_tier.gles3."
        private val REQUIRED_EXTENSIONS = arrayOf("GL_OES_EGL_image_external")

        @JvmStatic
        fun shouldAttemptEs3Context(requestGl20: Boolean): Boolean = requestGl20

        @JvmStatic
        @Nonnull
        fun probe(requestGl20: Boolean, contextCreatedEs3: Boolean): GpuCapabilities {
            val glVendor = Strings.nullToEmpty(GLES10.glGetString(GLES10.GL_VENDOR))
            val glRenderer = Strings.nullToEmpty(GLES10.glGetString(GLES10.GL_RENDERER))
            val glVersion = Strings.nullToEmpty(GLES10.glGetString(GLES10.GL_VERSION))
            val glExtensions = Strings.nullToEmpty(GLES10.glGetString(GLES10.GL_EXTENSIONS))
            val eglVersion = queryEglVersion()
            val rendererLower = glRenderer.lowercase(Locale.US)
            val vendorLower = glVendor.lowercase(Locale.US)

            val reportsEs11 = glVersion.contains("1.1")
            val supportsVbo = contextCreatedEs3 || glExtensions.contains("GL_ARB_vertex_buffer_object") || reportsEs11
            val supportsExternalTexture = glExtensions.contains("GL_OES_EGL_image_external")
            val missingRequiredExtensions = missingExtensions(glExtensions)
            val isAngleRenderer = rendererLower.contains("angle") || vendorLower.contains("angle") || glVersion.lowercase(Locale.US).contains("angle")

            val value = IntArray(1)
            val maxTextureSize = safeGlInt(GLES20.GL_MAX_TEXTURE_SIZE, value)
            val maxTextureUnits = safeGlInt(GLES20.GL_MAX_TEXTURE_IMAGE_UNITS, value)
            val maxVertexUniformVectors = safeGlInt(GLES20.GL_MAX_VERTEX_UNIFORM_VECTORS, value)

            var majorVersion = 2
            if (contextCreatedEs3) {
                majorVersion = safeGlInt(GLES30.GL_MAJOR_VERSION, value)
            }
            val supportsEs3 = contextCreatedEs3 && majorVersion >= 3

            var maxUniformBlockSize = 0
            var maxVertexUniformBlocks = 0
            var maxFragmentUniformBlocks = 0
            var supportsUbo = false
            if (supportsEs3) {
                maxUniformBlockSize = safeGlInt(GLES30.GL_MAX_UNIFORM_BLOCK_SIZE, value)
                maxVertexUniformBlocks = safeGlInt(GLES30.GL_MAX_VERTEX_UNIFORM_BLOCKS, value)
                maxFragmentUniformBlocks = safeGlInt(GLES30.GL_MAX_FRAGMENT_UNIFORM_BLOCKS, value)
                supportsUbo = maxUniformBlockSize > 0 && maxVertexUniformBlocks > 0
            }

            val detection = GPUDetection(glRenderer)
            val quirkDisableEs3Shaders = detection.detectedFamily.or("") == GPUDetection.GPU_FAMILY_ADRENO
                    && detection.detectedNumericVersion != GPUDetection.INVALID_VERSION
                    && detection.detectedNumericVersion < 330
            val quirkDisableAsyncLoadQueue = rendererLower.contains("tegra")

            val persistedTier = getPersistedTier(glRenderer)
            val selectedTier = chooseTier(requestGl20, supportsEs3, isAngleRenderer, supportsUbo, maxTextureSize, persistedTier, quirkDisableEs3Shaders)
            persistTier(glRenderer, selectedTier)

            Debug.AlwaysPrintf(
                "GPU Caps: EGL='%s' GLES='%s' renderer='%s' tier=%s es3=%b angle=%b ubo=%b tex=%d missingExt='%s' quirkEs3=%b quirkAsync=%b",
                eglVersion, glVersion, glRenderer, selectedTier,
                supportsEs3, isAngleRenderer, supportsUbo,
                maxTextureSize, missingRequiredExtensions,
                quirkDisableEs3Shaders, quirkDisableAsyncLoadQueue
            )

            return GpuCapabilities(
                glVendor, glRenderer, glVersion, glExtensions, eglVersion,
                requestGl20, contextCreatedEs3, reportsEs11, supportsEs3,
                supportsVbo, supportsUbo, supportsExternalTexture,
                missingRequiredExtensions, isAngleRenderer,
                maxTextureSize, maxTextureUnits, maxVertexUniformVectors,
                maxUniformBlockSize, maxVertexUniformBlocks, maxFragmentUniformBlocks,
                quirkDisableEs3Shaders, quirkDisableAsyncLoadQueue, selectedTier
            )
        }

        private fun missingExtensions(extensions: String): String {
            val missing = StringBuilder()
            for (requiredExtension in REQUIRED_EXTENSIONS) {
                if (!extensions.contains(requiredExtension)) {
                    if (missing.isNotEmpty()) {
                        missing.append(' ')
                    }
                    missing.append(requiredExtension)
                }
            }
            return missing.toString()
        }

        @JvmStatic
        fun chooseTier(
            requestGl20: Boolean,
            supportsEs3: Boolean,
            isAngleRenderer: Boolean,
            supportsUbo: Boolean,
            maxTextureSize: Int,
            persistedTier: CompatibilityTier?,
            quirkDisableEs3Shaders: Boolean
        ): CompatibilityTier {
            if (persistedTier != null) return persistedTier
            if (!requestGl20) return CompatibilityTier.TIER_C
            if (supportsEs3 && (isAngleRenderer || (!quirkDisableEs3Shaders && supportsUbo && maxTextureSize >= 4096))) {
                return CompatibilityTier.TIER_A
            }
            return if (supportsEs3) CompatibilityTier.TIER_B else CompatibilityTier.TIER_C
        }

        private fun safeGlInt(pname: Int, tmp: IntArray): Int {
            return try {
                GLES20.glGetIntegerv(pname, tmp, 0)
                tmp[0]
            } catch (th: Throwable) {
                Debug.Warning(th)
                0
            }
        }

        private fun queryEglVersion(): String {
            return try {
                val egl = EGLContext.getEGL()
                if (egl is EGL10) {
                    val display = egl.eglGetCurrentDisplay()
                    if (display != null && display != EGL10.EGL_NO_DISPLAY) {
                        val version = egl.eglQueryString(display, EGL10.EGL_VERSION)
                        return Strings.nullToEmpty(version)
                    }
                }
                ""
            } catch (th: Throwable) {
                Debug.Warning(th)
                ""
            }
        }

        private fun getTierPreferenceKey(glRenderer: String): String {
            val model = "${Build.MANUFACTURER}_${Build.MODEL}"
            return PREF_RENDER_TIER_PREFIX + "${model}_${Strings.nullToEmpty(glRenderer)}".replace(' ', '_')
        }

        private fun persistTier(glRenderer: String, tier: CompatibilityTier) {
            val preferences = LumiyaApp.getDefaultSharedPreferences()
            preferences.edit().putString(getTierPreferenceKey(glRenderer), tier.name).apply()
        }

        private fun getPersistedTier(glRenderer: String): CompatibilityTier? {
            val preferences = LumiyaApp.getDefaultSharedPreferences()
            val tierName = preferences.getString(getTierPreferenceKey(glRenderer), null) ?: return null
            return try {
                CompatibilityTier.valueOf(tierName)
            } catch (e: IllegalArgumentException) {
                null
            }
        }
    }
}
