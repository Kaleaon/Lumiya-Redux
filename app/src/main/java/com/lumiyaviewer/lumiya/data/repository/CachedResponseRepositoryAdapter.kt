package com.lumiyaviewer.lumiya.data.repository

import com.lumiyaviewer.lumiya.dao.CachedResponse
import com.lumiyaviewer.lumiya.dao.CachedResponseDao
import com.lumiyaviewer.lumiya.data.room.CachedResponseEntity
import com.lumiyaviewer.lumiya.data.room.CachedResponseRoomDao

class CachedResponseRepositoryAdapter(
    private val greenDao: CachedResponseDao,
    private val roomDao: CachedResponseRoomDao?
) {
    fun load(key: String): CachedResponse? = greenDao.load(key)

    fun insertOrReplace(value: CachedResponse) {
        greenDao.insertOrReplace(value)
        roomDao?.insertOrReplace(value.toRoomEntity())
    }

    fun update(value: CachedResponse) {
        greenDao.update(value)
        roomDao?.update(value.toRoomEntity())
    }

    private fun CachedResponse.toRoomEntity() = CachedResponseEntity().also { entity ->
        entity.key = getKey().orEmpty()
        entity.data = getData()
        entity.mustRevalidate = getMustRevalidate()
    }
}
