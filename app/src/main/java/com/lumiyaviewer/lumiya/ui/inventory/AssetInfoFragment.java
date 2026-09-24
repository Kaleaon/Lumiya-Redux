package com.lumiyaviewer.lumiya.ui.inventory;

import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import androidx.fragment.app.FragmentActivity;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.google.common.base.Objects;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Table;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.manager.InventoryManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout;
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment;
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class AssetInfoFragment extends FragmentWithTitle implements ReloadableFragment, View.OnClickListener, LoadableMonitor.OnLoadableDataChangedListener {
    private static final String ITEM_UUID_KEY = "itemUUID";
    private MenuItem menuItemCopy;
    private MenuItem menuItemCut;
    private MenuItem menuItemDelete;
    private MenuItem menuItemRename;
    private MenuItem menuItemShare;
    private final InventoryFragmentHelper inventoryFragmentHelper = new InventoryFragmentHelper(this);
    private final SubscriptionData<UUID, SLAgentCircuit> agentCircuit = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final SubscriptionData<UUID, SLInventoryEntry> entrySubscription = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final SubscriptionData<SubscriptionSingleKey, ImmutableMap<UUID, String>> wornAttachments = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final SubscriptionData<SubscriptionSingleKey, Table<SLWearableType, UUID, SLWearable>> wornWearables = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final SubscriptionData<SubscriptionSingleKey, ImmutableSet<UUID>> runningAnimations = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final LoadableMonitor loadableMonitor = new LoadableMonitor(this.entrySubscription).withOptionalLoadables(this.wornAttachments, this.wornWearables, this.agentCircuit, this.runningAnimations).withDataChangedListener(this);
    private ChatterNameRetriever ownerNameRetriever = null;
    private ChatterNameRetriever creatorNameRetriever = null;
    private ChatterNameRetriever lastOwnerNameRetriever = null;
    private final ChatterNameRetriever.OnChatterNameUpdated onNameUpdated = new ChatterNameRetriever.OnChatterNameUpdated() {
        private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
            AssetInfoFragment.this.m593xc7278eda(chatterNameRetriever);
        }

        @Override
        public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
            $m$0(chatterNameRetriever);
        }
    };

    private void applyEditedPermissions(Dialog dialog) {
        SLInventory inventory;
        SLInventoryEntry data = this.entrySubscription.getData();
        if (data == null || (inventory = this.inventoryFragmentHelper.getInventory()) == null) {
            return;
        }
        data.nextOwnerMask = data.ownerMask & getCheckboxes(dialog, R.id.asset_permission_cb_next_owner_copy, R.id.asset_permission_cb_next_owner_modify, R.id.asset_permission_cb_next_owner_transfer);
        data.groupMask = data.ownerMask & getCheckboxes(dialog, R.id.asset_permission_cb_group_copy, R.id.asset_permission_cb_group_modify, R.id.asset_permission_cb_group_transfer);
        data.everyoneMask = data.ownerMask & getCheckboxes(dialog, R.id.asset_permission_cb_everyone_copy, R.id.asset_permission_cb_everyone_modify, R.id.asset_permission_cb_everyone_transfer);
        inventory.UpdateStoreInventoryItem(data);
        showEntryInfo(data);
    }

    private void attachObject(SLInventoryEntry inventoryEntry) {
        try {
            this.agentCircuit.get().getModules().avatarAppearance.AttachInventoryItem(inventoryEntry, 0, false);
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e);
        }
    }

    private void detachObject(SLInventoryEntry inventoryEntry) {
        try {
            this.agentCircuit.get().getModules().avatarAppearance.DetachInventoryItem(inventoryEntry);
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e);
        }
    }

    private int getCheckboxes(Dialog dialog, int i, int i2, int i3) {
        int i4 = ((CheckBox) dialog.findViewById(i)).isChecked() ? 32768 : 0;
        if (((CheckBox) dialog.findViewById(i2)).isChecked()) {
            i4 |= 16384;
        }
        return ((CheckBox) dialog.findViewById(i3)).isChecked() ? i4 | 8192 : i4;
    }

    public static Bundle makeSelection(UUID uuid, UUID uuid2) {
        Bundle bundle = new Bundle();
        if (uuid != null) {
            bundle.putString("activeAgentUUID", uuid.toString());
        }
        if (uuid2 != null) {
            bundle.putString(ITEM_UUID_KEY, uuid2.toString());
        }
        return bundle;
    }

    private void playAnimation(SLInventoryEntry inventoryEntry, boolean z) {
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data != null) {
            data.getModules().avatarControl.playAnimation(inventoryEntry.assetUUID, z);
        }
    }

    private void setCheckboxes(Dialog dialog, int i, int i2, int i3, int i4, int i5, boolean z) {
        boolean z2 = false;
        ((CheckBox) dialog.findViewById(i3)).setChecked((i & 32768) != 0);
        ((CheckBox) dialog.findViewById(i4)).setChecked((i & 16384) != 0);
        ((CheckBox) dialog.findViewById(i5)).setChecked((i & 8192) != 0);
        dialog.findViewById(i3).setEnabled(z && (i2 & 32768) != 0);
        dialog.findViewById(i4).setEnabled(z && (i2 & 16384) != 0);
        View findViewById = dialog.findViewById(i5);
        if (z && (i2 & 8192) != 0) {
            z2 = true;
        }
        findViewById.setEnabled(z2);
    }

    private void showEditPermissionsDialog() {
        SLInventoryEntry data = this.entrySubscription.getData();
        if (data != null) {
            final Dialog dialog = new Dialog(getActivity());
            dialog.setContentView(R.layout.asset_permissions);
            dialog.setTitle(R.string.edit_permissions_title);
            setCheckboxes(dialog, data.ownerMask, data.ownerMask, R.id.asset_permission_cb_owner_copy, R.id.asset_permission_cb_owner_modify, R.id.asset_permission_cb_owner_transfer, false);
            setCheckboxes(dialog, data.nextOwnerMask, data.ownerMask, R.id.asset_permission_cb_next_owner_copy, R.id.asset_permission_cb_next_owner_modify, R.id.asset_permission_cb_next_owner_transfer, true);
            setCheckboxes(dialog, data.groupMask, data.ownerMask, R.id.asset_permission_cb_group_copy, R.id.asset_permission_cb_group_modify, R.id.asset_permission_cb_group_transfer, true);
            setCheckboxes(dialog, data.everyoneMask, data.ownerMask, R.id.asset_permission_cb_everyone_copy, R.id.asset_permission_cb_everyone_modify, R.id.asset_permission_cb_everyone_transfer, true);
            ((CheckBox) dialog.findViewById(R.id.asset_permission_cb_everyone_modify)).setChecked(false);
            dialog.findViewById(R.id.asset_permission_cb_everyone_modify).setEnabled(false);
            dialog.findViewById(R.id.okButton).setOnClickListener(new View.OnClickListener() {
                private final /* synthetic */ void $m$0(View view) {
                    AssetInfoFragment.this.m595xc7385836((Dialog) dialog, view);
                }

                @Override
                public final void onClick(View view) {
                    $m$0(view);
                }
            });
            dialog.findViewById(R.id.cancelButton).setOnClickListener(new View.OnClickListener() {
                private final /* synthetic */ void $m$0(View view) {
                    ((Dialog) dialog).dismiss();
                }

                @Override
                public final void onClick(View view) {
                    $m$0(view);
                }
            });
            dialog.show();
        }
    }

    private void showEntry(@Nullable UUID uuid) {
        this.loadableMonitor.unsubscribeAll();
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (uuid != null && userManager != null) {
            this.agentCircuit.subscribe(UserManager.agentCircuits(), userManager.getUserID());
            this.entrySubscription.subscribe(userManager.getInventoryManager().getFolderEntryPool(), uuid);
            this.wornAttachments.subscribe(userManager.getWornAttachmentsPool(), SubscriptionSingleKey.Value);
            this.wornWearables.subscribe(userManager.getWornWearablesPool(), SubscriptionSingleKey.Value);
            this.runningAnimations.subscribe(userManager.getObjectsManager().runningAnimations(), SubscriptionSingleKey.Value);
            return;
        }
        if (this.creatorNameRetriever != null) {
            this.creatorNameRetriever.dispose();
        }
        if (this.ownerNameRetriever != null) {
            this.ownerNameRetriever.dispose();
        }
        if (this.lastOwnerNameRetriever != null) {
            this.lastOwnerNameRetriever.dispose();
        }
    }

    private void showEntryInfo(@Nonnull SLInventoryEntry inventoryEntry) {
        View view = getView();
        if (view != null) {
            ((TextView) view.findViewById(R.id.asset_info_name)).setText(inventoryEntry.name);
            ((TextView) view.findViewById(R.id.asset_info_description)).setText(!Strings.isNullOrEmpty(inventoryEntry.description) ? inventoryEntry.description : getResources().getString(R.string.asset_no_description));
            ((TextView) view.findViewById(R.id.asset_info_type)).setText(inventoryEntry.getTypeDescriptionResId());
            int drawableResource = inventoryEntry.getDrawableResource();
            if (drawableResource >= 0) {
                ((ImageView) view.findViewById(R.id.asset_info_icon)).setImageResource(drawableResource);
            } else {
                ((ImageView) view.findViewById(R.id.asset_info_icon)).setImageBitmap(null);
            }
            int actionDescriptionResId = inventoryEntry.getActionDescriptionResId();
            if (actionDescriptionResId >= 0) {
                ((Button) view.findViewById(R.id.asset_action_button)).setText(actionDescriptionResId);
                view.findViewById(R.id.asset_action_button).setVisibility(View.VISIBLE);
                view.findViewById(R.id.asset_action_button).setEnabled(this.inventoryFragmentHelper.isActionAllowed(inventoryEntry, actionDescriptionResId));
            } else {
                view.findViewById(R.id.asset_action_button).setVisibility(View.GONE);
            }
            view.findViewById(R.id.edit_permissions_button).setVisibility((inventoryEntry.ownerMask & 16384) != 0 ? View.VISIBLE : View.GONE);
            showPermissions(inventoryEntry.ownerMask, R.id.asset_permission_owner_copy, R.id.asset_permission_owner_modify, R.id.asset_permission_owner_transfer);
            showPermissions(inventoryEntry.groupMask, R.id.asset_permission_group_copy, R.id.asset_permission_group_modify, R.id.asset_permission_group_transfer);
            showPermissions(inventoryEntry.everyoneMask, R.id.asset_permission_everyone_copy, R.id.asset_permission_everyone_modify, R.id.asset_permission_everyone_transfer);
            showPermissions(inventoryEntry.nextOwnerMask, R.id.asset_permission_next_owner_copy, R.id.asset_permission_next_owner_modify, R.id.asset_permission_next_owner_transfer);
            SLAgentCircuit data = this.agentCircuit.getData();
            boolean z = data != null;
            if (z && (inventoryEntry.assetType == SLAssetType.AT_OBJECT.getTypeCode() || (inventoryEntry.assetType == SLAssetType.AT_LINK.getTypeCode() && inventoryEntry.invType == SLInventoryType.IT_OBJECT.getTypeCode()))) {
                boolean z2 = inventoryEntry.whatIsItemWornOn(this.wornAttachments.getData(), this.wornWearables.getData(), false) != null;
                boolean canDetachItem = z2 ? data.getModules().avatarAppearance.canDetachItem(inventoryEntry) : false;
                view.findViewById(R.id.asset_attach_button).setVisibility(z2 ? View.GONE : View.VISIBLE);
                view.findViewById(R.id.asset_detach_button).setVisibility(canDetachItem ? View.VISIBLE : View.GONE);
            } else {
                view.findViewById(R.id.asset_attach_button).setVisibility(View.GONE);
                view.findViewById(R.id.asset_detach_button).setVisibility(View.GONE);
            }
            if (z && inventoryEntry.isAnimation()) {
                ImmutableSet<UUID> uuids = this.runningAnimations.getData();
                view.findViewById(R.id.asset_play_anim_button).setVisibility((uuids == null || !(uuids.contains(inventoryEntry.assetUUID) ^ true)) ? 8 : 0);
                view.findViewById(R.id.asset_stop_anim_button).setVisibility((uuids == null || !uuids.contains(inventoryEntry.assetUUID)) ? View.GONE : View.VISIBLE);
            } else {
                view.findViewById(R.id.asset_play_anim_button).setVisibility(View.GONE);
                view.findViewById(R.id.asset_stop_anim_button).setVisibility(View.GONE);
            }
            if (z && inventoryEntry.isWearable()) {
                Object whatIsItemWornOn = inventoryEntry.whatIsItemWornOn(this.wornAttachments.getData(), this.wornWearables.getData(), false);
                if (whatIsItemWornOn instanceof SLWearableType) {
                    view.findViewById(R.id.asset_wear_button).setVisibility(View.GONE);
                    if (((SLWearableType) whatIsItemWornOn).isBodyPart()) {
                        view.findViewById(R.id.asset_take_off_button).setVisibility(View.GONE);
                    } else {
                        view.findViewById(R.id.asset_take_off_button).setVisibility(data.getModules().avatarAppearance.canTakeItemOff((SLWearableType) whatIsItemWornOn) ? View.VISIBLE : View.GONE);
                    }
                    view.findViewById(R.id.asset_worn_text).setVisibility(view.findViewById(R.id.asset_take_off_button).getVisibility() != 0 ? View.VISIBLE : View.GONE);
                } else {
                    view.findViewById(R.id.asset_take_off_button).setVisibility(View.GONE);
                    view.findViewById(R.id.asset_wear_button).setVisibility(data.getModules().avatarAppearance.canWearItem(inventoryEntry) ? View.VISIBLE : View.GONE);
                    view.findViewById(R.id.asset_worn_text).setVisibility(View.GONE);
                }
            } else {
                view.findViewById(R.id.asset_wear_button).setVisibility(View.GONE);
                view.findViewById(R.id.asset_take_off_button).setVisibility(View.GONE);
                view.findViewById(R.id.asset_worn_text).setVisibility(View.GONE);
            }
        }
        updateMenuItems();
    }

    private void showPermissions(int i, int i2, int i3, int i4) {
        View view = getView();
        if (view != null) {
            TextView textView = (TextView) view.findViewById(i2);
            TextView viewById = (TextView) view.findViewById(i3);
            TextView viewById2 = (TextView) view.findViewById(i4);
            if ((32768 & i) != 0) {
                textView.setPaintFlags(textView.getPaintFlags() & (-17));
            } else {
                textView.setPaintFlags(textView.getPaintFlags() | 16);
            }
            if ((i & 16384) != 0) {
                viewById.setPaintFlags(viewById.getPaintFlags() & (-17));
            } else {
                viewById.setPaintFlags(viewById.getPaintFlags() | 16);
            }
            if ((i & 8192) != 0) {
                viewById2.setPaintFlags(viewById2.getPaintFlags() & (-17));
            } else {
                viewById2.setPaintFlags(viewById2.getPaintFlags() | 16);
            }
        }
    }

    private void showProfile(UUID uuid) {
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (uuid == null || !(!Objects.equal(uuid, UUIDPool.ZeroUUID)) || userManager == null) {
            return;
        }
        DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(userManager.getUserID(), uuid)));
    }

    private void showUserInfo(UUID uuid, ChatterNameRetriever chatterNameRetriever, int i, int i2, int i3) {
        View view = getView();
        if (view != null) {
            if (uuid == null || Objects.equal(uuid, UUIDPool.ZeroUUID) || chatterNameRetriever == null) {
                view.findViewById(i).setVisibility(View.GONE);
                return;
            }
            view.findViewById(i).setVisibility(View.VISIBLE);
            String resolvedName = chatterNameRetriever.getResolvedName();
            ((TextView) view.findViewById(i2)).setText(resolvedName != null ? resolvedName : getString(R.string.name_loading_title));
            ((ChatterPicView) view.findViewById(i3)).setChatterID(chatterNameRetriever.chatterID, resolvedName);
        }
    }

    private void takeOffObject(SLInventoryEntry inventoryEntry) {
        try {
            this.agentCircuit.get().getModules().avatarAppearance.TakeItemOff(inventoryEntry);
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e);
        }
    }

    private void updateMenuItems() {
        if (this.menuItemCopy == null || this.menuItemCut == null || this.menuItemShare == null || this.menuItemRename == null || this.menuItemDelete == null) {
            return;
        }
        try {
            this.agentCircuit.assertHasData();
            SLInventoryEntry inventoryEntry = this.entrySubscription.get();
            this.menuItemDelete.setVisible(true);
            this.menuItemRename.setVisible(((inventoryEntry.baseMask & inventoryEntry.ownerMask) & 16384) != 0);
            this.menuItemShare.setVisible(((inventoryEntry.ownerMask & inventoryEntry.baseMask) & 8192) != 0);
            this.menuItemCut.setVisible(true);
            this.menuItemCopy.setVisible(true);
        } catch (SubscriptionData.DataNotReadyException e) {
            this.menuItemDelete.setVisible(false);
            this.menuItemRename.setVisible(false);
            this.menuItemShare.setVisible(false);
            this.menuItemCut.setVisible(false);
            this.menuItemCopy.setVisible(false);
        }
    }

    private void wearObject(SLInventoryEntry inventoryEntry) {
        try {
            this.agentCircuit.get().getModules().avatarAppearance.WearItem(inventoryEntry, false);
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e);
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_AssetInfoFragment_10987, reason: not valid java name */
    /* synthetic */ void m593xc7278eda(ChatterNameRetriever chatterNameRetriever) {
        SLInventoryEntry data = this.entrySubscription.getData();
        if (data != null) {
            showUserInfo(data.ownerUUID, this.ownerNameRetriever, R.id.asset_owner_card_view, R.id.asset_owner_name, R.id.asset_owner_pic);
            showUserInfo(data.creatorUUID, this.creatorNameRetriever, R.id.asset_creator_card_view, R.id.asset_creator_name, R.id.asset_creator_pic);
            showUserInfo(data.lastOwnerUUID, this.lastOwnerNameRetriever, R.id.asset_last_owner_card_view, R.id.asset_last_owner_name, R.id.asset_last_owner_pic);
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_AssetInfoFragment_20027, reason: not valid java name */
    /* synthetic */ void m594xc73583d8() {
        FragmentActivity activity = getActivity();
        if (activity instanceof DetailsActivity) {
            ((DetailsActivity) activity).closeDetailsFragment(this);
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_AssetInfoFragment_26713, reason: not valid java name */
    /* synthetic */ void m595xc7385836(Dialog dialog, View view) {
        applyEditedPermissions(dialog);
        dialog.dismiss();
    }

    @Override
    public void onClick(View view) {
        SLInventoryEntry data = this.entrySubscription.getData();
        if (data != null) {
            switch (view.getId()) {
                case R.id.asset_action_button:
                    int actionDescriptionResId = data.getActionDescriptionResId();
                    if (actionDescriptionResId >= 0 && this.inventoryFragmentHelper.isActionAllowed(data, actionDescriptionResId)) {
                        this.inventoryFragmentHelper.PerformInventoryAction(data, actionDescriptionResId);
                        break;
                    }
                    break;
                case R.id.asset_attach_button:
                    attachObject(data);
                    break;
                case R.id.asset_detach_button:
                    detachObject(data);
                    break;
                case R.id.asset_wear_button:
                    wearObject(data);
                    break;
                case R.id.asset_take_off_button:
                    takeOffObject(data);
                    break;
                case R.id.asset_play_anim_button:
                    playAnimation(data, true);
                    break;
                case R.id.asset_stop_anim_button:
                    playAnimation(data, false);
                    break;
                case R.id.edit_permissions_button:
                    showEditPermissionsDialog();
                    break;
                case R.id.asset_owner_button:
                    showProfile(data.ownerUUID);
                    break;
                case R.id.asset_creator_button:
                    showProfile(data.creatorUUID);
                    break;
                case R.id.asset_last_owner_button:
                    showProfile(data.lastOwnerUUID);
                    break;
            }
        }
    }

    @Override
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(R.menu.inventory_item_menu, menu);
        this.menuItemDelete = menu.findItem(R.id.inventory_item_delete_item);
        this.menuItemRename = menu.findItem(R.id.inventory_item_rename_item);
        this.menuItemShare = menu.findItem(R.id.inventory_item_share_item);
        this.menuItemCut = menu.findItem(R.id.inventory_item_cut_item);
        this.menuItemCopy = menu.findItem(R.id.inventory_item_copy_item);
        updateMenuItems();
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.asset_info, viewGroup, false);
        ((LoadingLayout) inflate.findViewById(R.id.loading_layout)).setSwipeRefreshLayout((SwipeRefreshLayout) inflate.findViewById(R.id.swipe_refresh_layout));
        this.loadableMonitor.setLoadingLayout((LoadingLayout) inflate.findViewById(R.id.loading_layout), getString(R.string.no_item_selected), getString(R.string.inventorY_item_loading_fail));
        this.loadableMonitor.setSwipeRefreshLayout((SwipeRefreshLayout) inflate.findViewById(R.id.swipe_refresh_layout));
        inflate.findViewById(R.id.asset_creator_button).setOnClickListener(this);
        inflate.findViewById(R.id.asset_owner_button).setOnClickListener(this);
        inflate.findViewById(R.id.asset_last_owner_button).setOnClickListener(this);
        inflate.findViewById(R.id.asset_action_button).setOnClickListener(this);
        inflate.findViewById(R.id.edit_permissions_button).setOnClickListener(this);
        inflate.findViewById(R.id.edit_permissions_button).setVisibility(View.GONE);
        inflate.findViewById(R.id.asset_attach_button).setOnClickListener(this);
        inflate.findViewById(R.id.asset_detach_button).setOnClickListener(this);
        inflate.findViewById(R.id.asset_wear_button).setOnClickListener(this);
        inflate.findViewById(R.id.asset_take_off_button).setOnClickListener(this);
        inflate.findViewById(R.id.asset_play_anim_button).setOnClickListener(this);
        inflate.findViewById(R.id.asset_stop_anim_button).setOnClickListener(this);
        return inflate;
    }

    @Override
    public void onLoadableDataChanged() {
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        try {
            showEntryInfo(this.entrySubscription.get());
            if (userManager != null) {
                this.creatorNameRetriever = new ChatterNameRetriever(ChatterID.getUserChatterID(userManager.getUserID(), this.entrySubscription.get().creatorUUID), this.onNameUpdated, UIThreadExecutor.getInstance());
                this.ownerNameRetriever = new ChatterNameRetriever(ChatterID.getUserChatterID(userManager.getUserID(), this.entrySubscription.get().ownerUUID), this.onNameUpdated, UIThreadExecutor.getInstance());
                this.lastOwnerNameRetriever = new ChatterNameRetriever(ChatterID.getUserChatterID(userManager.getUserID(), this.entrySubscription.get().lastOwnerUUID), this.onNameUpdated, UIThreadExecutor.getInstance());
            }
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e);
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (userManager != null) {
            try {
                SLInventoryEntry inventoryEntry = this.entrySubscription.get();
                switch (menuItem.getItemId()) {
                    case R.id.inventory_item_delete_item:
                        this.inventoryFragmentHelper.DeleteInventoryEntry(inventoryEntry, new Runnable() {
                            private final /* synthetic */ void $m$0() {
                                AssetInfoFragment.this.m594xc73583d8();
                            }

                            @Override
                            public final void run() {
                                $m$0();
                            }
                        });
                        return true;
                    case R.id.inventory_item_rename_item:
                        this.inventoryFragmentHelper.RenameInventoryEntry(inventoryEntry);
                        return true;
                    case R.id.inventory_item_share_item:
                        this.inventoryFragmentHelper.ShareInventoryEntry(inventoryEntry);
                        return true;
                    case R.id.inventory_item_cut_item:
                        userManager.getInventoryManager().copyToClipboard(new InventoryManager.InventoryClipboardEntry(true, inventoryEntry));
                        Toast.makeText(getContext(), R.string.copied_to_clipboard, Toast.LENGTH_LONG).show();
                        return true;
                    case R.id.inventory_item_copy_item:
                        userManager.getInventoryManager().copyToClipboard(new InventoryManager.InventoryClipboardEntry(false, inventoryEntry));
                        Toast.makeText(getContext(), R.string.copied_to_clipboard, Toast.LENGTH_LONG).show();
                        return true;
                }
            } catch (SubscriptionData.DataNotReadyException e) {
                Debug.Warning(e);
            }
        }
        return super.onOptionsItemSelected(menuItem);
    }

    @Override
    public void onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        updateMenuItems();
    }

    @Override
    public void onStart() {
        super.onStart();
        showEntry(UUIDPool.getUUID(getArguments().getString(ITEM_UUID_KEY)));
    }

    @Override
    public void onStop() {
        showEntry(null);
        super.onStop();
    }

    @Override
    public void setFragmentArgs(Intent intent, Bundle bundle) {
        UUID activeAgentID = ActivityUtils.getActiveAgentID(intent);
        if (activeAgentID != null) {
            getArguments().putString("activeAgentUUID", activeAgentID.toString());
        }
        if (bundle != null) {
            getArguments().putAll(bundle);
        }
        if (isFragmentStarted()) {
            showEntry(UUIDPool.getUUID(getArguments().getString(ITEM_UUID_KEY)));
        }
    }
}
