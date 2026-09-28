package com.lumiyaviewer.lumiya.ui.objects

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo

internal class TouchableObjectListAdapter(private val context: Context) : BaseAdapter() {
    private var objects: ImmutableList<SLObjectInfo> = ImmutableList.of()

    override fun getCount(): Int {
        return this.objects.size
    }

    override fun getItem(i: Int): SLObjectInfo? {
        if (i < 0 || i >= this.objects.size) {
            return null
        }
        return this.objects.get(i)
    }

    override fun getItemId(i: Int): Long {
        val item = getItem(i)
        if (item != null) {
            return item.localID
        }
        return -1L
    }

    override fun getView(i: Int, view: View?, viewGroup: ViewGroup): View? {
        val item = getItem(i) ?: return null
        val view2 = if (view == null || view.id == R.id.touchable_object_list_item) view else null
        val inflate = view2 ?: (context.getSystemService("layout_inflater") as LayoutInflater)
            .inflate(R.layout.touchable_object_list_item, viewGroup, false)
        inflate.findViewById<TextView>(R.id.touchable_objectNameTextView).text = item.getName()
        inflate.findViewById<View>(R.id.touchable_touchIconView).visibility = if (item.isTouchable()) View.VISIBLE else View.INVISIBLE
        return inflate
    }

    override fun hasStableIds(): Boolean {
        return true
    }

    override fun isEmpty(): Boolean {
        return this.objects.isEmpty()
    }

    fun setData(immutableList: ImmutableList<SLObjectInfo>?) {
        this.objects = immutableList ?: ImmutableList.of()
        notifyDataSetChanged()
    }
}
