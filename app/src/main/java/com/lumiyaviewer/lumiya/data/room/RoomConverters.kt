package com.lumiyaviewer.lumiya.data.room

import androidx.room.TypeConverter
import java.util.UUID

class RoomConverters {
    companion object {
        @TypeConverter
        @JvmStatic
        fun toUuid(value: String?): UUID? = value?.let { UUID.fromString(it) }

        @TypeConverter
        @JvmStatic
        fun fromUuid(value: UUID?): String? = value?.toString()
    }
}
