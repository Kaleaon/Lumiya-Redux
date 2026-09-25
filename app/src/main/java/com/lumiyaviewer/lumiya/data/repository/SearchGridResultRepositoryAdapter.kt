package com.lumiyaviewer.lumiya.data.repository

import com.lumiyaviewer.lumiya.dao.SearchGridResult
import com.lumiyaviewer.lumiya.dao.SearchGridResultDao
import com.lumiyaviewer.lumiya.data.room.SearchGridResultEntity
import com.lumiyaviewer.lumiya.data.room.SearchGridResultRoomDao
import java.util.UUID

class SearchGridResultRepositoryAdapter(
    private val greenDao: SearchGridResultDao,
    private val roomDao: SearchGridResultRoomDao?
) {
    fun insert(value: SearchGridResult) {
        greenDao.insert(value)
        roomDao?.insert(value.toRoomEntity())
    }

    fun deleteOtherQueries(searchUUID: UUID) {
        greenDao.queryBuilder()
            .where(SearchGridResultDao.Properties.SearchUUID.notEq(searchUUID))
            .buildDelete()
            .executeDeleteWithoutDetachingEntities()
        roomDao?.deleteOtherQueries(searchUUID)
    }

    private fun SearchGridResult.toRoomEntity() = SearchGridResultEntity().also { entity ->
        entity.id = id
        entity.searchUUID = searchUUID
        entity.itemType = itemType
        entity.itemUUID = itemUUID
        entity.itemName = itemName
        entity.levensteinDistance = levensteinDistance
        entity.memberCount = memberCount
    }
}
