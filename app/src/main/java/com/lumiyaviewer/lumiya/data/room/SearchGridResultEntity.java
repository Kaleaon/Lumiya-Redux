package com.lumiyaviewer.lumiya.data.room;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.Index;
import androidx.room.PrimaryKey;
import java.util.UUID;

@Entity(tableName = "SearchGridResults", indices = {@Index(value = {"SEARCH_UUID"})})
public class SearchGridResultEntity {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "_id")
    public Long id;

    @ColumnInfo(name = "SEARCH_UUID")
    public UUID searchUUID;

    @ColumnInfo(name = "ITEM_TYPE")
    public int itemType;

    @ColumnInfo(name = "ITEM_UUID")
    public UUID itemUUID;

    @ColumnInfo(name = "ITEM_NAME")
    public String itemName;

    @ColumnInfo(name = "LEVENSTEIN_DISTANCE")
    public int levensteinDistance;

    @ColumnInfo(name = "MEMBER_COUNT")
    public Integer memberCount;
}
