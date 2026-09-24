package com.lumiyaviewer.lumiya.ui.objects;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory;
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity;

public class ObjectListNewActivity extends MasterDetailsActivity {

    public static class ObjectDetailsActivityFactory implements FragmentActivityFactory {

        private static class InstanceHolder {
            private static final ObjectDetailsActivityFactory Instance = new ObjectDetailsActivityFactory();

            private InstanceHolder() {
            }
        }

        public static ObjectDetailsActivityFactory getInstance() {
            return InstanceHolder.Instance;
        }

        @Override
        public Intent createIntent(Context context, Bundle bundle) {
            Intent intent = new Intent(context, (Class<?>) ObjectListNewActivity.class);
            intent.putExtra(MasterDetailsActivity.INTENT_SELECTION_KEY, bundle);
            ActivityUtils.setActiveAgentID(intent, ActivityUtils.getActiveAgentID(bundle));
            return intent;
        }

        @Override
        public Class<? extends Fragment> getFragmentClass() {
            return ObjectDetailsFragment.class;
        }
    }

    @Override
    protected FragmentActivityFactory getDetailsFragmentFactory() {
        return ObjectDetailsActivityFactory.getInstance();
    }

    @Override
    protected boolean isRootDetailsFragment(Class<? extends Fragment> cls) {
        if (cls != UserProfileFragment.class) {
            return super.isRootDetailsFragment(cls);
        }
        return true;
    }

    @Override
    protected void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setDefaultTitle(getString(R.string.objects_activity_caption), null);
    }

    @Override
    protected Fragment onCreateMasterFragment(Intent intent, @Nullable Bundle bundle) {
        return ObjectSelectorFragment.newInstance(ActivityUtils.makeFragmentArguments(ActivityUtils.getActiveAgentID(intent), null));
    }
}
