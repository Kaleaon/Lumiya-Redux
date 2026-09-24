package com.lumiyaviewer.lumiya.slproto.chat;

import android.content.Context;
import com.google.common.base.Strings;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.UUID;
import javax.annotation.Nonnull;

public final class SLChatLureRequestedEvent extends SLChatEvent {
    private final String message;

    public SLChatLureRequestedEvent(ChatMessage chatMessage, @Nonnull UUID uuid) {
        super(chatMessage, uuid);
        this.message = chatMessage.getMessageText();
    }

    public SLChatLureRequestedEvent(String message, @Nonnull UUID uuid) {
        super(ChatMessageSourceUnknown.getInstance(), uuid);
        this.message = message;
    }

    @Override
    @Nonnull
    protected SLChatEvent.ChatMessageType getMessageType() {
        return SLChatEvent.ChatMessageType.LureRequested;
    }

    @Override
    protected String getText(Context context, @Nonnull UserManager userManager) {
        return Strings.isNullOrEmpty(this.message) ? context.getString(R.string.chat_teleport_requested_no_message) : context.getString(R.string.chat_teleport_requested_message, this.message);
    }

    @Override
    public SLChatEvent.ChatMessageViewType getViewType() {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_NORMAL;
    }

    @Override
    protected boolean isActionMessage(@Nonnull UserManager userManager) {
        return false;
    }

    @Override
    public void serializeToDatabaseObject(@Nonnull ChatMessage chatMessage) {
        super.serializeToDatabaseObject(chatMessage);
        chatMessage.setMessageText(this.message);
    }
}
