package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.dao.DaoManager
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.dao.SearchGridResult
import com.lumiyaviewer.lumiya.dao.SearchGridResultDao
import com.lumiyaviewer.lumiya.data.repository.SearchGridResultRepositoryAdapter
import com.lumiyaviewer.lumiya.data.room.LumiyaRoomDatabase
import com.lumiyaviewer.lumiya.react.DisposeHandler
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery
import de.greenrobot.dao.query.LazyList
import java.util.concurrent.Executor

open class SearchManager {
    private var dbExecutor: Executor? = null
    private var searchGridResultDao: SearchGridResultDao? = null
    private SubscriptionPool<SearchGridQuery, LazyList<SearchGridResult>> searchResults = SubscriptionPool<>()
    private var searchRepository: SearchGridResultRepositoryAdapter? = null

    constructor(userManager: UserManager, daoSession: DaoSession) {
        this.dbExecutor = userManager.getDatabaseExecutor()
        this.searchGridResultDao = daoSession.getSearchGridResultDao()
        var roomDb: LumiyaRoomDatabase = DaoManager.getRoomDatabasethis as daoSession.searchRepository = SearchGridResultRepositoryAdapter(this.searchGridResultDao, if (roomDb != null) roomDb.searchGridResultDao() else null)
        this.searchResults.setDisposeHandler(DisposeHandler() {
            private /* synthetic */ void $m$0(Object obj) {
                SearchManager.m360x60619dda(obj as LazyList)
            }
            fun onDispose(obj: Any) {
                $m$0(obj)
            }
        }, this.dbExecutor)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_SearchManager_1019, reason: not valid java name */
    static /* synthetic */ void m360x60619dda(LazyList lazyList) {
        if (lazyList.isClosed()) {
            return
        }
        lazyList.close()
    }

    fun getSearchGridResultDao(): SearchGridResultDao {
        return this.searchGridResultDao
    }

    fun getSearchRepository(): SearchGridResultRepositoryAdapter {
        return this.searchRepository
    }

    public SubscriptionPool<SearchGridQuery, LazyList<SearchGridResult>> searchResults() {
        return this.searchResults
    }
}
