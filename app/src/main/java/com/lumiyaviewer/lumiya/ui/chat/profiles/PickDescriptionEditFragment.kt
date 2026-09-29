package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.content.Context
import android.os.Bundle
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.AvatarPickKey
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.TextFieldEditFragment

class PickDescriptionEditFragment : TextFieldEditFragment() {
    companion object {
        private const val AVATAR_PICK_KEY = "avatarPickKey"

        @JvmStatic
        fun makeSelection(chatterID: ChatterID, avatarPickKey: AvatarPickKey): Bundle {
            val makeSelection = ChatterFragment.makeSelection(chatterID)
            makeSelection.putParcelable(AVATAR_PICK_KEY, avatarPickKey)
            return makeSelection
        }
    }

    private val pickInfo = SubscriptionData<AvatarPickKey, PickInfoReply>(
        UIThreadExecutor.getInstance(),
        onData = { obj -> onPickInfoReply(obj) }
    )

    private fun getPickKey(): AvatarPickKey? {
        val arguments = arguments
        if (arguments == null || !arguments.containsKey(AVATAR_PICK_KEY)) {
            return null
        }
        return arguments.getParcelable(AVATAR_PICK_KEY)
    }

    fun onPickInfoReply(pickInfoReply: PickInfoReply?) {
        if (pickInfoReply != null) {
            setOriginalText(SLMessage.stringFromVariableUTF(pickInfoReply.Data_Field.Desc))
        }
    }

    override fun getFieldHint(context: Context): String {
        return getString(R.string.pick_description_edit_hint)
    }

    override fun onShowUser(chatterID: ChatterID?) {
        val pickKey = getPickKey()
        val userManager = this.userManager
        if (userManager == null || chatterID !is ChatterID.ChatterIDUser || pickKey == null) {
            this.pickInfo.unsubscribe()
        } else {
            this.pickInfo.subscribe(userManager.getAvatarPickInfos().getPool(), pickKey)
        }
    }

    override fun saveEditedText(agentCircuit: SLAgentCircuit, chatterID: ChatterID, str: String) {
        val pickKey = getPickKey()
        val data = this.pickInfo.getData()
        if (pickKey == null || data == null) {
            return
        }
        agentCircuit.getModules().userProfiles.UpdatePickInfo(
            pickKey.pickID, data.Data_Field.CreatorID, data.Data_Field.ParcelID,
            SLMessage.stringFromVariableOEM(data.Data_Field.Name), str, data.Data_Field.SnapshotID,
            data.Data_Field.PosGlobal, data.Data_Field.SortOrder, data.Data_Field.Enabled
        )
    }
}
