package com.lumiyaviewer.lumiya.ui.settings;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory;
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity;

public class SettingsActivity extends MasterDetailsActivity {
    private final FragmentActivityFactory detailsFragmentFactory = new FragmentActivityFactory() {
        @Override
        public Intent createIntent(Context context, Bundle bundle) {
            return null;
        }

        @Override
        public Class<? extends Fragment> getFragmentClass() {
            return SettingsFragment.class;
        }
    };

    @Override
    protected FragmentActivityFactory getDetailsFragmentFactory() {
        return this.detailsFragmentFactory;
    }

    @Override
    protected Bundle getNewDetailsFragmentArguments(@Nullable Bundle bundle, @Nullable Bundle bundle2) {
        return bundle == null ? SettingsFragment.makeSelection(SettingsPage.PageConnection.getPageResourceId()) : super.getNewDetailsFragmentArguments(bundle, bundle2);
    }

    @Override
    protected boolean handleConnectionEvents() {
        return false;
    }

    @Override
    protected boolean isRootDetailsFragment(Class<? extends Fragment> cls) {
        return cls == SettingsFragment.class;
    }

    @Override
    protected void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setDefaultTitle(getString(R.string.settings_title), null);
    }

    @Override
    protected Fragment onCreateMasterFragment(Intent intent, @Nullable Bundle bundle) {
        return new SettingsSelectionFragment();
    }
}
