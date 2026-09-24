package com.lumiyaviewer.lumiya.slproto.users.chatsrc;

import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class ChatMessageSource {

    public enum ChatMessageSourceType {
        Unknown,
        System,
        User,
        Group,
        Object;

        public static final ChatMessageSourceType[] VALUES = valuesCustom();

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static ChatMessageSourceType[] valuesCustom() {
            return values();
        }
    }

    @Nonnull
    public static ChatMessageSource loadFrom(@Nonnull ChatMessage chatMessage) {
        switch (ChatMessageSourceType.VALUES[chatMessage.getSenderType().intValue()]) {
            case Group:
                return new ChatMessageSourceGroup(chatMessage);
            case Object:
                return new ChatMessageSourceObject(chatMessage);
            case System:
                return new ChatMessageSourceSystem();
            case Unknown:
                return ChatMessageSourceUnknown.getInstance();
            case User:
                return new ChatMessageSourceUser(chatMessage);
            default:
                throw new IllegalArgumentException("Unknown message type");
        }
    }

    @Nonnull
    public abstract ChatterID getDefaultChatter(UUID uuid);

    @Nullable
    public abstract String getSourceName(@Nonnull UserManager userManager);

    @Nonnull
    public abstract ChatMessageSourceType getSourceType();

    @Nullable
    public abstract UUID getSourceUUID();

    public void serializeTo(@Nonnull ChatMessage chatMessage) {
        chatMessage.setSenderType(Integer.valueOf(getSourceType().ordinal()));
    }
}
