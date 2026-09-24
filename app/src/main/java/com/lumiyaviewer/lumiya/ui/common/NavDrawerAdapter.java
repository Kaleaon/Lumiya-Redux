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
         public void onClick(Context var1) {
            if (var1 instanceof Activity) {
               TeleportHomeDialog.show((Activity)var1);
            }
         }
      },
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_my_avatar, com.lumiyaviewer.lumiya.R.attr.MenuIconCardThemed, com.lumiyaviewer.lumiya.R.string.nav_my_avatar, MyAvatarActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_people_search, com.lumiyaviewer.lumiya.R.attr.MenuIconSearchThemed, com.lumiyaviewer.lumiya.R.string.nav_search, SearchGridActivity.class),
      new NavDrawerAdapter.NavDrawerActivityItem(com.lumiyaviewer.lumiya.R.id.item_settings, com.lumiyaviewer.lumiya.R.attr.MenuIconSettingsThemed, com.lumiyaviewer.lumiya.R.string.nav_settings, SettingsActivity.class),
      new NavDrawerAdapter.NavDrawerItem(com.lumiyaviewer.lumiya.R.id.item_signout, com.lumiyaviewer.lumiya.R.attr.MenuIconSignOffThemed, com.lumiyaviewer.lumiya.R.string.nav_signout) {
         @Override
         public void onClick(Context var1) {
            if (var1 instanceof Activity) {
               LogoutDialog.show((Activity)var1);
            }
         }
      }
   };

   NavDrawerAdapter(Context var1) {
      super(var1, com.lumiyaviewer.lumiya.R.layout.nav_drawer_list_item, items);
   }

   @Override
   public View getView(int var1, View var2, ViewGroup var3) {
      NavDrawerAdapter.NavDrawerItem var5 = this.getItem(var1);
      if (var5 == null) {
         return null;
      } else {
         View var4 = var2;
         if (var2 == null) {
            var4 = ((LayoutInflater)this.getContext().getSystemService("layout_inflater")).inflate(com.lumiyaviewer.lumiya.R.layout.nav_drawer_list_item, var3, false);
         }

         TypedValue var6 = new TypedValue();
         this.getContext().getTheme().resolveAttribute(var5.iconId, var6, true);
         var4.<TextView>findViewById(com.lumiyaviewer.lumiya.R.id.navDrawerItemName).setText(this.getContext().getString(var5.labelId));
         var4.<ImageView>findViewById(com.lumiyaviewer.lumiya.R.id.navDrawerItemIcon).setImageResource(var6.resourceId);
         return var4;
      }
   }

   @Override
   public void onItemClick(AdapterView<?> var1, View var2, int var3, long var4) {
      NavDrawerAdapter.NavDrawerItem var6 = this.getItem(var3);
      if (var6 != null) {
         var6.onClick(var1.getContext());
      }
   }

   private static class NavDrawerActivityItem extends NavDrawerAdapter.NavDrawerItem {
      final Class<?> activityClass;

      NavDrawerActivityItem(int var1, int var2, int var3, Class<?> var4) {
         super(var1, var2, var3);
         this.activityClass = var4;
      }

      @Override
      public void onClick(Context var1) {
         Intent var3 = new Intent(var1, this.activityClass);
         var3.addFlags(131072);
         if (var1 instanceof Activity) {
            UUID var2 = ActivityUtils.getActiveAgentID(((Activity)var1).getIntent());
            if (var2 != null) {
               var3.putExtra("activeAgentUUID", var2.toString());
            }
         }

         var1.startActivity(var3);
      }
   }

   static class NavDrawerItem {
      final int iconId;
      final int itemId;
      final int labelId;

      NavDrawerItem(int var1, int var2, int var3) {
         this.itemId = var1;
         this.iconId = var2;
         this.labelId = var3;
      }

      public void onClick(Context var1) {
      }
   }
}
