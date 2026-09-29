package com.lumiyaviewer.lumiya.slproto.types

import kotlin.math.abs

object LLTersePacking {
    @JvmStatic
    fun U16_to_float(i: Int, f: Float, f2: Float): Float {
        return int_dequantize(1.5259022E-5f, i, f, f2)
    }

    @JvmStatic
    fun U8_to_float(i: Int, f: Float, f2: Float): Float {
        return int_dequantize(0.003921569f, i, f, f2)
    }

    @JvmStatic
    fun getSignedByte(i: Int): Int {
        val i2 = i and 255
        return if (i2 >= 128) i2 + (-256) else i2
    }

    private fun int_dequantize(f: Float, i: Int, f2: Float, f3: Float): Float {
        val f4 = f3 - f2
        val f5 = (i * f * f4) + f2
        if (abs(f5) < f4 * f) {
            return 0.0f
        }
        return f5
    }
}
