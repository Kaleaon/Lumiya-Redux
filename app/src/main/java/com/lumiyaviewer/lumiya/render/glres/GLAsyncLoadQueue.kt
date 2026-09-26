package com.lumiyaviewer.lumiya.render.glres

import android.opengl.GLES10
import android.os.SystemClock
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.TextureMemoryTracker
import com.lumiyaviewer.lumiya.render.avatar.AnimationSequenceInfo
import com.lumiyaviewer.lumiya.res.collections.WeakQueue
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicReference
import javax.annotation.Nonnull
import javax.microedition.khronos.egl.EGL10
import javax.microedition.khronos.egl.EGLConfig
import javax.microedition.khronos.egl.EGLContext
import javax.microedition.khronos.egl.EGLDisplay
import javax.microedition.khronos.egl.EGLSurface

class GLAsyncLoadQueue @Throws(InstantiationException::class) constructor(
    renderContext: RenderContext,
    private val egl10: EGL10,
    private val eglDisplay: EGLDisplay,
    private val eglConfig: EGLConfig,
    private val requestGL30: Boolean
) : GLLoadQueue(), GLLoadQueue.GLLoadHandler {

    private val eglBaseContext: EGLContext
    private val thread: Thread
    private val mustExit = AtomicBoolean(false)
    private val contextReadyLock = Any()

    @Volatile
    private var contextReady = false

    @Volatile
    private var contextFailed = true

    private val loadedQueue = WeakQueue<GLLoadQueue.GLLoadable>()

    private inner class EGLLoadThread(renderContext: RenderContext) : Runnable {
        private var eglSurface: EGLSurface? = null
        private val renderContext = AtomicReference(renderContext)

        private fun createContext(): EGLContext? {
            Debug.Printf("TexLoad: create[1]: eglGetError = %d", egl10.eglGetError())
            val ints = intArrayOf(12440, if (requestGL30) 3 else 2, 12344)
            val eglCreateContext = egl10.eglCreateContext(eglDisplay, eglConfig, eglBaseContext, ints)
            Debug.Printf("TexLoad: create[2]: eglGetError = %d", egl10.eglGetError())
            val eglCreatePbufferSurface = egl10.eglCreatePbufferSurface(
                eglDisplay, eglConfig, intArrayOf(12374, 128, 12375, 128, 12344)
            )
            Debug.Printf("TexLoad: create[3]: eglGetError = %d", egl10.eglGetError())
            if (eglCreateContext == null || eglCreateContext == EGL10.EGL_NO_CONTEXT) {
                Debug.Printf("TexLoad: Failed to create loader context")
                egl10.eglDestroySurface(eglDisplay, eglCreatePbufferSurface)
                return null
            }
            Debug.Printf("TexLoad: texture loader context created (%s)", eglCreateContext)
            eglSurface = eglCreatePbufferSurface
            return eglCreateContext
        }

        override fun run() {
            val rc = renderContext.getAndSet(null)
            val createContext = createContext()
            var failedAttempts = 0
            var lastGcTime = 0L

            Debug.Printf("TexLoad: Signaling context readiness.")
            synchronized(contextReadyLock) {
                contextFailed = createContext == null
                contextReady = true
                (contextReadyLock as Object).notifyAll()
            }

            if (createContext != null) {
                Debug.Printf("TexLoad: thread init: eglGetError = %d", egl10.eglGetError())
                Debug.Printf("TexLoad: thread init: rc = %b, eglGetError = %d",
                    egl10.eglMakeCurrent(eglDisplay, eglSurface, eglSurface, createContext),
                    egl10.eglGetError())

                while (!mustExit.get()) {
                    try {
                        val take = loadQueue.take()
                        if (TextureMemoryTracker.canAllocateMemory(take.GLGetLoadSize())) {
                            take.GLLoad(rc, this@GLAsyncLoadQueue)
                            GLES10.glFinish()
                            failedAttempts = 0
                        } else {
                            loadQueue.offer(take)
                            Thread.sleep(1000L)
                            failedAttempts++
                            if (failedAttempts >= 10) {
                                val uptimeMillis = SystemClock.uptimeMillis()
                                if (uptimeMillis - lastGcTime >= AnimationSequenceInfo.MAX_ANIMATION_LENGTH) {
                                    Debug.Printf("TexLoad: invoking GC.")
                                    System.gc()
                                    failedAttempts = 0
                                    lastGcTime = uptimeMillis
                                }
                            }
                        }
                    } catch (e: InterruptedException) {
                        // interrupted, check mustExit
                    }
                }

                loadedQueue.clear()
                Debug.Printf("TexLoad: Working thread exiting.")
                egl10.eglMakeCurrent(eglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT)
                egl10.eglDestroyContext(eglDisplay, createContext)
                egl10.eglDestroySurface(eglDisplay, eglSurface)
                eglSurface = null
            }
        }
    }

    init {
        eglBaseContext = egl10.eglGetCurrentContext()
        if (eglBaseContext == null || eglBaseContext == EGL10.EGL_NO_CONTEXT) {
            throw InstantiationException("TexLoad: current context was null")
        }
        thread = Thread(EGLLoadThread(renderContext), "EGLLoader")
        thread.priority = 4
        thread.start()
        try {
            Debug.Printf("TexLoad: Waiting for thread to create context")
            synchronized(contextReadyLock) {
                while (!contextReady) {
                    (contextReadyLock as Object).wait()
                }
            }
            Debug.Printf("TexLoad: Context created, failed = %b", contextFailed)
            if (contextFailed) {
                throw InstantiationException("TexLoad: failed to create context")
            }
        } catch (e: InterruptedException) {
            throw InstantiationException("Interrupted: ${e.message}")
        }
    }

    override fun GLResourceLoaded(glLoadable: GLLoadQueue.GLLoadable) {
        loadedQueue.offer(glLoadable)
    }

    override fun RunLoadQueue(@Nonnull renderContext: RenderContext) {
        while (true) {
            val poll = loadedQueue.poll() ?: return
            poll.GLCompleteLoad()
        }
    }

    override fun StopLoadQueue() {
        Debug.Printf("TexLoad: StopLoadQueue called.")
        mustExit.set(true)
        thread.interrupt()
        try {
            thread.join()
        } catch (e: InterruptedException) {
            // ignore
        }
        super.StopLoadQueue()
        Debug.Printf("TexLoad: StopLoadQueue exiting.")
    }

    override fun remove(@Nonnull glLoadable: GLLoadQueue.GLLoadable) {
        loadedQueue.remove(glLoadable)
        super.remove(glLoadable)
    }
}
