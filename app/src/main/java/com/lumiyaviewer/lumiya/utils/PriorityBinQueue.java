package com.lumiyaviewer.lumiya.utils;

import com.lumiyaviewer.lumiya.Debug;
import java.util.Collection;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: classes.dex */
public class PriorityBinQueue<T> implements BlockingQueue<T> {
    private final Map<T, Integer> allItems = new IdentityHashMap();
    private final Lock lock = new ReentrantLock();
    private final Condition notEmpty = this.lock.newCondition();
    private final int numBins;
    private final Set<T>[] queues;

    public PriorityBinQueue(int i) {
        this.numBins = i;
        this.queues = new Set[i];
        for (int i2 = 0; i2 < i; i2++) {
            this.queues[i2] = new HashSet();
        }
    }

    @Override // java.util.concurrent.BlockingQueue, java.util.Queue, java.util.Collection
    public boolean add(T t) {
        int i;
        this.lock.lock();
        try {
            if (t instanceof HasPriority) {
                i = ((HasPriority) t).getPriority();
                if (i < 0) {
                    i = 0;
                } else if (i > this.numBins - 1) {
                    i = this.numBins - 1;
                }
            } else {
                Debug.Printf("Thread %s added item %s without a priority", Thread.currentThread().getName(), t.toString());
                i = 0;
            }
            boolean add = this.queues[i].add(t);
            this.allItems.put(t, Integer.valueOf(i));
            Debug.Printf("Thread %s added item to the queue, bin %d/%d", Thread.currentThread().getName(), Integer.valueOf(i), Integer.valueOf(this.numBins));
            this.notEmpty.signalAll();
            return add;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Collection
    public boolean addAll(Collection<? extends T> collection) {
        boolean z = false;
        Iterator<? extends T> it = collection.iterator();
        while (it.hasNext()) {
            z |= add(it.next());
        }
        return z;
    }

    @Override // java.util.Collection
    public void clear() {
        this.lock.lock();
        try {
            for (int i = 0; i < this.numBins; i++) {
                this.queues[i].clear();
            }
            this.allItems.clear();
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.BlockingQueue, java.util.Collection
    public boolean contains(Object obj) {
        this.lock.lock();
        try {
            return this.allItems.containsKey(obj);
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Collection
    public boolean containsAll(Collection<?> collection) {
        this.lock.lock();
        boolean z = true;
        try {
            Iterator<?> it = collection.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                if (!contains(it.next())) {
                    z = false;
                    break;
                }
            }
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.BlockingQueue
    public int drainTo(Collection<? super T> collection) {
        this.lock.lock();
        try {
            int i = 0;
            for (int i2 = 0; i2 < this.numBins; i2++) {
                i += this.queues[i2].size();
                collection.addAll(this.queues[i2]);
                this.queues[i2].clear();
            }
            this.allItems.clear();
            return i;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.BlockingQueue
    public int drainTo(Collection<? super T> collection, int i) {
        if (collection == this) throw new IllegalArgumentException("Cannot drain a queue into itself");
        this.lock.lock();
        try {
            int drained = 0;
            while (drained < i) {
                T item = pollLocked();
                if (item == null) break;
                collection.add(item);
                drained++;
            }
            return drained;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Queue
    public T element() {
        T peek = peek();
        if (peek == null) {
            throw new NoSuchElementException();
        }
        return peek;
    }

    @Override // java.util.Collection
    public boolean isEmpty() {
        this.lock.lock();
        try {
            return this.allItems.isEmpty();
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Collection, java.lang.Iterable
    public Iterator<T> iterator() {
        throw new UnsupportedOperationException("Iterator not supported");
    }

    @Override // java.util.concurrent.BlockingQueue, java.util.Queue
    public boolean offer(T t) {
        return add(t);
    }

    @Override // java.util.concurrent.BlockingQueue
    public boolean offer(T t, long j, TimeUnit timeUnit) throws InterruptedException {
        return add(t);
    }

    @Override // java.util.Queue
    public T peek() {
        this.lock.lock();
        try {
            for (Set<T> queue : this.queues) if (!queue.isEmpty()) return queue.iterator().next();
            return null;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Queue
    public T poll() {
        this.lock.lock();
        try {
            return pollLocked();
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.BlockingQueue
    public T poll(long j, TimeUnit timeUnit) throws InterruptedException {
        long remaining = timeUnit.toNanos(j);
        this.lock.lockInterruptibly();
        try {
            T item;
            while ((item = pollLocked()) == null) {
                if (remaining <= 0L) return null;
                remaining = this.notEmpty.awaitNanos(remaining);
            }
            return item;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.BlockingQueue
    public void put(T t) throws InterruptedException {
        add(t);
    }

    @Override // java.util.concurrent.BlockingQueue
    public int remainingCapacity() {
        return Integer.MAX_VALUE;
    }

    @Override // java.util.Queue
    public T remove() {
        T poll = poll();
        if (poll == null) {
            throw new NoSuchElementException();
        }
        return poll;
    }

    @Override // java.util.concurrent.BlockingQueue, java.util.Collection
    public boolean remove(Object obj) {
        this.lock.lock();
        try {
            Integer bin = this.allItems.remove(obj);
            return bin != null && this.queues[bin.intValue()].remove(obj);
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Collection
    public boolean removeAll(Collection<?> collection) {
        boolean z = false;
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            z |= remove(it.next());
        }
        return z;
    }

    @Override // java.util.Collection
    public boolean retainAll(Collection<?> collection) {
        this.lock.lock();
        try {
            boolean z = false;
            for (int i = 0; i < this.numBins; i++) {
                z |= this.queues[i].retainAll(collection);
            }
            this.allItems.keySet().retainAll(collection);
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Collection
    public int size() {
        this.lock.lock();
        try {
            return this.allItems.size();
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.BlockingQueue
    public T take() throws InterruptedException {
        this.lock.lockInterruptibly();
        try {
            T item;
            while ((item = pollLocked()) == null) this.notEmpty.await();
            return item;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Collection
    public Object[] toArray() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public <T> T[] toArray(T[] tArr) {
        throw new UnsupportedOperationException();
    }

    public void updatePriority(T t) {
        int intValue;
        this.lock.lock();
        try {
            if (t instanceof HasPriority) {
                int priority = ((HasPriority) t).getPriority();
                int i = priority >= 0 ? priority > this.numBins + (-1) ? this.numBins - 1 : priority : 0;
                Integer num = this.allItems.get(t);
                if (num != null && (intValue = num.intValue()) != i && this.queues[intValue].remove(t)) {
                    this.queues[i].add(t);
                    this.allItems.put(t, Integer.valueOf(i));
                }
            }
        } finally {
            this.lock.unlock();
        }
    }

    private T pollLocked() {
        for (int i = 0; i < this.numBins; i++) {
            Iterator<T> iterator = this.queues[i].iterator();
            if (iterator.hasNext()) {
                T item = iterator.next();
                iterator.remove();
                this.allItems.remove(item);
                return item;
            }
        }
        return null;
    }
}
