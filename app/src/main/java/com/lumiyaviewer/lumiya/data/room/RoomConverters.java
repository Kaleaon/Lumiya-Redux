package com.lumiyaviewer.lumiya.data.room;

import androidx.annotation.Nullable;
import androidx.room.TypeConverter;
import java.util.UUID;

public class RoomConverters {
    @TypeConverter
    @Nullable
    public static UUID toUuid(@Nullable String value) {
        if (value == null) {
            return null;
        }
        return UUID.fromString(value);
    }

    @TypeConverter
    @Nullable
    public static String fromUuid(@Nullable UUID value) {
        if (value == null) {
            return null;
        }
        return value.toString();
    }
}
