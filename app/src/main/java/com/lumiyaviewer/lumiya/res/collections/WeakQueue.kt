package com.lumiyaviewer.lumiya.res.collections

import com.google.common.collect.ObjectArrays
import java.util.Collections
import java.util.NoSuchElementException
import java.util.WeakHashMap
import java.util.concurrent.BlockingQueue
import java.util.concurrent.TimeUnit
import java.util.concurrent.locks.ReentrantLock

class WeakQueue<T> : BlockingQueue<T> {

    interface LowPriority

    private val queue: MutableSet<T> = Collections.newSetFromMap(WeakHashMap())
    private val lowPriorityQueue: MutableSet<T> = Collections.newSetFromMap(WeakHashMap())
    private val lock = ReentrantLock()
    private val notEmpty = lock.newCondition()

    override fun add(element: T): Boolean {
        if (element == null) return false
        lock.lock()
        try {
            if (element is LowPriority) {
                lowPriorityQueue.add(element)
            } else {
                queue.add(element)
            }
            notEmpty.signalAll()
            return true
        } finally {
            lock.unlock()
        }
    }

    override fun addAll(elements: Collection<T>): Boolean {
        lock.lock()
        try {
            for (element in elements) {
                if (element is LowPriority) {
                    lowPriorityQueue.add(element)
                } else {
                    queue.add(element)
                }
            }
            notEmpty.signalAll()
            return true
        } finally {
            lock.unlock()
        }
    }

    override fun clear() {
        lock.lock()
        try {
            queue.clear()
            lowPriorityQueue.clear()
        } finally {
            lock.unlock()
        }
    }

    override fun contains(element: T): Boolean {
        lock.lock()
        try {
            return queue.contains(element) || lowPriorityQueue.contains(element)
        } finally {
            lock.unlock()
        }
    }

    override fun containsAll(elements: Collection<T>): Boolean {
        lock.lock()
        try {
            return queue.containsAll(elements) || lowPriorityQueue.containsAll(elements)
        } finally {
            lock.unlock()
        }
    }

    override fun drainTo(c: MutableCollection<in T>): Int {
        lock.lock()
        var count = 0
        try {
            for (item in queue) {
                if (item != null) {
                    c.add(item)
                    count++
                }
            }
            queue.clear()
            for (item in lowPriorityQueue) {
                if (item != null) {
                    c.add(item)
                    count++
                }
            }
            lowPriorityQueue.clear()
            return count
        } finally {
            lock.unlock()
        }
    }

    override fun drainTo(c: MutableCollection<in T>, maxElements: Int): Int {
        lock.lock()
        var count = 0
        try {
            val it = queue.iterator()
            while (it.hasNext() && count < maxElements) {
                val next = it.next()
                if (next != null) {
                    c.add(next)
                    count++
                }
                it.remove()
            }
            val lowIt = lowPriorityQueue.iterator()
            while (lowIt.hasNext() && count < maxElements) {
                val item = lowIt.next()
                if (item != null) {
                    c.add(item)
                    count++
                }
                lowIt.remove()
            }
            return count
        } finally {
            lock.unlock()
        }
    }

    override fun element(): T = peek() ?: throw NoSuchElementException()

    override fun isEmpty(): Boolean {
        lock.lock()
        try {
            return queue.isEmpty() && lowPriorityQueue.isEmpty()
        } finally {
            lock.unlock()
        }
    }

    override fun iterator(): MutableIterator<T> {
        throw UnsupportedOperationException("Iterating over WeakQueue is not supported")
    }

    override fun offer(element: T): Boolean = add(element)

    override fun offer(element: T, timeout: Long, unit: TimeUnit): Boolean = add(element)

    override fun peek(): T? {
        lock.lock()
        try {
            if (queue.isNotEmpty()) {
                for (item in queue) {
                    if (item != null) return item
                }
            }
            if (lowPriorityQueue.isNotEmpty()) {
                for (item in lowPriorityQueue) {
                    if (item != null) return item
                }
            }
            return null
        } finally {
            lock.unlock()
        }
    }

    override fun poll(): T? {
        lock.lock()
        try {
            if (queue.isNotEmpty()) {
                val it = queue.iterator()
                while (it.hasNext()) {
                    val next = it.next()
                    if (next != null) {
                        it.remove()
                        return next
                    }
                }
            }
            if (lowPriorityQueue.isNotEmpty()) {
                val it = lowPriorityQueue.iterator()
                while (it.hasNext()) {
                    val item = it.next()
                    if (item != null) {
                        it.remove()
                        return item
                    }
                }
            }
            return null
        } finally {
            lock.unlock()
        }
    }

    override fun poll(timeout: Long, unit: TimeUnit): T? {
        lock.lock()
        try {
            do {
                val result = poll()
                if (result != null) return result
            } while (notEmpty.await(timeout, unit))
            return null
        } finally {
            lock.unlock()
        }
    }

    override fun put(element: T) {
        add(element)
    }

    override fun remainingCapacity(): Int = Int.MAX_VALUE

    override fun remove(): T = poll() ?: throw NoSuchElementException()

    override fun remove(element: T): Boolean {
        lock.lock()
        try {
            return queue.remove(element) or lowPriorityQueue.remove(element)
        } finally {
            lock.unlock()
        }
    }

    override fun removeAll(elements: Collection<T>): Boolean {
        lock.lock()
        try {
            return queue.removeAll(elements.toSet()) or lowPriorityQueue.removeAll(elements.toSet())
        } finally {
            lock.unlock()
        }
    }

    override fun retainAll(elements: Collection<T>): Boolean {
        lock.lock()
        try {
            return queue.retainAll(elements.toSet()) or lowPriorityQueue.retainAll(elements.toSet())
        } finally {
            lock.unlock()
        }
    }

    override val size: Int
        get() {
            lock.lock()
            try {
                return queue.size + lowPriorityQueue.size
            } finally {
                lock.unlock()
            }
        }

    override fun take(): T {
        lock.lock()
        try {
            while (true) {
                val result = poll()
                if (result != null) return result
                notEmpty.await()
            }
        } finally {
            lock.unlock()
        }
    }

    override fun toArray(): Array<Any?> {
        lock.lock()
        try {
            return ObjectArrays.concat(queue.toTypedArray(), lowPriorityQueue.toTypedArray(), Any::class.java)
        } finally {
            lock.unlock()
        }
    }

    override fun <T1> toArray(a: Array<T1>): Array<T1> {
        lock.lock()
        try {
            @Suppress("UNCHECKED_CAST")
            val all = toArray() as Array<T1>
            if (all.size > a.size) return all
            java.util.Arrays.fill(a, null)
            System.arraycopy(all, 0, a, 0, all.size)
            return a
        } finally {
            lock.unlock()
        }
    }
}
