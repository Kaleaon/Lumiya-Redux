package com.lumiyaviewer.lumiya.data.room

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

@Entity(tableName = "USER_PIC", indices = [Index(value = ["UUID"])])
class UserPicEntity {
    @JvmField
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "_id")
    var id: Long? = null

    @JvmField
    @ColumnInfo(name = "UUID")
    var uuid: String? = null

    @JvmField
    @ColumnInfo(name = "BITMAP")
    var bitmap: ByteArray? = null
}
