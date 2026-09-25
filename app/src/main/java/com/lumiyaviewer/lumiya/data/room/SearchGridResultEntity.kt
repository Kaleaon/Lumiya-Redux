package com.lumiyaviewer.lumiya.data.room

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import java.util.UUID

@Entity(tableName = "SearchGridResults", indices = [Index(value = ["SEARCH_UUID"])])
class SearchGridResultEntity {
    @JvmField
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "_id")
    var id: Long? = null

    @JvmField
    @ColumnInfo(name = "SEARCH_UUID")
    var searchUUID: UUID? = null

    @JvmField
    @ColumnInfo(name = "ITEM_TYPE")
    var itemType: Int = 0

    @JvmField
    @ColumnInfo(name = "ITEM_UUID")
    var itemUUID: UUID? = null

    @JvmField
    @ColumnInfo(name = "ITEM_NAME")
    var itemName: String? = null

    @JvmField
    @ColumnInfo(name = "LEVENSTEIN_DISTANCE")
    var levensteinDistance: Int = 0

    @JvmField
    @ColumnInfo(name = "MEMBER_COUNT")
    var memberCount: Int? = null
}
