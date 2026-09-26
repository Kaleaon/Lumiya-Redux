package com.lumiyaviewer.lumiya.react

class SubscriptionDataPool<K, T> : SubscriptionGenericDataPool<K, T>() {
    private val entries: MutableMap<K, SubscriptionList<K, T>> = HashMap()

    override fun getExistingSubscriptions(key: K): SubscriptionList<K, T>? = entries[key]

    override fun getSubscriptions(key: K): SubscriptionList<K, T> {
        return entries.getOrPut(key) { SubscriptionList() }
    }

    override fun setCanContainNulls(canContainNulls: Boolean): SubscriptionDataPool<K, T> {
        super.setCanContainNulls(canContainNulls)
        return this
    }
}
