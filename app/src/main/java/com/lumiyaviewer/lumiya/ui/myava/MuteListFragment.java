package com.lumiyaviewer.lumiya.ui.myava;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Toast;
import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.databinding.MuteListBinding;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissListViewTouchListener;
import java.util.UUID;

public class MuteListFragment extends FragmentWithTitle {
    private MuteListAdapter adapter;
    private MuteListBinding binding;
    private final SubscriptionData<SubscriptionSingleKey, ImmutableList<MuteListEntry>> muteListData = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            MuteListFragment.this.onMuteList((ImmutableList) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<UUID, SLAgentCircuit> agentCircuit = new SubscriptionData<>(UIThreadExecutor.getInstance());

    private void askForUnblock(final MuteListEntry muteListEntry) {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setMessage(String.format(getString(R.string.unblock_confirm_message), muteListEntry.name)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                MuteListFragment.this.m661lambda$com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_5870((MuteListEntry) muteListEntry, dialogInterface, i);
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

    public void doUnblock(MuteListEntry muteListEntry) {
        try {
            this.agentCircuit.get().getModules().muteList.Unblock(muteListEntry);
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e);
        }
    }

    public static Bundle makeSelection(UUID uuid) {
        Bundle bundle = new Bundle();
        ActivityUtils.setActiveAgentID(bundle, uuid);
        return bundle;
    }

    public void onMuteList(ImmutableList<MuteListEntry> immutableList) {
        if (this.adapter != null) {
            this.adapter.setData(immutableList);
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_3737, reason: not valid java name */
    /* synthetic */ void m660lambda$com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_3737(AdapterView adapterView, View view, int i, long j) {
        Toast.makeText(getContext(), getString(R.string.mute_list_dismiss_hint), Toast.LENGTH_SHORT).show();
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_5870, reason: not valid java name */
    /* synthetic */ void m661lambda$com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_5870(MuteListEntry muteListEntry, DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
        doUnblock(muteListEntry);
    }

    public void onAddMuteListButtonClick() {
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        FragmentActivity activity = getActivity();
        if (activity == null || userManager == null) {
            return;
        }
        DetailsActivity.showEmbeddedDetails(activity, AvatarPickerForMute.class, AvatarPickerForMute.makeArguments(userManager.getUserID()));
    }

    @Override
    public boolean onContextItemSelected(MenuItem menuItem) {
        MuteListEntry item;
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuItem.getMenuInfo();
        if (adapterContextMenuInfo == null || this.adapter == null || (item = this.adapter.getItem(adapterContextMenuInfo.position)) == null) {
            return false;
        }
        switch (menuItem.getItemId()) {
            case R.id.item_mute_list_delete:
                askForUnblock(item);
                return true;
            default:
                return false;
        }
    }

    @Override
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        binding = MuteListBinding.inflate(layoutInflater, viewGroup, false);
        binding.addMuteListButton.setOnClickListener(v -> onAddMuteListButtonClick());
        this.adapter = new MuteListAdapter(layoutInflater.getContext());
        binding.muteList.setAdapter((ListAdapter) this.adapter);
        SwipeDismissListViewTouchListener swipeDismissListViewTouchListener = new SwipeDismissListViewTouchListener(binding.muteList, new SwipeDismissListViewTouchListener.DismissCallbacks() {
            @Override
            public boolean canDismiss(ListView listView, int i) {
                return true;
            }

            @Override
            public void onDismiss(ListView listView, int i) {
                MuteListEntry item;
                ListAdapter adapter = listView.getAdapter();
                if (!(adapter instanceof MuteListAdapter) || (item = ((MuteListAdapter) adapter).getItem(i)) == null) {
                    return;
                }
                MuteListFragment.this.doUnblock(item);
            }
        });
        binding.muteList.setOnTouchListener(swipeDismissListViewTouchListener);
        binding.muteList.setOnScrollListener(swipeDismissListViewTouchListener.makeScrollListener());
        binding.muteList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            private final /* synthetic */ void $m$0(AdapterView adapterView, View view, int i, long j) {
                MuteListFragment.this.m660lambda$com_lumiyaviewer_lumiya_ui_myava_MuteListFragment_3737(adapterView, view, i, j);
            }

            @Override
            public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
                $m$0(adapterView, view, i, j);
            }
        });
        registerForContextMenu(binding.muteList);
        return binding.getRoot();
    }

    @Override
    public void onDestroyView() {
        binding = null;
        super.onDestroyView();
    }

    @Override
    public void onStart() {
        super.onStart();
        setTitle(getString(R.string.mute_list_fragment_title), null);
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (userManager != null) {
            this.muteListData.subscribe(userManager.muteListPool(), SubscriptionSingleKey.Value);
            this.agentCircuit.subscribe(UserManager.agentCircuits(), userManager.getUserID());
        }
    }

    @Override
    public void onStop() {
        this.muteListData.unsubscribe();
        this.agentCircuit.unsubscribe();
        super.onStop();
    }
}
