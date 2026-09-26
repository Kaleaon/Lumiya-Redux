package com.lumiyaviewer.lumiya.ui.common

import androidx.recyclerview.widget.RecyclerView
import android.view.ViewGroup
import com.google.common.base.Optional
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.manager.SubscribableList
import java.util.AbstractList
import java.util.ArrayList
import java.util.List
import java.util.concurrent.Executor

abstract class RecyclerSubscribableListAdapter<T> : RecyclerView.Adapter() {
    private RecyclerSubscribableListAdapter<T>.LocalItemList<T> localItemList

    private class LocalItemList<T> : AbstractList<T>() {
        private List<T> backingList = ArrayList()

        constructor(subscribableList: SubscribableList<T>, optional: Optional<Executor>) {
            this.backingList.addAll(subscribableList.addSubscription(this, optional))
        }

        override fun add(i: Int, t: T) {
            this.backingList.add(i, t)
            RecyclerSubscribableListAdapter.this.notifyItemInserted(i)
        }

        override fun clear() {
            this.backingList.clear()
            RecyclerSubscribableListAdapter.this.notifyDataSetChanged()
        }

        override fun get(i: Int): T {
            return this.backingList.get(i)
        }

        override fun remove(i: Int): T {
            T remove = this.backingList.remove(i)
            RecyclerSubscribableListAdapter.this.notifyItemRemoved(i)
            return remove
        }

        override fun set(i: Int, t: T): T {
            T t2 = this.backingList.set(i, t)
            RecyclerSubscribableListAdapter.this.notifyItemChanged(i)
            return t2
        }

        override fun size(): Int {
            return this.backingList.size()
        }
    }

    constructor(subscribableList: SubscribableList<T>) {
        this.localItemList = new LocalItemList<>(subscribableList, Optional.of(UIThreadExecutor.getInstance()))
    }

    protected abstract void bindObjectViewHolder(RecyclerView.ViewHolder viewHolder, T t)

    protected abstract RecyclerView.ViewHolder createObjectViewHolder(ViewGroup viewGroup, int i)

    override fun getItemCount(): Int {
        return this.localItemList.size()
    }

    override fun getItemViewType(i: Int): Int {
        return getObjectViewType(this.localItemList.get(i))
    }

    open fun getObject(i: Int): T? {
        if (i < 0 || i >= this.localItemList.size()) {
            return null
        }
        return this.localItemList.get(i)
    }

    protected abstract int getObjectViewType(T t)

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, i: Int) {
        bindObjectViewHolder(viewHolder, this.localItemList.get(i))
    }

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): RecyclerView.ViewHolder {
        fun createObjectViewHolder(viewGroup, i): return
    }
}
