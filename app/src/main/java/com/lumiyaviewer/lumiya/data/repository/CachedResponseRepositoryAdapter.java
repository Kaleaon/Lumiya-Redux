package com.lumiyaviewer.lumiya.data.repository;

import androidx.annotation.Nullable;
import com.lumiyaviewer.lumiya.dao.CachedResponse;
import com.lumiyaviewer.lumiya.dao.CachedResponseDao;
import com.lumiyaviewer.lumiya.data.room.CachedResponseEntity;
import com.lumiyaviewer.lumiya.data.room.CachedResponseRoomDao;

public class CachedResponseRepositoryAdapter {
    private final CachedResponseDao greenDao;
    @Nullable
    private final CachedResponseRoomDao roomDao;

    public CachedResponseRepositoryAdapter(CachedResponseDao greenDao, @Nullable CachedResponseRoomDao roomDao) {
        this.greenDao = greenDao;
        this.roomDao = roomDao;
    }

    @Nullable
    public CachedResponse load(String key) {
        return this.greenDao.load(key);
    }

    public void insertOrReplace(CachedResponse value) {
        this.greenDao.insertOrReplace(value);
        if (this.roomDao != null) {
            this.roomDao.insertOrReplace(toEntity(value));
        }
    }

    public void update(CachedResponse value) {
        this.greenDao.update(value);
        if (this.roomDao != null) {
            this.roomDao.update(toEntity(value));
        }
    }

    private static CachedResponseEntity toEntity(CachedResponse value) {
        CachedResponseEntity entity = new CachedResponseEntity();
        entity.key = value.getKey();
        entity.data = value.getData();
        entity.mustRevalidate = value.getMustRevalidate();
        return entity;
    }
}
