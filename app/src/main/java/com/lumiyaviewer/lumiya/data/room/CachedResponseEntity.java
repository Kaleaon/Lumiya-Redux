package com.lumiyaviewer.lumiya.data.room;

import androidx.annotation.NonNull;
import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "CachedResponses")
public class CachedResponseEntity {
    @PrimaryKey
    @NonNull
    @ColumnInfo(name = "KEY")
    public String key;

    @ColumnInfo(name = "DATA")
    public byte[] data;

    @ColumnInfo(name = "MUST_REVALIDATE")
    public boolean mustRevalidate;
}
