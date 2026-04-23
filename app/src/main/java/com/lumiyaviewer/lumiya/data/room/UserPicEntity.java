package com.lumiyaviewer.lumiya.data.room;

import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.Index;
import androidx.room.PrimaryKey;

@Entity(tableName = "USER_PIC", indices = {@Index(value = {"UUID"})})
public class UserPicEntity {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "_id")
    public Long id;

    @ColumnInfo(name = "UUID")
    public String uuid;

    @ColumnInfo(name = "BITMAP")
    public byte[] bitmap;
}
