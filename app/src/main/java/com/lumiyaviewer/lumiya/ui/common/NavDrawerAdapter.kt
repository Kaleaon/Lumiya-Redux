package com.lumiyaviewer.lumiya.ui.common

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.ImageView
import android.widget.TextView
import android.widget.AdapterView.OnItemClickListener
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.chat.ChatNewActivity
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import com.lumiyaviewer.lumiya.ui.login.LogoutDialog
import com.lumiyaviewer.lumiya.ui.minimap.MinimapActivity
import com.lumiyaviewer.lumiya.ui.myava.MyAvatarActivity
import com.lumiyaviewer.lumiya.ui.objects.ObjectListNewActivity
import com.lumiyaviewer.lumiya.ui.render.WorldViewActivity
import com.lumiyaviewer.lumiya.ui.search.SearchGridActivity
import com.lumiyaviewer.lumiya.ui.settings.SettingsActivity
import java.util.UUID

internal class NavDrawerAdapter(context: Context) :
    ArrayAdapter<NavDrawerAdapter.NavDrawerItem>(context, R.layout.nav_drawer_list_item, items),
    OnItemClickListener {

    internal open class NavDrawerItem(val itemId: Int, val iconId: Int, val labelId: Int) {
        open fun onClick(context: Context) {
        }
    }

    private class NavDrawerActivityItem(itemId: Int, iconId: Int, labelId: Int, val activityClass: Class<*>) :
        NavDrawerItem(itemId, iconId, labelId) {

        override fun onClick(context: Context) {
            val intent = Intent(context, activityClass)
            intent.addFlags(131072)
            if (context is Activity) {
                val activeAgentID: UUID? = ActivityUtils.getActiveAgentID(context.intent)
                if (activeAgentID != null) {
                    intent.putExtra("activeAgentUUID", activeAgentID.toString())
                }
            }
            context.startActivity(intent)
        }
    }

    companion object {
        private val items: Array<NavDrawerItem> = arrayOf(
            NavDrawerActivityItem(R.id.item_chat, R.attr.MenuIconLocalChatThemed, R.string.nav_chat, ChatNewActivity::class.java),
            NavDrawerActivityItem(R.id.item_3d_view, R.attr.MenuIconWorldViewThemed, R.string.nav_3d_view, WorldViewActivity::class.java),
            NavDrawerActivityItem(R.id.item_objects, R.attr.MenuIconObjectsThemed, R.string.nav_objects, ObjectListNewActivity::class.java),
            NavDrawerActivityItem(R.id.item_inventory, R.attr.MenuIconInventoryThemed, R.string.nav_inventory, InventoryActivity::class.java),
            NavDrawerActivityItem(R.id.item_minimap, R.attr.MenuIconMinimapThemed, R.string.nav_minimap, MinimapActivity::class.java),
            object : NavDrawerItem(R.id.item_teleport_home, R.attr.MenuIconHomeThemed, R.string.nav_teleport_home) {
                override fun onClick(context: Context) {
                    if (context is Activity) {
                        TeleportHomeDialog.show(context)
                    }
                }
            },
            NavDrawerActivityItem(R.id.item_my_avatar, R.attr.MenuIconCardThemed, R.string.nav_my_avatar, MyAvatarActivity::class.java),
            NavDrawerActivityItem(R.id.item_people_search, R.attr.MenuIconSearchThemed, R.string.nav_search, SearchGridActivity::class.java),
            NavDrawerActivityItem(R.id.item_settings, R.attr.MenuIconSettingsThemed, R.string.nav_settings, SettingsActivity::class.java),
            object : NavDrawerItem(R.id.item_signout, R.attr.MenuIconSignOffThemed, R.string.nav_signout) {
                override fun onClick(context: Context) {
                    if (context is Activity) {
                        LogoutDialog.show(context)
                    }
                }
            }
        )
    }

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
        val navDrawerItem = getItem(position) ?: return convertView ?: View(context)
        val view: View = convertView
            ?: (context.getSystemService("layout_inflater") as LayoutInflater)
                .inflate(R.layout.nav_drawer_list_item, parent, false)
        val typedValue = TypedValue()
        context.theme.resolveAttribute(navDrawerItem.iconId, typedValue, true)
        view.findViewById<TextView>(R.id.navDrawerItemName).text = context.getString(navDrawerItem.labelId)
        view.findViewById<ImageView>(R.id.navDrawerItemIcon).setImageResource(typedValue.resourceId)
        return view
    }

    override fun onItemClick(adapterView: AdapterView<*>, view: View, position: Int, id: Long) {
        val navDrawerItem = getItem(position)
        if (navDrawerItem != null) {
            navDrawerItem.onClick(adapterView.context)
        }
    }
}
