package com.lumiyaviewer.lumiya.ui.common

import android.content.Intent
import android.os.Bundle
import com.lumiyaviewer.lumiya.slproto.users.ChatterID

abstract class ChatterReloadableFragment : ChatterFragment(), ReloadableFragment {
    @Suppress("DEPRECATION")
    override fun setFragmentArgs(intent: Intent?, bundle: Bundle?) {
        var chatterID = bundle?.getParcelable(CHATTER_ID_KEY) as? ChatterID
        if (chatterID == null) {
            val activeAgentID = ActivityUtils.getActiveAgentID(intent)
            if (activeAgentID != null) {
                chatterID = ChatterID.getLocalChatterID(activeAgentID)
            }
        }
        if (bundle != null) {
            arguments!!.putAll(bundle)
        }
        if (isFragmentStarted()) {
            setNewUser(chatterID)
        }
    }
}
