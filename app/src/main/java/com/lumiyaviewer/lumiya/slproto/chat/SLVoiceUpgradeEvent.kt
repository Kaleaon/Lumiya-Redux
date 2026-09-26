package com.lumiyaviewer.lumiya.slproto.chat

import android.content.Context
import android.content.Intent
import android.net.Uri
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

class SLVoiceUpgradeEvent : SLChatYesNoEvent() {
    private var isInstall: Boolean = false
    private var upgradeURL: String = ""

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.upgradeURL = chatMessage.getItemName()
        this.isInstall = chatMessage.getAssetType() != 0
    }

    constructor(uuid: UUID, str: String, isInstall: Boolean, upgradeURL: String) : super(ChatMessageSourceUnknown.getInstance(), uuid, str) {
        this.upgradeURL = upgradeURL
        this.isInstall = isInstall
    }
    protected fun getMessageType(): SLChatEvent.ChatMessageType {
        return SLChatEvent.ChatMessageType.VoiceUpgrade
    }
    fun getNoButton(context: Context): String {
        return context.getString(R.string.voice_upgrade_no)
    }
    fun getNoMessage(context: Context): String {
        return if (this.isInstall) context.getString(R.string.voice_install_declined) else context.getString(R.string.voice_upgrade_declined)
    }
    fun getQuestion(context: Context): String {
        return if (this.isInstall) context.getString(R.string.install_now_question) else context.getString(R.string.upgrade_now_question)
    }
    fun getText(context: Context, userManager: UserManager): String {
        return this.text
    }
    fun getYesButton(context: Context): String {
        return if (this.isInstall) context.getString(R.string.voice_install_yes) else context.getString(R.string.voice_upgrade_yes)
    }
    fun getYesMessage(context: Context): String {
        return ""
    }
    fun isObjectPopup(): Boolean {
        return false
    }
    protected fun onNoAction(context: Context, userManager: UserManager) {
        super.onNoAction(context, userManager)
        userManager.getObjectPopupsManager().cancelObjectPopup(this)
    }
    fun onYesAction(context: Context, userManager: UserManager) {
        super.onYesAction(context, userManager)
        userManager.getObjectPopupsManager().cancelObjectPopup(this)
        var intent: Intent = Intent("android.intent.action.VIEW")
        intent.setData(Uri.parse(this.upgradeURL))
        context.startActivity(intent)
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setItemName(this.upgradeURL)
        chatMessage.setAssetType(if (this.isInstall) 1 else 0)
    }
}
