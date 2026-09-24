package com.lumiyaviewer.lumiya.utils;

import javax.annotation.Nullable;

public final class StringUtils {
    public static int countOccurrences(String str, char c) {
        int i = 0;
        for (int j = 0; j < str.length(); j++) {
            if (str.charAt(j) == c) {
                i++;
            }
        }
        return i;
    }

    @Nullable
    public static String toString(@Nullable Object obj) {
        if (obj != null) {
            return obj.toString();
        }
        return null;
    }
}
