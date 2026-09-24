package com.lumiyaviewer.lumiya.slproto.chat;

import android.content.Context;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.text.DateFormat;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class SLChatSessionMarkEvent extends SLChatEvent {

    @Nullable
    private final String description;

    @Nonnull
    private final SessionMarkType sessionMarkType;

    public enum SessionMarkType {
        NewSession,
        Teleport;

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static SessionMarkType[] valuesCustom() {
            return values();
        }
    }

    public SLChatSessionMarkEvent(ChatMessage chatMessage, @Nonnull UUID uuid) {
        super(chatMessage, uuid);
        this.sessionMarkType = SessionMarkType.values()[chatMessage.getChatChannel().intValue()];
        this.description = chatMessage.getMessageText();
    }

    public SLChatSessionMarkEvent(ChatMessageSource chatMessageSource, @Nonnull UUID uuid, @Nonnull SessionMarkType sessionMarkType, @Nullable String str) {
        super(chatMessageSource, uuid);
        this.sessionMarkType = sessionMarkType;
        this.description = str;
    }

    @Override
    @Nonnull
    protected SLChatEvent.ChatMessageType getMessageType() {
        return SLChatEvent.ChatMessageType.SessionMark;
    }

    @Override
    protected String getText(Context context, @Nonnull UserManager userManager) {
        return this.sessionMarkType == SessionMarkType.Teleport ? context.getString(R.string.teleport_complete_format, this.description) : context.getString(R.string.new_session_mark_format, DateFormat.getDateTimeInstance(3, 3).format(getTimestamp()));
    }

    @Override
    public SLChatEvent.ChatMessageViewType getViewType() {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_SESSION_MARK;
    }

    @Override
    protected boolean isActionMessage(@Nonnull UserManager userManager) {
        return true;
    }

    @Override
    public void serializeToDatabaseObject(@Nonnull ChatMessage chatMessage) {
        super.serializeToDatabaseObject(chatMessage);
        chatMessage.setMessageText(this.description);
        chatMessage.setChatChannel(Integer.valueOf(this.sessionMarkType.ordinal()));
    }
}
