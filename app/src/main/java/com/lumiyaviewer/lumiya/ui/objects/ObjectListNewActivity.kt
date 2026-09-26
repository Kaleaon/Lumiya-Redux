package com.lumiyaviewer.lumiya.ui.objects

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity

class ObjectListNewActivity : MasterDetailsActivity() {

    class ObjectDetailsActivityFactory private constructor() : FragmentActivityFactory {
        override fun createIntent(context: Context, bundle: Bundle): Intent {
            val intent = Intent(context, ObjectListNewActivity::class.java)
            intent.putExtra(MasterDetailsActivity.INTENT_SELECTION_KEY, bundle)
            ActivityUtils.setActiveAgentID(intent, ActivityUtils.getActiveAgentID(bundle))
            return intent
        }

        override fun getFragmentClass(): Class<out Fragment> = ObjectDetailsFragment::class.java

        companion object {
            @JvmStatic
            val instance = ObjectDetailsActivityFactory()
        }
    }

    override fun getDetailsFragmentFactory(): FragmentActivityFactory = ObjectDetailsActivityFactory.instance

    override fun isRootDetailsFragment(cls: Class<out Fragment>): Boolean {
        return if (cls != UserProfileFragment::class.java) super.isRootDetailsFragment(cls) else true
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        setDefaultTitle(getString(R.string.objects_activity_caption), null)
    }

    override fun onCreateMasterFragment(intent: Intent, bundle: Bundle?): Fragment {
        return ObjectSelectorFragment.newInstance(
            ActivityUtils.makeFragmentArguments(ActivityUtils.getActiveAgentID(intent), null)
        )
    }
}
