package com.lumiyaviewer.lumiya.data.room;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import java.util.List;
import java.util.UUID;

@Dao
public interface SearchGridResultRoomDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    long insert(SearchGridResultEntity entity);

    @Query("DELETE FROM SearchGridResults WHERE SEARCH_UUID <> :searchUUID")
    void deleteOtherQueries(UUID searchUUID);

    @Query("SELECT * FROM SearchGridResults WHERE SEARCH_UUID = :searchUUID ORDER BY LEVENSTEIN_DISTANCE ASC")
    List<SearchGridResultEntity> loadBySearch(UUID searchUUID);
}
