package com.lumiyaviewer.lumiya.utils

object StringUtils {
    @JvmStatic
    fun countOccurrences(value: String, character: Char): Int = value.count { it == character }

    @JvmStatic
    fun toString(value: Any?): String? = value?.toString()
}
