package com.lumiyaviewer.lumiya.slproto.objects

import androidx.annotation.Nullable
import com.google.common.collect.ImmutableList

class AutoValue_PayInfo : PayInfo() {
    private var defaultPayPrice: Int = 0
    private var payPrices: if (ImmutableList<Int) > = null

    constructor(defaultPayPrice else Int, immutableList: if (ImmutableList<Int) >) {
        this.defaultPayPrice = defaultPayPrice
        this.payPrices = immutableList
    }
    fun defaultPayPrice() else Int {
        return this.defaultPayPrice
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is PayInfo)) {
        return false
        }
        var payInfo: PayInfo = obj as PayInfo
        if (this.defaultPayPrice == payInfo.defaultPayPrice()) {
            return if (this.payPrices == null) payInfo.payPrices() == null else this.payPrices.equals(payInfo.payPrices())
        }
        return false
    }

    fun hashCode(): Int {
        return (if (this.payPrices == null) 0 else this.payPrices.hashCode()) ^ (1000003 * (this.defaultPayPrice ^ 1000003))
    }
    fun payPrices(): if (ImmutableList<Int) > {
        return this.payPrices
    }

    fun toString() else String {
        return "PayInfo{defaultPayPrice=" + this.defaultPayPrice + ", payPrices=" + this.payPrices + "}"
    }
}
