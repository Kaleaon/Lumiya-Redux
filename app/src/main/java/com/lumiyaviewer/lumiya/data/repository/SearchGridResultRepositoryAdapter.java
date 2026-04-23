package com.lumiyaviewer.lumiya.data.repository;

import androidx.annotation.Nullable;
import com.lumiyaviewer.lumiya.dao.SearchGridResult;
import com.lumiyaviewer.lumiya.dao.SearchGridResultDao;
import com.lumiyaviewer.lumiya.data.room.SearchGridResultEntity;
import com.lumiyaviewer.lumiya.data.room.SearchGridResultRoomDao;

public class SearchGridResultRepositoryAdapter {
    private final SearchGridResultDao greenDao;
    @Nullable
    private final SearchGridResultRoomDao roomDao;

    public SearchGridResultRepositoryAdapter(SearchGridResultDao greenDao, @Nullable SearchGridResultRoomDao roomDao) {
        this.greenDao = greenDao;
        this.roomDao = roomDao;
    }

    public void insert(SearchGridResult value) {
        this.greenDao.insert(value);
        if (this.roomDao != null) {
            this.roomDao.insert(toEntity(value));
        }
    }

    public void deleteOtherQueries(java.util.UUID searchUUID) {
        this.greenDao.queryBuilder().where(SearchGridResultDao.Properties.SearchUUID.notEq(searchUUID), new de.greenrobot.dao.query.WhereCondition[0]).buildDelete().executeDeleteWithoutDetachingEntities();
        if (this.roomDao != null) {
            this.roomDao.deleteOtherQueries(searchUUID);
        }
    }

    private static SearchGridResultEntity toEntity(SearchGridResult value) {
        SearchGridResultEntity entity = new SearchGridResultEntity();
        entity.id = value.getId();
        entity.searchUUID = value.getSearchUUID();
        entity.itemType = value.getItemType();
        entity.itemUUID = value.getItemUUID();
        entity.itemName = value.getItemName();
        entity.levensteinDistance = value.getLevensteinDistance();
        entity.memberCount = value.getMemberCount();
        return entity;
    }
}
