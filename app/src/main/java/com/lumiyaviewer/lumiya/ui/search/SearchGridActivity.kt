package com.lumiyaviewer.lumiya.ui.search

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.GroupProfileFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity

class SearchGridActivity : MasterDetailsActivity() {
    // SearchGridActivity never embeds a standalone details fragment outside itself
    // (see MasterDetailsActivity.showDetails); this factory is unreachable in practice.
    private val detailsFragmentFactory = object : FragmentActivityFactory {
        override fun createIntent(context: Context, bundle: Bundle): Intent {
            error("SearchGridActivity's details factory does not create standalone intents")
        }

        override fun getFragmentClass(): Class<out Fragment> = SearchGridFragment::class.java
    }

    override fun getDetailsFragmentFactory(): FragmentActivityFactory = detailsFragmentFactory

    override fun isRootDetailsFragment(cls: Class<out Fragment>): Boolean =
        cls == UserProfileFragment::class.java || cls == GroupProfileFragment::class.java ||
            cls == ParcelInfoFragment::class.java

    override fun onCreateMasterFragment(intent: Intent, bundle: Bundle?): Fragment =
        SearchGridFragment.newInstance(ActivityUtils.getActiveAgentID(intent) ?: error("Agent ID required"))
}
