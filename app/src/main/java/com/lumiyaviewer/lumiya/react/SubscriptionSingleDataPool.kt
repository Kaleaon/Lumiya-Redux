package com.lumiyaviewer.lumiya.react

class SubscriptionSingleDataPool<T> : SubscriptionGenericDataPool<SubscriptionSingleKey, T>() {
    private val entry = SubscriptionList<SubscriptionSingleKey, T>()

    companion object {
        @JvmStatic
        fun getSingleDataKey(): SubscriptionSingleKey = SubscriptionSingleKey.Value
    }

    fun getData(): T? = entry.getData()

    override fun getExistingSubscriptions(key: SubscriptionSingleKey): SubscriptionList<SubscriptionSingleKey, T> = entry

    fun getKey(): SubscriptionSingleKey = SubscriptionSingleKey.Value

    override fun getSubscriptions(key: SubscriptionSingleKey): SubscriptionList<SubscriptionSingleKey, T> = entry
}
