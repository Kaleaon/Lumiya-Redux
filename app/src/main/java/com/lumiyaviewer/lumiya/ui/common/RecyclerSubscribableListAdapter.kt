package com.lumiyaviewer.lumiya.ui.common

import androidx.recyclerview.widget.RecyclerView
import android.view.ViewGroup
import com.google.common.base.Optional
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.manager.SubscribableList
import java.util.ArrayList
import java.util.concurrent.Executor

abstract class RecyclerSubscribableListAdapter<T>(subscribableList: SubscribableList<T>) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    private inner class LocalItemList<T>(subscribableList: SubscribableList<T>, optional: Optional<Executor>) : AbstractMutableList<T>() {
        private val backingList: MutableList<T> = ArrayList()

        init {
            this.backingList.addAll(subscribableList.addSubscription(this, optional))
        }

        override fun add(i: Int, t: T) {
            this.backingList.add(i, t)
            this@RecyclerSubscribableListAdapter.notifyItemInserted(i)
        }

        override fun clear() {
            this.backingList.clear()
            this@RecyclerSubscribableListAdapter.notifyDataSetChanged()
        }

        override fun get(i: Int): T {
            return this.backingList.get(i)
        }

        override fun removeAt(i: Int): T {
            val removed = this.backingList.removeAt(i)
            this@RecyclerSubscribableListAdapter.notifyItemRemoved(i)
            return removed
        }

        override fun set(i: Int, t: T): T {
            val t2 = this.backingList.set(i, t)
            this@RecyclerSubscribableListAdapter.notifyItemChanged(i)
            return t2
        }

        override val size: Int
            get() = this.backingList.size
    }

    private val localItemList: LocalItemList<T> = LocalItemList(subscribableList, Optional.of(UIThreadExecutor.getInstance()))

    protected abstract fun bindObjectViewHolder(viewHolder: RecyclerView.ViewHolder, t: T)

    protected abstract fun createObjectViewHolder(viewGroup: ViewGroup, i: Int): RecyclerView.ViewHolder

    override fun getItemCount(): Int {
        return this.localItemList.size
    }

    override fun getItemViewType(i: Int): Int {
        return getObjectViewType(this.localItemList.get(i))
    }

    open fun getObject(i: Int): T? {
        if (i < 0 || i >= this.localItemList.size) {
            return null
        }
        return this.localItemList.get(i)
    }

    protected abstract fun getObjectViewType(t: T): Int

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, i: Int) {
        bindObjectViewHolder(viewHolder, this.localItemList.get(i))
    }

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): RecyclerView.ViewHolder {
        return createObjectViewHolder(viewGroup, i)
    }
}
