package com.lumiyaviewer.lumiya.slproto.objects

import com.google.common.collect.ImmutableList
import com.google.common.primitives.Ints

abstract class PayInfo {
    abstract fun defaultPayPrice(): Int
    abstract fun payPrices(): ImmutableList<Int>?
    companion object {
        const val MAX_PAY_PRICES = 4
        @JvmStatic fun create(defaultPrice: Int, prices: IntArray?): PayInfo =
            AutoValue_PayInfo(defaultPrice, prices?.let { ImmutableList.copyOf(Ints.asList(*it)) })
    }
}
