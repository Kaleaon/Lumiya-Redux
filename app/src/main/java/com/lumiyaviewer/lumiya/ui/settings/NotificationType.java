package com.lumiyaviewer.lumiya.ui.settings;

import com.google.common.collect.ImmutableList;

public enum NotificationType {
    LocalChat(0, "notify_local_chat", "enableNotifyLocalChat", "soundOnLocalChat", "notifySoundLocalChat", "notifyLEDchatIMs", "notifyLEDColorChatIMs"),
    Private(2, "notify_private_im", "enableNotifyPrivateIM", "soundOnPrivateIM", "notifySoundPrivateIM", "notifyLEDprivateIMs", "notifyLEDColorPrivateIMs"),
    Group(1, "notify_group_messages", "enableNotifyGroupMessage", "soundOnGroupMessage", "notifySoundGroupMessage", "notifyLEDgroupMessages", "notifyLEDColorGroupMessages");

    private String blinkColorKey;
    private String blinkKey;
    private String enableKey;
    private String playSoundKey;
    private String prefScreenKey;
    private int priority;
    private String ringtoneKey;
    public static ImmutableList<NotificationType> VALUES = ImmutableList.copyOf(valuesCustom());
    public static ImmutableList<NotificationType> VALUES_BY_DESCENDING_PRIORITY = ImmutableList.of(Private, Group, LocalChat);

    NotificationType(int priority, String prefScreenKey, String enableKey, String playSoundKey, String ringtoneKey, String blinkKey, String blinkColorKey) {
        this.priority = priority;
        this.prefScreenKey = prefScreenKey;
        this.enableKey = enableKey;
        this.playSoundKey = playSoundKey;
        this.ringtoneKey = ringtoneKey;
        this.blinkKey = blinkKey;
        this.blinkColorKey = blinkColorKey;
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    public static NotificationType[] valuesCustom() {
        return values();
    }

    public String getBlinkColorKey() {
        return this.blinkColorKey;
    }

    public String getBlinkKey() {
        return this.blinkKey;
    }

    public String getEnableKey() {
        return this.enableKey;
    }

    public String getPlaySoundKey() {
        return this.playSoundKey;
    }

    public String getPrefScreenKey() {
        return this.prefScreenKey;
    }

    public int getPriority() {
        return this.priority;
    }

    public String getRingtoneKey() {
        return this.ringtoneKey;
    }
}
