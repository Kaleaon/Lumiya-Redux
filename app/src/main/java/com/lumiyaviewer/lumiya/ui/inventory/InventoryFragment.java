package com.lumiyaviewer.lumiya.ui.inventory;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.google.common.base.Objects;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Table;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.eventbus.EventBus;
import com.lumiyaviewer.lumiya.eventbus.EventHandler;
import com.lumiyaviewer.lumiya.orm.InventoryEntryList;
import com.lumiyaviewer.lumiya.orm.InventoryQuery;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType;
import com.lumiyaviewer.lumiya.slproto.chat.SLChatInventoryItemOfferedEvent;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType;
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply;
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoReply;
import com.lumiyaviewer.lumiya.slproto.users.manager.InventoryManager;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout;
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment;
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity;
import com.lumiyaviewer.lumiya.ui.inventory.InventorySaveInfo;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class InventoryFragment extends FragmentWithTitle implements ReloadableFragment {

    private static final String FOLDER_ID_KEY = "folderID";
    private static final String IS_MASTER_FRAGMENT = "isMasterFragment";
    private static final String IS_SEARCHING_KEY = "isSearching";
    private static final String SEARCH_STRING_KEY = "searchString";
    public static final String SELECTED_INVENTORY_ENTRY = "selectedInventoryEntry";
    private static final int[] folderActionIds = {R.id.inventory_go_up_item, R.id.inventory_create_item, R.id.inventory_folder_create_item, R.id.inventory_folder_create_landmark, R.id.inventory_folder_create_notecard, R.id.inventory_folder_upload_picture, R.id.inventory_folder_delete_item, R.id.inventory_folder_rename_item, R.id.inventory_folder_share_item, R.id.inventory_folder_cut_item, R.id.inventory_folder_copy_item, R.id.inventory_folder_paste_item, R.id.inventory_folder_paste_as_link_item};
    private final InventoryFragmentHelper inventoryFragmentHelper = new InventoryFragmentHelper(this);
    private InventoryFolderAdapter adapter = null;
    private InventorySaveInfo saveInfo = null;

    @Nonnull
    private ImmutableMap<Integer, MenuItem> folderActionMenuItems = ImmutableMap.of();
    private final SubscriptionData<InventoryQuery, InventoryEntryList> entryList = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            InventoryFragment.this.onInventoryEntryList((InventoryEntryList) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, InventoryManager.InventoryClipboardEntry> clipboardEntry = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            InventoryFragment.this.onClipboardEntry((InventoryManager.InventoryClipboardEntry) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<UUID, SLAgentCircuit> agentCircuit = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            InventoryFragment.this.onAgentCircuit((SLAgentCircuit) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<UUID, Boolean> folderLoading = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            InventoryFragment.this.onLoadingStatusChanged((Boolean) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, Boolean> searchRunning = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            InventoryFragment.this.onLoadingStatusChanged((Boolean) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, ImmutableMap<UUID, String>> wornAttachments = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            InventoryFragment.this.onWornAttachmentsChanged((ImmutableMap) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, Table<SLWearableType, UUID, SLWearable>> wornWearables = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            InventoryFragment.this.onWornWearablesChanged((Table) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final LoadableMonitor loadableMonitor = new LoadableMonitor(this.entryList);
    private final AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener() {
        private final /* synthetic */ void $m$0(AdapterView adapterView, View view, int i, long j) {
            InventoryFragment.this.m614x3694a933(adapterView, view, i, j);
        }

        @Override
        public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
            $m$0(adapterView, view, i, j);
        }
    };
    private final View.OnClickListener saveAsClickListener = new View.OnClickListener() {
        private final /* synthetic */ void $m$0(View view) {
            InventoryFragment.this.m616x36a1db7a(view);
        }

        @Override
        public final void onClick(View view) {
            $m$0(view);
        }
    };

    private void applyPickImage(SLInventoryEntry sLInventoryEntry, PickInfoReply pickInfoReply) {
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data == null || pickInfoReply == null) {
            return;
        }
        data.getModules().userProfiles.UpdatePickInfo(pickInfoReply.Data_Field.PickID, pickInfoReply.Data_Field.CreatorID, pickInfoReply.Data_Field.ParcelID, SLMessage.stringFromVariableOEM(pickInfoReply.Data_Field.Name), SLMessage.stringFromVariableUTF(pickInfoReply.Data_Field.Desc), sLInventoryEntry.assetUUID, pickInfoReply.Data_Field.PosGlobal, pickInfoReply.Data_Field.SortOrder, pickInfoReply.Data_Field.Enabled);
        FragmentActivity activity = getActivity();
        if (activity != null) {
            activity.finish();
        }
    }

    private void applyProfilePic(SLInventoryEntry sLInventoryEntry, boolean z, AvatarPropertiesReply avatarPropertiesReply) {
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data != null && avatarPropertiesReply != null) {
            UUID uuid = avatarPropertiesReply.PropertiesData_Field.ImageID;
            UUID uuid2 = avatarPropertiesReply.PropertiesData_Field.FLImageID;
            if (z) {
                uuid2 = sLInventoryEntry.assetUUID;
            } else {
                uuid = sLInventoryEntry.assetUUID;
            }
            data.getModules().userProfiles.UpdateAvatarProperties(uuid, uuid2, SLMessage.stringFromVariableUTF(avatarPropertiesReply.PropertiesData_Field.AboutText), SLMessage.stringFromVariableOEM(avatarPropertiesReply.PropertiesData_Field.FLAboutText), (avatarPropertiesReply.PropertiesData_Field.Flags & 1) != 0, (avatarPropertiesReply.PropertiesData_Field.Flags & 2) != 0, SLMessage.stringFromVariableOEM(avatarPropertiesReply.PropertiesData_Field.ProfileURL));
        }
        FragmentActivity activity = getActivity();
        if (activity != null) {
            activity.finish();
        }
    }

    private boolean folderActionsVisible() {
        if (isMasterFragment()) {
            return !isSplitScreen();
        }
        return true;
    }

    @Nullable
    private UUID forTransferToUUID() {
        Intent intent;
        String stringExtra;
        FragmentActivity activity = getActivity();
        if (activity == null || (intent = activity.getIntent()) == null || (stringExtra = intent.getStringExtra("transferToID")) == null) {
            return null;
        }
        return UUIDPool.getUUID(stringExtra);
    }

    @Nullable
    private SLAssetType getFilterAssetType() {
        Intent intent;
        SLAssetType byType;
        FragmentActivity activity = getActivity();
        if (activity == null || (intent = activity.getIntent()) == null || (byType = SLAssetType.getByType(intent.getIntExtra("selectActionAssetType", SLAssetType.AT_UNKNOWN.getTypeCode()))) == SLAssetType.AT_UNKNOWN) {
            return null;
        }
        return byType;
    }

    private InventoryQuery getInventoryQuery() {
        Bundle arguments = getArguments();
        UUID uuid = UUIDPool.getUUID(arguments.getString(FOLDER_ID_KEY));
        String string = arguments.getBoolean(IS_SEARCHING_KEY) ? arguments.getString(SEARCH_STRING_KEY) : null;
        if (string != null) {
            string = string.trim();
        }
        String emptyToNull = Strings.emptyToNull(string);
        return InventoryQuery.create(emptyToNull != null ? null : uuid, emptyToNull, !isMasterFragment() ? !isSplitScreen() : true, isMasterFragment() ? !isSplitScreen() : true, InventoryFragmentHelper.getSortOrder(getContext()) == 0, getFilterAssetType());
    }

    @Nullable
    private InventoryActivity.SelectAction getSelectAction() {
        Intent intent;
        String stringExtra;
        FragmentActivity activity = getActivity();
        if (activity == null || (intent = activity.getIntent()) == null || (stringExtra = intent.getStringExtra("selectAction")) == null) {
            return null;
        }
        try {
            return InventoryActivity.SelectAction.valueOf(stringExtra);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    @Nullable
    private UserManager getUserManager() {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            return ActivityUtils.getUserManager(activity.getIntent());
        }
        return null;
    }

    private boolean isForSelectItem() {
        Intent intent;
        FragmentActivity activity = getActivity();
        if (activity == null || (intent = activity.getIntent()) == null) {
            return false;
        }
        return intent.getBooleanExtra("forSelectItem", false);
    }

    private boolean isMasterFragment() {
        Bundle arguments = getArguments();
        if (arguments == null || !arguments.containsKey(IS_MASTER_FRAGMENT)) {
            return false;
        }
        return arguments.getBoolean(IS_MASTER_FRAGMENT);
    }

    private boolean isSplitScreen() {
        FragmentActivity activity = getActivity();
        if (activity instanceof MasterDetailsActivity) {
            return ((MasterDetailsActivity) activity).isSplitScreen();
        }
        return false;
    }

    public static Bundle makeDetailsArguments(Bundle bundle) {
        Bundle bundle2 = new Bundle();
        bundle2.putString(FOLDER_ID_KEY, bundle.getString(FOLDER_ID_KEY));
        bundle2.putString(SEARCH_STRING_KEY, bundle.getString(SEARCH_STRING_KEY));
        bundle2.putBoolean(IS_SEARCHING_KEY, bundle.getBoolean(IS_SEARCHING_KEY));
        return bundle2;
    }

    public static Bundle makeSelection(@Nullable UUID uuid, @Nullable String str) {
        Bundle bundle = new Bundle();
        if (uuid != null) {
            bundle.putString(FOLDER_ID_KEY, uuid.toString());
        }
        bundle.putBoolean(IS_SEARCHING_KEY, str != null);
        bundle.putString(SEARCH_STRING_KEY, str);
        return bundle;
    }

    private void navigateToFolder(UUID uuid) {
        Bundle arguments = getArguments();
        arguments.putString(FOLDER_ID_KEY, uuid.toString());
        arguments.putBoolean(IS_SEARCHING_KEY, false);
        showInventoryList(getInventoryQuery());
        FragmentActivity activity = getActivity();
        if (activity instanceof InventoryActivity) {
            ((InventoryActivity) activity).clearSearchMode();
        }
    }

    public static Fragment newInstance(Bundle bundle, boolean z) {
        InventoryFragment inventoryFragment = new InventoryFragment();
        Bundle bundle2 = new Bundle();
        if (bundle != null) {
            bundle2.putAll(bundle);
        }
        bundle2.putBoolean(IS_MASTER_FRAGMENT, z);
        inventoryFragment.setArguments(bundle2);
        return inventoryFragment;
    }

    public void onAgentCircuit(SLAgentCircuit sLAgentCircuit) {
        updateFolderActionItems();
    }

    public void onClipboardEntry(InventoryManager.InventoryClipboardEntry inventoryClipboardEntry) {
        updateFolderActionItems();
    }

    public void onInventoryEntryList(InventoryEntryList inventoryEntryList) {
        Debug.Printf("InventoryFragment (%s): onInventoryEntryList: %d entries", this, Integer.valueOf(inventoryEntryList.size()));
        if (isForSelectItem()) {
            InventoryActivity.SelectAction selectAction = getSelectAction();
            if (selectAction != null) {
                setTitle(inventoryEntryList.getTitle(), getString(selectAction.subtitleResourceId));
            } else {
                setTitle(inventoryEntryList.getTitle(), forTransferToUUID() != null ? getString(R.string.select_item_to_share_title) : getString(R.string.select_item_for_attachment_title));
            }
        } else {
            setTitle(inventoryEntryList.getTitle(), null);
        }
        if (this.adapter != null) {
            this.adapter.setData(inventoryEntryList);
        }
        updateLoadingStatus();
        updateFolderActionItems();
    }

    public void onLoadingStatusChanged(Boolean bool) {
        updateLoadingStatus();
    }

    public void onWornAttachmentsChanged(ImmutableMap<UUID, String> immutableMap) {
        if (this.adapter != null) {
            this.adapter.setWornAttachments(immutableMap);
        }
    }

    public void onWornWearablesChanged(Table<SLWearableType, UUID, SLWearable> table) {
        if (this.adapter != null) {
            this.adapter.setWornWearables(table);
        }
    }

    private void performSelectAction(SLInventoryEntry sLInventoryEntry, InventoryActivity.SelectAction selectAction) {
        Intent intent;
        Bundle bundle = null;
        FragmentActivity activity = getActivity();
        if (activity != null && (intent = activity.getIntent()) != null) {
            bundle = intent.getBundleExtra("selectActionParams");
            Debug.Printf("InventoryAction: actionParams %s, has params %b", bundle, Boolean.valueOf(intent.hasExtra("selectActionParams")));
        }
        if (bundle == null) {
            bundle = new Bundle();
        }
        switch (selectAction) {
            case applyFirstLife:
            case applyUserProfile:
                applyProfilePic(sLInventoryEntry, selectAction == InventoryActivity.SelectAction.applyFirstLife, (AvatarPropertiesReply) bundle.getParcelable("oldProfileData"));
                break;
            case applyPickImage:
                applyPickImage(sLInventoryEntry, (PickInfoReply) bundle.getParcelable("oldPickData"));
                break;
        }
    }

    private void selectPictureForUpload() {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction("android.intent.action.GET_CONTENT");
        startActivityForResult(Intent.createChooser(intent, "Select Picture"), 10);
    }

    private void shareItem(final SLInventoryEntry sLInventoryEntry, final UUID uuid) {
        Intent intent;
        String str = null;
        if ((sLInventoryEntry.baseMask & sLInventoryEntry.ownerMask & 8192) == 0) {
            new AlertDialog.Builder(getContext()).setMessage(getString(R.string.item_is_no_transfer)).setCancelable(true).setNegativeButton("Dismiss", new DialogInterface.OnClickListener() {
                private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                    dialogInterface.cancel();
                }

                @Override
                public final void onClick(DialogInterface dialogInterface, int i) {
                    $m$0(dialogInterface, i);
                }
            }).create().show();
            return;
        }
        final FragmentActivity activity = getActivity();
        if (activity != null && (intent = activity.getIntent()) != null) {
            str = intent.getStringExtra("transferToName");
        }
        Object[] objArr = new Object[2];
        objArr[0] = sLInventoryEntry.name;
        if (str == null) {
            str = getString(R.string.name_loading_title);
        }
        objArr[1] = str;
        String string = getString(R.string.share_inv_item_title, objArr);
        if ((sLInventoryEntry.baseMask & sLInventoryEntry.ownerMask & 32768) == 0) {
            string = string + "\n" + getString(R.string.no_copy_item_transfer_confirm);
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setMessage(string).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                InventoryFragment.this.m615x3697e76c((UUID) uuid, (SLInventoryEntry) sLInventoryEntry, (FragmentActivity) activity, dialogInterface, i);
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        });
        builder.create().show();
    }

    private void showInventoryList(@Nullable InventoryQuery inventoryQuery) {
        Debug.Printf("InventoryFragment (%s): showInventoryList '%s'", this, inventoryQuery);
        this.entryList.unsubscribe();
        this.agentCircuit.unsubscribe();
        this.clipboardEntry.unsubscribe();
        this.folderLoading.unsubscribe();
        UserManager userManager = getUserManager();
        if (inventoryQuery == null || userManager == null) {
            this.searchRunning.unsubscribe();
            this.wornAttachments.unsubscribe();
            this.wornWearables.unsubscribe();
            this.adapter.setDatabase(null);
        } else {
            this.wornAttachments.subscribe(userManager.getWornAttachmentsPool(), SubscriptionSingleKey.Value);
            this.wornWearables.subscribe(userManager.getWornWearablesPool(), SubscriptionSingleKey.Value);
            this.agentCircuit.subscribe(UserManager.agentCircuits(), userManager.getUserID());
            UUID folderId = inventoryQuery.folderId();
            if (folderId != null) {
                this.folderLoading.subscribe(userManager.getInventoryManager().getFolderLoading(), folderId);
            }
            this.searchRunning.subscribe(userManager.getInventoryManager().getSearchRunning(), SubscriptionSingleKey.Value);
            this.clipboardEntry.subscribe(userManager.getInventoryManager().getClipboard(), SubscriptionSingleKey.Value);
            this.entryList.subscribe(userManager.getInventoryManager().getInventoryEntries(), inventoryQuery);
            if (isMasterFragment() && isSplitScreen()) {
                FragmentActivity activity = getActivity();
                if (activity instanceof MasterDetailsActivity) {
                    ((MasterDetailsActivity) activity).setCurrentDetailsArguments(InventoryFragment.class, makeDetailsArguments(getArguments()));
                }
            }
            if (this.adapter != null) {
                this.adapter.setDatabase(userManager.getInventoryManager().getDatabase());
            }
        }
        updateLoadingStatus();
    }

    private void updateFolderActionItems() {
        if (this.folderActionMenuItems.isEmpty()) {
            return;
        }
        InventoryEntryList data = this.entryList.getData();
        SLInventoryEntry folder = data != null ? data.getFolder() : null;
        if (!folderActionsVisible() || folder == null) {
            Iterator<MenuItem> it = this.folderActionMenuItems.values().iterator();
            while (it.hasNext()) {
                it.next().setVisible(false);
            }
            return;
        }
        InventoryManager.InventoryClipboardEntry data2 = this.clipboardEntry.getData();
        boolean hasData = this.agentCircuit.hasData();
        boolean equal = folder.parentUUID != null ? Objects.equal(folder.parentUUID, UUIDPool.ZeroUUID) : true;
        boolean z = folder.typeDefault >= 0;
        boolean isCopyable = data2 != null ? !data2.isCut ? data2.inventoryEntry.isCopyable() : true : false;
        boolean z2 = data2 != null;
        for (Map.Entry<Integer, MenuItem> entry : this.folderActionMenuItems.entrySet()) {
            switch (entry.getKey().intValue()) {
                case R.id.inventory_go_up_item:
                    entry.getValue().setVisible(!equal);
                    break;
                case R.id.inventory_create_item:
                case R.id.inventory_folder_create_item:
                case R.id.inventory_folder_create_landmark:
                case R.id.inventory_folder_create_notecard:
                case R.id.inventory_folder_upload_picture:
                    entry.getValue().setVisible(hasData);
                    break;
                case R.id.inventory_folder_delete_item:
                case R.id.inventory_folder_rename_item:
                case R.id.inventory_folder_share_item:
                case R.id.inventory_folder_cut_item:
                case R.id.inventory_folder_copy_item:
                default:
                    entry.getValue().setVisible((equal || !(z ^ true)) ? false : hasData);
                    break;
                case R.id.inventory_folder_paste_item:
                    entry.getValue().setVisible(isCopyable ? hasData : false);
                    break;
                case R.id.inventory_folder_paste_as_link_item:
                    entry.getValue().setVisible(z2 ? hasData : false);
                    break;
            }
        }
    }

    private void updateLoadingStatus() {
        boolean z;
        boolean z2;
        Context context = getContext();
        if (context != null) {
            boolean z3 = getArguments().getBoolean(IS_SEARCHING_KEY);
            if (this.folderLoading.isSubscribed()) {
                Boolean data = this.folderLoading.getData();
                z = data != null ? data.booleanValue() : false;
            } else {
                z = false;
            }
            if (z3) {
                Boolean data2 = this.searchRunning.getData();
                z2 = (data2 != null ? data2.booleanValue() : false) | z;
            } else {
                z2 = z;
            }
            boolean isEmpty = this.adapter != null ? this.adapter.isEmpty() : true;
            this.loadableMonitor.setExtraLoading(isEmpty ? z2 : false);
            LoadableMonitor loadableMonitor = this.loadableMonitor;
            if (isEmpty) {
                z2 = false;
            }
            loadableMonitor.setButteryProgressBar(z2);
            this.loadableMonitor.setEmptyMessage(isEmpty, z3 ? isSplitScreen() ? isMasterFragment() ? context.getString(R.string.no_inventory_folders_found) : context.getString(R.string.no_inventory_items_found) : context.getString(R.string.no_inventory_entries_found) : isSplitScreen() ? isMasterFragment() ? context.getString(R.string.no_inventory_subfolders) : context.getString(R.string.no_inventory_subitems) : context.getString(R.string.no_inventory_subentries));
        }
    }

    private void uploadImage(String str, Bitmap bitmap, UUID uuid, UUID uuid2) {
        String trim = Strings.nullToEmpty(str).trim();
        int indexOf = trim.indexOf(46);
        if (indexOf != -1) {
            trim = trim.substring(0, indexOf).trim();
        }
        StringBuilder sb = new StringBuilder();
        boolean z = false;
        for (int i = 0; i < trim.length(); i++) {
            char charAt = trim.charAt(i);
            if ("0123456789ABCDEFGHIJKLMNOPQRSTUWXYZabcdefghijklmnopqrstuwxyz ".indexOf(charAt) != -1) {
                sb.append(charAt);
                z = false;
            } else {
                if (!z) {
                    sb.append('_');
                }
                z = true;
            }
        }
        String trim2 = sb.toString().trim();
        if (trim2.equals("") || trim2.equals("_")) {
            trim2 = "Picture";
        }
        Debug.Printf("Upload: uploading name '%s' bitmap %d x %d", trim2, Integer.valueOf(bitmap.getWidth()), Integer.valueOf(bitmap.getHeight()));
        new UploadImageAsyncTask(getContext(), uuid).execute(new UploadImageParams(trim2, bitmap, uuid, uuid2));
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_23670, reason: not valid java name */
    /* synthetic */ void m612x3687192d(SLInventoryEntry sLInventoryEntry) {
        if (sLInventoryEntry.parentUUID == null || !(!Objects.equal(sLInventoryEntry.parentUUID, UUIDPool.ZeroUUID))) {
            return;
        }
        navigateToFolder(sLInventoryEntry.parentUUID);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_29313, reason: not valid java name */
    /* synthetic */ void m613x3689c76d(String str, Bitmap bitmap, UserManager userManager, UUID uuid, DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
        uploadImage(str, bitmap, userManager.getUserID(), uuid);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_32146, reason: not valid java name */
    /* synthetic */ void m614x3694a933(AdapterView adapterView, View view, int i, long j) {
        SLInventoryEntry item;
        UUID uuid = null;
        if (this.adapter == null || (item = this.adapter.getItem(i)) == null) {
            return;
        }
        Debug.Printf("Inventory: Item click: item isFolder %b invType %d typeDefault %d assetType %d", Boolean.valueOf(item.isFolder), Integer.valueOf(item.invType), Integer.valueOf(item.typeDefault), Integer.valueOf(item.assetType));
        if (item.isFolder && item.uuid != null) {
            uuid = item.uuid;
        } else if (item.isLink() && item.invType == 8) {
            uuid = item.assetUUID;
        }
        if (uuid != null) {
            navigateToFolder(uuid);
            return;
        }
        if (!isForSelectItem()) {
            FragmentActivity activity = getActivity();
            if (activity instanceof InventoryActivity) {
                ((InventoryActivity) activity).clearSearchMode();
            }
            UserManager userManager = getUserManager();
            if (userManager != null) {
                DetailsActivity.showEmbeddedDetails(getActivity(), AssetInfoFragment.class, AssetInfoFragment.makeSelection(userManager.getUserID(), item.uuid));
                return;
            }
            return;
        }
        InventoryActivity.SelectAction selectAction = getSelectAction();
        if (selectAction != null) {
            performSelectAction(item, selectAction);
            return;
        }
        UUID forTransferToUUID = forTransferToUUID();
        if (forTransferToUUID != null) {
            shareItem(item, forTransferToUUID);
            return;
        }
        FragmentActivity activity2 = getActivity();
        if (activity2 != null) {
            Intent intent = new Intent();
            intent.putExtra(SELECTED_INVENTORY_ENTRY, item);
            activity2.setResult(-1, intent);
            activity2.finish();
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_39597, reason: not valid java name */
    /* synthetic */ void m615x3697e76c(UUID uuid, SLInventoryEntry sLInventoryEntry, FragmentActivity fragmentActivity, DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
        SLAgentCircuit data = this.agentCircuit.getData();
        if (data != null) {
            data.OfferInventoryItem(uuid, sLInventoryEntry);
            if (fragmentActivity != null) {
                fragmentActivity.finish();
            }
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_40227, reason: not valid java name */
    /* synthetic */ void m616x36a1db7a(View view) {
        if (this.saveInfo != null) {
            if (this.saveInfo.saveType == InventorySaveInfo.InventorySaveType.NotecardItem) {
                SLAgentCircuit data = this.agentCircuit.getData();
                UUID uuid = UUIDPool.getUUID(getArguments().getString(FOLDER_ID_KEY));
                if (data == null || uuid == null) {
                    return;
                }
                final ProgressDialog show = ProgressDialog.show(getContext(), null, getString(R.string.notecard_saving_contents), true, true);
                data.getModules().inventory.CopyInventoryFromNotecard(this.saveInfo.notecardUUID, this.saveInfo.saveItemUUID, uuid, new Runnable() {
                    private final /* synthetic */ void $m$0() {
                        InventoryFragment.this.m617x36a1f2bc((ProgressDialog) show);
                    }

                    @Override
                    public final void run() {
                        $m$0();
                    }
                });
                return;
            }
            if (this.saveInfo.saveType == InventorySaveInfo.InventorySaveType.InventoryOffer) {
                SLAgentCircuit data2 = this.agentCircuit.getData();
                UUID uuid2 = UUIDPool.getUUID(getArguments().getString(FOLDER_ID_KEY));
                UserManager userManager = getUserManager();
                if (data2 == null || uuid2 == null || userManager == null) {
                    return;
                }
                ChatMessage chatMessage = userManager.getChatterList().getActiveChattersManager().getChatMessage(this.saveInfo.inventoryOfferMessageId);
                if (chatMessage != null) {
                    SLChatEvent loadFromDatabaseObject = SLChatEvent.loadFromDatabaseObject(chatMessage, userManager.getUserID());
                    if (loadFromDatabaseObject instanceof SLChatInventoryItemOfferedEvent) {
                        ((SLChatInventoryItemOfferedEvent) loadFromDatabaseObject).onOfferAccepted(getContext(), userManager, uuid2);
                    }
                }
                FragmentActivity activity = getActivity();
                if (activity != null) {
                    activity.finish();
                }
            }
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_40889, reason: not valid java name */
    /* synthetic */ void m617x36a1f2bc(final ProgressDialog progressDialog) {
        UIThreadExecutor.getInstance().execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                InventoryFragment.this.m618x36a1f5df((ProgressDialog) progressDialog);
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_inventory_InventoryFragment_40936, reason: not valid java name */
    /* synthetic */ void m618x36a1f5df(ProgressDialog progressDialog) {
        if (progressDialog.isShowing()) {
            progressDialog.dismiss();
            FragmentActivity activity = getActivity();
            if (activity != null) {
                activity.finish();
            }
        }
    }

    @Override
    public void onActivityCreated(@Nullable Bundle bundle) {
        Intent intent;
        super.onActivityCreated(bundle);
        FragmentActivity activity = getActivity();
        if (activity != null && (intent = activity.getIntent()) != null) {
            this.saveInfo = (InventorySaveInfo) intent.getParcelableExtra("forSaveInfo");
        }
        View view = getView();
        if (view != null) {
            if (this.saveInfo == null || !folderActionsVisible()) {
                view.findViewById(R.id.save_as_layout).setVisibility(View.GONE);
            } else {
                view.findViewById(R.id.save_as_layout).setVisibility(View.VISIBLE);
                ((TextView) view.findViewById(R.id.save_as_message)).setText(getString(R.string.inventory_save_format, this.saveInfo.saveItemName));
            }
        }
    }

    @Override
    public void onActivityResult(int i, int i2, Intent intent) {
        Uri data;
        super.onActivityResult(i, i2, intent);
        if (i != 10 || i2 != -1 || intent == null || (data = intent.getData()) == null) {
            return;
        }
        try {
            final String lastPathSegment = data.getLastPathSegment();
            final Bitmap bitmap = MediaStore.Images.Media.getBitmap(getContext().getContentResolver(), data);
            final UserManager userManager = getUserManager();
            SLAgentCircuit activeAgentCircuit = userManager != null ? userManager.getActiveAgentCircuit() : null;
            final UUID uuid = UUIDPool.getUUID(getArguments().getString(FOLDER_ID_KEY));
            if (activeAgentCircuit != null) {
                int uploadCost = activeAgentCircuit.getModules().financialInfo.getUploadCost();
                if (uploadCost == 0) {
                    uploadImage(lastPathSegment, bitmap, userManager.getUserID(), uuid);
                    return;
                }
                AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
                builder.setMessage(getString(R.string.upload_confirm_question, Integer.valueOf(uploadCost))).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i3) {
                        InventoryFragment.this.m613x3689c76d((String) lastPathSegment, (Bitmap) bitmap, (UserManager) userManager, (UUID) uuid, dialogInterface, i3);
                    }

                    @Override
                    public final void onClick(DialogInterface dialogInterface, int i3) {
                        $m$0(dialogInterface, i3);
                    }
                }).setNegativeButton("No", new DialogInterface.OnClickListener() {
                    private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i3) {
                        dialogInterface.cancel();
                    }

                    @Override
                    public final void onClick(DialogInterface dialogInterface, int i3) {
                        $m$0(dialogInterface, i3);
                    }
                });
                builder.create().show();
            }
        } catch (IOException e) {
            Debug.Warning(e);
            new AlertDialog.Builder(getContext()).setMessage(getString(R.string.failed_to_open_picture)).setCancelable(true).setNegativeButton("Dismiss", new DialogInterface.OnClickListener() {
                private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i3) {
                    dialogInterface.cancel();
                }

                @Override
                public final void onClick(DialogInterface dialogInterface, int i3) {
                    $m$0(dialogInterface, i3);
                }
            }).create().show();
        }
    }

    @Override
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater);
        if (folderActionsVisible()) {
            menuInflater.inflate(R.menu.inventory_fragment_menu, menu);
            ImmutableMap.Builder builder = new ImmutableMap.Builder();
            for (int i : folderActionIds) {
                builder.put(Integer.valueOf(i), menu.findItem(i));
            }
            this.folderActionMenuItems = builder.build();
            updateFolderActionItems();
        }
    }

    @Override
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        Debug.Printf("InventoryFragment: onCreateView", new Object[0]);
        View inflate = layoutInflater.inflate(R.layout.inventory_folder, viewGroup, false);
        this.loadableMonitor.setLoadingLayout((LoadingLayout) inflate.findViewById(R.id.loading_layout), getString(R.string.no_folder_selected), getString(R.string.inventory_folder_fail));
        this.adapter = new InventoryFolderAdapter(layoutInflater, false);
        ((ListView) inflate.findViewById(R.id.item_list)).setAdapter((ListAdapter) this.adapter);
        ((ListView) inflate.findViewById(R.id.item_list)).setOnItemClickListener(this.itemClickListener);
        inflate.findViewById(R.id.save_as_button).setOnClickListener(this.saveAsClickListener);
        return inflate;
    }

    @EventHandler
    public void onInventorySortOrderChanged(InventorySortOrderChangedEvent inventorySortOrderChangedEvent) {
        if (isFragmentStarted()) {
            showInventoryList(getInventoryQuery());
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        final SLInventoryEntry folder;
        UserManager userManager = getUserManager();
        InventoryEntryList data = this.entryList.getData();
        if (data != null && userManager != null && (folder = data.getFolder()) != null) {
            SLAgentCircuit data2 = this.agentCircuit.getData();
            switch (menuItem.getItemId()) {
                case R.id.inventory_go_up_item:
                    if (folder.parentUUID != null && (!Objects.equal(folder.parentUUID, UUIDPool.ZeroUUID))) {
                        Debug.Printf("InventoryFragment: navigate up to %s (current is %s)", folder.parentUUID, folder.uuid);
                        navigateToFolder(folder.parentUUID);
                    }
                    return true;
                case R.id.inventory_folder_create_item:
                    this.inventoryFragmentHelper.CreateNewFolder(folder);
                    return true;
                case R.id.inventory_folder_create_landmark:
                    this.inventoryFragmentHelper.CreateNewLandmark(folder);
                    return true;
                case R.id.inventory_folder_create_notecard:
                    getActivity().startActivity(NotecardEditActivity.createIntent(getContext(), userManager.getUserID(), folder.uuid, null, false, null, 0));
                    return true;
                case R.id.inventory_folder_upload_picture:
                    selectPictureForUpload();
                    return true;
                case R.id.inventory_folder_delete_item:
                    this.inventoryFragmentHelper.DeleteInventoryEntry(folder, new Runnable() {
                        private final /* synthetic */ void $m$0() {
                            InventoryFragment.this.m612x3687192d((SLInventoryEntry) folder);
                        }

                        @Override
                        public final void run() {
                            $m$0();
                        }
                    });
                    return true;
                case R.id.inventory_folder_rename_item:
                    this.inventoryFragmentHelper.RenameInventoryEntry(folder);
                    return true;
                case R.id.inventory_folder_share_item:
                    this.inventoryFragmentHelper.ShareInventoryEntry(folder);
                    return true;
                case R.id.inventory_folder_cut_item:
                    userManager.getInventoryManager().copyToClipboard(new InventoryManager.InventoryClipboardEntry(true, folder));
                    Toast.makeText(getContext(), R.string.copied_to_clipboard, Toast.LENGTH_LONG).show();
                    return true;
                case R.id.inventory_folder_copy_item:
                    userManager.getInventoryManager().copyToClipboard(new InventoryManager.InventoryClipboardEntry(false, folder));
                    Toast.makeText(getContext(), R.string.copied_to_clipboard, Toast.LENGTH_LONG).show();
                    return true;
                case R.id.inventory_folder_paste_item:
                    InventoryManager.InventoryClipboardEntry data3 = this.clipboardEntry.getData();
                    if (data3 != null && data2 != null) {
                        if (data3.isCut) {
                            data2.getModules().inventory.MoveInventoryItem(data3.inventoryEntry, folder);
                            userManager.getInventoryManager().copyToClipboard(null);
                        } else {
                            data2.getModules().inventory.CopyInventoryItem(data3.inventoryEntry, folder);
                        }
                    }
                    return true;
                case R.id.inventory_folder_paste_as_link_item:
                    InventoryManager.InventoryClipboardEntry data4 = this.clipboardEntry.getData();
                    if (data4 != null && data2 != null) {
                        data2.getModules().inventory.LinkInventoryItem(folder, data4.inventoryEntry.uuid, data4.inventoryEntry.isFolder ? SLInventoryType.IT_CATEGORY.getTypeCode() : data4.inventoryEntry.invType, data4.inventoryEntry.isFolder ? SLAssetType.AT_LINK_FOLDER.getTypeCode() : SLAssetType.AT_LINK.getTypeCode(), data4.inventoryEntry.name, data4.inventoryEntry.description);
                    }
                    return true;
            }
        }
        return false;
    }

    @Override
    public void onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        updateFolderActionItems();
    }

    @Override
    public void onStart() {
        super.onStart();
        EventBus.getInstance().subscribe(this);
        showInventoryList(getInventoryQuery());
    }

    @Override
    public void onStop() {
        showInventoryList(null);
        EventBus.getInstance().unsubscribe(this);
        super.onStop();
    }

    @Override
    public void setFragmentArgs(Intent intent, Bundle bundle) {
        Debug.Printf("InventoryFragment: setFragmentArgs '%s'", bundle);
        if (bundle != null) {
            getArguments().putAll(bundle);
        }
        if (isFragmentStarted()) {
            showInventoryList(getInventoryQuery());
        }
    }

    void setSearchString(String str) {
        Bundle arguments = getArguments();
        arguments.putBoolean(IS_SEARCHING_KEY, str != null);
        arguments.putString(SEARCH_STRING_KEY, str);
        if (isFragmentStarted()) {
            showInventoryList(getInventoryQuery());
        }
    }
}
