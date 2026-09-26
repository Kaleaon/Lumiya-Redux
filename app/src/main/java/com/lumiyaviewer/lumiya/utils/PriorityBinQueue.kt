package com.lumiyaviewer.lumiya.utils

import com.lumiyaviewer.lumiya.Debug
import java.util.IdentityHashMap
import java.util.NoSuchElementException
import java.util.concurrent.BlockingQueue
import java.util.concurrent.TimeUnit
import java.util.concurrent.locks.ReentrantLock

class PriorityBinQueue<T>(private val numBins: Int) : BlockingQueue<T> {
    private val allItems: MutableMap<T, Int> = IdentityHashMap()
    private val lock = ReentrantLock()
    private val notEmpty = lock.newCondition()
    private val queues: Array<MutableSet<T>> = Array(numBins) { HashSet() }

    override fun add(element: T): Boolean {
        lock.lock()
        try {
            val priority = if (element is HasPriority) {
                element.priority.coerceIn(0, numBins - 1)
            } else {
                Debug.Printf("Thread %s added item %s without a priority", Thread.currentThread().name, element.toString())
                0
            }
            val result = queues[priority].add(element)
            allItems[element] = priority
            Debug.Printf("Thread %s added item to the queue, bin %d/%d", Thread.currentThread().name, priority, numBins)
            notEmpty.signalAll()
            return result
        } finally {
            lock.unlock()
        }
    }

    override fun addAll(elements: Collection<T>): Boolean {
        var changed = false
        for (element in elements) {
            changed = add(element) or changed
        }
        return changed
    }

    override fun clear() {
        lock.lock()
        try {
            for (i in 0 until numBins) {
                queues[i].clear()
            }
            allItems.clear()
        } finally {
            lock.unlock()
        }
    }

    override fun contains(element: T): Boolean {
        lock.lock()
        try {
            return allItems.containsKey(element)
        } finally {
            lock.unlock()
        }
    }

    override fun containsAll(elements: Collection<T>): Boolean {
        lock.lock()
        try {
            return elements.all { allItems.containsKey(it) }
        } finally {
            lock.unlock()
        }
    }

    override fun drainTo(c: MutableCollection<in T>): Int {
        lock.lock()
        try {
            var count = 0
            for (j in 0 until numBins) {
                count += queues[j].size
                c.addAll(queues[j])
                queues[j].clear()
            }
            allItems.clear()
            return count
        } finally {
            lock.unlock()
        }
    }

    override fun drainTo(c: MutableCollection<in T>, maxElements: Int): Int {
        if (c === this) throw IllegalArgumentException("Cannot drain a queue into itself")
        lock.lock()
        try {
            var drained = 0
            while (drained < maxElements) {
                val item = pollLocked() ?: break
                c.add(item)
                drained++
            }
            return drained
        } finally {
            lock.unlock()
        }
    }

    override fun element(): T = peek() ?: throw NoSuchElementException()

    override fun isEmpty(): Boolean {
        lock.lock()
        try {
            return allItems.isEmpty()
        } finally {
            lock.unlock()
        }
    }

    override fun iterator(): MutableIterator<T> {
        throw UnsupportedOperationException("Iterator not supported")
    }

    override fun offer(element: T): Boolean = add(element)

    override fun offer(element: T, timeout: Long, unit: TimeUnit): Boolean = add(element)

    override fun peek(): T? {
        lock.lock()
        try {
            for (queue in queues) {
                if (queue.isNotEmpty()) return queue.iterator().next()
            }
            return null
        } finally {
            lock.unlock()
        }
    }

    override fun poll(): T? {
        lock.lock()
        try {
            return pollLocked()
        } finally {
            lock.unlock()
        }
    }

    override fun poll(timeout: Long, unit: TimeUnit): T? {
        var remaining = unit.toNanos(timeout)
        lock.lockInterruptibly()
        try {
            var item: T?
            while (true) {
                item = pollLocked()
                if (item != null) return item
                if (remaining <= 0L) return null
                remaining = notEmpty.awaitNanos(remaining)
            }
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
            val bin = allItems.remove(element) ?: return false
            return queues[bin].remove(element)
        } finally {
            lock.unlock()
        }
    }

    override fun removeAll(elements: Collection<T>): Boolean {
        var changed = false
        for (element in elements) {
            changed = remove(element) or changed
        }
        return changed
    }

    override fun retainAll(elements: Collection<T>): Boolean {
        lock.lock()
        try {
            var changed = false
            for (i in 0 until numBins) {
                changed = queues[i].retainAll(elements.toSet()) or changed
            }
            allItems.keys.retainAll(elements.toSet())
            return changed
        } finally {
            lock.unlock()
        }
    }

    override val size: Int
        get() {
            lock.lock()
            try {
                return allItems.size
            } finally {
                lock.unlock()
            }
        }

    @Throws(InterruptedException::class)
    override fun take(): T {
        lock.lockInterruptibly()
        try {
            while (true) {
                val item = pollLocked()
                if (item != null) return item
                notEmpty.await()
            }
        } finally {
            lock.unlock()
        }
    }

    override fun toArray(): Array<Any?> {
        throw UnsupportedOperationException()
    }

    override fun <T : Any?> toArray(a: Array<out T>): Array<T> {
        throw UnsupportedOperationException()
    }

    fun updatePriority(t: T) {
        lock.lock()
        try {
            if (t is HasPriority) {
                val newPriority = t.priority.coerceIn(0, numBins - 1)
                val oldBin = allItems[t] ?: return
                if (oldBin != newPriority && queues[oldBin].remove(t)) {
                    queues[newPriority].add(t)
                    allItems[t] = newPriority
                }
            }
        } finally {
            lock.unlock()
        }
    }

    private fun pollLocked(): T? {
        for (i in 0 until numBins) {
            val iterator = queues[i].iterator()
            if (iterator.hasNext()) {
                val item = iterator.next()
                iterator.remove()
                allItems.remove(item)
                return item
            }
        }
        return null
    }
}
