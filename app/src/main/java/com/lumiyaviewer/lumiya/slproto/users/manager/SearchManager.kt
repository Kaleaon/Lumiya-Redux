package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.dao.DaoManager
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.dao.SearchGridResult
import com.lumiyaviewer.lumiya.dao.SearchGridResultDao
import com.lumiyaviewer.lumiya.data.repository.SearchGridResultRepositoryAdapter
import com.lumiyaviewer.lumiya.react.DisposeHandler
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery
import de.greenrobot.dao.query.LazyList
import java.util.concurrent.Executor

class SearchManager(userManager: UserManager, daoSession: DaoSession) {
    private val dbExecutor: Executor = userManager.getDatabaseExecutor()
    private val searchGridResultDao: SearchGridResultDao = daoSession.searchGridResultDao
    private val searchResults = SubscriptionPool<SearchGridQuery, LazyList<SearchGridResult>>()
    private val searchRepository: SearchGridResultRepositoryAdapter

    init {
        val roomDatabase = DaoManager.getRoomDatabase(daoSession)
        searchRepository = SearchGridResultRepositoryAdapter(
            searchGridResultDao,
            roomDatabase?.searchGridResultDao()
        )
        searchResults.setDisposeHandler(
            DisposeHandler<LazyList<SearchGridResult>> { results ->
                if (!results.isClosed) results.close()
            },
            dbExecutor
        )
    }

    fun getSearchGridResultDao(): SearchGridResultDao = searchGridResultDao

    fun getSearchRepository(): SearchGridResultRepositoryAdapter = searchRepository

    fun searchResults(): SubscriptionPool<SearchGridQuery, LazyList<SearchGridResult>> = searchResults
}
