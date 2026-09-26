package com.lumiyaviewer.lumiya.ui.myava

import android.os.Bundle
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteType
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.avapicker.AvatarPickerFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import java.util.UUID

class AvatarPickerForMute : AvatarPickerFragment() {

    override fun getTitle(): String = getString(R.string.select_avatar_to_mute)

    override fun onAvatarSelected(chatterID: ChatterID, str: String?) {
        val userManager = ActivityUtils.getUserManager(arguments)
        if (userManager != null) {
            val activeAgentCircuit = userManager.activeAgentCircuit
            if (activeAgentCircuit != null) {
                activeAgentCircuit.modules.muteList.Block(
                    MuteListEntry(MuteType.AGENT, chatterID.optionalChatterUUID, str, 15)
                )
            }
            val activity = activity
            if (activity is DetailsActivity) {
                activity.closeDetailsFragment(this)
            }
        }
    }

    companion object {
        @JvmStatic
        fun makeArguments(uuid: UUID): Bundle {
            val bundle = Bundle()
            ActivityUtils.setActiveAgentID(bundle, uuid)
            return bundle
        }
    }
}
