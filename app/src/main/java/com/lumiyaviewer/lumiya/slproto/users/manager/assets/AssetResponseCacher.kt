package com.lumiyaviewer.lumiya.slproto.users.manager.assets

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.CachedAsset
import com.lumiyaviewer.lumiya.dao.CachedAssetDao
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.react.RateLimitRequestHandler
import com.lumiyaviewer.lumiya.react.Refreshable
import com.lumiyaviewer.lumiya.react.RequestProcessor
import com.lumiyaviewer.lumiya.react.RequestSource
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import java.util.concurrent.Executor

open class AssetResponseCacher : Refreshable<AssetKey> {
    private var cachedAssetDao: CachedAssetDao = null
    private var pool: SubscriptionPool<AssetKey, AssetData> = SubscriptionPool<>()
    private var requestHandler: RateLimitRequestHandler<AssetKey, AssetData> = null

    constructor(daoSession: DaoSession, executor: Executor) {
        this.cachedAssetDao = daoSession.getCachedAssetDao()
        this.pool.setCacheInvalidateHandler(this::m388x50f99f72, executor)
        this.requestHandler = RateLimitRequestHandler<>(RequestProcessor<AssetKey, AssetData, AssetData>(this.pool, executor) {
            fun isRequestComplete(assetKey: AssetKey, assetData: AssetData): Boolean {
                var cachedAsset: CachedAsset = AssetResponseCacher.this.cachedAssetDao.load(assetKey.toString())
                return cachedAsset != null && !cachedAsset.getMustRevalidate()
            }
            fun processRequest(assetKey: AssetKey): AssetData {
                var load: CachedAsset = AssetResponseCacher.this.cachedAssetDao.load(assetKey.toString())
                if (load == null) {
                    Debug.Printf("AssetCache: no cached data for key %s", assetKey)
        return null
                }
                var assetData: AssetData = AssetData(load.getStatus(), load.getData())
                Debug.Printf("AssetCache: returning cached response for key %s", assetKey)
        return assetData
            }
            fun processResult(assetKey: AssetKey, assetData: AssetData): AssetData {
                Debug.Printf("AssetCache: saving cached data for key %s", assetKey.toString())
                if (assetData != null) {
                    AssetResponseCacher.this.cachedAssetDao.insertOrReplace(CachedAsset(assetKey.toString(), assetData.getStatus(), assetData.getData(), false))
                }
        return assetData
            }
        })
    }

    public Subscribable<AssetKey, AssetData> getPool() {
        return this.pool
    }

    public RequestSource<AssetKey, AssetData> getRequestSource() {
        return this.requestHandler
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_assets_AssetResponseCacher_872, reason: not valid java name */
    /* synthetic */ void m388x50f99f72(AssetKey assetKey) {
        var load: CachedAsset = this.cachedAssetDao.load(assetKey.toString())
        if (load != null) {
            load.setMustRevalidatethis as true.cachedAssetDao.update(load)
        }
    }
    fun requestUpdate(assetKey: AssetKey) {
        this.pool.requestUpdate(assetKey)
    }
}
