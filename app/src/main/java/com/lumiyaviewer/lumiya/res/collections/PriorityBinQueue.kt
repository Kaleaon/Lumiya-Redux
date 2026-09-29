package com.lumiyaviewer.lumiya.res.collections

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.utils.HasPriority
import java.util.NoSuchElementException
import java.util.Queue
import java.util.TreeMap
import java.util.concurrent.BlockingQueue
import java.util.concurrent.TimeUnit
import java.util.concurrent.locks.ReentrantLock

class PriorityBinQueue<T>(
    private val queueFactory: QueueFactory<T>
) : BlockingQueue<T> {

    fun interface QueueFactory<T> {
        fun getQueue(): Queue<T>
    }

    private val queues = TreeMap<Int, Queue<T>>()
    private val lock = ReentrantLock()
    private val notEmpty = lock.newCondition()

    private fun getPriority(obj: Any?): Int {
        return if (obj is HasPriority) obj.priority else 0
    }

    override fun add(element: T): Boolean {
        lock.lock()
        try {
            val priority = getPriority(element)
            Debug.Printf("PriorityBinQueue: added %s with prio %d", element.toString(), priority)
            val queue = queues.getOrPut(priority) { queueFactory.getQueue() }
            val result = queue.add(element)
            notEmpty.signalAll()
            return result
        } finally {
            lock.unlock()
        }
    }

    override fun addAll(elements: Collection<T>): Boolean {
        lock.lock()
        var changed = false
        try {
            for (element in elements) {
                val priority = getPriority(element)
                val queue = queues.getOrPut(priority) { queueFactory.getQueue() }
                changed = queue.add(element) or changed
                notEmpty.signalAll()
            }
            return changed
        } finally {
            lock.unlock()
        }
    }

    override fun clear() {
        lock.lock()
        try {
            queues.clear()
        } finally {
            lock.unlock()
        }
    }

    override fun contains(element: T): Boolean {
        lock.lock()
        try {
            val queue = queues[getPriority(element)]
            return queue?.contains(element) ?: false
        } finally {
            lock.unlock()
        }
    }

    override fun containsAll(elements: Collection<T>): Boolean {
        lock.lock()
        try {
            for (element in elements) {
                val queue = queues[getPriority(element)]
                if (queue == null || !queue.contains(element)) return false
            }
            return true
        } finally {
            lock.unlock()
        }
    }

    override fun drainTo(c: MutableCollection<in T>): Int {
        lock.lock()
        var count = 0
        try {
            for (queue in queues.values) {
                while (true) {
                    val item = queue.poll() ?: break
                    c.add(item)
                    count++
                }
            }
            queues.clear()
            return count
        } finally {
            lock.unlock()
        }
    }

    override fun drainTo(c: MutableCollection<in T>, maxElements: Int): Int {
        lock.lock()
        var count = 0
        try {
            for (queue in queues.values) {
                while (count < maxElements) {
                    val item = queue.poll() ?: break
                    c.add(item)
                    count++
                }
                if (count >= maxElements) break
            }
            return count
        } finally {
            lock.unlock()
        }
    }

    override fun element(): T {
        return peek() ?: throw NoSuchElementException()
    }

    override fun isEmpty(): Boolean {
        lock.lock()
        try {
            return queues.values.all { it.isEmpty() }
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
            for (queue in queues.values) {
                if (queue.isNotEmpty()) {
                    for (item in queue) {
                        if (item != null) return item
                    }
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
            for (queue in queues.values) {
                val it = queue.iterator()
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

    override fun remove(): T {
        return poll() ?: throw NoSuchElementException()
    }

    override fun remove(element: T): Boolean {
        lock.lock()
        try {
            val queue = queues[getPriority(element)]
            return queue?.remove(element) ?: false
        } finally {
            lock.unlock()
        }
    }

    override fun removeAll(elements: Collection<T>): Boolean {
        lock.lock()
        var changed = false
        try {
            for (item in elements) {
                val queue = queues[getPriority(item)]
                if (queue != null) {
                    changed = queue.remove(item) or changed
                }
            }
            return changed
        } finally {
            lock.unlock()
        }
    }

    override fun retainAll(elements: Collection<T>): Boolean {
        lock.lock()
        var changed = false
        try {
            for (queue in queues.values) {
                changed = queue.retainAll(elements.toSet()) or changed
            }
            return changed
        } finally {
            lock.unlock()
        }
    }

    override val size: Int
        get() {
            lock.lock()
            try {
                return queues.values.sumOf { it.size }
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

}
