package com.lumiyaviewer.lumiya.res.anim

import android.content.res.AssetManager
import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.render.avatar.AnimationData
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.executors.LoaderExecutor
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetData
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetKey
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetResponseCacher
import java.io.ByteArrayInputStream
import java.io.IOException
import java.util.UUID
import java.util.concurrent.atomic.AtomicReference

class AnimationCache private constructor() : ResourceMemoryCache<UUID, AnimationData>() {

    private val assetResponseCacher = AtomicReference<AssetResponseCacher?>(null)
    private val assetAnimations: ImmutableSet<String>

    init {
        val builder = ImmutableSet.builder<String>()
        val assetManager = LumiyaApp.getAssetManager()
        if (assetManager != null) {
            try {
                val list = assetManager.list("anims")
                if (list != null) {
                    builder.addAll(list.toList())
                }
            } catch (e: IOException) {
                Debug.Warning(e)
            }
        }
        assetAnimations = builder.build()
    }

    private class AssetLoadRequest(
        uuid: UUID,
        manager: ResourceManager<UUID, AnimationData>,
        private val assetName: String
    ) : ResourceRequest<UUID, AnimationData>(uuid, manager), Runnable {

        override fun cancelRequest() {
            LoaderExecutor.getInstance().remove(this)
            super.cancelRequest()
        }

        override fun execute() {
            LoaderExecutor.getInstance().execute(this)
        }

        override fun run() {
            var animationData: AnimationData? = null
            val assetManager = LumiyaApp.getAssetManager()
            if (assetManager != null) {
                try {
                    assetManager.open("anims/$assetName").use { input ->
                        animationData = AnimationData(getParams(), input)
                        val data = animationData
                        if (data != null && data.priority >= 6) {
                            Debug.Printf("Animation: priority %d loaded from asset %s",
                                data.priority, assetName)
                        }
                    }
                } catch (e: IOException) {
                    Debug.Warning(e)
                }
            }
            completeRequest(animationData)
        }
    }

    private inner class DownloadRequest(
        uuid: UUID,
        manager: ResourceManager<UUID, AnimationData>
    ) : ResourceRequest<UUID, AnimationData>(uuid, manager), Subscription.OnData<AssetData>, Subscription.OnError {

        private var assetSubscription: Subscription<AssetKey, AssetData>? = null

        override fun cancelRequest() {
            assetSubscription?.unsubscribe()
            super.cancelRequest()
        }

        override fun completeRequest(result: AnimationData?) {
            assetSubscription?.unsubscribe()
            super.completeRequest(result)
        }

        override fun execute() {
            val cacher = assetResponseCacher.get()
            if (cacher != null) {
                assetSubscription = cacher.pool.subscribe(
                    AssetKey.createAssetKey(null, null, getParams(), 20),
                    LoaderExecutor.getInstance(), this, this
                )
            } else {
                completeRequest(null)
            }
        }

        override fun onData(data: AssetData) {
            if (data == null || data.data == null || data.status != 1) {
                completeRequest(null)
                return
            }
            var animationData: AnimationData? = null
            try {
                val input = ByteArrayInputStream(data.data)
                animationData = AnimationData(getParams(), input)
                input.close()
            } catch (e: IOException) {
                Debug.Warning(e)
            }
            completeRequest(animationData)
        }

        override fun onError(error: Throwable) {
            completeRequest(null)
        }
    }

    private object InstanceHolder {
        @JvmField
        val Instance = AnimationCache()
    }

    companion object {
        @JvmStatic
        fun getInstance(): AnimationCache = InstanceHolder.Instance
    }

    override fun CreateNewRequest(
        params: UUID,
        manager: ResourceManager<UUID, AnimationData>
    ): ResourceRequest<UUID, AnimationData> {
        val text = params.toString()
        return if (assetAnimations.contains(text)) {
            AssetLoadRequest(params, manager, text)
        } else {
            DownloadRequest(params, manager)
        }
    }

    fun setAssetResponseCacher(cacher: AssetResponseCacher) {
        assetResponseCacher.set(cacher)
    }
}
