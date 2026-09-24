package com.lumiyaviewer.lumiya.slproto.chat;

import android.content.Context;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.UUID;
import javax.annotation.Nonnull;

public final class SLChatGroupInvitationSentEvent extends SLChatEvent {
    public SLChatGroupInvitationSentEvent(ChatMessage chatMessage, @Nonnull UUID uuid) {
        super(chatMessage, uuid);
    }

    public SLChatGroupInvitationSentEvent(@Nonnull ChatMessageSource chatMessageSource, @Nonnull UUID uuid) {
        super(chatMessageSource, uuid);
    }

    @Override
    @Nonnull
    protected SLChatEvent.ChatMessageType getMessageType() {
        return SLChatEvent.ChatMessageType.GroupInvitationSent;
    }

    @Override
    protected String getText(Context context, @Nonnull UserManager userManager) {
        String sourceName = this.source.getSourceName(userManager);
        Object[] objArr = new Object[1];
        if (sourceName == null) {
            sourceName = "(unknown)";
        }
        objArr[0] = sourceName;
        return context.getString(R.string.invitation_sent_text, objArr);
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
    }
}
