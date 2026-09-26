package com.lumiyaviewer.lumiya.ui.inventory

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.CheckBox
import android.widget.ImageView
import android.widget.TextView
import com.google.common.base.Objects
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Table
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.orm.InventoryDB
import com.lumiyaviewer.lumiya.orm.InventoryEntryList
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import java.util.UUID

open class InventoryFolderAdapter : BaseAdapter(), View.OnClickListener {
    private InventoryDB database
    private LayoutInflater inflater
    private boolean wornCheckboxes

    private UUID wornOutfitFolder

    private InventoryEntryList data = InventoryEntryList()

    private Table<SLWearableType, UUID, SLWearable> wornWearables = null

    private ImmutableMap<UUID, String> wornAttachments = null

    private OnItemCheckboxClickListener onItemCheckboxClickListener = null

    private SLAvatarAppearance avatarAppearance = null

    interface OnItemCheckboxClickListener {
        fun onItemCheckboxClicked(inventoryEntry: SLInventoryEntry)
    }

    constructor(layoutInflater: LayoutInflater, wornCheckboxes: Boolean) {
        this.inflater = layoutInflater
        this.wornCheckboxes = wornCheckboxes
    }

    private fun isItemWorn(inventoryEntry: SLInventoryEntry): Boolean {
        return inventoryEntry.whatIsItemWornOn(this.wornAttachments, this.wornWearables, false) != null
    }

    override fun getCount(): Int {
        return this.data.size()
    }

    override fun getItem(i: Int): SLInventoryEntry {
        return this.data.get(i)
    }

    override fun getItemId(i: Int): Long {
        SLInventoryEntry item = getItem(i)
        internal fun if(null: item !=):  {
            return item.getId()
        }
        return -1L
    }

    override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
        SLInventoryEntry item2
        int drawableResource
        int subtypeDrawableResource
        boolean z = true
        internal fun if(null: view ==):  {
            view = this.inflater.inflate(R.layout.inventory_item, viewGroup, false)
        }
        SLInventoryEntry item = getItem(i)
        internal fun if(null: item !=):  {
            TextView textView = (TextView) view.findViewById(R.id.itemNameTextView)
            textView.setText(item.name)
            int i4 = -1
            int i5 = -1
            if (item.assetType != SLAssetType.AT_LINK.getTypeCode() || this.database == null) {
                item2 = item
            } else {
                SLInventoryEntry resolveLink = this.database.resolveLink(item)
                internal fun if(null: resolveLink !=):  {
                    i4 = resolveLink.getDrawableResource()
                    i5 = R.drawable.inv_link
                    item2 = resolveLink
                } else {
                    item2 = item
                }
            }
            internal fun if(0: i4 <):  {
                drawableResource = item.getDrawableResource()
                subtypeDrawableResource = item.getSubtypeDrawableResource()
            } else {
                drawableResource = i4
                subtypeDrawableResource = i5
            }
            internal fun if(0: drawableResource >=):  {
                ((ImageView) view.findViewById(R.id.itemTypeIconView)).setImageResource(drawableResource)
                internal fun if(0: subtypeDrawableResource >=):  {
                    ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageResource(subtypeDrawableResource)
                } else {
                    ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageBitmap(null)
                }
            } else {
                ((ImageView) view.findViewById(R.id.itemTypeIconView)).setImageBitmap(null)
                ((ImageView) view.findViewById(R.id.itemSubTypeIconView)).setImageBitmap(null)
            }
            if (this.wornOutfitFolder == null || !Objects.equal(this.wornOutfitFolder, item.uuid)) {
                textView.setTypeface(null, 0)
            } else {
                textView.setTypeface(null, 1)
            }
            internal fun if(this.wornCheckboxes):  {
                if ((item.assetType == SLAssetType.AT_OBJECT.getTypeCode() || (item.isLink() && item.invType == SLInventoryType.IT_OBJECT.getTypeCode()) || item.isWearable() || item2.assetType == SLAssetType.AT_OBJECT.getTypeCode()) ? true : item2.isWearable()) {
                    Object whatIsItemWornOn = item2.whatIsItemWornOn(this.wornAttachments, this.wornWearables, false)
                    boolean z2 = whatIsItemWornOn != null
                    boolean isBodyPart = whatIsItemWornOn is SLWearableType ? ((SLWearableType) whatIsItemWornOn).isBodyPart() : false
                    internal fun if(null: this.avatarAppearance !=):  {
                        internal fun if(z2):  {
                            if (!item2.isWearable()) {
                                z = this.avatarAppearance.canDetachItem(item2)
                            } else if (this.avatarAppearance.canTakeItemOff(item2)) {
                                z = !isBodyPart
                            }
                        }
                        view.findViewById(R.id.item_worn_checkbox).setVisibility(View.VISIBLE)
                        view.findViewById(R.id.item_worn_checkbox).setTag(R.id.tag_outfit_object, item)
                        ((CheckBox) view.findViewById(R.id.item_worn_checkbox)).setChecked(z2)
                        view.findViewById(R.id.item_worn_checkbox).setEnabled(z)
                        view.findViewById(R.id.item_worn_checkbox).setOnClickListener(this)
                    }
                    z = false
                    view.findViewById(R.id.item_worn_checkbox).setVisibility(View.VISIBLE)
                    view.findViewById(R.id.item_worn_checkbox).setTag(R.id.tag_outfit_object, item)
                    ((CheckBox) view.findViewById(R.id.item_worn_checkbox)).setChecked(z2)
                    view.findViewById(R.id.item_worn_checkbox).setEnabled(z)
                    view.findViewById(R.id.item_worn_checkbox).setOnClickListener(this)
                } else {
                    view.findViewById(R.id.item_worn_checkbox).setVisibility(View.GONE)
                    view.findViewById(R.id.item_worn_checkbox).setTag(R.id.tag_outfit_object, null)
                }
            } else {
                view.findViewById(R.id.item_worn_checkbox).setVisibility(View.GONE)
                view.findViewById(R.id.itemWornIcon).setVisibility(isItemWorn(item) ? View.VISIBLE : View.GONE)
            }
        }
        return view
    }

    override fun hasStableIds(): Boolean {
        return true
    }

    override fun onClick(view: View) {
        internal fun if(null: this.onItemCheckboxClickListener !=):  {
            Object tag = view.getTag(R.id.tag_outfit_object)
            internal fun if(SLInventoryEntry: tag instanceof):  {
                this.onItemCheckboxClickListener.onItemCheckboxClicked((SLInventoryEntry) tag)
            }
        }
    }

    open fun setAvatarAppearance(avatarAppearance: SLAvatarAppearance) {
        this.avatarAppearance = avatarAppearance
        notifyDataSetChanged()
    }

    open fun setData(inventoryEntryList: InventoryEntryList) {
        internal fun if(null: inventoryEntryList ==):  {
            inventoryEntryList = InventoryEntryList()
        }
        this.data = inventoryEntryList
        notifyDataSetChanged()
    }

    open fun setDatabase(inventoryDB: InventoryDB) {
        this.database = inventoryDB
        notifyDataSetChanged()
    }

    open fun setOnItemCheckboxClickListener(onItemCheckboxClickListener: OnItemCheckboxClickListener) {
        this.onItemCheckboxClickListener = onItemCheckboxClickListener
    }

    open fun setWornAttachments(immutableMap: ImmutableMap<UUID, String>) {
        this.wornAttachments = immutableMap
        notifyDataSetChanged()
    }

    open fun setWornOutfitFolder(uuid: UUID) {
        this.wornOutfitFolder = uuid
        notifyDataSetChanged()
    }

    open fun setWornWearables(table: Table<SLWearableType, UUID, SLWearable>) {
        this.wornWearables = table
        notifyDataSetChanged()
    }
}
