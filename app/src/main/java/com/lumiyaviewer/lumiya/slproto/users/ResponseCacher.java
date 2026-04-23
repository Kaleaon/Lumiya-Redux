package com.lumiyaviewer.lumiya.slproto.users;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.dao.CachedResponse;
import com.lumiyaviewer.lumiya.dao.DaoManager;
import com.lumiyaviewer.lumiya.dao.DaoSession;
import com.lumiyaviewer.lumiya.data.repository.CachedResponseRepositoryAdapter;
import com.lumiyaviewer.lumiya.data.room.LumiyaRoomDatabase;
import com.lumiyaviewer.lumiya.react.RateLimitRequestHandler;
import com.lumiyaviewer.lumiya.react.Refreshable;
import com.lumiyaviewer.lumiya.react.RequestProcessor;
import com.lumiyaviewer.lumiya.react.RequestSource;
import com.lumiyaviewer.lumiya.react.Subscribable;
import com.lumiyaviewer.lumiya.react.SubscriptionPool;
import java.util.concurrent.Executor;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/* loaded from: classes.dex */
abstract class ResponseCacher<KeyType, MessageType> implements Refreshable<KeyType> {
    private final Executor cacheExecutor;
    private final CachedResponseRepositoryAdapter cachedResponseRepository;
    private final String keyPrefix;
    private final SubscriptionPool<KeyType, MessageType> pool = new SubscriptionPool<>();
    private final RateLimitRequestHandler<KeyType, MessageType> requestHandler;

    ResponseCacher(DaoSession daoSession, Executor executor, final String str) {
        this.cacheExecutor = executor;
        LumiyaRoomDatabase roomDb = DaoManager.getRoomDatabase(daoSession);
        this.cachedResponseRepository = new CachedResponseRepositoryAdapter(daoSession.getCachedResponseDao(), roomDb != null ? roomDb.cachedResponseDao() : null);
        this.keyPrefix = str;
        this.pool.setCacheInvalidateHandler(new Refreshable() { // from class: com.lumiyaviewer.lumiya.slproto.users.-$Lambda$Tb8OaRVtYXRJ6N6ca7skHX1PNws
            private final /* synthetic */ void $m$0(Object obj) {
                ((ResponseCacher) this).m277xf8190129(obj);
            }

            @Override // com.lumiyaviewer.lumiya.react.Refreshable
            public final void requestUpdate(Object obj) {
                $m$0(obj);
            }
        }, executor);
        this.requestHandler = new RateLimitRequestHandler<>(new RequestProcessor<KeyType, MessageType, MessageType>(this.pool, executor) { // from class: com.lumiyaviewer.lumiya.slproto.users.ResponseCacher.1
            @Override // com.lumiyaviewer.lumiya.react.RequestProcessor
            protected boolean isRequestComplete(@Nonnull KeyType keytype, MessageType messagetype) {
                if (ResponseCacher.this.cachedResponseRepository.load(ResponseCacher.this.getKeyString(keytype)) != null) {
                    return !r0.getMustRevalidate();
                }
                return false;
            }

            @Override // com.lumiyaviewer.lumiya.react.RequestProcessor
            @Nullable
            protected MessageType processRequest(@Nonnull KeyType keytype) {
                CachedResponse load = ResponseCacher.this.cachedResponseRepository.load(ResponseCacher.this.getKeyString(keytype));
                if (load == null || load.getData() == null) {
                    return null;
                }
                MessageType messagetype = (MessageType) ResponseCacher.this.loadCached(load.getData());
                Debug.Printf("%s: returning cached response for key %s (%s)", str, keytype.toString(), messagetype);
                return messagetype;
            }

            @Override // com.lumiyaviewer.lumiya.react.RequestProcessor
            protected MessageType processResult(@Nonnull KeyType keytype, MessageType messagetype) {
                Debug.Printf("%s: saving cached data for key %s", str, keytype.toString());
                if (messagetype != null) {
                    ResponseCacher.this.cachedResponseRepository.insertOrReplace(new CachedResponse(ResponseCacher.this.getKeyString(keytype), ResponseCacher.this.storeCached(messagetype), false));
                }
                return messagetype;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getKeyString(@Nonnull KeyType keytype) {
        return this.keyPrefix + ":" + keytype.toString();
    }

    public Subscribable<KeyType, MessageType> getPool() {
        return this.pool;
    }

    public RequestSource<KeyType, MessageType> getRequestSource() {
        return this.requestHandler;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_ResponseCacher_1058, reason: not valid java name */
    /* synthetic */ void m277xf8190129(Object obj) {
        CachedResponse load = this.cachedResponseRepository.load(getKeyString(obj));
        if (load != null) {
            load.setMustRevalidate(true);
            this.cachedResponseRepository.update(load);
        }
    }

    protected abstract MessageType loadCached(byte[] bArr);

    @Override // com.lumiyaviewer.lumiya.react.Refreshable
    public void requestUpdate(KeyType keytype) {
        this.pool.requestUpdate(keytype);
    }

    protected abstract byte[] storeCached(@Nonnull MessageType messagetype);
}
