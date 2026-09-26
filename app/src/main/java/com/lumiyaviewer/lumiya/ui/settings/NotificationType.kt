package com.lumiyaviewer.lumiya.ui.settings

import com.google.common.collect.ImmutableList

enum class NotificationType(
    private val priority: Int,
    private val prefScreenKey: String,
    private val enableKey: String,
    private val playSoundKey: String,
    private val ringtoneKey: String,
    private val blinkKey: String,
    private val blinkColorKey: String
) {
    LocalChat(
        0, "notify_local_chat", "enableNotifyLocalChat", "soundOnLocalChat",
        "notifySoundLocalChat", "notifyLEDchatIMs", "notifyLEDColorChatIMs"
    ),
    Private(
        2, "notify_private_im", "enableNotifyPrivateIM", "soundOnPrivateIM",
        "notifySoundPrivateIM", "notifyLEDprivateIMs", "notifyLEDColorPrivateIMs"
    ),
    Group(
        1, "notify_group_messages", "enableNotifyGroupMessage", "soundOnGroupMessage",
        "notifySoundGroupMessage", "notifyLEDgroupMessages", "notifyLEDColorGroupMessages"
    );

    fun getBlinkColorKey(): String = blinkColorKey

    fun getBlinkKey(): String = blinkKey

    fun getEnableKey(): String = enableKey

    fun getPlaySoundKey(): String = playSoundKey

    fun getPrefScreenKey(): String = prefScreenKey

    fun getPriority(): Int = priority

    fun getRingtoneKey(): String = ringtoneKey

    companion object {
        @JvmField
        val VALUES: ImmutableList<NotificationType> = ImmutableList.copyOf(values())

        @JvmField
        val VALUES_BY_DESCENDING_PRIORITY: ImmutableList<NotificationType> = ImmutableList.of(Private, Group, LocalChat)
    }
}
