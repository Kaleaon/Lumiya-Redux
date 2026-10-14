package com.lumiyaviewer.lumiya.utils

import org.junit.Assert.assertEquals
import org.junit.Test

class LevensteinDistanceTest {

    @Test
    fun testEmptyStrings() {
        assertEquals(0, LevensteinDistance.computeLevensteinDistance("", ""))
        assertEquals(5, LevensteinDistance.computeLevensteinDistance("", "hello"))
        assertEquals(5, LevensteinDistance.computeLevensteinDistance("hello", ""))
    }

    @Test
    fun testIdenticalStrings() {
        assertEquals(0, LevensteinDistance.computeLevensteinDistance("test", "test"))
        assertEquals(0, LevensteinDistance.computeLevensteinDistance("a", "a"))
        assertEquals(0, LevensteinDistance.computeLevensteinDistance("Lumiya Viewer", "Lumiya Viewer"))
    }

    @Test
    fun testSingleCharacterEdits() {
        // Insertion
        assertEquals(1, LevensteinDistance.computeLevensteinDistance("cat", "cats"))
        assertEquals(1, LevensteinDistance.computeLevensteinDistance("cats", "cat"))

        // Substitution
        assertEquals(1, LevensteinDistance.computeLevensteinDistance("cat", "bat"))

        // Deletion
        assertEquals(1, LevensteinDistance.computeLevensteinDistance("cat", "ca"))
    }

    @Test
    fun testComplexEdits() {
        assertEquals(3, LevensteinDistance.computeLevensteinDistance("kitten", "sitting"))
        assertEquals(2, LevensteinDistance.computeLevensteinDistance("flaw", "lawn"))
        assertEquals(2, LevensteinDistance.computeLevensteinDistance("gumbo", "gambol"))
        assertEquals(3, LevensteinDistance.computeLevensteinDistance("saturday", "sunday"))
    }

    @Test
    fun testSymmetry() {
        val pairs = listOf(
            "kitten" to "sitting",
            "hello" to "world",
            "algorithm" to "altruistic",
            "short" to "a very long string comparison"
        )
        for ((a, b) in pairs) {
            val distAB = LevensteinDistance.computeLevensteinDistance(a, b)
            val distBA = LevensteinDistance.computeLevensteinDistance(b, a)
            assertEquals("Symmetry failed for '$a' and '$b'", distAB, distBA)
        }
    }

    @Test
    fun testLongStrings() {
        val str1 = "The quick brown fox jumps over the lazy dog."
        val str2 = "The fast brown fox leaped over a lazy dog!"
        val dist1 = LevensteinDistance.computeLevensteinDistance(str1, str2)
        val dist2 = LevensteinDistance.computeLevensteinDistance(str2, str1)
        assertEquals(dist1, dist2)
        assertEquals(14, dist1)
    }

    @Test
    fun testUnicodeAndMultibyte() {
        assertEquals(1, LevensteinDistance.computeLevensteinDistance("café", "cafe"))
        assertEquals(2, LevensteinDistance.computeLevensteinDistance("こんにちは", "こんばんは"))
    }
}
