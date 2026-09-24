package com.lumiyaviewer.lumiya.res.collections;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.utils.HasPriority;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Queue;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class PriorityBinQueue<T> implements BlockingQueue<T> {
    private final QueueFactory<T> queueFactory;
    private final SortedMap<Integer, Queue<T>> queues = new TreeMap();
    private final Lock lock = new ReentrantLock();
    private final Condition notEmpty = this.lock.newCondition();

    public interface QueueFactory<T> {
        Queue<T> getQueue();
    }

    public PriorityBinQueue(QueueFactory<T> queueFactory) {
        this.queueFactory = queueFactory;
    }

    private int getPriority(Object obj) {
        if (obj instanceof HasPriority) {
            return ((HasPriority) obj).getPriority();
        }
        return 0;
    }

    @Override
    public boolean add(T t) {
        this.lock.lock();
        try {
            int priority = getPriority(t);
            Debug.Printf("PriorityBinQueue: added %s with prio %d", t.toString(), Integer.valueOf(priority));
            Queue<T> queue = this.queues.get(Integer.valueOf(priority));
            if (queue == null) {
                queue = this.queueFactory.getQueue();
                this.queues.put(Integer.valueOf(priority), queue);
            }
            boolean add = queue.add(t);
            this.notEmpty.signalAll();
            return add;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean addAll(Collection<? extends T> collection) {
        this.lock.lock();
        boolean z = false;
        try {
            Iterator<? extends T> it = collection.iterator();
            while (true) {
                boolean z2 = z;
                if (!it.hasNext()) {
                    return z2;
                }
                T next = it.next();
                int priority = getPriority(next);
                Queue<T> queue = this.queues.get(Integer.valueOf(priority));
                if (queue == null) {
                    queue = this.queueFactory.getQueue();
                    this.queues.put(Integer.valueOf(priority), queue);
                }
                z = queue.add(next) | z2;
                this.notEmpty.signalAll();
            }
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public void clear() {
        this.lock.lock();
        try {
            this.queues.clear();
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean contains(Object obj) {
        this.lock.lock();
        try {
            Queue<T> queue = this.queues.get(Integer.valueOf(getPriority(obj)));
            if (queue != null) {
                return queue.contains(obj);
            }
            return false;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean containsAll(Collection<?> collection) {
        boolean z;
        this.lock.lock();
        try {
            Iterator<?> it = collection.iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = true;
                    break;
                }
                Object next = it.next();
                Queue<T> queue = this.queues.get(Integer.valueOf(getPriority(next)));
                if (queue != null && !queue.contains(next)) {
                    z = false;
                    break;
                }
            }
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public int drainTo(Collection<? super T> collection) {
        this.lock.lock();
        int i = 0;
        try {
            Iterator<Queue<T>> it = this.queues.values().iterator();
            while (it.hasNext()) {
                Queue<T> queue = it.next();
                while (true) {
                    T item = queue.poll();
                    if (item != null) {
                        collection.add(item);
                        i++;
                    }
                }
            }
            this.queues.clear();
            return i;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public int drainTo(Collection<? super T> collection, int i) {
        int i2;
        this.lock.lock();
        int i3 = 0;
        try {
            Iterator<Queue<T>> it = this.queues.values().iterator();
            while (true) {
                if (!it.hasNext()) {
                    i2 = i3;
                    break;
                }
                Queue<T> queue = it.next();
                while (true) {
                    T item = queue.poll();
                    if (item == null || i3 >= i) {
                        break;
                    }
                    collection.add(item);
                    i3++;
                }
                if (i3 >= i) {
                    i2 = i3;
                    break;
                }
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
        boolean z;
        this.lock.lock();
        try {
            Iterator<Queue<T>> it = this.queues.values().iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = true;
                    break;
                }
                if (!it.next().isEmpty()) {
                    z = false;
                    break;
                }
            }
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public Iterator<T> iterator() {
        throw new UnsupportedOperationException("Iterator not supported");
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
            Iterator<Queue<T>> it = this.queues.values().iterator();
            while (it.hasNext()) {
                Queue<T> queue = it.next();
                if (!queue.isEmpty()) {
                    for (T t : queue) {
                        if (t != null) {
                            return t;
                        }
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
            Iterator<Queue<T>> it = this.queues.values().iterator();
            while (it.hasNext()) {
                Iterator it2 = it.next().iterator();
                while (it2.hasNext()) {
                    T t = (T) it2.next();
                    if (t != null) {
                        it2.remove();
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
            Queue<T> queue = this.queues.get(Integer.valueOf(getPriority(obj)));
            if (queue != null) {
                return queue.remove(obj);
            }
            return false;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean removeAll(Collection<?> collection) {
        this.lock.lock();
        boolean z = false;
        try {
            for (Object item : collection) {
                Queue<T> queue = this.queues.get(Integer.valueOf(getPriority(item)));
                z = queue != null ? queue.remove(item) | z : z;
            }
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public boolean retainAll(Collection<?> collection) {
        this.lock.lock();
        boolean z = false;
        try {
            Iterator<Queue<T>> it = this.queues.values().iterator();
            while (true) {
                boolean z2 = z;
                if (!it.hasNext()) {
                    return z2;
                }
                z = it.next().retainAll(collection) | z2;
            }
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public int size() {
        this.lock.lock();
        int i = 0;
        try {
            Iterator<Queue<T>> it = this.queues.values().iterator();
            while (true) {
                int i2 = i;
                if (!it.hasNext()) {
                    return i2;
                }
                i = it.next().size() + i2;
            }
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
        int i = 0;
        this.lock.lock();
        try {
            ArrayList<Object[]> arrayList = new ArrayList();
            Iterator<Queue<T>> it = this.queues.values().iterator();
            int i2 = 0;
            while (it.hasNext()) {
                Object[] array = it.next().toArray();
                int length = array.length + i2;
                arrayList.add(array);
                i2 = length;
            }
            Object[] objArr = new Object[i2];
            for (Object[] objArr2 : arrayList) {
                System.arraycopy(objArr2, 0, objArr, i, objArr2.length);
                i = objArr2.length + i;
            }
            arrayList.clear();
            return objArr;
        } finally {
            this.lock.unlock();
        }
    }

    @Override
    public <T1> T1[] toArray(T1[] t1Arr) {
        int i = 0;
        this.lock.lock();
        try {
            ArrayList<Object[]> arrayList = new ArrayList();
            Iterator<Queue<T>> it = this.queues.values().iterator();
            int i2 = 0;
            while (it.hasNext()) {
                Object[] array = it.next().toArray();
                int length = array.length + i2;
                arrayList.add(array);
                i2 = length;
            }
            if (t1Arr.length >= i2) {
                Arrays.fill(t1Arr, (Object) null);
            } else {
                t1Arr = (T1[]) new Object[i2];
            }
            for (Object[] objArr : arrayList) {
                System.arraycopy(objArr, 0, t1Arr, i, objArr.length);
                i = objArr.length + i;
            }
            arrayList.clear();
            return t1Arr;
        } finally {
            this.lock.unlock();
        }
    }
}
