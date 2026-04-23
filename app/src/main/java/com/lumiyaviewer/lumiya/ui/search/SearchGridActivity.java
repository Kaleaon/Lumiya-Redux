package com.lumiyaviewer.lumiya.ui.search;

import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.lumiyaviewer.lumiya.ui.chat.profiles.GroupProfileFragment;
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory;
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity;

/* loaded from: classes.dex */
public class SearchGridActivity extends MasterDetailsActivity {
    @Override // com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity
    protected FragmentActivityFactory getDetailsFragmentFactory() {
        return null;
    }

    @Override // com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity, com.lumiyaviewer.lumiya.ui.common.DetailsActivity
    protected boolean isRootDetailsFragment(Class<? extends Fragment> cls) {
        return cls == UserProfileFragment.class || cls == GroupProfileFragment.class || cls == ParcelInfoFragment.class;
    }

    @Override // com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity
    protected Fragment onCreateMasterFragment(Intent intent, @Nullable Bundle bundle) {
        return SearchGridFragment.newInstance(ActivityUtils.getActiveAgentID(intent));
    }
}
