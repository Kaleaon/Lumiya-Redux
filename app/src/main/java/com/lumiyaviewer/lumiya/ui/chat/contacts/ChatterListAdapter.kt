package com.lumiyaviewer.lumiya.ui.chat.contacts

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ListAdapter
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo

internal abstract class ChatterListAdapter(
    protected val context: Context,
    protected val userManager: UserManager
) : BaseAdapter(), ListAdapter {
    private val inflater: LayoutInflater = LayoutInflater.from(context)
    private val viewBuilder = ChatterItemViewBuilder()
    private var userDistanceInline = true

    override fun getView(i: Int, view: View?, viewGroup: ViewGroup): View? {
        val item = getItem(i)
        if (item !is ChatterDisplayInfo) {
            return null
        }
        viewBuilder.reset()
        item.buildView(context, viewBuilder, userManager)
        return viewBuilder.getView(inflater, view, viewGroup, userDistanceInline)
    }

    fun setUserDistanceInline(userDistanceInline: Boolean) {
        this.userDistanceInline = userDistanceInline
    }
}
