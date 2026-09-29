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

class TaskInventoryListAdapter(private val context: Context) : BaseAdapter() {
    private var taskInventory: SLTaskInventory? = null

    override fun getCount(): Int {
        val taskInventory = this.taskInventory
        if (taskInventory != null) {
            return taskInventory.entries.size
        }
        return 0
    }

    override fun getItem(i: Int): SLInventoryEntry? {
        val taskInventory = this.taskInventory
        if (taskInventory != null) {
            return taskInventory.entries.get(i)
        }
        return null
    }

    override fun getItemId(i: Int): Long {
        return i.toLong()
    }

    override fun getView(i: Int, convertView: View?, viewGroup: ViewGroup): View {
        val view = convertView ?: (context.getSystemService("layout_inflater") as LayoutInflater)
            .inflate(R.layout.inventory_item, viewGroup, false)
        val item = getItem(i)!!
        view.findViewById<TextView>(R.id.itemNameTextView).text = item.name
        val drawableResource = item.getDrawableResource()
        if (drawableResource >= 0) {
            view.findViewById<ImageView>(R.id.itemTypeIconView).setImageResource(drawableResource)
            val subtypeDrawableResource = item.getSubtypeDrawableResource()
            if (subtypeDrawableResource >= 0) {
                view.findViewById<ImageView>(R.id.itemSubTypeIconView).setImageResource(subtypeDrawableResource)
            } else {
                view.findViewById<ImageView>(R.id.itemSubTypeIconView).setImageBitmap(null)
            }
        } else {
            view.findViewById<ImageView>(R.id.itemTypeIconView).setImageBitmap(null)
            view.findViewById<ImageView>(R.id.itemSubTypeIconView).setImageBitmap(null)
        }
        view.findViewById<View>(R.id.itemWornIcon).visibility = View.GONE
        return view
    }

    override fun hasStableIds(): Boolean {
        return false
    }

    fun setData(taskInventory: SLTaskInventory?) {
        this.taskInventory = taskInventory
        notifyDataSetChanged()
    }
}
