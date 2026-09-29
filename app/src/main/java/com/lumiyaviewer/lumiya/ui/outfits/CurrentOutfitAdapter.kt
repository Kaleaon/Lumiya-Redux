package com.lumiyaviewer.lumiya.ui.outfits

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.TextView
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import com.lumiyaviewer.lumiya.ui.common.DismissableAdapter
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissListViewTouchListener

internal open class CurrentOutfitAdapter : BaseAdapter(), DismissableAdapter {

    private SLAvatarAppearance avatarAppearance
    private LayoutInflater inflater

    private ImmutableList<SLAvatarAppearance.WornItem> wornItems = ImmutableList.of()

    internal constructor(context: Context) {
        this.inflater = LayoutInflater.from(context)
    }

    override fun canDismiss(i: Int): Boolean {
        SLAvatarAppearance.WornItem item = getItem(i)
        if (item == null || this.avatarAppearance == null) {
            return false
        }
        if (item.getWornOn() == null) {
            return this.avatarAppearance.canDetachItem(item)
        }
        if (item.getWornOn().isBodyPart()) {
            return false
        }
        return this.avatarAppearance.canTakeItemOff(item.getWornOn())
    }

    override fun getCount(): Int {
        return this.wornItems.size()
    }

    override fun getItem(i: Int): SLAvatarAppearance.WornItem {
        if (i < 0 || i >= this.wornItems.size()) {
            return null
        }
        return this.wornItems.get(i)
    }

    override fun getItemId(i: Int): Long {
        return i
    }

    override fun getItemViewType(i: Int): Int {
        return 0
    }

    override fun getView(i: Int, view: View, viewGroup: ViewGroup): View {
        View view2 = (view == null || view.getId() == R.id.outfitItemLayout) ? view : null
        View inflate = view2 == null ? this.inflater.inflate(R.layout.outfit_item, viewGroup, false) : view2
        SLAvatarAppearance.WornItem wornItem = this.wornItems.get(i)
        ((TextView) inflate.findViewById(R.id.itemNameTextView)).setText(wornItem.getName())
        if (wornItem.getWornOn() != null) {
            ((ImageView) inflate.findViewById(R.id.itemTypeIconView)).setImageResource(R.drawable.inv_clothes)
            inflate.findViewById(R.id.itemTouchableIcon).setVisibility(View.GONE)
        } else {
            ((ImageView) inflate.findViewById(R.id.itemTypeIconView)).setImageResource(R.drawable.inv_object)
            inflate.findViewById(R.id.itemTouchableIcon).setVisibility(wornItem.getIsTouchable() ? View.VISIBLE : View.GONE)
        }
        SwipeDismissListViewTouchListener.restoreViewState(inflate)
        return inflate
    }

    override fun hasStableIds(): Boolean {
        return false
    }

    override fun isEmpty(): Boolean {
        return this.wornItems.isEmpty()
    }

    override fun onDismiss(i: Int) {
        SLAvatarAppearance.WornItem item = getItem(i)
        if (item == null || this.avatarAppearance == null) {
            return
        }
        if (item.getWornOn() != null) {
            this.avatarAppearance.TakeItemOff(item.itemID())
        } else {
            this.avatarAppearance.DetachItem(item)
        }
    }

    open fun setAvatarAppearance(avatarAppearance: SLAvatarAppearance) {
        this.avatarAppearance = avatarAppearance
    }

    open fun setData(immutableList: ImmutableList<SLAvatarAppearance.WornItem>) {
        if (immutableList == null) {
            immutableList = ImmutableList.of()
        }
        this.wornItems = immutableList
        notifyDataSetChanged()
    }
}
