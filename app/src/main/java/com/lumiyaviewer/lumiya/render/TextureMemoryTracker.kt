package com.lumiyaviewer.lumiya.render

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.slproto.avatar.SLMoveEvents
import java.lang.ref.WeakReference
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.atomic.AtomicInteger
import javax.annotation.Nullable

object TextureMemoryTracker {
    private const val PAGE_SIZE = 4096
    private const val RELEASE_DELAY_FRAMES = 4
    private const val TEXTURE_MAX_RESERVED_MEMORY = 33554432

    @Volatile
    private var textureMemoryReserved: Int = TEXTURE_MAX_RESERVED_MEMORY

    private val textureMemoryUsed = AtomicInteger(0)
    private val openJpegMemoryUsed = AtomicInteger(0)
    private val openJpegMemoryMmapped = AtomicInteger(0)
    private val textureMemoryLimit = AtomicInteger(SLMoveEvents.AGENT_CONTROL_TURN_RIGHT)
    private val inflightLowMemory = AtomicBoolean(false)
    private val bufMemory = AtomicInteger(0)
    private val delayedRelease = Array(RELEASE_DELAY_FRAMES) { AtomicInteger(0) }
    private val delayedReleaseBuf = Array(RELEASE_DELAY_FRAMES) { AtomicInteger(0) }
    private val delayedReleaseIndex = AtomicInteger(0)
    private val stalled = AtomicBoolean(false)
    private val rendererLock = Any()

    @Nullable
    private var activeRendererRef: WeakReference<Any>? = null

    @JvmStatic
    fun actualSize(i: Int): Int = (((i + PAGE_SIZE) - 1) / PAGE_SIZE) * PAGE_SIZE

    @JvmStatic
    fun allocBufferMemory(i: Int) {
        bufMemory.addAndGet(actualSize(i))
        printStats()
    }

    @JvmStatic
    fun allocOpenJpegMemory(i: Int, isMmapped: Boolean) {
        val size = actualSize(i)
        if (isMmapped) {
            openJpegMemoryMmapped.addAndGet(size)
        }
        openJpegMemoryUsed.addAndGet(size)
        updateInflightMemoryLow()
        printStats()
    }

    @JvmStatic
    fun allocTextureMemory(i: Int) {
        textureMemoryUsed.addAndGet(actualSize(i))
        updateInflightMemoryLow()
        printStats()
    }

    @JvmStatic
    fun canAllocateMemory(i: Int): Boolean {
        return !stalled.get() && (textureMemoryUsed.get() + bufMemory.get() + actualSize(i) + textureMemoryReserved) < textureMemoryLimit.get()
    }

    @JvmStatic
    fun clearActiveRenderer(obj: Any) {
        synchronized(rendererLock) {
            val current = activeRendererRef?.get()
            if (current === obj || current == null) {
                activeRendererRef = null
            }
        }
    }

    @JvmStatic
    fun hasActiveRenderer(): Boolean {
        synchronized(rendererLock) {
            return activeRendererRef?.get() != null
        }
    }

    private fun printStats() {
        if (Debug.isDebugBuild()) {
            Debug.Printf(
                "Texture mem used: %d Mb oj %d mmap %d tot %d limit %d Mb buf %dk",
                textureMemoryUsed.get() / 1048576,
                openJpegMemoryUsed.get() / 1048576,
                openJpegMemoryMmapped.get() / 1048576,
                (textureMemoryUsed.get() + openJpegMemoryUsed.get()) / 1048576,
                textureMemoryLimit.get() / 1048576,
                bufMemory.get() / 1024
            )
        }
    }

    @JvmStatic
    fun releaseAllFrameMemory() {
        for (i in 0 until RELEASE_DELAY_FRAMES) {
            delayedRelease[i].set(0)
            delayedReleaseBuf[i].set(0)
        }
        delayedReleaseIndex.set(0)
    }

    @JvmStatic
    fun releaseAllGLMemory() {
        textureMemoryUsed.set(0)
        bufMemory.set(0)
        stalled.set(false)
        printStats()
    }

    @JvmStatic
    fun releaseBufferMemory(i: Int) {
        delayedReleaseBuf[delayedReleaseIndex.get()].addAndGet(actualSize(i))
    }

    @JvmStatic
    fun releaseFrameMemory() {
        var changed: Boolean
        var incrementAndGet = delayedReleaseIndex.incrementAndGet()
        if (incrementAndGet >= RELEASE_DELAY_FRAMES) {
            delayedReleaseIndex.set(0)
            incrementAndGet = 0
        }
        val andSet = delayedRelease[incrementAndGet].getAndSet(0)
        val andSet2 = delayedReleaseBuf[incrementAndGet].getAndSet(0)
        changed = if (andSet != 0) {
            textureMemoryUsed.addAndGet(-andSet)
            true
        } else {
            false
        }
        if (andSet2 != 0) {
            bufMemory.addAndGet(-andSet2)
            changed = true
        }
        if (changed) {
            updateInflightMemoryLow()
            printStats()
            stalled.set(false)
        }
    }

    @JvmStatic
    fun releaseOpenJpegMemory(i: Int, isMmapped: Boolean) {
        val size = actualSize(i)
        if (isMmapped) {
            openJpegMemoryMmapped.addAndGet(-size)
        }
        openJpegMemoryUsed.addAndGet(-size)
        updateInflightMemoryLow()
    }

    @JvmStatic
    fun releaseTextureMemory(i: Int) {
        delayedRelease[delayedReleaseIndex.get()].addAndGet(actualSize(i))
    }

    @JvmStatic
    fun setActiveRenderer(activeRenderer: Any) {
        synchronized(rendererLock) {
            activeRendererRef = WeakReference(activeRenderer)
        }
    }

    private fun setInflightMemoryLow(inflightMemoryLow: Boolean) {
        if (inflightLowMemory.getAndSet(inflightMemoryLow) != inflightMemoryLow) {
            TextureCache.getInstance().setTextureMemoryState(inflightMemoryLow)
        }
    }

    @JvmStatic
    fun setMemoryLimit(memoryLimit: Int) {
        textureMemoryLimit.set(memoryLimit)
        val quarter = memoryLimit / 4
        textureMemoryReserved = if (quarter <= TEXTURE_MAX_RESERVED_MEMORY) quarter else TEXTURE_MAX_RESERVED_MEMORY
    }

    @JvmStatic
    fun stall() {
        stalled.set(true)
    }

    private fun updateInflightMemoryLow() {
        setInflightMemoryLow(textureMemoryUsed.get() + openJpegMemoryUsed.get() >= (textureMemoryLimit.get() * 3) / 2)
    }
}
