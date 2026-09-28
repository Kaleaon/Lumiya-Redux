package com.lumiyaviewer.lumiya.react

open class SubscriptionList<K, T> {
    private val subscriptions: MutableSet<Subscription.SubscriptionReference<K, T>> = HashSet()
    private var lastData: T? = null
    private var lastError: Throwable? = null

    fun addSubscription(subscription: Subscription<K, T>) {
        subscriptions.add(subscription.reference)
    }

    fun getData(): T? = lastData

    fun getError(): Throwable? = lastError

    fun getSubscriptions(removeCollected: Boolean): List<Subscription<K, T>>? {
        var result: MutableList<Subscription<K, T>>? = null
        val it = subscriptions.iterator()
        while (it.hasNext()) {
            val subscription = it.next().get()
            if (subscription != null) {
                if (result == null) {
                    result = ArrayList(subscriptions.size)
                }
                result.add(subscription)
            } else if (removeCollected) {
                it.remove()
            }
        }
        return result
    }

    fun isEmpty(): Boolean = subscriptions.isEmpty()

    fun removeByReference(subscriptionReference: Subscription.SubscriptionReference<*, *>) {
        subscriptions.remove(subscriptionReference)
    }

    fun removeSubscription(subscription: Subscription<K, T>) {
        subscriptions.remove(subscription.reference)
    }

    fun setData(data: T?) {
        lastData = data
        lastError = null
    }

    fun setError(error: Throwable?) {
        lastData = null
        lastError = error
    }
}
