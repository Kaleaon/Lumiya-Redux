package com.lumiyaviewer.lumiya.ui.objects;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.appcompat.app.AlertDialog;
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
import com.google.common.base.Function;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory;
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry;
import com.lumiyaviewer.lumiya.slproto.inventory.SLTaskInventory;
import com.lumiyaviewer.lumiya.slproto.modules.SLModules;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity;
import com.lumiyaviewer.lumiya.ui.inventory.NotecardEditActivity;
import com.lumiyaviewer.lumiya.ui.objects.TaskInventoryFragment;
import java.util.HashSet;
import java.util.Iterator;
import java.util.UUID;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;

public class TaskInventoryFragment extends FragmentWithTitle {

    private static final String OBJECT_LOCAL_ID_KEY = "objectLocalId";
    private static final String OBJECT_UUID_KEY = "objectUUID";
    private Subscription<Integer, SLObjectProfileData> objectProfileSubscription;

    @Nullable
    private SLTaskInventory taskInventory;
    private Subscription<Integer, SLTaskInventory> taskInventorySubscription;

    @Nullable
    private SLObjectProfileData objectProfileData = null;
    private final Subscription.OnData<SLTaskInventory> onTaskInventoryReceived = new Subscription.OnData<SLTaskInventory>() {
        @Override
        public void onData(SLTaskInventory taskInventory) {
            TaskInventoryFragment.this.taskInventory = taskInventory;
            View view = TaskInventoryFragment.this.getView();
            if (view != null) {
                ListAdapter adapter = ((ListView) view.findViewById(R.id.taskInventoryListView)).getAdapter();
                if (adapter instanceof TaskInventoryListAdapter) {
                    ((TaskInventoryListAdapter) adapter).setData(taskInventory);
                }
                ((TextView) view.findViewById(R.id.taskInventoryEmptyText)).setText(R.string.object_contents_empty);
                view.findViewById(R.id.taskInventoryLoading).setVisibility(View.GONE);
            }
        }
    };
    private final Subscription.OnData<SLObjectProfileData> onObjectProfileData = new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            TaskInventoryFragment.this.m699x1db91107((SLObjectProfileData) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    };

    /* renamed from: com.lumiyaviewer.lumiya.ui.objects.TaskInventoryFragment$2, reason: invalid class name */
    class AnonymousClass2 implements Function<UUID, Void> {
        final /* synthetic */ ProgressDialog val$progressDialog;
        final /* synthetic */ int val$taskID;
        final /* synthetic */ UserManager val$userManager;

        AnonymousClass2(UserManager userManager, int i, ProgressDialog progressDialog) {
            this.val$userManager = userManager;
            this.val$taskID = i;
            this.val$progressDialog = progressDialog;
        }

        @Override
        @Nullable
        public Void apply(@Nullable final UUID uuid) {
            Executor executor = UIThreadExecutor.getInstance();
            final int i = this.val$taskID;
            final UserManager userManager = this.val$userManager;
            final ProgressDialog progressDialog = this.val$progressDialog;
            executor.execute(new Runnable() {
                private final /* synthetic */ void $m$0() {
                    AnonymousClass2.this.m700x9b244ddf((UserManager) userManager, i, (ProgressDialog) progressDialog, (UUID) uuid);
                }

                @Override
                public final void run() {
                    $m$0();
                }
            });
            return null;
        }

        /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment$2_10938, reason: not valid java name */
        /* synthetic */ void m700x9b244ddf(UserManager userManager, int i, ProgressDialog progressDialog, UUID uuid) {
            userManager.getObjectsManager().requestTaskInventoryUpdate(i);
            if (progressDialog.isShowing()) {
                progressDialog.dismiss();
                if (uuid != null) {
                    Debug.Printf("TaskInventory: going to display target folder: %s", uuid);
                    TaskInventoryFragment.this.startActivity(InventoryActivity.makeFolderIntent(TaskInventoryFragment.this.getContext(), userManager.getUserID(), uuid));
                }
            }
        }
    }

    private boolean canModifyObject() {
        UserManager userManager = getUserManager();
        if (this.objectProfileData == null || userManager == null || !userManager.getUserID().equals(this.objectProfileData.ownerUUID())) {
            return false;
        }
        return this.objectProfileData.isModifiable();
    }

    private boolean canModifyObjectContents(SLInventoryEntry inventoryEntry) {
        UserManager userManager = getUserManager();
        if (userManager != null) {
            return userManager.getUserID().equals(inventoryEntry.ownerUUID) ? (inventoryEntry.ownerMask & 16384) != 0 : (inventoryEntry.everyoneMask & 16384) != 0;
        }
        return false;
    }

    private void copyAllToInventory(boolean z) {
        SLAgentCircuit activeAgentCircuit;
        SLModules modules;
        boolean z2;
        boolean z3 = false;
        int objectLocalID = getObjectLocalID();
        UserManager userManager = getUserManager();
        if (this.taskInventory == null || this.objectProfileData == null || userManager == null || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null || (modules = activeAgentCircuit.getModules()) == null) {
            return;
        }
        SLInventory inventory = modules.inventory;
        if (this.taskInventory.entries.size() == 0) {
            return;
        }
        if (!userManager.getUserID().equals(this.objectProfileData.ownerUUID())) {
            Toast.makeText(getActivity(), R.string.object_contents_not_owned, Toast.LENGTH_LONG).show();
            return;
        }
        if (!z) {
            Iterator<SLInventoryEntry> it = this.taskInventory.entries.iterator();
            while (true) {
                z2 = z3;
                if (!it.hasNext()) {
                    break;
                } else {
                    z3 = (it.next().ownerMask & 32768) == 0 ? true : z2;
                }
            }
            if (z2) {
                AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
                builder.setMessage(R.string.object_contents_has_no_copy).setPositiveButton(R.string.object_contents_yes_move, new DialogInterface.OnClickListener() {
                    private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                        TaskInventoryFragment.this.m697x992e5209(dialogInterface, i);
                    }

                    @Override
                    public final void onClick(DialogInterface dialogInterface, int i) {
                        $m$0(dialogInterface, i);
                    }
                }).setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() {
                    private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                        dialogInterface.dismiss();
                    }

                    @Override
                    public final void onClick(DialogInterface dialogInterface, int i) {
                        $m$0(dialogInterface, i);
                    }
                });
                builder.create().show();
                return;
            }
        }
        String or = this.objectProfileData.name().or(getString(R.string.default_object_contents_folder));
        HashSet hashSet = new HashSet();
        Iterator<SLInventoryEntry> iterator = this.taskInventory.entries.iterator();
        while (iterator.hasNext()) {
            hashSet.add(iterator.next().uuid);
        }
        inventory.CopyObjectContents(or, objectLocalID, hashSet, new AnonymousClass2(userManager, objectLocalID, ProgressDialog.show(getContext(), null, getString(R.string.copying_object_contents), true, true)));
    }

    private int getObjectLocalID() {
        return getArguments().getInt(OBJECT_LOCAL_ID_KEY);
    }

    private UUID getObjectUUID() {
        return UUID.fromString(getArguments().getString(OBJECT_UUID_KEY));
    }

    @Nullable
    private UserManager getUserManager() {
        return ActivityUtils.getUserManager(getArguments());
    }

    private void handleObjectClick(int i) {
        SLInventoryEntry item;
        UserManager userManager = getUserManager();
        if (getView() == null || userManager == null) {
            return;
        }
        ListAdapter adapter = ((ListView) getView().findViewById(R.id.taskInventoryListView)).getAdapter();
        if (!(adapter instanceof TaskInventoryListAdapter) || (item = ((TaskInventoryListAdapter) adapter).getItem(i)) == null) {
            return;
        }
        switch (SLAssetType.getByType(item.assetType)) {
            case AT_LSL_TEXT:
                if (canModifyObject() && canModifyObjectContents(item)) {
                    startActivity(NotecardEditActivity.createIntent(getContext(), userManager.getUserID(), null, item, true, getObjectUUID(), getObjectLocalID()));
                    break;
                }
                break;
            case AT_NOTECARD:
                if (canModifyObject() && canModifyObjectContents(item)) {
                    startActivity(NotecardEditActivity.createIntent(getContext(), userManager.getUserID(), null, item, false, getObjectUUID(), getObjectLocalID()));
                    break;
                }
                break;
        }
    }

    public static Bundle makeSelection(UUID uuid, UUID uuid2, int i) {
        Bundle bundle = new Bundle();
        ActivityUtils.setActiveAgentID(bundle, uuid);
        if (uuid2 != null) {
            bundle.putString(OBJECT_UUID_KEY, uuid2.toString());
        }
        bundle.putInt(OBJECT_LOCAL_ID_KEY, i);
        return bundle;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment_10017, reason: not valid java name */
    /* synthetic */ void m697x992e5209(DialogInterface dialogInterface, int i) {
        copyAllToInventory(true);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment_3527, reason: not valid java name */
    /* synthetic */ void m698x1db827b5(AdapterView adapterView, View view, int i, long j) {
        handleObjectClick(i);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment_5570, reason: not valid java name */
    /* synthetic */ void m699x1db91107(SLObjectProfileData objectProfileData) {
        this.objectProfileData = objectProfileData;
        if (this.objectProfileData.name().isPresent()) {
            setTitle(getString(R.string.object_contents_title), this.objectProfileData.name().or(getString(R.string.object_name_loading)));
        }
    }

    @Override
    public void onCreate(@androidx.annotation.Nullable Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater);
        menuInflater.inflate(R.menu.task_inventory_menu, menu);
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.task_inventory, viewGroup, false);
        ((ListView) inflate.findViewById(R.id.taskInventoryListView)).setAdapter((ListAdapter) new TaskInventoryListAdapter(layoutInflater.getContext()));
        ((ListView) inflate.findViewById(R.id.taskInventoryListView)).setEmptyView(inflate.findViewById(android.R.id.empty));
        ((ListView) inflate.findViewById(R.id.taskInventoryListView)).setOnItemClickListener(new AdapterView.OnItemClickListener() {
            private final /* synthetic */ void $m$0(AdapterView adapterView, View view, int i, long j) {
                TaskInventoryFragment.this.m698x1db827b5(adapterView, view, i, j);
            }

            @Override
            public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
                $m$0(adapterView, view, i, j);
            }
        });
        return inflate;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.item_copy_all:
                copyAllToInventory(false);
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    @Override
    public void onStart() {
        super.onStart();
        setTitle(getString(R.string.object_contents_title), null);
        UserManager userManager = getUserManager();
        if (userManager != null) {
            int objectLocalID = getObjectLocalID();
            this.taskInventorySubscription = userManager.getObjectsManager().getObjectTaskInventory().subscribe(Integer.valueOf(objectLocalID), UIThreadExecutor.getInstance(), this.onTaskInventoryReceived);
            this.objectProfileSubscription = userManager.getObjectsManager().getObjectProfile().subscribe(Integer.valueOf(objectLocalID), UIThreadExecutor.getInstance(), this.onObjectProfileData);
        }
    }

    @Override
    public void onStop() {
        if (this.taskInventorySubscription != null) {
            this.taskInventorySubscription.unsubscribe();
            this.taskInventorySubscription = null;
        }
        if (this.objectProfileSubscription != null) {
            this.objectProfileSubscription.unsubscribe();
            this.objectProfileSubscription = null;
        }
        super.onStop();
    }
}
