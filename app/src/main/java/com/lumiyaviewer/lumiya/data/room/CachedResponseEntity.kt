package com.lumiyaviewer.lumiya.data.room

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "CachedResponses")
class CachedResponseEntity {
    @JvmField
    @PrimaryKey
    @ColumnInfo(name = "KEY")
    var key: String = ""

    @JvmField
    @ColumnInfo(name = "DATA")
    var data: ByteArray? = null

    @JvmField
    @ColumnInfo(name = "MUST_REVALIDATE")
    var mustRevalidate: Boolean = false
}
