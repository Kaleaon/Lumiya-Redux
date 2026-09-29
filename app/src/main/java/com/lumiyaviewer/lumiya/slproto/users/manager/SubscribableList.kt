package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Optional
import com.google.common.collect.ImmutableList
import java.util.AbstractList
import java.util.ArrayList
import java.util.Collection
import java.util.List
import java.util.Map
import java.util.WeakHashMap
import java.util.concurrent.Executor

open class SubscribableList<T> : AbstractList<T>() {
    private var lock: Any = Object()
    private var backingList: MutableList<T> = ArrayList()
    private Map<List<T>, Optional<Executor>> targets = WeakHashMap()
    fun add(i: final int, t: T) {
        var copyOf: ImmutableList<Map.Entry>? = null
        synchronized(this.lock) {
            this.backingList.add(i, t)
            copyOf = ImmutableList.copyOf(this as Collection.targets.entrySet())
        }
        for (entry in copyOf) {
            var list: List = entry as List.getKey()
            var executor: Executor = (Executor) (entry as Optional.getValue()).orNull()
            if (executor != null) {
                executor.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        (list as List).add(i, t)
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                list.add(i, t)
            }
        }
    }

    fun addSubscription(list: MutableList<T>, optional: Optional<Executor>): MutableList<T> {
        var copyOf: ImmutableList? = null
        synchronized(this.lock) {
            this.targets.put(list, optional)
            copyOf = ImmutableList.copyOf(this as Collection.backingList)
        }
        return copyOf
    }
    fun clear() {
        var copyOf: ImmutableList<Map.Entry>? = null
        synchronized(this.lock) {
            this.backingList.clear()
            copyOf = ImmutableList.copyOf(this as Collection.targets.entrySet())
        }
        for (entry in copyOf) {
            var list: List = entry as List.getKey()
            var executor: Executor = (Executor) (entry as Optional.getValue()).orNull()
            if (executor != null) {
                list.javaClass
                executor.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        (list as List).clear()
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                list.clear()
            }
        }
    }
    fun get(i: Int): T {
        var t: T? = null
        synchronized(this.lock) {
            t = this.backingList.get(i)
        }
        return t
    }
    fun remove(i: final int): T {
        var remove: T? = null
        var copyOf: ImmutableList<Map.Entry>? = null
        synchronized(this.lock) {
            remove = this.backingList.remove(i)
            copyOf = ImmutableList.copyOf(this as Collection.targets.entrySet())
        }
        for (entry in copyOf) {
            var list: List = entry as List.getKey()
            var executor: Executor = (Executor) (entry as Optional.getValue()).orNull()
            if (executor != null) {
                executor.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        (list as List).remove(i)
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                list.remove(i)
            }
        }
        return remove
    }

    fun removeSubscription(list: MutableList<T>) {
        synchronized(this.lock) {
            this.targets.remove(list)
        }
    }
    fun set(i: final int, t: T): T {
        var t2: T? = null
        var copyOf: ImmutableList<Map.Entry>? = null
        synchronized(this.lock) {
            t2 = this.backingList.set(i, t)
            copyOf = ImmutableList.copyOf(this as Collection.targets.entrySet())
        }
        for (entry in copyOf) {
            var list: List = entry as List.getKey()
            var executor: Executor = (Executor) (entry as Optional.getValue()).orNull()
            if (executor != null) {
                executor.execute(Runnable() {
                    private /* synthetic */ void $m$0() {
                        (list as List).set(i, t)
                    }
                    fun run() {
                        $m$0()
                    }
                })
            } else {
                list.set(i, t)
            }
        }
        return t2
    }
    fun size(): Int {
        var size: Int = 0
        synchronized(this.lock) {
            size = this.backingList.size()
        }
        return size
    }
}
