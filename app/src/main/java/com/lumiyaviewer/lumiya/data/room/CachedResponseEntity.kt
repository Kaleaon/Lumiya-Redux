package com.lumiyaviewer.lumiya.data.room

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "CachedResponses")
class CachedResponseEntity {
    @PrimaryKey
    @ColumnInfo(name = "KEY")
    var key: String = ""

    @ColumnInfo(name = "DATA")
    var data: ByteArray? = null

    @ColumnInfo(name = "MUST_REVALIDATE")
    var mustRevalidate: Boolean = false
}
