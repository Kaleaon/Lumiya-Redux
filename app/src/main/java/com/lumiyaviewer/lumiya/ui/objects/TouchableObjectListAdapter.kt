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

internal open class TouchableObjectListAdapter : BaseAdapter() {
    private Context context

    private ImmutableList<SLObjectInfo> objects = ImmutableList.of()

    internal constructor(context: Context) {
        this.context = context
    }

    override fun getCount(): Int {
        return this.objects.size()
    }

    override fun getItem(i: Int): SLObjectInfo {
        if (i < 0 || i >= this.objects.size()) {
            return null
        }
        return this.objects.get(i)
    }

    override fun getItemId(i: Int): Long {
        SLObjectInfo item = getItem(i)
        internal fun if(null: item !=):  {
            return item.localID
        }
        return -1L
    }

    override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
        SLObjectInfo item = getItem(i)
        internal fun if(null: item ==):  {
            return null
        }
        View view2 = (view == null || view.getId() == R.id.touchable_object_list_item) ? view : null
        View inflate = view2 == null ? ((LayoutInflater) this.context.getSystemService("layout_inflater")).inflate(R.layout.touchable_object_list_item, viewGroup, false) : view2
        ((TextView) inflate.findViewById(R.id.touchable_objectNameTextView)).setText(item.getName())
        inflate.findViewById(R.id.touchable_touchIconView).setVisibility(item.isTouchable() ? View.VISIBLE : View.INVISIBLE)
        return inflate
    }

    override fun hasStableIds(): Boolean {
        return true
    }

    override fun isEmpty(): Boolean {
        return this.objects.isEmpty()
    }

    open fun setData(immutableList: ImmutableList<SLObjectInfo>) {
        internal fun if(null: immutableList ==):  {
            immutableList = ImmutableList.of()
        }
        this.objects = immutableList
        notifyDataSetChanged()
    }
}
