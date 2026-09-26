package com.lumiyaviewer.lumiya.ui.myava

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity
import com.lumiyaviewer.lumiya.ui.outfits.OutfitsFragment

class MyAvatarActivity : MasterDetailsActivity() {
    private val detailsFragmentFactory = object : FragmentActivityFactory {
        override fun createIntent(context: Context, bundle: Bundle): Intent {
            // This factory only ever embeds MyProfileFragment inside MyAvatarActivity itself
            // (see DetailsActivity.showDetails/showEmbeddedDetails); it is never launched as a
            // standalone external activity, so this path was unreachable in the original Java.
            error("MyAvatarActivity's details factory does not create standalone intents")
        }

        override fun getFragmentClass(): Class<out Fragment> = MyProfileFragment::class.java
    }

    override fun getDetailsFragmentFactory(): FragmentActivityFactory = detailsFragmentFactory

    override fun getNewDetailsFragmentArguments(bundle: Bundle?, bundle2: Bundle?): Bundle {
        if (bundle == null) {
            val activeAgentID = ActivityUtils.getActiveAgentID(intent)
            if (activeAgentID != null) {
                return UserProfileFragment.makeSelection(ChatterID.getUserChatterID(activeAgentID, activeAgentID))
            }
        }
        return super.getNewDetailsFragmentArguments(bundle, bundle2)
    }

    override fun isRootDetailsFragment(cls: Class<out Fragment>): Boolean {
        return cls == MyProfileFragment::class.java || cls == OutfitsFragment::class.java || cls == MuteListFragment::class.java
    }

    override fun onCreateMasterFragment(intent: Intent, bundle: Bundle?): Fragment {
        return MyAvatarFragment.newInstance(ActivityUtils.getActiveAgentID(intent))
    }
}
