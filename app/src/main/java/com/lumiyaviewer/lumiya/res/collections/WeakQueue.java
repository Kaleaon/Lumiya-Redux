package com.lumiyaviewer.lumiya.res.collections;

import com.google.common.collect.ObjectArrays;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import javax.annotation.Nonnull;

public class WeakQueue<T> implements BlockingQueue<T> {
    private final Set<T> queue = Collections.newSetFromMap(new WeakHashMap());
    private final Set<T> lowPriorityQueue = Collections.newSetFromMap(new WeakHashMap());
    private final Lock lock = new ReentrantLock();
    private final Condition notEmpty = this.lock.newCondition();

    public interface LowPriority {
    }

    @Override
    public boolean add(T t) {
        if (t == null) {
            return false;
        }
        this.lock.lock();
        try {
            if (t instanceof LowPriority) {
                this.lowPriorityQueue.add(t);
            } else {
                this.queue.add(t);
            }
            this.notEmpty.signalAll();
            return true;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean addAll(Collection<? extends T> collection) {
        this.lock.lock();
        try {
            for (T t : collection) {
                if (t instanceof LowPriority) {
                    this.lowPriorityQueue.add(t);
                } else {
                    this.queue.add(t);
                }
            }
            this.notEmpty.signalAll();
            return true;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public void clear() {
        this.lock.lock();
        try {
            this.queue.clear();
            this.lowPriorityQueue.clear();
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean contains(Object obj) {
        this.lock.lock();
        try {
            return !this.queue.contains(obj) ? this.lowPriorityQueue.contains(obj) : true;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean containsAll(Collection<?> collection) {
        this.lock.lock();
        try {
            return !this.queue.containsAll(collection) ? this.lowPriorityQueue.containsAll(collection) : true;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public int drainTo(Collection<? super T> collection) {
        this.lock.lock();
        int i = 0;
        try {
            for (T t : this.queue) {
                if (t != null) {
                    collection.add(t);
                    i++;
                }
            }
            this.queue.clear();
            for (T t2 : this.lowPriorityQueue) {
                if (t2 != null) {
                    collection.add(t2);
                    i++;
                }
            }
            this.lowPriorityQueue.clear();
            return i;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public int drainTo(Collection<? super T> collection, int i) {
        this.lock.lock();
        int i2 = 0;
        try {
            Iterator<T> it = this.queue.iterator();
            while (it.hasNext() && i2 < i) {
                T next = it.next();
                if (next != null) {
                    collection.add(next);
                    i2++;
                }
                it.remove();
            }
            Iterator<T> iterator = this.lowPriorityQueue.iterator();
            while (iterator.hasNext() && i2 < i) {
                T t = iterator.next();
                if (t != null) {
                    collection.add(t);
                    i2++;
                }
                iterator.remove();
            }
            return i2;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public T element() {
        T peek = peek();
        if (peek == null) {
            throw new NoSuchElementException();
        }
        return peek;
    }

    @Override
    public boolean isEmpty() {
        this.lock.lock();
        try {
            return this.queue.isEmpty() ? this.lowPriorityQueue.isEmpty() : false;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public Iterator<T> iterator() {
        throw new UnsupportedOperationException("Iterating over WeakQueue is not supported");
    }

    @Override
    public boolean offer(T t) {
        return add(t);
    }

    @Override
    public boolean offer(T t, long j, TimeUnit timeUnit) throws InterruptedException {
        return add(t);
    }

    @Override
    public T peek() {
        this.lock.lock();
        try {
            if (!this.queue.isEmpty()) {
                for (T t : this.queue) {
                    if (t != null) {
                        return t;
                    }
                }
            }
            if (!this.lowPriorityQueue.isEmpty()) {
                for (T t2 : this.lowPriorityQueue) {
                    if (t2 != null) {
                        return t2;
                    }
                }
            }
            return null;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public T poll() {
        this.lock.lock();
        try {
            if (!this.queue.isEmpty()) {
                Iterator<T> it = this.queue.iterator();
                while (it.hasNext()) {
                    T next = it.next();
                    if (next != null) {
                        it.remove();
                        return next;
                    }
                }
            }
            if (!this.lowPriorityQueue.isEmpty()) {
                Iterator<T> iterator = this.lowPriorityQueue.iterator();
                while (iterator.hasNext()) {
                    T t = iterator.next();
                    if (t != null) {
                        iterator.remove();
                        return t;
                    }
                }
            }
            return null;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public T poll(long j, TimeUnit timeUnit) throws InterruptedException {
        this.lock.lock();
        do {
            try {
                T poll = poll();
                if (poll != null) {
                    return poll;
                }
            } finally {
                this.lock.unlock();
            }
        } while (this.notEmpty.await(j, timeUnit));
        return null;
    }

    @Override
    public void put(T t) throws InterruptedException {
        add(t);
    }

    @Override
    public int remainingCapacity() {
        return Integer.MAX_VALUE;
    }

    @Override
    public T remove() {
        T poll = poll();
        if (poll == null) {
            throw new NoSuchElementException();
        }
        return poll;
    }

    @Override
    public boolean remove(Object obj) {
        this.lock.lock();
        try {
            return this.queue.remove(obj) | this.lowPriorityQueue.remove(obj);
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean removeAll(@Nonnull Collection<?> collection) {
        this.lock.lock();
        try {
            return this.queue.removeAll(collection) | this.lowPriorityQueue.removeAll(collection);
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean retainAll(Collection<?> collection) {
        this.lock.lock();
        try {
            return this.queue.retainAll(collection) | this.lowPriorityQueue.retainAll(collection);
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public int size() {
        this.lock.lock();
        try {
            return this.queue.size() + this.lowPriorityQueue.size();
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public T take() throws InterruptedException {
        this.lock.lock();
        while (true) {
            try {
                T poll = poll();
                if (poll != null) {
                    return poll;
                }
                this.notEmpty.await();
            } finally {
                this.lock.unlock();
            }
        }
    }

    @Override
    public Object[] toArray() {
        this.lock.lock();
        try {
            return ObjectArrays.concat(this.queue.toArray(), this.lowPriorityQueue.toArray(), Object.class);
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public <T1> T1[] toArray(T1[] t1Arr) {
        this.lock.lock();
        try {
            T1[] t1s = (T1[]) toArray();
            if (t1s.length > t1Arr.length) {
                return t1s;
            }
            Arrays.fill(t1Arr, (Object) null);
            System.arraycopy(t1s, 0, t1Arr, 0, t1s.length);
            return t1Arr;
        } finally {
            this.lock.unlock();
        }
    }
}
