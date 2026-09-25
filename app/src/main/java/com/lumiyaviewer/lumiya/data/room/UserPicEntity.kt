package com.lumiyaviewer.lumiya.data.room

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(tableName = "USER_PIC", indices = [Index(value = ["UUID"])])
class UserPicEntity {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "_id")
    var id: Long? = null

    @ColumnInfo(name = "UUID")
    var uuid: String? = null

    @ColumnInfo(name = "BITMAP")
    var bitmap: ByteArray? = null
}
