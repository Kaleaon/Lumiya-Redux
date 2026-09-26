package com.lumiyaviewer.lumiya.ui.objects

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.TextView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLTaskInventory

open class TaskInventoryListAdapter : BaseAdapter() {
    private Context context

    private SLTaskInventory taskInventory = null

    constructor(context: Context) {
        this.context = context
    }

    override fun getCount(): Int {
        internal fun if(null: this.taskInventory !=):  {
            return this.taskInventory.entries.size()
        }
        return 0
    }

    override fun getItem(i: Int): SLInventoryEntry {
        internal fun if(null: this.taskInventory !=):  {
            return this.taskInventory.entries.get(i)
        }
        return null
    }

    override fun getItemId(i: Int): Long {
        return i
    }

    override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
        internal fun if(null: view ==):  {
            view = ((LayoutInflater) this.context.getSystemService("layout_inflater")).inflate(R.layout.inventory_item, viewGroup, false)
        }
        SLInventoryEntry item = getItem(i)
        ((TextView) view.findViewById(R.id.itemNameTextView)).setText(item.name)
        int drawableResource = item.getDrawableResource()
        internal fun if(0: drawableResource >=):  {
            ((ImageView) view.findViewById(R.id.itemTypeIconView)).setImageResource(drawableResource)
            int subtypeDrawableResource = item.getSubtypeDrawableResource()
            internal fun if(0: subtypeDrawableResource >=):  {
                ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageResource(subtypeDrawableResource)
            } else {
                ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageBitmap(null)
            }
        } else {
            ((ImageView) view.findViewById(R.id.itemTypeIconView)).setImageBitmap(null)
            ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageBitmap(null)
        }
        view.findViewById(R.id.itemWornIcon).setVisibility(View.GONE)
        return view
    }

    override fun hasStableIds(): Boolean {
        return false
    }

    open fun setData(taskInventory: SLTaskInventory) {
        this.taskInventory = taskInventory
        notifyDataSetChanged()
    }
}
