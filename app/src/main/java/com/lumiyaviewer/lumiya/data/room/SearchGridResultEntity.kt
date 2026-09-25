package com.lumiyaviewer.lumiya.data.room

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey
import java.util.UUID

@Entity(tableName = "SearchGridResults", indices = [Index(value = ["SEARCH_UUID"])])
class SearchGridResultEntity {
    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "_id")
    var id: Long? = null

    @ColumnInfo(name = "SEARCH_UUID")
    var searchUUID: UUID? = null

    @ColumnInfo(name = "ITEM_TYPE")
    var itemType: Int = 0

    @ColumnInfo(name = "ITEM_UUID")
    var itemUUID: UUID? = null

    @ColumnInfo(name = "ITEM_NAME")
    var itemName: String? = null

    @ColumnInfo(name = "LEVENSTEIN_DISTANCE")
    var levensteinDistance: Int = 0

    @ColumnInfo(name = "MEMBER_COUNT")
    var memberCount: Int? = null
}
