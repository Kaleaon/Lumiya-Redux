package com.lumiyaviewer.lumiya.ui.myava;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.ui.common.binding.Unbinder;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.outfits.OutfitsFragment;
import java.util.UUID;

public class MyAvatarFragment extends FragmentWithTitle implements AdapterView.OnItemClickListener, ChatterNameRetriever.OnChatterNameUpdated {

    TextView myAvatarName;

    ListView myAvatarOptionsList;

    ChatterPicView myAvatarPic;
    private Unbinder unbinder;
    private ChatterNameRetriever myAvatarNameRetriever = null;
    private final SubscriptionData<SubscriptionSingleKey, Integer> myBalance = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            MyAvatarFragment.this.onMyBalance((Integer) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });

    private class MyAvatarPagesAdapter extends ArrayAdapter<MyAvatarDetailsPages> {

        public MyAvatarPagesAdapter(Context context) {
            super(context, android.R.layout.simple_list_item_1, MyAvatarDetailsPages.values());
        }

        @Override
        public View getView(int i, View view, ViewGroup viewGroup) {
            View view2 = super.getView(i, view, viewGroup);
            MyAvatarDetailsPages item = getItem(i);
            if ((view2 instanceof TextView) && item != null) {
                switch (item) {
                    case pageBalance:
                        Integer num = (Integer) MyAvatarFragment.this.myBalance.getData();
                        ((TextView) view2).setText(num != null ? MyAvatarFragment.this.getString(R.string.my_ava_balance_title, num) : MyAvatarFragment.this.getString(R.string.my_ava_balance_unknown));
                        break;
                    default:
                        ((TextView) view2).setText(MyAvatarFragment.this.getString(item.getTitleResource()));
                        break;
                }
            }
            return view2;
        }
    }

    private UUID getAgentUUID() {
        return ActivityUtils.getActiveAgentID(getArguments());
    }

    public static Bundle makeSelection(UUID uuid) {
        Bundle bundle = new Bundle();
        ActivityUtils.setActiveAgentID(bundle, uuid);
        return bundle;
    }

    public static MyAvatarFragment newInstance(UUID uuid) {
        MyAvatarFragment myAvatarFragment = new MyAvatarFragment();
        myAvatarFragment.setArguments(makeSelection(uuid));
        return myAvatarFragment;
    }

    public void onMyBalance(Integer num) {
        if (this.unbinder != null) {
            ListAdapter adapter = this.myAvatarOptionsList.getAdapter();
            if (adapter instanceof MyAvatarPagesAdapter) {
                ((MyAvatarPagesAdapter) adapter).notifyDataSetChanged();
            }
        }
    }

    @Override
    public void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
        String resolvedName = chatterNameRetriever.getResolvedName();
        if (this.unbinder != null) {
            this.myAvatarName.setText(resolvedName != null ? resolvedName : getString(R.string.name_loading_title));
            this.myAvatarPic.setChatterID(chatterNameRetriever.chatterID, resolvedName);
        }
        setTitle(resolvedName, null);
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.my_avatar, viewGroup, false);
        this.unbinder = new MyAvatarFragment_ViewBinding(this, inflate);
        this.myAvatarOptionsList.setAdapter((ListAdapter) new MyAvatarPagesAdapter(viewGroup.getContext()));
        this.myAvatarOptionsList.setOnItemClickListener(this);
        return inflate;
    }

    @Override
    public void onDestroyView() {
        if (this.unbinder != null) {
            this.unbinder.unbind();
            this.unbinder = null;
        }
        super.onDestroyView();
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        UUID agentUUID = getAgentUUID();
        Object itemAtPosition = adapterView.getItemAtPosition(i);
        if (!(itemAtPosition instanceof MyAvatarDetailsPages) || agentUUID == null) {
            return;
        }
        switch (((MyAvatarDetailsPages) itemAtPosition)) {
            case pageBalance:
                DetailsActivity.showEmbeddedDetails(getActivity(), TransactionLogFragment.class, TransactionLogFragment.makeSelection(agentUUID));
                break;
            case pageBlockList:
                DetailsActivity.showEmbeddedDetails(getActivity(), MuteListFragment.class, MuteListFragment.makeSelection(agentUUID));
                break;
            case pageOutfits:
                DetailsActivity.showEmbeddedDetails(getActivity(), OutfitsFragment.class, OutfitsFragment.makeSelection(agentUUID, null));
                break;
            case pageProfile:
                DetailsActivity.showEmbeddedDetails(getActivity(), MyProfileFragment.class, MyProfileFragment.makeSelection(ChatterID.getUserChatterID(agentUUID, agentUUID)));
                break;
        }
    }

    @Override
    public void onStart() {
        super.onStart();
        UUID agentUUID = getAgentUUID();
        UserManager userManager = UserManager.getUserManager(agentUUID);
        if (userManager != null) {
            this.myBalance.subscribe(userManager.getBalanceManager().getBalance(), SubscriptionSingleKey.Value);
        }
        if (agentUUID != null) {
            this.myAvatarNameRetriever = new ChatterNameRetriever(ChatterID.getUserChatterID(agentUUID, agentUUID), this, UIThreadExecutor.getSerialInstance());
        }
    }

    @Override
    public void onStop() {
        if (this.myAvatarNameRetriever != null) {
            this.myAvatarNameRetriever.dispose();
            this.myAvatarNameRetriever = null;
        }
        this.myBalance.unsubscribe();
        super.onStop();
    }
}
