package com.lumiyaviewer.lumiya.ui.inventory

import android.content.Context
import android.database.Cursor
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.CursorAdapter
import android.widget.ImageView
import android.widget.TextView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance

class InventoryListAdapter(
    private val avatarAppearance: SLAvatarAppearance?,
    context: Context,
    cursor: Cursor
) : CursorAdapter(context, cursor, 0) {

    override fun bindView(view: View, context: Context, cursor: Cursor) {
        val inventoryEntry = SLInventoryEntry(cursor)
        view.findViewById<TextView>(R.id.itemNameTextView).text = inventoryEntry.name
        val drawableResource = inventoryEntry.drawableResource
        if (drawableResource >= 0) {
            view.findViewById<ImageView>(R.id.itemTypeIconView).setImageResource(drawableResource)
            val subtypeDrawableResource = inventoryEntry.subtypeDrawableResource
            if (subtypeDrawableResource >= 0) {
                view.findViewById<ImageView>(R.id.itemSubTypeIconView).setImageResource(subtypeDrawableResource)
            } else {
                view.findViewById<ImageView>(R.id.itemSubTypeIconView).setImageBitmap(null)
            }
        } else {
            view.findViewById<ImageView>(R.id.itemTypeIconView).setImageBitmap(null)
            view.findViewById<ImageView>(R.id.itemSubTypeIconView).setImageBitmap(null)
        }
        if (avatarAppearance != null) {
            view.findViewById<View>(R.id.itemWornIcon).visibility =
                if (avatarAppearance.isItemWorn(inventoryEntry)) View.VISIBLE else View.GONE
        } else {
            view.findViewById<View>(R.id.itemWornIcon).visibility = View.GONE
        }
    }

    override fun newView(context: Context, cursor: Cursor, viewGroup: ViewGroup): View {
        return (context.getSystemService("layout_inflater") as LayoutInflater)
            .inflate(R.layout.inventory_item, viewGroup, false)
    }
}
