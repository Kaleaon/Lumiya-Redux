package com.lumiyaviewer.lumiya.ui.search

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.GroupProfileFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity

class SearchGridActivity : MasterDetailsActivity() {
    override fun getDetailsFragmentFactory(): FragmentActivityFactory? = null

    override fun isRootDetailsFragment(cls: Class<out Fragment>): Boolean =
        cls == UserProfileFragment::class.java || cls == GroupProfileFragment::class.java ||
            cls == ParcelInfoFragment::class.java

    override fun onCreateMasterFragment(intent: Intent, bundle: Bundle?): Fragment =
        SearchGridFragment.newInstance(ActivityUtils.getActiveAgentID(intent))
}
