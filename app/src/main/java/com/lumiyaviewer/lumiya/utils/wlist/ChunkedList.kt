package com.lumiyaviewer.lumiya.utils.wlist

import java.util.AbstractList
import java.util.Collections
import java.util.RandomAccess

class ChunkedList<E> : AbstractList<E>(), RandomAccess {
    private val chunks: MutableList<MutableList<E>> = ArrayList()
    private var count = 0
    private var lastChunk: MutableList<E>? = null
    private var lastChunkIndex = 0
    private var lastChunkStart = 0
    private var lastChunkSize = 0

    fun interface ChunkFactory<E> {
        fun createEmptyChunk(): MutableList<E>
    }

    private fun checkConsistency() {
        var newCount = 0
        for (chunk in chunks) {
            newCount += chunk.size
        }
        check(newCount == count) {
            String.format("newCount %d, count %d", newCount, count)
        }
    }

    private fun replaceElementInChunk(list: MutableList<E>, element: E & Any, comparator: Comparator<E>): Int {
        if (list.isEmpty()) return -1
        val index = Collections.binarySearch(list, element, comparator)
        return if (index < 0) -1 else replaceFoundElement(list, index, element)
    }

    private fun replaceFoundElement(list: MutableList<E>, index: Int, element: E & Any): Int {
        list[index] = element
        var offset = 0
        for (chunk in chunks) {
            if (chunk === list) return offset + index
            offset += chunk.size
        }
        return -1
    }

    private fun resetLastPosition() {
        lastChunk = null
        checkConsistency()
    }

    private fun setLastChunk(position: Int) {
        if (position < 0 || position >= count) {
            throw IndexOutOfBoundsException(String.format("index %d, count %d", position, count))
        }
        checkConsistency()
        if (lastChunk == null) {
            lastChunkIndex = 0
            lastChunkStart = 0
            lastChunk = chunks[lastChunkIndex]
            lastChunkSize = lastChunk!!.size
        }
        while (position < lastChunkStart) {
            lastChunkIndex--
            lastChunk = chunks[lastChunkIndex]
            lastChunkSize = lastChunk!!.size
            lastChunkStart -= lastChunkSize
        }
        while (position >= lastChunkStart + lastChunkSize) {
            lastChunkIndex++
            lastChunkStart += lastChunkSize
            check(lastChunkIndex < chunks.size) {
                String.format("lastChunkIndex runaway, position %d, count %d, lastChunkStart %d", position, count, lastChunkStart)
            }
            lastChunk = chunks[lastChunkIndex]
            lastChunkSize = lastChunk!!.size
        }
    }

    fun addChunkAtEnd(list: MutableList<E>) {
        chunks.add(list)
        count += list.size
        resetLastPosition()
    }

    fun addChunkAtStart(list: MutableList<E>) {
        chunks.add(0, list)
        count += list.size
        resetLastPosition()
    }

    fun addElement(element: E, maxChunkSize: Int, chunkFactory: ChunkFactory<E>) {
        val lastList = if (chunks.isNotEmpty()) chunks[chunks.size - 1] else null
        if (lastList == null || lastList.size >= maxChunkSize) {
            val newChunk = chunkFactory.createEmptyChunk()
            newChunk.add(element)
            chunks.add(newChunk)
            count++
        } else {
            lastList.add(element)
            count++
            if (lastChunk === lastList) {
                lastChunkSize++
            }
        }
        checkConsistency()
    }

    override fun clear() {
        chunks.clear()
        count = 0
        resetLastPosition()
    }

    override fun get(index: Int): E {
        setLastChunk(index)
        if (index < lastChunkStart || index >= lastChunkStart + lastChunkSize) {
            throw IndexOutOfBoundsException(String.format("index %d, count %d", index, count))
        }
        return lastChunk!![index - lastChunkStart]
    }

    fun removeChunkAtEnd(): Int {
        if (chunks.isEmpty()) return 0
        val removed = chunks.removeAt(chunks.size - 1)
        val removedSize = removed?.size ?: 0
        count -= removedSize
        resetLastPosition()
        return removedSize
    }

    fun removeChunkAtStart(): Int {
        if (chunks.isEmpty()) return 0
        val removed = chunks.removeAt(0)
        val removedSize = removed?.size ?: 0
        count -= removedSize
        resetLastPosition()
        return removedSize
    }

    fun removeElementsAfter(index: Int): Int {
        checkConsistency()
        if (index < 0 || index >= count) return 0
        setLastChunk(index)
        if (index < lastChunkStart || index >= lastChunkStart + lastChunkSize) return 0
        val startRemoveIndex = lastChunkIndex + 2
        var removed = 0
        for (i in chunks.size - 1 downTo startRemoveIndex) {
            removed += chunks[i].size
            chunks.removeAt(i)
        }
        count -= removed
        checkConsistency()
        return removed
    }

    fun removeElementsBefore(index: Int): Int {
        checkConsistency()
        if (index < 0 || index >= count) return 0
        setLastChunk(index)
        if (index < lastChunkStart || index >= lastChunkStart + lastChunkSize) return 0
        var chunksToRemove = lastChunkIndex - 2
        var removed = 0
        if (chunksToRemove < 0) {
            chunksToRemove = 0
        } else {
            chunksToRemove += 1
        }
        while (chunksToRemove > 0) {
            removed += chunks[0].size
            chunks.removeAt(0)
            chunksToRemove--
        }
        count -= removed
        resetLastPosition()
        return removed
    }

    fun replaceElement(element: E & Any, comparator: Comparator<E>): Int {
        if (chunks.isEmpty()) return -1
        var chunkIndex = chunks.size / 2
        var direction = 0
        while (true) {
            val chunk = chunks[chunkIndex]
            if (chunk.isNotEmpty()) {
                val vsFirst = comparator.compare(element, chunk[0])
                if (vsFirst == 0) return replaceFoundElement(chunk, 0, element)
                if (vsFirst < 0) {
                    val next = chunkIndex - 1
                    if (next < 0) return -1
                    direction = -1
                    chunkIndex = next
                } else {
                    val vsLast = comparator.compare(element, chunk[chunk.size - 1])
                    if (vsLast == 0) return replaceFoundElement(chunk, chunk.size - 1, element)
                    if (vsLast <= 0) return replaceElementInChunk(chunk, element, comparator)
                    val next = chunkIndex + 1
                    if (next >= chunks.size) return -1
                    direction = 1
                    chunkIndex = next
                }
            } else if (direction < 0) {
                val next = chunkIndex - 1
                if (next < 0) return -1
                chunkIndex = next
            } else if (direction > 0) {
                val next = chunkIndex + 1
                if (next >= chunks.size) return -1
                chunkIndex = next
            } else {
                var next = -1
                for (i in chunks.indices) {
                    if (chunks[i].isNotEmpty()) {
                        next = i
                        break
                    }
                }
                if (next == -1) return -1
                chunkIndex = next
            }
        }
    }

    override val size: Int get() = count
}
