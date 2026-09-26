package com.lumiyaviewer.lumiya.utils

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class StringUtilsTest {
    @Test
    fun countsOnlyRequestedCharacter() {
        assertEquals(2, StringUtils.countOccurrences("migration", 'i'))
        assertEquals(0, StringUtils.countOccurrences("migration", 'z'))
    }

    @Test
    fun convertsNullableObjects() {
        assertEquals("42", StringUtils.toString(42))
        assertNull(StringUtils.toString(null))
    }
}
