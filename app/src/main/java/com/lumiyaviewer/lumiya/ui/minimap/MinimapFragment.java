package com.lumiyaviewer.lumiya.ui.minimap;

import android.os.Bundle;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.modules.SLMinimap;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.minimap.MinimapView;
import java.util.UUID;

public class MinimapFragment extends Fragment implements MinimapView.OnUserClickListener {
    private final SubscriptionData<SubscriptionSingleKey, SLMinimap.MinimapBitmap> minimapBitmap = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            MinimapFragment.this.onMinimapBitmap((SLMinimap.MinimapBitmap) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });
    private final SubscriptionData<SubscriptionSingleKey, SLMinimap.UserLocations> userLocations = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
        private final /* synthetic */ void $m$0(Object obj) {
            MinimapFragment.this.onUserLocations((SLMinimap.UserLocations) obj);
        }

        @Override
        public final void onData(Object obj) {
            $m$0(obj);
        }
    });

    static Fragment newInstance(UUID uuid) {
        MinimapFragment minimapFragment = new MinimapFragment();
        minimapFragment.setArguments(ActivityUtils.makeFragmentArguments(uuid, null));
        return minimapFragment;
    }

    public void onMinimapBitmap(SLMinimap.MinimapBitmap minimapBitmap) {
        View view = getView();
        if (view != null) {
            ((MinimapView) view.findViewById(R.id.minimapView)).setMinimapBitmap(minimapBitmap);
        }
    }

    public void onUserLocations(SLMinimap.UserLocations userLocations) {
        View view = getView();
        if (view != null) {
            ((MinimapView) view.findViewById(R.id.minimapView)).setUserLocations(userLocations);
        }
    }

    @Override
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.minimap_fragment, viewGroup, false);
        ((MinimapView) inflate.findViewById(R.id.minimapView)).setOnUserClickListener(this);
        return inflate;
    }

    @Override
    public void onStart() {
        super.onStart();
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (userManager != null) {
            this.minimapBitmap.subscribe(userManager.getMinimapBitmapPool(), SubscriptionSingleKey.Value);
            this.userLocations.subscribe(userManager.getUserLocationsPool(), SubscriptionSingleKey.Value);
        } else {
            this.minimapBitmap.unsubscribe();
            this.userLocations.unsubscribe();
        }
    }

    @Override
    public void onStop() {
        this.minimapBitmap.unsubscribe();
        this.userLocations.unsubscribe();
        super.onStop();
    }

    @Override
    public void onUserClick(UUID uuid) {
        FragmentManager fragmentManager = getFragmentManager();
        if (fragmentManager != null) {
            Fragment findFragmentById = fragmentManager.findFragmentById(R.id.details);
            if (findFragmentById instanceof NearbyPeopleMinimapFragment) {
                ((NearbyPeopleMinimapFragment) findFragmentById).setSelectedUser(uuid);
            }
        }
        View view = getView();
        if (view != null) {
            ((MinimapView) view.findViewById(R.id.minimapView)).setSelectedUser(uuid);
        }
    }
}
