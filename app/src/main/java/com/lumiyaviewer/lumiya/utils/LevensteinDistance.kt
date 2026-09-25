package com.lumiyaviewer.lumiya.utils

import kotlin.math.min

object LevensteinDistance {
    @JvmStatic
    fun computeLevensteinDistance(charSequence: CharSequence, charSequence2: CharSequence): Int {
        val intsList = Array(charSequence.length + 1) { IntArray(charSequence2.length + 1) }
        var i = 0
        while (i <= charSequence.length) {
            intsList[i][0] = i
            i++
        }
        var j = 1
        while (j <= charSequence2.length) {
            intsList[0][j] = j
            j++
        }
        for (var11 in 1..charSequence.length) {
            for (var3 in 1..charSequence2.length) {
                val ints = intsList[var11]
                val var7 = intsList[var11 - 1][var3]
                val var5 = intsList[var11][var3 - 1]
                val var6 = intsList[var11 - 1][var3 - 1]
                val var4 = if (charSequence[var11 - 1] == charSequence2[var3 - 1]) 0 else 1
                ints[var3] = minimum(var7 + 1, var5 + 1, var4 + var6)
            }
        }
        return intsList[charSequence.length][charSequence2.length]
    }

    private fun minimum(var0: Int, var1: Int, var2: Int): Int {
        return min(min(var0, var1), var2)
    }
}
