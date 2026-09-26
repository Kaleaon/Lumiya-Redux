package com.lumiyaviewer.lumiya.ui.chat.profiles

import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.TextFieldEditFragment
import java.util.UUID

abstract class ProfileTextFieldEditFragment : TextFieldEditFragment() {
    private var avatarProperties: Subscription<UUID, AvatarPropertiesReply>? = null

    abstract fun onAvatarProperties(avatarPropertiesReply: AvatarPropertiesReply)

    override fun onShowUser(chatterID: ChatterID?) {
        avatarProperties?.unsubscribe()
        avatarProperties = null
        val manager = userManager
        if (manager == null || chatterID !is ChatterID.ChatterIDUser) {
            return
        }
        avatarProperties = manager.avatarProperties.pool.subscribe(
            chatterID.chatterUUID,
            UIThreadExecutor.getInstance()
        ) { data -> onAvatarProperties(data) }
    }
}
