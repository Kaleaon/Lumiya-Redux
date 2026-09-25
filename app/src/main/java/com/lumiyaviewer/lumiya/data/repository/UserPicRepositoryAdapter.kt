package com.lumiyaviewer.lumiya.data.repository

import com.lumiyaviewer.lumiya.dao.UserPic
import com.lumiyaviewer.lumiya.dao.UserPicDao
import com.lumiyaviewer.lumiya.data.room.UserPicEntity
import com.lumiyaviewer.lumiya.data.room.UserPicRoomDao

class UserPicRepositoryAdapter(
    private val greenDao: UserPicDao,
    private val roomDao: UserPicRoomDao?
) {
    fun insertOrReplace(value: UserPic) {
        greenDao.insertOrReplace(value)
        roomDao?.insertOrReplace(value.toRoomEntity())
    }

    private fun UserPic.toRoomEntity() = UserPicEntity().also { entity ->
        entity.id = id
        entity.uuid = uuid
        entity.bitmap = bitmap
    }
}
