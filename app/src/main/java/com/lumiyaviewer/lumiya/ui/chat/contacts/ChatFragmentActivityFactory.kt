package com.lumiyaviewer.lumiya.ui.chat.contacts

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment
import com.lumiyaviewer.lumiya.ui.chat.ChatNewActivity
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.FragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity

class ChatFragmentActivityFactory private constructor() : FragmentActivityFactory {

    // NOTE: FragmentActivityFactory.createIntent declares a non-null Bundle (from an earlier
    // migration batch, not part of this one), even though at least one real caller
    // (GridConnectionService) passes a null selection bundle for a grouped-notification intent.
    // The original Java implementation tolerated null here; matching the interface exactly is
    // required to compile as an override, so this preserves the Java-visible signature rather
    // than silently widening it. See migration report for the flagged follow-up.
    override fun createIntent(context: Context, bundle: Bundle): Intent {
        val intent = Intent(context, ChatNewActivity::class.java)
        intent.putExtra(MasterDetailsActivity.INTENT_SELECTION_KEY, bundle)
        if (bundle.containsKey(ChatterFragment.CHATTER_ID_KEY)) {
            @Suppress("DEPRECATION")
            val chatterID = bundle.getParcelable(ChatterFragment.CHATTER_ID_KEY) as? ChatterID
            if (chatterID != null) {
                ActivityUtils.setActiveAgentID(intent, chatterID.agentUUID)
            }
        }
        return intent
    }

    override fun getFragmentClass(): Class<out Fragment> = ChatFragment::class.java

    companion object {
        private val Instance = ChatFragmentActivityFactory()

        @JvmStatic
        fun getInstance(): ChatFragmentActivityFactory = Instance
    }
}
