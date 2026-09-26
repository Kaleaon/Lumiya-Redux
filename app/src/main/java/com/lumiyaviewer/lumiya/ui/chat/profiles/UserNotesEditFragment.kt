package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.AvatarNotesReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.BackButtonHandler
import com.lumiyaviewer.lumiya.ui.common.TextFieldEditFragment
import java.util.UUID

class UserNotesEditFragment : TextFieldEditFragment(), BackButtonHandler {
    private var avatarNotesSubscription: Subscription<UUID, AvatarNotesReply>? = null

    fun onAvatarNotes(avatarNotesReply: AvatarNotesReply) {
        setOriginalText(SLMessage.stringFromVariableUTF(avatarNotesReply.Data_Field.Notes).trim())
    }

    override fun decorateFragmentTitle(title: String): String = getString(R.string.notes_for_title, title)

    override fun getFieldHint(context: Context): String = context.getString(R.string.user_notes_hint)

    override fun onShowUser(chatterID: ChatterID?) {
        avatarNotesSubscription?.unsubscribe()
        avatarNotesSubscription = null
        val userManager = this.userManager
        if (userManager == null || chatterID !is ChatterID.ChatterIDUser) {
            return
        }
        avatarNotesSubscription = userManager.avatarNotes.pool.subscribe(
            chatterID.chatterUUID,
            UIThreadExecutor.getInstance()
        ) { onAvatarNotes(it) }
    }

    override fun saveEditedText(agentCircuit: SLAgentCircuit, chatterID: ChatterID, text: String) {
        agentCircuit.modules.userProfiles.SaveUserNotes(chatterID.optionalChatterUUID, text)
    }
}
