package com.lumiyaviewer.lumiya.utils.reqset

import java.lang.ref.WeakReference
import java.util.LinkedList
import java.util.TreeMap
import java.util.concurrent.locks.ReentrantLock
import javax.annotation.concurrent.ThreadSafe

@ThreadSafe
class WeakPriorityRequestSet<T> {
    private val priorityBins: MutableMap<Int, WeakRequestSet<T>> = TreeMap()
    private val lock = ReentrantLock()
    private val notEmpty = lock.newCondition()
    private val listeners: MutableSet<WeakReference<RequestListener>> = HashSet()

    private fun invokeListeners() {
        val activeListeners = LinkedList<RequestListener>()
        lock.lock()
        try {
            val iter = listeners.iterator()
            while (iter.hasNext()) {
                val listener = iter.next().get()
                if (listener == null) {
                    iter.remove()
                } else {
                    activeListeners.add(listener)
                }
            }
        } finally {
            lock.unlock()
        }
        for (listener in activeListeners) {
            listener.onNewRequest()
        }
    }

    fun addListener(listener: RequestListener) {
        lock.lock()
        try {
            val iter = listeners.iterator()
            var found = false
            while (iter.hasNext()) {
                val existing = iter.next().get()
                if (existing == null) {
                    iter.remove()
                } else if (existing === listener) {
                    found = true
                }
            }
            if (!found) {
                listeners.add(WeakReference(listener))
            }
        } finally {
            lock.unlock()
        }
    }

    fun addRequest(priority: Int, key: T & Any, requester: Any) {
        lock.lock()
        try {
            var set = priorityBins[priority]
            if (set == null) {
                set = WeakRequestSet()
                priorityBins[priority] = set
            }
            val added = set.addRequest(key, requester)
            if (added) {
                notEmpty.signalAll()
            }
            if (added) {
                invokeListeners()
            }
        } finally {
            lock.unlock()
        }
    }

    fun completeRequest(key: T & Any) {
        lock.lock()
        try {
            for (set in priorityBins.values) {
                set.completeRequest(key)
            }
        } finally {
            lock.unlock()
        }
    }

    fun getRequest(): T? {
        lock.lock()
        try {
            for (entry in priorityBins.entries) {
                val result = entry.value.getRequest()
                if (result != null) return result
            }
            return null
        } finally {
            lock.unlock()
        }
    }

    fun removeListener(listener: RequestListener) {
        lock.lock()
        try {
            val iter = listeners.iterator()
            while (iter.hasNext()) {
                val existing = iter.next().get()
                if (existing == null || existing === listener) {
                    iter.remove()
                }
            }
        } finally {
            lock.unlock()
        }
    }

    @Throws(InterruptedException::class)
    fun waitRequest() {
        lock.lock()
        try {
            if (getRequest() == null) {
                notEmpty.await()
            }
        } finally {
            lock.unlock()
        }
    }
}
