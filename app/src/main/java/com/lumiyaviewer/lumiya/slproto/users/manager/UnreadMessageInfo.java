package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import javax.annotation.Nullable;

public abstract class UnreadMessageInfo {
    public static UnreadMessageInfo create(int i, @Nullable SLChatEvent chatEvent) {
        return new AutoValue_UnreadMessageInfo(i, chatEvent);
    }

    @Nullable
    public abstract SLChatEvent lastMessage();

    public abstract int unreadCount();
}
