package com.lumiyaviewer.lumiya.utils.wlist

import com.google.common.collect.Lists
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.utils.Identifiable
import java.util.AbstractList
import java.util.Comparator
import java.util.RandomAccess
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.Executor
import java.util.concurrent.atomic.AtomicBoolean

open class ChunkedListLoader<E : Identifiable<Long>>(
    private val windowSize: Int,
    private val executor: Executor,
    private val startFromStart: Boolean,
    private val listener: EventListener
) : AbstractList<E>(), ChunkedList.ChunkFactory<E>, RandomAccess {

    private val listenerExecutor: Executor = listener.listEventsExecutor
    private var loadAboveTopmostId: Long = 0L
    private var loadBelowLastId: Long = 0L
    private val addedElements = ConcurrentLinkedQueue<E>()
    private val updatePosted = AtomicBoolean()
    private val loadRequested = AtomicBoolean()
    private val reloadRequested = AtomicBoolean()
    private val reloadAccepted = AtomicBoolean()
    private val lock = Any()
    private var loadAboveWanted = false
    private var loadAboveResult: LoadResult<E>? = null
    private var loadBelowWanted = false
    private var loadBelowResult: LoadResult<E>? = null
    private val updatedElements: MutableMap<Long, E> = HashMap()

    private val loadMoreData = Runnable {
        var shouldPostUpdate: Boolean
        Debug.Printf("ChatView: processing loadMoreData(), reloadRequested %b", reloadRequested.get())
        loadRequested.set(false)

        var needAbove: Boolean
        var aboveId: Long
        synchronized(lock) {
            needAbove = loadAboveWanted && loadAboveResult == null && !reloadRequested.get()
            aboveId = loadAboveTopmostId
        }
        var didLoad = false
        if (needAbove) {
            val result = loadInBackground(windowSize, aboveId, false)
            synchronized(lock) { loadAboveResult = result }
            didLoad = true
        }

        var needBelow: Boolean
        var belowId: Long
        synchronized(lock) {
            needBelow = loadBelowWanted && loadBelowResult == null && !reloadRequested.get()
            belowId = loadBelowLastId
        }
        if (needBelow) {
            val result = loadInBackground(windowSize, belowId, true)
            synchronized(lock) { loadBelowResult = result }
            didLoad = true
        }

        shouldPostUpdate = if (reloadRequested.getAndSet(false)) {
            reloadAccepted.set(true)
            true
        } else {
            didLoad
        }

        if (shouldPostUpdate) {
            postUpdate()
        }
    }

    private val processUpdate = Runnable {
        updatePosted.set(false)
        Debug.Printf("ChatView: processUpdate, reloadAccepted: %b", reloadAccepted.get())

        if (reloadAccepted.getAndSet(false)) {
            synchronized(lock) {
                loadAboveWanted = false
                loadAboveResult = null
                loadBelowResult = null
                loadBelowWanted = false
            }
            hasAbove = true
            hasBelow = true
            addedElements.clear()
            items.clear()
            listener.onListReloaded()
            return@Runnable
        }

        var aboveResult: LoadResult<E>? = null
        synchronized(lock) {
            val lr = loadAboveResult
            if (lr != null) {
                aboveResult = lr
                loadAboveResult = null
                loadAboveWanted = false
            }
        }
        var addedAbove = 0
        if (aboveResult != null) {
            addedAbove = aboveResult!!.entries.size
            items.addChunkAtStart(Lists.reverse(aboveResult!!.entries).toMutableList())
            hasAbove = aboveResult!!.hasMore
            if (aboveResult!!.fromId == Long.MAX_VALUE) {
                hasBelow = false
            }
        }
        if (addedAbove != 0) {
            listener.onListItemsAdded(0, addedAbove)
        }

        val prevSize = items.size

        var belowResult: LoadResult<E>? = null
        synchronized(lock) {
            val lr = loadBelowResult
            if (lr != null) {
                belowResult = lr
                loadBelowResult = null
                loadBelowWanted = false
            }
        }
        var addedBelow = if (belowResult != null) {
            val sz = belowResult!!.entries.size
            items.addChunkAtEnd(belowResult!!.entries.toMutableList())
            hasBelow = belowResult!!.hasMore
            if (belowResult!!.fromId == 0L) {
                hasAbove = false
            }
            sz
        } else 0

        var addedAtEnd = false
        while (true) {
            val removed = addedElements.poll() ?: break
            val lastId = if (items.size > 0) items[items.size - 1].id else -1L
            Debug.Printf("ChatView: added element: id %d, lastId %d, hasBelow %b", removed.id, lastId, hasBelow)
            if (!hasBelow && removed.id > lastId) {
                items.addElement(removed, windowSize, this@ChunkedListLoader)
                addedBelow++
                addedAtEnd = true
            }
        }
        if (addedBelow != 0) {
            listener.onListItemsAdded(prevSize, addedBelow)
        }
        if (addedAtEnd) {
            listener.onListItemAddedAtEnd()
        }

        while (true) {
            var element: E? = null
            synchronized(lock) {
                val iter = updatedElements.entries.iterator()
                if (iter.hasNext()) {
                    element = iter.next().value
                    iter.remove()
                }
            }
            if (element == null) return@Runnable
            val replacedIndex = items.replaceElement(element!!, chatMessageComparator)
            Debug.Printf("ChunkedListLoader: replace: replacedIndex is %d", replacedIndex)
            if (replacedIndex >= 0) {
                listener.onListItemChanged(replacedIndex)
            }
        }
    }

    private val chatMessageComparator = Comparator<E> { a, b ->
        java.lang.Long.signum(a.id - b.id)
    }

    private var items: ChunkedList<E> = ChunkedList()
    private var hasAbove = true
    private var hasBelow = true

    interface EventListener {
        val listEventsExecutor: Executor
        fun onListItemAddedAtEnd()
        fun onListItemChanged(index: Int)
        fun onListItemsAdded(start: Int, count: Int)
        fun onListItemsRemoved(start: Int, count: Int)
        fun onListReloaded()
    }

    protected open class LoadResult<E>(
        val entries: List<E>,
        val hasMore: Boolean,
        val fromId: Long
    )

    fun postUpdate() {
        if (!updatePosted.compareAndSet(false, true)) {
            Debug.Printf("ChatView: processUpdate () already requested")
        } else {
            Debug.Printf("ChatView: requesting processUpdate ()")
            listenerExecutor.execute(processUpdate)
        }
    }

    fun addElement(e: E) {
        Debug.Printf("ChatView: addElement: adding element with id %d", e.id)
        addedElements.add(e)
        postUpdate()
    }

    override fun createEmptyChunk(): MutableList<E> = ArrayList(windowSize)

    override fun get(index: Int): E = items[index]

    fun hasMoreItemsAtBottom(): Boolean = hasBelow

    protected open fun loadInBackground(count: Int, fromId: Long, forward: Boolean): LoadResult<E> {
        return LoadResult(ArrayList(0), false, fromId)
    }

    fun reload() {
        reloadRequested.set(true)
        if (loadRequested.compareAndSet(false, true)) {
            executor.execute(loadMoreData)
        }
    }

    fun setVisibleRange(first: Int, last: Int) {
        var shouldLoad = false
        synchronized(lock) {
            Debug.Printf("ChatView: new visible range %d, %d size %d above possible %s below possible %s",
                first, last, items.size,
                if (loadAboveWanted || loadAboveResult != null) "no" else "yes",
                if (loadBelowWanted || loadBelowResult != null) "no" else "yes")
        }

        if (items.size > 0) {
            if (first <= 0 && hasAbove) {
                synchronized(lock) {
                    if (!loadAboveWanted && loadAboveResult == null) {
                        loadAboveTopmostId = items[0].id
                        loadAboveWanted = true
                        Debug.Printf("ChatView: requesting load above id %d", loadAboveTopmostId)
                        shouldLoad = true
                    }
                }
            } else if (first > 0) {
                var canTrim: Boolean
                synchronized(lock) { canTrim = !loadAboveWanted && loadAboveResult == null }
                if (canTrim) {
                    val removed = items.removeElementsBefore(first)
                    if (removed != 0) {
                        hasAbove = true
                        listener.onListItemsRemoved(0, removed)
                    }
                }
            }
            if (last >= items.size - 1 && hasBelow) {
                synchronized(lock) {
                    if (!loadBelowWanted && loadBelowResult == null) {
                        loadBelowLastId = items[items.size - 1].id
                        loadBelowWanted = true
                        Debug.Printf("ChatView: requesting load below id %d", loadBelowLastId)
                        shouldLoad = true
                    }
                }
            } else if (last in 0 until items.size - 1) {
                var canTrim: Boolean
                synchronized(lock) { canTrim = !loadBelowWanted && loadBelowResult == null }
                if (canTrim) {
                    val prevSize = items.size
                    val removed = items.removeElementsAfter(last)
                    if (removed != 0) {
                        hasBelow = true
                        listener.onListItemsRemoved(prevSize - removed, removed)
                    }
                }
            }
        } else if (startFromStart) {
            if (hasBelow) {
                synchronized(lock) {
                    if (!loadBelowWanted && loadBelowResult == null) {
                        loadBelowLastId = 0L
                        loadBelowWanted = true
                        Debug.Printf("ChatView: requesting load below id %d", loadBelowLastId)
                        shouldLoad = true
                    }
                }
            }
        } else {
            if (hasAbove) {
                synchronized(lock) {
                    if (!loadAboveWanted && loadAboveResult == null) {
                        loadAboveTopmostId = Long.MAX_VALUE
                        loadAboveWanted = true
                        Debug.Printf("ChatView: requesting load above id %d", loadAboveTopmostId)
                        shouldLoad = true
                    }
                }
            }
        }

        if (shouldLoad) {
            if (!loadRequested.compareAndSet(false, true)) {
                Debug.Printf("ChatView: loadMoreData() already requested")
            } else {
                Debug.Printf("ChatView: requesting loadMoreData ()")
                executor.execute(loadMoreData)
            }
        }
    }

    override val size: Int get() = items.size

    fun updateElement(e: E) {
        Debug.Printf("ChatView: addElement: updated element with id %d", e.id)
        synchronized(lock) {
            updatedElements[e.id] = e
        }
        postUpdate()
    }
}
