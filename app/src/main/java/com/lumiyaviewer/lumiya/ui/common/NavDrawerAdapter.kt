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

internal open class NavDrawerAdapter : ArrayAdapter<NavDrawerAdapter.NavDrawerItem>(), OnItemClickListener {
   private static NavDrawerAdapter.NavDrawerItem[] items = new NavDrawerAdapter.NavDrawerItem[]{
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_chat, com.lumiyaviewer.lumiya.R.attr.MenuIconLocalChatThemed, com.lumiyaviewer.lumiya.R.string.nav_chat, ChatNewActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_3d_view, com.lumiyaviewer.lumiya.R.attr.MenuIconWorldViewThemed, com.lumiyaviewer.lumiya.R.string.nav_3d_view, WorldViewActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_objects, com.lumiyaviewer.lumiya.R.attr.MenuIconObjectsThemed, com.lumiyaviewer.lumiya.R.string.nav_objects, ObjectListNewActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_inventory, com.lumiyaviewer.lumiya.R.attr.MenuIconInventoryThemed, com.lumiyaviewer.lumiya.R.string.nav_inventory, InventoryActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_minimap, com.lumiyaviewer.lumiya.R.attr.MenuIconMinimapThemed, com.lumiyaviewer.lumiya.R.string.nav_minimap, MinimapActivity.class),
      new NavDrawerAdapter.NavDrawerItem(com.lumiyaviewer.lumiya.R.id.item_teleport_home, com.lumiyaviewer.lumiya.R.attr.MenuIconHomeThemed, com.lumiyaviewer.lumiya.R.string.nav_teleport_home) {
         override fun onClick(context: Context) {
            internal fun if(Activity: context instanceof):  {
               TeleportHomeDialog.show((Activity)context)
            }
         }
      },
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_my_avatar, com.lumiyaviewer.lumiya.R.attr.MenuIconCardThemed, com.lumiyaviewer.lumiya.R.string.nav_my_avatar, MyAvatarActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_people_search, com.lumiyaviewer.lumiya.R.attr.MenuIconSearchThemed, com.lumiyaviewer.lumiya.R.string.nav_search, SearchGridActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_settings, com.lumiyaviewer.lumiya.R.attr.MenuIconSettingsThemed, com.lumiyaviewer.lumiya.R.string.nav_settings, SettingsActivity.class),
      new NavDrawerAdapter.NavDrawerItem(com.lumiyaviewer.lumiya.R.id.item_signout, com.lumiyaviewer.lumiya.R.attr.MenuIconSignOffThemed, com.lumiyaviewer.lumiya.R.string.nav_signout) {
         override fun onClick(context: Context) {
            internal fun if(Activity: context instanceof):  {
               LogoutDialog.show((Activity)context)
            }
         }
      }
   }

   internal constructor(context: Context) {
      super(context, com.lumiyaviewer.lumiya.R.layout.nav_drawer_list_item, items)
   }

   override fun getView(var1: Int, view2: View, viewGroup: ViewGroup): View {
      NavDrawerAdapter.NavDrawerItem navDrawerItem = this.getItem(var1)
      internal fun if(null: navDrawerItem ==):  {
         return null
      } else {
         View view = view2
         internal fun if(null: view2 ==):  {
            view = ((LayoutInflater)this.getContext().getSystemService("layout_inflater")).inflate(com.lumiyaviewer.lumiya.R.layout.nav_drawer_list_item, viewGroup, false)
         }

         TypedValue typedValue = TypedValue()
         this.getContext().getTheme().resolveAttribute(navDrawerItem.iconId, typedValue, true)
         view.<TextView>findViewById(com.lumiyaviewer.lumiya.R.id.navDrawerItemName).setText(this.getContext().getString(navDrawerItem.labelId))
         view.<ImageView>findViewById(com.lumiyaviewer.lumiya.R.id.navDrawerItemIcon).setImageResource(typedValue.resourceId)
         return view
      }
   }

   override fun onItemClick(adapterView: AdapterView<?>, view: View, var3: Int, var4: Long) {
      NavDrawerAdapter.NavDrawerItem navDrawerItem = this.getItem(var3)
      internal fun if(null: navDrawerItem !=):  {
         navDrawerItem.onClick(adapterView.getContext())
      }
   }

   private class NavDrawerActivityItem : NavDrawerAdapter.NavDrawerItem() {
      Class<?> activityClass

      internal constructor(var1: Int, var2: Int, var3: Int, activityClass: Class<?>) {
         super(var1, var2, var3)
         this.activityClass = activityClass
      }

      override fun onClick(context: Context) {
         Intent intent = Intent(context, this.activityClass)
         intent.addFlags(131072)
         internal fun if(Activity: context instanceof):  {
            UUID activeAgentID = ActivityUtils.getActiveAgentID(((Activity)context).getIntent())
            internal fun if(null: activeAgentID !=):  {
               intent.putExtra("activeAgentUUID", activeAgentID.toString())
            }
         }

         context.startActivity(intent)
      }
   }

   internal open class NavDrawerItem {
      int iconId
      int itemId
      int labelId

      internal constructor(itemId: Int, iconId: Int, labelId: Int) {
         this.itemId = itemId
         this.iconId = iconId
         this.labelId = labelId
      }

      open fun onClick(context: Context) {
      }
   }
}
