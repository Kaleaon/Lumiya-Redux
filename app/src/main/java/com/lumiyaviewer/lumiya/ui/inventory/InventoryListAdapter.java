package com.lumiyaviewer.lumiya.ui.inventory;

import android.content.Context;
import android.database.Cursor;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CursorAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance;

public class InventoryListAdapter extends CursorAdapter {
    private SLAvatarAppearance avatarAppearance;

    public InventoryListAdapter(SLAvatarAppearance avatarAppearance, Context context, Cursor cursor) {
        super(context, cursor);
        this.avatarAppearance = avatarAppearance;
    }

    @Override
    public void bindView(View view, Context context, Cursor cursor) {
        SLInventoryEntry inventoryEntry = new SLInventoryEntry(cursor);
        ((TextView) view.findViewById(R.id.itemNameTextView)).setText(inventoryEntry.name);
        int drawableResource = inventoryEntry.getDrawableResource();
        if (drawableResource >= 0) {
            ((ImageView) view.findViewById(R.id.itemTypeIconView)).setImageResource(drawableResource);
            int subtypeDrawableResource = inventoryEntry.getSubtypeDrawableResource();
            if (subtypeDrawableResource >= 0) {
                ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageResource(subtypeDrawableResource);
            } else {
                ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageBitmap(null);
            }
        } else {
            ((ImageView) view.findViewById(R.id.itemTypeIconView)).setImageBitmap(null);
            ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageBitmap(null);
        }
        if (this.avatarAppearance != null) {
            view.findViewById(R.id.itemWornIcon).setVisibility(this.avatarAppearance.isItemWorn(inventoryEntry) ? View.VISIBLE : View.GONE);
        } else {
            view.findViewById(R.id.itemWornIcon).setVisibility(View.GONE);
        }
    }

    @Override
    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        return ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(R.layout.inventory_item, viewGroup, false);
    }
}
