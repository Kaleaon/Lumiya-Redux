package com.lumiyaviewer.lumiya.slproto.users.chatsrc;

import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

class ChatMessageSourceSystem extends ChatMessageSource {
    ChatMessageSourceSystem() {
    }

    @Override
    @Nonnull
    public ChatterID getDefaultChatter(UUID uuid) {
        return ChatterID.getLocalChatterID(uuid);
    }

    @Override
    @Nullable
    public String getSourceName(@Nonnull UserManager userManager) {
        return null;
    }

    @Override
    @Nonnull
    public ChatMessageSource.ChatMessageSourceType getSourceType() {
        return ChatMessageSource.ChatMessageSourceType.System;
    }

    @Override
    @Nullable
    public UUID getSourceUUID() {
        return null;
    }
}
