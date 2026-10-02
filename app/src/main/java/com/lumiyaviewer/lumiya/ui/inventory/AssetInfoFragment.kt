package com.lumiyaviewer.lumiya.ui.inventory

import android.app.Dialog
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.CheckBox
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.google.common.collect.ImmutableMap
import com.google.common.collect.ImmutableSet
import com.google.common.collect.Table
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.InventoryManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class AssetInfoFragment : FragmentWithTitle(), ReloadableFragment, View.OnClickListener, LoadableMonitor.OnLoadableDataChangedListener {
    private static String ITEM_UUID_KEY = "itemUUID"
    private MenuItem menuItemCopy
    private MenuItem menuItemCut
    private MenuItem menuItemDelete
    private MenuItem menuItemRename
    private MenuItem menuItemShare
    private InventoryFragmentHelper inventoryFragmentHelper = InventoryFragmentHelper(this)
    private SubscriptionData<UUID, SLAgentCircuit> agentCircuit = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<UUID, SLInventoryEntry> entrySubscription = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<SubscriptionSingleKey, ImmutableMap<UUID, String>> wornAttachments = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<SubscriptionSingleKey, Table<SLWearableType, UUID, SLWearable>> wornWearables = SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<SubscriptionSingleKey, ImmutableSet<UUID>> runningAnimations = SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.entrySubscription).withOptionalLoadables(this.wornAttachments, this.wornWearables, this.agentCircuit, this.runningAnimations).withDataChangedListener(this)
    private ChatterNameRetriever ownerNameRetriever = null
    private ChatterNameRetriever creatorNameRetriever = null
    private ChatterNameRetriever lastOwnerNameRetriever = null
    private ChatterNameRetriever.OnChatterNameUpdated onNameUpdated = ChatterNameRetriever.OnChatterNameUpdated() {
            AssetInfoFragment.this.m593xc7278eda(chatterNameRetriever)
        }

        override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
            dialog.findViewById(R.id.cancelButton).setOnClickListener(View.OnClickListener() {
                    ((Dialog) dialog).dismiss()
                }

                override fun onClick(view: View) {
                        view.findViewById(R.id.asset_take_off_button).setVisibility(data.getModules().avatarAppearance.canTakeItemOff((SLWearableType) whatIsItemWornOn) ? View.VISIBLE : View.GONE)
                    }
                    view.findViewById(R.id.asset_worn_text).setVisibility(view.findViewById(R.id.asset_take_off_button).getVisibility() != 0 ? View.VISIBLE : View.GONE)
                } else {
                    view.findViewById(R.id.asset_take_off_button).setVisibility(View.GONE)
                    view.findViewById(R.id.asset_wear_button).setVisibility(data.getModules().avatarAppearance.canWearItem(inventoryEntry) ? View.VISIBLE : View.GONE)
                    view.findViewById(R.id.asset_worn_text).setVisibility(View.GONE)
                }
            } else {
                view.findViewById(R.id.asset_wear_button).setVisibility(View.GONE)
                view.findViewById(R.id.asset_take_off_button).setVisibility(View.GONE)
                view.findViewById(R.id.asset_worn_text).setVisibility(View.GONE)
            }
        }
        updateMenuItems()
    }

    private fun showPermissions(i: Int, i2: Int, i3: Int, i4: Int) {
        View view = getView()
        if (view != null) {
            TextView textView = (TextView) view.findViewById(i2)
            TextView viewById = (TextView) view.findViewById(i3)
            TextView viewById2 = (TextView) view.findViewById(i4)
            if ((32768 & i) != 0) {
                textView.setPaintFlags(textView.getPaintFlags() & (-17))
            } else {
                textView.setPaintFlags(textView.getPaintFlags() | 16)
            }
            if ((i & 16384) != 0) {
                viewById.setPaintFlags(viewById.getPaintFlags() & (-17))
            } else {
                viewById.setPaintFlags(viewById.getPaintFlags() | 16)
            }
            if ((i & 8192) != 0) {
                viewById2.setPaintFlags(viewById2.getPaintFlags() & (-17))
            } else {
                viewById2.setPaintFlags(viewById2.getPaintFlags() | 16)
            }
        }
    }

    private fun showProfile(uuid: UUID) {
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        if (uuid == null || !(!Objects.equal(uuid, UUIDPool.ZeroUUID)) || userManager == null) {
            return
        }
        DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(userManager.getUserID(), uuid)))
    }

    private fun showUserInfo(uuid: UUID, chatterNameRetriever: ChatterNameRetriever, i: Int, i2: Int, i3: Int) {
        View view = getView()
        if (view != null) {
            if (uuid == null || Objects.equal(uuid, UUIDPool.ZeroUUID) || chatterNameRetriever == null) {
                view.findViewById(i).setVisibility(View.GONE)
                return
            }
            view.findViewById(i).setVisibility(View.VISIBLE)
            String resolvedName = chatterNameRetriever.getResolvedName()
            ((TextView) view.findViewById(i2)).setText(resolvedName != null ? resolvedName : getString(R.string.name_loading_title))
            ((ChatterPicView) view.findViewById(i3)).setChatterID(chatterNameRetriever.chatterID, resolvedName)
        }
    }

    private fun takeOffObject(inventoryEntry: SLInventoryEntry) {
        try {
            this.agentCircuit.get().getModules().avatarAppearance.TakeItemOff(inventoryEntry)
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e)
        }
    }

    private fun updateMenuItems() {
        if (this.menuItemCopy == null || this.menuItemCut == null || this.menuItemShare == null || this.menuItemRename == null || this.menuItemDelete == null) {
            return
        }
        try {
            this.agentCircuit.assertHasData()
            SLInventoryEntry inventoryEntry = this.entrySubscription.get()
            this.menuItemDelete.setVisible(true)
            this.menuItemRename.setVisible(((inventoryEntry.baseMask & inventoryEntry.ownerMask) & 16384) != 0)
            this.menuItemShare.setVisible(((inventoryEntry.ownerMask & inventoryEntry.baseMask) & 8192) != 0)
            this.menuItemCut.setVisible(true)
            this.menuItemCopy.setVisible(true)
        } catch (SubscriptionData.DataNotReadyException e) {
            this.menuItemDelete.setVisible(false)
            this.menuItemRename.setVisible(false)
            this.menuItemShare.setVisible(false)
            this.menuItemCut.setVisible(false)
            this.menuItemCopy.setVisible(false)
        }
    }

    private fun wearObject(inventoryEntry: SLInventoryEntry) {
        try {
            this.agentCircuit.get().getModules().avatarAppearance.WearItem(inventoryEntry, false)
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e)
        }
    }




    override fun onClick(view: View) {
        SLInventoryEntry data = this.entrySubscription.getData()
        if (data != null) {
            when (view.getId()) {
                R.id.asset_action_button -> {
                    int actionDescriptionResId = data.getActionDescriptionResId()
                    if (actionDescriptionResId >= 0 && this.inventoryFragmentHelper.isActionAllowed(data, actionDescriptionResId)) {
                        this.inventoryFragmentHelper.PerformInventoryAction(data, actionDescriptionResId)
                        }
                    }
                    }
                R.id.asset_attach_button -> {
                    attachObject(data)
                    }
                R.id.asset_detach_button -> {
                    detachObject(data)
                    }
                R.id.asset_wear_button -> {
                    wearObject(data)
                    }
                R.id.asset_take_off_button -> {
                    takeOffObject(data)
                    }
                R.id.asset_play_anim_button -> {
                    playAnimation(data, true)
                    }
                R.id.asset_stop_anim_button -> {
                    playAnimation(data, false)
                    }
                R.id.edit_permissions_button -> {
                    showEditPermissionsDialog()
                    }
                R.id.asset_owner_button -> {
                    showProfile(data.ownerUUID)
                    }
                R.id.asset_creator_button -> {
                    showProfile(data.creatorUUID)
                    }
                R.id.asset_last_owner_button -> {
                    showProfile(data.lastOwnerUUID)
                    }
            }
        }
    }

    override fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        setHasOptionsMenu(true)
    }

    override fun onCreateOptionsMenu(menu: Menu, menuInflater: MenuInflater) {
        menuInflater.inflate(R.menu.inventory_item_menu, menu)
        this.menuItemDelete = menu.findItem(R.id.inventory_item_delete_item)
        this.menuItemRename = menu.findItem(R.id.inventory_item_rename_item)
        this.menuItemShare = menu.findItem(R.id.inventory_item_share_item)
        this.menuItemCut = menu.findItem(R.id.inventory_item_cut_item)
        this.menuItemCopy = menu.findItem(R.id.inventory_item_copy_item)
        updateMenuItems()
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        View inflate = layoutInflater.inflate(R.layout.asset_info, viewGroup, false)
        ((LoadingLayout) inflate.findViewById(R.id.loading_layout)).setSwipeRefreshLayout((SwipeRefreshLayout) inflate.findViewById(R.id.swipe_refresh_layout))
        this.loadableMonitor.setLoadingLayout((LoadingLayout) inflate.findViewById(R.id.loading_layout), getString(R.string.no_item_selected), getString(R.string.inventorY_item_loading_fail))
        this.loadableMonitor.setSwipeRefreshLayout((SwipeRefreshLayout) inflate.findViewById(R.id.swipe_refresh_layout))
        inflate.findViewById(R.id.asset_creator_button).setOnClickListener(this)
        inflate.findViewById(R.id.asset_owner_button).setOnClickListener(this)
        inflate.findViewById(R.id.asset_last_owner_button).setOnClickListener(this)
        inflate.findViewById(R.id.asset_action_button).setOnClickListener(this)
        inflate.findViewById(R.id.edit_permissions_button).setOnClickListener(this)
        inflate.findViewById(R.id.edit_permissions_button).setVisibility(View.GONE)
        inflate.findViewById(R.id.asset_attach_button).setOnClickListener(this)
        inflate.findViewById(R.id.asset_detach_button).setOnClickListener(this)
        inflate.findViewById(R.id.asset_wear_button).setOnClickListener(this)
        inflate.findViewById(R.id.asset_take_off_button).setOnClickListener(this)
        inflate.findViewById(R.id.asset_play_anim_button).setOnClickListener(this)
        inflate.findViewById(R.id.asset_stop_anim_button).setOnClickListener(this)
        return inflate
    }

    override fun onLoadableDataChanged() {
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        try {
            showEntryInfo(this.entrySubscription.get())
            if (userManager != null) {
                this.creatorNameRetriever = ChatterNameRetriever(ChatterID.getUserChatterID(userManager.getUserID(), this.entrySubscription.get().creatorUUID), this.onNameUpdated, UIThreadExecutor.getInstance())
                this.ownerNameRetriever = ChatterNameRetriever(ChatterID.getUserChatterID(userManager.getUserID(), this.entrySubscription.get().ownerUUID), this.onNameUpdated, UIThreadExecutor.getInstance())
                this.lastOwnerNameRetriever = ChatterNameRetriever(ChatterID.getUserChatterID(userManager.getUserID(), this.entrySubscription.get().lastOwnerUUID), this.onNameUpdated, UIThreadExecutor.getInstance())
            }
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e)
        }
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        if (userManager != null) {
            try {
                SLInventoryEntry inventoryEntry = this.entrySubscription.get()
                when (menuItem.getItemId()) {
                    R.id.inventory_item_delete_item -> {
                        this.inventoryFragmentHelper.DeleteInventoryEntry(inventoryEntry, Runnable() {
                                AssetInfoFragment.this.m594xc73583d8()
                            }

                            override fun run() {
