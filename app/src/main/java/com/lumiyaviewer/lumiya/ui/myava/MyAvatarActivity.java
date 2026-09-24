package com.lumiyaviewer.lumiya.ui.myava;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory;
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity;
import com.lumiyaviewer.lumiya.ui.outfits.OutfitsFragment;
import java.util.UUID;

public class MyAvatarActivity extends MasterDetailsActivity {
    private final FragmentActivityFactory detailsFragmentFactory = new FragmentActivityFactory() {
        @Override
        public Intent createIntent(Context context, Bundle bundle) {
            return null;
        }

        @Override
        public Class<? extends Fragment> getFragmentClass() {
            return MyProfileFragment.class;
        }
    };

    @Override
    protected FragmentActivityFactory getDetailsFragmentFactory() {
        return this.detailsFragmentFactory;
    }

    @Override
    protected Bundle getNewDetailsFragmentArguments(@Nullable Bundle bundle, @Nullable Bundle bundle2) {
        UUID activeAgentID;
        return (bundle != null || (activeAgentID = ActivityUtils.getActiveAgentID(getIntent())) == null) ? super.getNewDetailsFragmentArguments(bundle, bundle2) : MyProfileFragment.makeSelection(ChatterID.getUserChatterID(activeAgentID, activeAgentID));
    }

    @Override
    protected boolean isRootDetailsFragment(Class<? extends Fragment> cls) {
        return cls == MyProfileFragment.class || cls == OutfitsFragment.class || cls == MuteListFragment.class;
    }

    @Override
    protected Fragment onCreateMasterFragment(Intent intent, @Nullable Bundle bundle) {
        return MyAvatarFragment.newInstance(ActivityUtils.getActiveAgentID(intent));
    }
}
