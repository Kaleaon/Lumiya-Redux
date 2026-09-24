package com.lumiyaviewer.lumiya.ui.inventory;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.common.base.Objects;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Table;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.orm.InventoryDB;
import com.lumiyaviewer.lumiya.orm.InventoryEntryList;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType;
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class InventoryFolderAdapter extends BaseAdapter implements View.OnClickListener {
    private InventoryDB database;
    private final LayoutInflater inflater;
    private final boolean wornCheckboxes;

    @Nullable
    private UUID wornOutfitFolder;

    @Nonnull
    private InventoryEntryList data = new InventoryEntryList();

    @Nullable
    private Table<SLWearableType, UUID, SLWearable> wornWearables = null;

    @Nullable
    private ImmutableMap<UUID, String> wornAttachments = null;

    @Nullable
    private OnItemCheckboxClickListener onItemCheckboxClickListener = null;

    @Nullable
    private SLAvatarAppearance avatarAppearance = null;

    public interface OnItemCheckboxClickListener {
        void onItemCheckboxClicked(SLInventoryEntry inventoryEntry);
    }

    public InventoryFolderAdapter(LayoutInflater layoutInflater, boolean wornCheckboxes) {
        this.inflater = layoutInflater;
        this.wornCheckboxes = wornCheckboxes;
    }

    private boolean isItemWorn(SLInventoryEntry inventoryEntry) {
        return inventoryEntry.whatIsItemWornOn(this.wornAttachments, this.wornWearables, false) != null;
    }

    @Override
    public int getCount() {
        return this.data.size();
    }

    @Override
    public SLInventoryEntry getItem(int i) {
        return this.data.get(i);
    }

    @Override
    public long getItemId(int i) {
        SLInventoryEntry item = getItem(i);
        if (item != null) {
            return item.getId();
        }
        return -1L;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        SLInventoryEntry item2;
        int drawableResource;
        int subtypeDrawableResource;
        boolean z = true;
        if (view == null) {
            view = this.inflater.inflate(R.layout.inventory_item, viewGroup, false);
        }
        SLInventoryEntry item = getItem(i);
        if (item != null) {
            TextView textView = (TextView) view.findViewById(R.id.itemNameTextView);
            textView.setText(item.name);
            int i4 = -1;
            int i5 = -1;
            if (item.assetType != SLAssetType.AT_LINK.getTypeCode() || this.database == null) {
                item2 = item;
            } else {
                SLInventoryEntry resolveLink = this.database.resolveLink(item);
                if (resolveLink != null) {
                    i4 = resolveLink.getDrawableResource();
                    i5 = R.drawable.inv_link;
                    item2 = resolveLink;
                } else {
                    item2 = item;
                }
            }
            if (i4 < 0) {
                drawableResource = item.getDrawableResource();
                subtypeDrawableResource = item.getSubtypeDrawableResource();
            } else {
                drawableResource = i4;
                subtypeDrawableResource = i5;
            }
            if (drawableResource >= 0) {
                ((ImageView) view.findViewById(R.id.itemTypeIconView)).setImageResource(drawableResource);
                if (subtypeDrawableResource >= 0) {
                    ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageResource(subtypeDrawableResource);
                } else {
                    ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageBitmap(null);
                }
            } else {
                ((ImageView) view.findViewById(R.id.itemTypeIconView)).setImageBitmap(null);
                ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageBitmap(null);
            }
            if (this.wornOutfitFolder == null || !Objects.equal(this.wornOutfitFolder, item.uuid)) {
                textView.setTypeface(null, 0);
            } else {
                textView.setTypeface(null, 1);
            }
            if (this.wornCheckboxes) {
                if ((item.assetType == SLAssetType.AT_OBJECT.getTypeCode() || (item.isLink() && item.invType == SLInventoryType.IT_OBJECT.getTypeCode()) || item.isWearable() || item2.assetType == SLAssetType.AT_OBJECT.getTypeCode()) ? true : item2.isWearable()) {
                    Object whatIsItemWornOn = item2.whatIsItemWornOn(this.wornAttachments, this.wornWearables, false);
                    boolean z2 = whatIsItemWornOn != null;
                    boolean isBodyPart = whatIsItemWornOn instanceof SLWearableType ? ((SLWearableType) whatIsItemWornOn).isBodyPart() : false;
                    if (this.avatarAppearance != null) {
                        if (z2) {
                            if (!item2.isWearable()) {
                                z = this.avatarAppearance.canDetachItem(item2);
                            } else if (this.avatarAppearance.canTakeItemOff(item2)) {
                                z = !isBodyPart;
                            }
                        }
                        view.findViewById(R.id.item_worn_checkbox).setVisibility(View.VISIBLE);
                        view.findViewById(R.id.item_worn_checkbox).setTag(R.id.tag_outfit_object, item);
                        ((CheckBox) view.findViewById(R.id.item_worn_checkbox)).setChecked(z2);
                        view.findViewById(R.id.item_worn_checkbox).setEnabled(z);
                        view.findViewById(R.id.item_worn_checkbox).setOnClickListener(this);
                    }
                    z = false;
                    view.findViewById(R.id.item_worn_checkbox).setVisibility(View.VISIBLE);
                    view.findViewById(R.id.item_worn_checkbox).setTag(R.id.tag_outfit_object, item);
                    ((CheckBox) view.findViewById(R.id.item_worn_checkbox)).setChecked(z2);
                    view.findViewById(R.id.item_worn_checkbox).setEnabled(z);
                    view.findViewById(R.id.item_worn_checkbox).setOnClickListener(this);
                } else {
                    view.findViewById(R.id.item_worn_checkbox).setVisibility(View.GONE);
                    view.findViewById(R.id.item_worn_checkbox).setTag(R.id.tag_outfit_object, null);
                }
            } else {
                view.findViewById(R.id.item_worn_checkbox).setVisibility(View.GONE);
                view.findViewById(R.id.itemWornIcon).setVisibility(isItemWorn(item) ? View.VISIBLE : View.GONE);
            }
        }
        return view;
    }

    @Override
    public boolean hasStableIds() {
        return true;
    }

    @Override
    public void onClick(View view) {
        if (this.onItemCheckboxClickListener != null) {
            Object tag = view.getTag(R.id.tag_outfit_object);
            if (tag instanceof SLInventoryEntry) {
                this.onItemCheckboxClickListener.onItemCheckboxClicked((SLInventoryEntry) tag);
            }
        }
    }

    public void setAvatarAppearance(@Nullable SLAvatarAppearance avatarAppearance) {
        this.avatarAppearance = avatarAppearance;
        notifyDataSetChanged();
    }

    public void setData(@Nullable InventoryEntryList inventoryEntryList) {
        if (inventoryEntryList == null) {
            inventoryEntryList = new InventoryEntryList();
        }
        this.data = inventoryEntryList;
        notifyDataSetChanged();
    }

    public void setDatabase(InventoryDB inventoryDB) {
        this.database = inventoryDB;
        notifyDataSetChanged();
    }

    public void setOnItemCheckboxClickListener(@Nullable OnItemCheckboxClickListener onItemCheckboxClickListener) {
        this.onItemCheckboxClickListener = onItemCheckboxClickListener;
    }

    public void setWornAttachments(@Nullable ImmutableMap<UUID, String> immutableMap) {
        this.wornAttachments = immutableMap;
        notifyDataSetChanged();
    }

    public void setWornOutfitFolder(@Nullable UUID uuid) {
        this.wornOutfitFolder = uuid;
        notifyDataSetChanged();
    }

    public void setWornWearables(@Nullable Table<SLWearableType, UUID, SLWearable> table) {
        this.wornWearables = table;
        notifyDataSetChanged();
    }
}
