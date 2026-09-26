package com.lumiyaviewer.lumiya.ui.chat.contacts

import android.content.Context
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo

internal open class ChatterListSimpleAdapter(context: Context, userManager: UserManager) :
    ChatterListAdapter(context, userManager) {

    private var data: ImmutableList<out ChatterDisplayInfo>? = null

    override fun areAllItemsEnabled(): Boolean = true

    override fun getCount(): Int = data?.size ?: 0

    override fun getItem(position: Int): Any? {
        val data = this.data
        if (data == null || position < 0 || position >= data.size) {
            return null
        }
        return data[position]
    }

    override fun getItemId(position: Int): Long = 0L

    override fun hasStableIds(): Boolean = false

    override fun isEmpty(): Boolean = data?.isEmpty() ?: true

    override fun isEnabled(position: Int): Boolean = true

    protected fun setData(data: ImmutableList<out ChatterDisplayInfo>?) {
        this.data = data
        notifyDataSetChanged()
    }
}
