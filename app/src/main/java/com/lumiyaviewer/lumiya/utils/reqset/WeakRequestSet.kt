package com.lumiyaviewer.lumiya.utils.reqset

import java.lang.ref.WeakReference
import javax.annotation.concurrent.ThreadSafe

@ThreadSafe
internal class WeakRequestSet<T> {
    private val requests: MutableMap<T, MutableSet<WeakReference<Any>>> = HashMap()
    private val lock = Any()

    fun addRequest(key: T & Any, requester: Any): Boolean {
        synchronized(lock) {
            val existing = requests[key]
            if (existing == null) {
                val newSet = HashSet<WeakReference<Any>>()
                newSet.add(WeakReference(requester))
                requests[key] = newSet
                return true
            }
            val iter = existing.iterator()
            var alreadyPresent = false
            while (iter.hasNext()) {
                val ref = iter.next()
                val obj = ref.get()
                if (obj == null) {
                    iter.remove()
                } else if (obj === requester) {
                    alreadyPresent = true
                }
            }
            if (alreadyPresent) return false
            existing.add(WeakReference(requester))
            return true
        }
    }

    fun completeRequest(key: T & Any) {
        val removed: MutableSet<WeakReference<Any>>
        synchronized(lock) {
            removed = requests.remove(key) ?: return
        }
        for (ref in removed) {
            val obj = ref.get()
            if (obj != null && obj is RequestCompleteListener<*>) {
                @Suppress("UNCHECKED_CAST")
                (obj as RequestCompleteListener<T>).onRequestComplete(key)
            }
        }
    }

    fun getRequest(): T? {
        synchronized(lock) {
            val iter = requests.entries.iterator()
            while (iter.hasNext()) {
                val entry = iter.next()
                val refIter = entry.value.iterator()
                while (refIter.hasNext()) {
                    if (refIter.next().get() == null) {
                        refIter.remove()
                    }
                }
                if (entry.value.isNotEmpty()) {
                    return entry.key
                }
                iter.remove()
            }
            return null
        }
    }
}
