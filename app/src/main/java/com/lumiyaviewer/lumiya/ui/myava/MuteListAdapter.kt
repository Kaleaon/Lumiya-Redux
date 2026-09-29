package com.lumiyaviewer.lumiya.ui.myava

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.TextView
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteType
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissListViewTouchListener
import java.util.Collection
import java.util.List

internal open class MuteListAdapter : BaseAdapter() {

    private LayoutInflater layoutInflater

    private ImmutableList<MuteListEntry> muteList = ImmutableList.of()

    internal constructor(context: Context) {
        this.layoutInflater = LayoutInflater.from(context)
    }

    override fun getCount(): Int {
        return this.muteList.size()
    }

    override fun getItem(i: Int): MuteListEntry {
        if (i < 0 || i >= this.muteList.size()) {
            return null
        }
        return this.muteList.get(i)
    }

    override fun getItemId(i: Int): Long {
        return 0L
    }

    override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
        int i2
        MuteListEntry item = getItem(i)
        if (item != null) {
            if (view == null) {
                view = this.layoutInflater.inflate(R.layout.mute_list_item, viewGroup, false)
            }
            if (view != null) {
                ((TextView) view.findViewById(R.id.muteName)).setText(item.name)
                internal fun switch(item.type):  {
                    AGENT -> {
                    GROUP -> {
                        i2 = R.drawable.inv_human
                        }
                    BY_NAME -> {
                    OBJECT -> {
                        i2 = R.drawable.inv_object
                        }
                    EXTERNAL -> {
                    else -> {
                        i2 = R.drawable.inv_link
                        }
                }
                ((ImageView) view.findViewById(R.id.muteTypeIcon)).setImageResource(i2)
                SwipeDismissListViewTouchListener.restoreViewState(view)
                return view
            }
        }
        return null
    }

    override fun hasStableIds(): Boolean {
        return false
    }

    internal fun setData(list: List<MuteListEntry>) {
        this.muteList = list != null ? ImmutableList.copyOf((Collection) list) : ImmutableList.of()
        notifyDataSetChanged()
    }
}
