package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.content.Context
import android.os.Bundle
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment

class UserAboutTextEditFragment : ProfileTextFieldEditFragment() {
    private var avatarProperties: AvatarPropertiesReply? = null

    private fun isFirstLife(): Boolean = arguments?.getBoolean(IS_FIRST_LIFE_KEY) ?: false

    override fun decorateFragmentTitle(title: String): String = getString(R.string.edit_about_title, title)

    override fun getFieldHint(context: Context): String = getString(R.string.edit_about_hint)

    override fun onAvatarProperties(avatarPropertiesReply: AvatarPropertiesReply) {
        avatarProperties = avatarPropertiesReply
        setOriginalText(
            if (isFirstLife()) {
                SLMessage.stringFromVariableOEM(avatarPropertiesReply.PropertiesData_Field.FLAboutText)
            } else {
                SLMessage.stringFromVariableUTF(avatarPropertiesReply.PropertiesData_Field.AboutText)
            }
        )
    }

    override fun saveEditedText(agentCircuit: SLAgentCircuit, chatterID: ChatterID, text: String) {
        val properties = avatarProperties ?: return
        var aboutText = SLMessage.stringFromVariableUTF(properties.PropertiesData_Field.AboutText)
        var flAboutText = SLMessage.stringFromVariableOEM(properties.PropertiesData_Field.FLAboutText)
        if (isFirstLife()) {
            flAboutText = text
        } else {
            aboutText = text
        }
        agentCircuit.modules.userProfiles.UpdateAvatarProperties(
            properties.PropertiesData_Field.ImageID,
            properties.PropertiesData_Field.FLImageID,
            aboutText,
            flAboutText,
            (properties.PropertiesData_Field.Flags and 1) != 0,
            (properties.PropertiesData_Field.Flags and 2) != 0,
            SLMessage.stringFromVariableOEM(properties.PropertiesData_Field.ProfileURL)
        )
    }

    companion object {
        private const val IS_FIRST_LIFE_KEY = "isFirstLife"

        @JvmStatic
        fun makeSelection(chatterID: ChatterID, isFirstLife: Boolean): Bundle {
            val selection = ChatterFragment.makeSelection(chatterID)
            selection.putBoolean(IS_FIRST_LIFE_KEY, isFirstLife)
            return selection
        }
    }
}
