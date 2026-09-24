package com.lumiyaviewer.lumiya.slproto.users.chatsrc;

import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class ChatMessageSourceObject extends ChatMessageSource {
    public final String name;

    @Nonnull
    public final UUID uuid;

    ChatMessageSourceObject(ChatMessage chatMessage) {
        this.uuid = chatMessage.getSenderUUID();
        this.name = chatMessage.getSenderName();
    }

    public ChatMessageSourceObject(@Nonnull UUID uuid, String str) {
        this.uuid = uuid;
        this.name = str;
    }

    @Override
    @Nonnull
    public ChatterID getDefaultChatter(UUID uuid) {
        return ChatterID.getLocalChatterID(uuid);
    }

    @Override
    @Nullable
    public String getSourceName(@Nonnull UserManager userManager) {
        return this.name;
    }

    @Override
    @Nonnull
    public ChatMessageSource.ChatMessageSourceType getSourceType() {
        return ChatMessageSource.ChatMessageSourceType.Object;
    }

    @Override
    @Nullable
    public UUID getSourceUUID() {
        return this.uuid;
    }

    @Override
    public void serializeTo(@Nonnull ChatMessage chatMessage) {
        super.serializeTo(chatMessage);
        chatMessage.setSenderUUID(this.uuid);
        chatMessage.setSenderName(this.name);
    }
}
