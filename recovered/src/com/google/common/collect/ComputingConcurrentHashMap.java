package com.google.common.collect;

import com.google.common.base.Equivalence;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.MapMaker;
import com.google.common.collect.MapMakerInternalMap;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.ref.ReferenceQueue;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutionException;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

/* loaded from: classes.dex */
class ComputingConcurrentHashMap<K, V> extends MapMakerInternalMap<K, V> {
    private static final long serialVersionUID = 4;
    final Function<? super K, ? extends V> computingFunction;

    private static final class ComputationExceptionReference<K, V> implements MapMakerInternalMap.ValueReference<K, V> {
        final Throwable t;

        ComputationExceptionReference(Throwable th) {
            this.t = th;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public void clear(MapMakerInternalMap.ValueReference<K, V> valueReference) {
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public MapMakerInternalMap.ValueReference<K, V> copyFor(ReferenceQueue<V> referenceQueue, V v, MapMakerInternalMap.ReferenceEntry<K, V> referenceEntry) {
            return this;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public V get() {
            return null;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public MapMakerInternalMap.ReferenceEntry<K, V> getEntry() {
            return null;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public boolean isComputingReference() {
            return false;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public V waitForValue() throws ExecutionException {
            throw new ExecutionException(this.t);
        }
    }

    private static final class ComputedReference<K, V> implements MapMakerInternalMap.ValueReference<K, V> {
        final V value;

        ComputedReference(@Nullable V v) {
            this.value = v;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public void clear(MapMakerInternalMap.ValueReference<K, V> valueReference) {
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public MapMakerInternalMap.ValueReference<K, V> copyFor(ReferenceQueue<V> referenceQueue, V v, MapMakerInternalMap.ReferenceEntry<K, V> referenceEntry) {
            return this;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public V get() {
            return this.value;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public MapMakerInternalMap.ReferenceEntry<K, V> getEntry() {
            return null;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public boolean isComputingReference() {
            return false;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public V waitForValue() {
            return get();
        }
    }

    static final class ComputingSegment<K, V> extends MapMakerInternalMap.Segment<K, V> {
        ComputingSegment(MapMakerInternalMap<K, V> mapMakerInternalMap, int i, int i2) {
            super(mapMakerInternalMap, i, i2);
        }

        /* JADX WARN: Removed duplicated region for block: B:28:0x0025  */
        /* JADX WARN: Removed duplicated region for block: B:31:0x003c  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        V compute(K r7, int r8, com.google.common.collect.MapMakerInternalMap.ReferenceEntry<K, V> r9, com.google.common.collect.ComputingConcurrentHashMap.ComputingValueReference<K, V> r10) throws java.util.concurrent.ExecutionException {
            /*
                r6 = this;
                r4 = 0
                r1 = 0
                java.lang.System.nanoTime()
                monitor-enter(r9)     // Catch: java.lang.Throwable -> L40
                java.lang.Object r1 = r10.compute(r7, r8)     // Catch: java.lang.Throwable -> L1c
                long r2 = java.lang.System.nanoTime()     // Catch: java.lang.Throwable -> L1c
                monitor-exit(r9)     // Catch: java.lang.Throwable -> L43
                if (r1 != 0) goto L2b
            L12:
                int r0 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
                if (r0 != 0) goto L19
                java.lang.System.nanoTime()
            L19:
                if (r1 == 0) goto L38
            L1b:
                return r1
            L1c:
                r0 = move-exception
                r2 = r4
            L1e:
                monitor-exit(r9)     // Catch: java.lang.Throwable -> L43
                throw r0     // Catch: java.lang.Throwable -> L20
            L20:
                r0 = move-exception
            L21:
                int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
                if (r2 != 0) goto L28
                java.lang.System.nanoTime()
            L28:
                if (r1 == 0) goto L3c
            L2a:
                throw r0
            L2b:
                r0 = 1
                java.lang.Object r0 = r6.put(r7, r8, r1, r0)     // Catch: java.lang.Throwable -> L20
                if (r0 == 0) goto L12
                com.google.common.collect.MapMaker$RemovalCause r0 = com.google.common.collect.MapMaker.RemovalCause.REPLACED     // Catch: java.lang.Throwable -> L20
                r6.enqueueNotification(r7, r8, r1, r0)     // Catch: java.lang.Throwable -> L20
                goto L12
            L38:
                r6.clearValue(r7, r8, r10)
                goto L1b
            L3c:
                r6.clearValue(r7, r8, r10)
                goto L2a
            L40:
                r0 = move-exception
                r2 = r4
                goto L21
            L43:
                r0 = move-exception
                goto L1e
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.collect.ComputingConcurrentHashMap.ComputingSegment.compute(java.lang.Object, int, com.google.common.collect.MapMakerInternalMap$ReferenceEntry, com.google.common.collect.ComputingConcurrentHashMap$ComputingValueReference):java.lang.Object");
        }

        /* JADX WARN: Code restructure failed: missing block: B:18:0x0090, code lost:
        
            if (r5.getValueReference().isComputingReference() != false) goto L48;
         */
        /* JADX WARN: Code restructure failed: missing block: B:19:0x0092, code lost:
        
            r9 = r5.getValueReference().get();
         */
        /* JADX WARN: Code restructure failed: missing block: B:20:0x009a, code lost:
        
            if (r9 == null) goto L49;
         */
        /* JADX WARN: Code restructure failed: missing block: B:22:0x00a2, code lost:
        
            if (r11.map.expires() != false) goto L51;
         */
        /* JADX WARN: Code restructure failed: missing block: B:24:0x00ce, code lost:
        
            if (r11.map.isExpired(r5) == false) goto L74;
         */
        /* JADX WARN: Code restructure failed: missing block: B:25:0x00d0, code lost:
        
            enqueueNotification(r6, r13, r9, com.google.common.collect.MapMaker.RemovalCause.EXPIRED);
         */
        /* JADX WARN: Code restructure failed: missing block: B:26:0x00b9, code lost:
        
            r11.evictionQueue.remove(r5);
            r11.expirationQueue.remove(r5);
            r11.count = r3;
            r6 = true;
         */
        /* JADX WARN: Code restructure failed: missing block: B:27:0x0029, code lost:
        
            if (r6 != false) goto L61;
         */
        /* JADX WARN: Code restructure failed: missing block: B:28:0x002b, code lost:
        
            r3 = null;
            r0 = r5;
         */
        /* JADX WARN: Code restructure failed: missing block: B:30:0x0033, code lost:
        
            if (r6 != false) goto L77;
         */
        /* JADX WARN: Code restructure failed: missing block: B:31:0x0035, code lost:
        
            r3 = r0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:47:0x0103, code lost:
        
            return compute(r12, r13, r0, r3);
         */
        /* JADX WARN: Code restructure failed: missing block: B:48:0x00e3, code lost:
        
            r3 = new com.google.common.collect.ComputingConcurrentHashMap.ComputingValueReference<>(r14);
         */
        /* JADX WARN: Code restructure failed: missing block: B:49:0x00e8, code lost:
        
            if (r5 == null) goto L64;
         */
        /* JADX WARN: Code restructure failed: missing block: B:50:0x00ea, code lost:
        
            r5.setValueReference(r3);
            r0 = r5;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x00f0, code lost:
        
            r0 = newEntry(r12, r13, r0);
            r0.setValueReference(r3);
            r7.set(r8, r0);
         */
        /* JADX WARN: Code restructure failed: missing block: B:53:0x00a4, code lost:
        
            recordLockedRead(r5);
         */
        /* JADX WARN: Code restructure failed: missing block: B:56:0x00b0, code lost:
        
            return r9;
         */
        /* JADX WARN: Code restructure failed: missing block: B:59:0x00b4, code lost:
        
            enqueueNotification(r6, r13, r9, com.google.common.collect.MapMaker.RemovalCause.COLLECTED);
         */
        /* JADX WARN: Code restructure failed: missing block: B:60:0x00b1, code lost:
        
            r6 = false;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        V getOrCompute(K r12, int r13, com.google.common.base.Function<? super K, ? extends V> r14) throws java.util.concurrent.ExecutionException {
            /*
                Method dump skipped, instructions count: 263
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.collect.ComputingConcurrentHashMap.ComputingSegment.getOrCompute(java.lang.Object, int, com.google.common.base.Function):java.lang.Object");
        }
    }

    static final class ComputingSerializationProxy<K, V> extends MapMakerInternalMap.AbstractSerializationProxy<K, V> {
        private static final long serialVersionUID = 4;
        final Function<? super K, ? extends V> computingFunction;

        ComputingSerializationProxy(MapMakerInternalMap.Strength strength, MapMakerInternalMap.Strength strength2, Equivalence<Object> equivalence, Equivalence<Object> equivalence2, long j, long j2, int i, int i2, MapMaker.RemovalListener<? super K, ? super V> removalListener, ConcurrentMap<K, V> concurrentMap, Function<? super K, ? extends V> function) {
            super(strength, strength2, equivalence, equivalence2, j, j2, i, i2, removalListener, concurrentMap);
            this.computingFunction = function;
        }

        private void readObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
            objectInputStream.defaultReadObject();
            this.delegate = readMapMaker(objectInputStream).makeComputingMap(this.computingFunction);
            readEntries(objectInputStream);
        }

        private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
            objectOutputStream.defaultWriteObject();
            writeMapTo(objectOutputStream);
        }

        Object readResolve() {
            return this.delegate;
        }
    }

    private static final class ComputingValueReference<K, V> implements MapMakerInternalMap.ValueReference<K, V> {

        @GuardedBy("this")
        volatile MapMakerInternalMap.ValueReference<K, V> computedReference = MapMakerInternalMap.unset();
        final Function<? super K, ? extends V> computingFunction;

        public ComputingValueReference(Function<? super K, ? extends V> function) {
            this.computingFunction = function;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public void clear(MapMakerInternalMap.ValueReference<K, V> valueReference) {
            setValueReference(valueReference);
        }

        V compute(K k, int i) throws ExecutionException {
            try {
                V apply = this.computingFunction.apply(k);
                setValueReference(new ComputedReference(apply));
                return apply;
            } catch (Throwable th) {
                setValueReference(new ComputationExceptionReference(th));
                throw new ExecutionException(th);
            }
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public MapMakerInternalMap.ValueReference<K, V> copyFor(ReferenceQueue<V> referenceQueue, @Nullable V v, MapMakerInternalMap.ReferenceEntry<K, V> referenceEntry) {
            return this;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public V get() {
            return null;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public MapMakerInternalMap.ReferenceEntry<K, V> getEntry() {
            return null;
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public boolean isComputingReference() {
            return true;
        }

        void setValueReference(MapMakerInternalMap.ValueReference<K, V> valueReference) {
            synchronized (this) {
                if (this.computedReference == MapMakerInternalMap.UNSET) {
                    this.computedReference = valueReference;
                    notifyAll();
                }
            }
        }

        @Override // com.google.common.collect.MapMakerInternalMap.ValueReference
        public V waitForValue() throws ExecutionException {
            boolean z = false;
            if (this.computedReference == MapMakerInternalMap.UNSET) {
                try {
                    synchronized (this) {
                        while (this.computedReference == MapMakerInternalMap.UNSET) {
                            try {
                                wait();
                            } catch (InterruptedException e) {
                                z = true;
                            }
                        }
                    }
                    if (z) {
                        Thread.currentThread().interrupt();
                    }
                } catch (Throwable th) {
                    if (z) {
                        Thread.currentThread().interrupt();
                    }
                    throw th;
                }
            }
            return this.computedReference.waitForValue();
        }
    }

    ComputingConcurrentHashMap(MapMaker mapMaker, Function<? super K, ? extends V> function) {
        super(mapMaker);
        this.computingFunction = (Function) Preconditions.checkNotNull(function);
    }

    @Override // com.google.common.collect.MapMakerInternalMap
    MapMakerInternalMap.Segment<K, V> createSegment(int i, int i2) {
        return new ComputingSegment(this, i, i2);
    }

    V getOrCompute(K k) throws ExecutionException {
        int hash = hash(Preconditions.checkNotNull(k));
        return segmentFor(hash).getOrCompute(k, hash, this.computingFunction);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.common.collect.MapMakerInternalMap
    public ComputingSegment<K, V> segmentFor(int i) {
        return (ComputingSegment) super.segmentFor(i);
    }

    @Override // com.google.common.collect.MapMakerInternalMap
    Object writeReplace() {
        return new ComputingSerializationProxy(this.keyStrength, this.valueStrength, this.keyEquivalence, this.valueEquivalence, this.expireAfterWriteNanos, this.expireAfterAccessNanos, this.maximumSize, this.concurrencyLevel, this.removalListener, this, this.computingFunction);
    }
}
