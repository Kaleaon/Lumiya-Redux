package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity

class SettingsActivity : MasterDetailsActivity() {
    private val detailsFragmentFactory = object : FragmentActivityFactory {
        override fun createIntent(context: Context, bundle: Bundle): Intent {
            // This factory only ever embeds SettingsFragment inside SettingsActivity itself
            // (see DetailsActivity.showDetails/showEmbeddedDetails); it is never launched as a
            // standalone external activity, so this path was unreachable in the original Java.
            error("SettingsActivity's details factory does not create standalone intents")
        }

        override fun getFragmentClass(): Class<out Fragment> = SettingsFragment::class.java
    }

    override fun getDetailsFragmentFactory(): FragmentActivityFactory = detailsFragmentFactory

    override fun getNewDetailsFragmentArguments(bundle: Bundle?, bundle2: Bundle?): Bundle {
        return if (bundle == null) {
            SettingsFragment.makeSelection(SettingsPage.PageConnection.getPageResourceId())
        } else {
            super.getNewDetailsFragmentArguments(bundle, bundle2)
        }
    }

    override fun handleConnectionEvents(): Boolean = false

    override fun isRootDetailsFragment(cls: Class<out Fragment>): Boolean = cls == SettingsFragment::class.java

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setDefaultTitle(getString(R.string.settings_title), null)
    }

    override fun onCreateMasterFragment(intent: Intent, bundle: Bundle?): Fragment = SettingsSelectionFragment()
}
