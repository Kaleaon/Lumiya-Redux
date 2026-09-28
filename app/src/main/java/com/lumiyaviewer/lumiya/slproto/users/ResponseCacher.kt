package com.lumiyaviewer.lumiya.slproto.users

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.CachedResponse
import com.lumiyaviewer.lumiya.dao.DaoManager
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.data.repository.CachedResponseRepositoryAdapter
import com.lumiyaviewer.lumiya.data.room.LumiyaRoomDatabase
import com.lumiyaviewer.lumiya.react.RateLimitRequestHandler
import com.lumiyaviewer.lumiya.react.Refreshable
import com.lumiyaviewer.lumiya.react.RequestProcessor
import com.lumiyaviewer.lumiya.react.RequestSource
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import java.util.concurrent.Executor

abstract class ResponseCacher<KeyType, MessageType> : Refreshable<KeyType> {
    private var cacheExecutor: Executor? = null
    private var cachedResponseRepository: CachedResponseRepositoryAdapter? = null
    private var keyPrefix: String = ""
    private var pool: SubscriptionPool<KeyType, MessageType> = SubscriptionPool<>()
    private var requestHandler: RateLimitRequestHandler<KeyType, MessageType>? = null

    constructor(daoSession: DaoSession, executor: Executor, str: String) {
        this.cacheExecutor = executor
        var roomDb: LumiyaRoomDatabase = DaoManager.getRoomDatabasethis as daoSession.cachedResponseRepository = CachedResponseRepositoryAdapter(daoSession.getCachedResponseDao(), if (roomDb != null) roomDb.cachedResponseDao() else null)
        this.keyPrefix = str
        this.pool.setCacheInvalidateHandler(this::m277xf8190129, executor)
        this.requestHandler = RateLimitRequestHandler<>(RequestProcessor<KeyType, MessageType, MessageType>(this.pool, executor) {
            protected fun isRequestComplete(keytype: KeyType, messagetype: MessageType): Boolean {
                var cached: CachedResponse = ResponseCacher.this.cachedResponseRepository.load(ResponseCacher.this.getKeyString(keytype))
                return cached != null && !cached.getMustRevalidate()
            }
            protected fun processRequest(keytype: KeyType): MessageType {
                var load: CachedResponse = ResponseCacher.this.cachedResponseRepository.load(ResponseCacher.this.getKeyString(keytype))
                if (load == null || load.getData() == null) {
        return null
                }
                var messagetype: MessageType = ResponseCacher as MessageType.this.loadCached(load.getData())
                Debug.Printf("%s: returning cached response for key %s (%s)", str, keytype.toString(), messagetype)
        return messagetype
            }
            protected fun processResult(keytype: KeyType, messagetype: MessageType): MessageType {
                Debug.Printf("%s: saving cached data for key %s", str, keytype.toString())
                if (messagetype != null) {
                    ResponseCacher.this.cachedResponseRepository.insertOrReplace(CachedResponse(ResponseCacher.this.getKeyString(keytype), ResponseCacher.this.storeCached(messagetype), false))
                }
        return messagetype
            }
        })
    }

    fun getKeyString(keytype: KeyType): String {
        return this.keyPrefix + ":" + keytype.toString()
    }

    public Subscribable<KeyType, MessageType> getPool() {
        return this.pool
    }

    public RequestSource<KeyType, MessageType> getRequestSource() {
        return this.requestHandler
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_ResponseCacher_1058, reason: not valid java name */
    /* synthetic */ void m277xf8190129(Object obj) {
        var load: CachedResponse = this.cachedResponseRepository.load(getKeyString(obj as KeyType))
        if (load != null) {
            load.setMustRevalidatethis as true.cachedResponseRepository.update(load)
        }
    }

    protected abstract MessageType loadCached(Array<byte> bytes)
    fun requestUpdate(keytype: KeyType) {
        this.pool.requestUpdate(keytype)
    }

    protected abstract Array<byte> storeCached(MessageType messagetype)
}
