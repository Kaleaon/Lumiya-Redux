package com.lumiyaviewer.lumiya.ui.common;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;
import com.lumiyaviewer.lumiya.ui.chat.ChatNewActivity;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity;
import com.lumiyaviewer.lumiya.ui.login.LogoutDialog;
import com.lumiyaviewer.lumiya.ui.minimap.MinimapActivity;
import com.lumiyaviewer.lumiya.ui.myava.MyAvatarActivity;
import com.lumiyaviewer.lumiya.ui.objects.ObjectListNewActivity;
import com.lumiyaviewer.lumiya.ui.render.WorldViewActivity;
import com.lumiyaviewer.lumiya.ui.search.SearchGridActivity;
import com.lumiyaviewer.lumiya.ui.settings.SettingsActivity;
import java.util.UUID;

class NavDrawerAdapter extends ArrayAdapter<NavDrawerAdapter.NavDrawerItem> implements OnItemClickListener {
   private static NavDrawerAdapter.NavDrawerItem[] items = new NavDrawerAdapter.NavDrawerItem[]{
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_chat, com.lumiyaviewer.lumiya.R.attr.MenuIconLocalChatThemed, com.lumiyaviewer.lumiya.R.string.nav_chat, ChatNewActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_3d_view, com.lumiyaviewer.lumiya.R.attr.MenuIconWorldViewThemed, com.lumiyaviewer.lumiya.R.string.nav_3d_view, WorldViewActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_objects, com.lumiyaviewer.lumiya.R.attr.MenuIconObjectsThemed, com.lumiyaviewer.lumiya.R.string.nav_objects, ObjectListNewActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_inventory, com.lumiyaviewer.lumiya.R.attr.MenuIconInventoryThemed, com.lumiyaviewer.lumiya.R.string.nav_inventory, InventoryActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_minimap, com.lumiyaviewer.lumiya.R.attr.MenuIconMinimapThemed, com.lumiyaviewer.lumiya.R.string.nav_minimap, MinimapActivity.class),
      new NavDrawerAdapter.NavDrawerItem(com.lumiyaviewer.lumiya.R.id.item_teleport_home, com.lumiyaviewer.lumiya.R.attr.MenuIconHomeThemed, com.lumiyaviewer.lumiya.R.string.nav_teleport_home) {
         @Override
         public void onClick(Context context) {
            if (context instanceof Activity) {
               TeleportHomeDialog.show((Activity)context);
            }
         }
      },
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_my_avatar, com.lumiyaviewer.lumiya.R.attr.MenuIconCardThemed, com.lumiyaviewer.lumiya.R.string.nav_my_avatar, MyAvatarActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_people_search, com.lumiyaviewer.lumiya.R.attr.MenuIconSearchThemed, com.lumiyaviewer.lumiya.R.string.nav_search, SearchGridActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_settings, com.lumiyaviewer.lumiya.R.attr.MenuIconSettingsThemed, com.lumiyaviewer.lumiya.R.string.nav_settings, SettingsActivity.class),
      new NavDrawerAdapter.NavDrawerItem(com.lumiyaviewer.lumiya.R.id.item_signout, com.lumiyaviewer.lumiya.R.attr.MenuIconSignOffThemed, com.lumiyaviewer.lumiya.R.string.nav_signout) {
         @Override
         public void onClick(Context context) {
            if (context instanceof Activity) {
               LogoutDialog.show((Activity)context);
            }
         }
      }
   };

   NavDrawerAdapter(Context context) {
      super(context, com.lumiyaviewer.lumiya.R.layout.nav_drawer_list_item, items);
   }

   @Override
   public View getView(int var1, View view2, ViewGroup viewGroup) {
      NavDrawerAdapter.NavDrawerItem navDrawerItem = this.getItem(var1);
      if (navDrawerItem == null) {
         return null;
      } else {
         View view = view2;
         if (view2 == null) {
            view = ((LayoutInflater)this.getContext().getSystemService("layout_inflater")).inflate(com.lumiyaviewer.lumiya.R.layout.nav_drawer_list_item, viewGroup, false);
         }

         TypedValue typedValue = new TypedValue();
         this.getContext().getTheme().resolveAttribute(navDrawerItem.iconId, typedValue, true);
         view.<TextView>findViewById(com.lumiyaviewer.lumiya.R.id.navDrawerItemName).setText(this.getContext().getString(navDrawerItem.labelId));
         view.<ImageView>findViewById(com.lumiyaviewer.lumiya.R.id.navDrawerItemIcon).setImageResource(typedValue.resourceId);
         return view;
      }
   }

   @Override
   public void onItemClick(AdapterView<?> adapterView, View view, int var3, long var4) {
      NavDrawerAdapter.NavDrawerItem navDrawerItem = this.getItem(var3);
      if (navDrawerItem != null) {
         navDrawerItem.onClick(adapterView.getContext());
      }
   }

   private static class NavDrawerActivityItem extends NavDrawerAdapter.NavDrawerItem {
      final Class<?> activityClass;

      NavDrawerActivityItem(int var1, int var2, int var3, Class<?> activityClass) {
         super(var1, var2, var3);
         this.activityClass = activityClass;
      }

      @Override
      public void onClick(Context context) {
         Intent intent = new Intent(context, this.activityClass);
         intent.addFlags(131072);
         if (context instanceof Activity) {
            UUID activeAgentID = ActivityUtils.getActiveAgentID(((Activity)context).getIntent());
            if (activeAgentID != null) {
               intent.putExtra("activeAgentUUID", activeAgentID.toString());
            }
         }

         context.startActivity(intent);
      }
   }

   static class NavDrawerItem {
      final int iconId;
      final int itemId;
      final int labelId;

      NavDrawerItem(int itemId, int iconId, int labelId) {
         this.itemId = itemId;
         this.iconId = iconId;
         this.labelId = labelId;
      }

      public void onClick(Context context) {
      }
   }
}
