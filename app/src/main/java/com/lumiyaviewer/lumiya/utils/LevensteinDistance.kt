package com.lumiyaviewer.lumiya.utils

import kotlin.math.min

object LevensteinDistance {
    @JvmStatic
    fun computeLevensteinDistance(charSequence: CharSequence, charSequence2: CharSequence): Int {
        var s1 = charSequence
        var s2 = charSequence2

        if (s1 == s2) return 0
        if (s1.isEmpty()) return s2.length
        if (s2.isEmpty()) return s1.length

        if (s1.length < s2.length) {
            val temp = s1
            s1 = s2
            s2 = temp
        }

        val m = s1.length
        val n = s2.length

        var v0 = IntArray(n + 1)
        var v1 = IntArray(n + 1)

        for (j in 0..n) {
            v0[j] = j
        }

        for (i in 1..m) {
            v1[0] = i
            val char1 = s1[i - 1]
            for (j in 1..n) {
                val cost = if (char1 == s2[j - 1]) 0 else 1
                val deletion = v0[j] + 1
                val insertion = v1[j - 1] + 1
                val substitution = v0[j - 1] + cost
                v1[j] = min(min(deletion, insertion), substitution)
            }
            val temp = v0
            v0 = v1
            v1 = temp
        }

        return v0[n]
    }
}
