package com.lumiyaviewer.lumiya.slproto.users.chatsrc

import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

abstract class ChatMessageSource {

    enum class ChatMessageSourceType {
        Unknown,
        System,
        User,
        Group,
        Object

        public static ChatMessageSourceType[] VALUES = valuesCustom()

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<ChatMessageSourceType> {
            return values()
        }
    }

    fun loadFrom(chatMessage: ChatMessage): ChatMessageSource {
        switch (ChatMessageSourceType.VALUES[chatMessage.getSenderType()]) {
            Group ->
                return ChatMessageSourceGroup(chatMessage)
            Object ->
                return ChatMessageSourceObject(chatMessage)
            System ->
                return ChatMessageSourceSystem()
            Unknown ->
                return ChatMessageSourceUnknown.getInstance()
            User ->
                return ChatMessageSourceUser(chatMessage)
            else ->
                throw IllegalArgumentException("Unknown message type")
        }
    }

    public abstract ChatterID getDefaultChatter(UUID uuid)

    public abstract String getSourceName(UserManager userManager)

    public abstract ChatMessageSourceType getSourceType()

    public abstract UUID getSourceUUID()

    fun serializeTo(chatMessage: ChatMessage) {
        chatMessage.setSenderType(getSourceType(.ordinal()))
    }
}
