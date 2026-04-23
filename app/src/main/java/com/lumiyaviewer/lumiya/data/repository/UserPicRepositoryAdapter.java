package com.lumiyaviewer.lumiya.data.repository;

import androidx.annotation.Nullable;
import com.lumiyaviewer.lumiya.dao.UserPic;
import com.lumiyaviewer.lumiya.dao.UserPicDao;
import com.lumiyaviewer.lumiya.data.room.UserPicEntity;
import com.lumiyaviewer.lumiya.data.room.UserPicRoomDao;

public class UserPicRepositoryAdapter {
    private final UserPicDao greenDao;
    @Nullable
    private final UserPicRoomDao roomDao;

    public UserPicRepositoryAdapter(UserPicDao greenDao, @Nullable UserPicRoomDao roomDao) {
        this.greenDao = greenDao;
        this.roomDao = roomDao;
    }

    public void insertOrReplace(UserPic value) {
        this.greenDao.insertOrReplace(value);
        if (this.roomDao != null) {
            this.roomDao.insertOrReplace(toEntity(value));
        }
    }

    private static UserPicEntity toEntity(UserPic value) {
        UserPicEntity entity = new UserPicEntity();
        entity.id = value.getId();
        entity.uuid = value.getUuid();
        entity.bitmap = value.getBitmap();
        return entity;
    }
}
