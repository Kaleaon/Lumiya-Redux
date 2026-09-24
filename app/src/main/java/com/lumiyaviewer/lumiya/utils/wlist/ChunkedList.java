package com.lumiyaviewer.lumiya.utils.wlist;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.RandomAccess;
import javax.annotation.Nonnull;

public class ChunkedList<E> extends AbstractList<E> implements RandomAccess {
    private final List<List<E>> chunks = new ArrayList();
    private int count = 0;
    private List<E> lastChunk = null;
    private int lastChunkIndex = 0;
    private int lastChunkStart = 0;
    private int lastChunkSize = 0;

    public interface ChunkFactory<E> {
        List<E> createEmptyChunk();
    }

    private void checkConsistency() {
        Iterator<List<E>> it = this.chunks.iterator();
        int i = 0;
        while (it.hasNext()) {
            i = ((List) it.next()).size() + i;
        }
        if (i != this.count) {
            throw new IllegalStateException(String.format("newCount %d, count %d", Integer.valueOf(i), Integer.valueOf(this.count)));
        }
    }

    private int replaceElementInChunk(List<E> list, @Nonnull E e, @Nonnull Comparator<E> comparator) {
        int binarySearch;
        if (list.isEmpty() || (binarySearch = Collections.binarySearch(list, e, comparator)) < 0) {
            return -1;
        }
        return replaceFoundElement(list, binarySearch, e);
    }

    private int replaceFoundElement(List<E> list, int i, @Nonnull E e) {
        list.set(i, e);
        int i2 = 0;
        Iterator<List<E>> it = this.chunks.iterator();
        while (true) {
            int i3 = i2;
            if (!it.hasNext()) {
                return -1;
            }
            List<E> list2 = (List) it.next();
            if (list2 == list) {
                return i3 + i;
            }
            i2 = list2.size() + i3;
        }
    }

    private void resetLastPosition() {
        this.lastChunk = null;
        checkConsistency();
    }

    private void setLastChunk(int i) {
        if (i < 0 || i >= this.count) {
            throw new IndexOutOfBoundsException(String.format("index %d, count %d", Integer.valueOf(i), Integer.valueOf(this.count)));
        }
        checkConsistency();
        if (this.lastChunk == null) {
            this.lastChunkIndex = 0;
            this.lastChunkStart = 0;
            this.lastChunk = this.chunks.get(this.lastChunkIndex);
            this.lastChunkSize = this.lastChunk.size();
        }
        while (i < this.lastChunkStart) {
            this.lastChunkIndex--;
            this.lastChunk = this.chunks.get(this.lastChunkIndex);
            this.lastChunkSize = this.lastChunk.size();
            this.lastChunkStart -= this.lastChunkSize;
        }
        while (i >= this.lastChunkStart + this.lastChunkSize) {
            this.lastChunkIndex++;
            this.lastChunkStart += this.lastChunkSize;
            if (this.lastChunkIndex >= this.chunks.size()) {
                throw new IllegalStateException(String.format("lastChunkIndex runaway, position %d, count %d, lastChunkStart %d", Integer.valueOf(i), Integer.valueOf(this.count), Integer.valueOf(this.lastChunkStart)));
            }
            this.lastChunk = this.chunks.get(this.lastChunkIndex);
            this.lastChunkSize = this.lastChunk.size();
        }
    }

    public void addChunkAtEnd(List<E> list) {
        this.chunks.add(list);
        this.count += list.size();
        resetLastPosition();
    }

    public void addChunkAtStart(List<E> list) {
        this.chunks.add(0, list);
        this.count += list.size();
        resetLastPosition();
    }

    public void addElement(E e, int i, ChunkFactory<E> chunkFactory) {
        List<E> list = this.chunks.size() > 0 ? this.chunks.get(this.chunks.size() - 1) : null;
        if (list == null || list.size() >= i) {
            List<E> createEmptyChunk = chunkFactory.createEmptyChunk();
            createEmptyChunk.add(e);
            this.chunks.add(createEmptyChunk);
            this.count++;
        } else {
            list.add(e);
            this.count++;
            if (this.lastChunk == list) {
                this.lastChunkSize++;
            }
        }
        checkConsistency();
    }

    @Override
    public void clear() {
        this.chunks.clear();
        this.count = 0;
        resetLastPosition();
    }

    @Override
    public E get(int i) {
        setLastChunk(i);
        if (i < this.lastChunkStart || i >= this.lastChunkStart + this.lastChunkSize) {
            throw new IndexOutOfBoundsException(String.format("index %d, count %d", Integer.valueOf(i), Integer.valueOf(this.count)));
        }
        return this.lastChunk.get(i - this.lastChunkStart);
    }

    public int removeChunkAtEnd() {
        if (this.chunks.size() <= 0) {
            return 0;
        }
        List<E> remove = this.chunks.remove(this.chunks.size() - 1);
        int size = remove != null ? remove.size() : 0;
        this.count -= size;
        resetLastPosition();
        return size;
    }

    public int removeChunkAtStart() {
        if (this.chunks.size() <= 0) {
            return 0;
        }
        List<E> remove = this.chunks.remove(0);
        int size = remove != null ? remove.size() : 0;
        this.count -= size;
        resetLastPosition();
        return size;
    }

    public int removeElementsAfter(int i) {
        checkConsistency();
        if (i < 0 || i >= this.count) {
            return 0;
        }
        setLastChunk(i);
        if (i < this.lastChunkStart || i >= this.lastChunkStart + this.lastChunkSize) {
            return 0;
        }
        int i2 = this.lastChunkIndex + 2;
        int i3 = 0;
        for (int size = this.chunks.size() - 1; size >= i2; size--) {
            i3 += this.chunks.get(size).size();
            this.chunks.remove(size);
        }
        this.count -= i3;
        checkConsistency();
        return i3;
    }

    public int removeElementsBefore(int i) {
        int i2;
        int i3;
        checkConsistency();
        if (i < 0 || i >= this.count) {
            return 0;
        }
        setLastChunk(i);
        if (i < this.lastChunkStart || i >= this.lastChunkStart + this.lastChunkSize) {
            return 0;
        }
        int i4 = this.lastChunkIndex - 2;
        if (i4 >= 0) {
            i2 = i4 + 1;
            i3 = 0;
        } else {
            i2 = 0;
            i3 = 0;
        }
        while (i2 > 0) {
            i3 += this.chunks.get(0).size();
            this.chunks.remove(0);
            i2--;
        }
        this.count -= i3;
        resetLastPosition();
        return i3;
    }

    /**
     * Replace the element equal to {@code e} (per {@code comparator}) and
     * return its overall index, or -1. Chunks are kept in sorted order, so
     * the search starts at the middle chunk and walks towards the element by
     * comparing with each chunk's first and last entries. Empty chunks are
     * stepped over in the current direction; if the first probe is empty the
     * walk restarts at the first non-empty chunk.
     */
    public int replaceElement(@Nonnull E e, @Nonnull Comparator<E> comparator) {
        if (this.chunks.isEmpty()) {
            return -1;
        }
        int chunkIndex = this.chunks.size() / 2;
        int direction = 0;
        while (true) {
            List<E> chunk = this.chunks.get(chunkIndex);
            int next;
            if (!chunk.isEmpty()) {
                int vsFirst = comparator.compare(e, chunk.get(0));
                if (vsFirst == 0) {
                    return replaceFoundElement(chunk, 0, e);
                }
                if (vsFirst < 0) {
                    next = chunkIndex - 1;
                    if (next < 0) {
                        return -1;
                    }
                    direction = -1;
                } else {
                    int vsLast = comparator.compare(e, chunk.get(chunk.size() - 1));
                    if (vsLast == 0) {
                        return replaceFoundElement(chunk, chunk.size() - 1, e);
                    }
                    if (vsLast <= 0) {
                        return replaceElementInChunk(chunk, e, comparator);
                    }
                    next = chunkIndex + 1;
                    direction = 1;
                    if (next >= this.chunks.size()) {
                        return -1;
                    }
                }
            } else if (direction < 0) {
                next = chunkIndex - 1;
                if (next < 0) {
                    return -1;
                }
            } else if (direction > 0) {
                next = chunkIndex + 1;
                if (next >= this.chunks.size()) {
                    return -1;
                }
            } else {
                next = -1;
                for (int i = 0; i < this.chunks.size(); i++) {
                    if (!this.chunks.get(i).isEmpty()) {
                        next = i;
                        break;
                    }
                }
                if (next == -1) {
                    return -1;
                }
            }
            chunkIndex = next;
        }
    }

    @Override
    public int size() {
        return this.count;
    }
}
