package com.lumiyaviewer.lumiya.slproto.chat;

import android.content.Context;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent;
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.UUID;
import javax.annotation.Nonnull;

public final class SLChatFriendshipOfferedEvent extends SLChatYesNoEvent {
    public final UUID sessionID;

    public SLChatFriendshipOfferedEvent(ChatMessage chatMessage, @Nonnull UUID uuid) {
        super(chatMessage, uuid);
        this.sessionID = chatMessage.getSessionID();
    }

    public SLChatFriendshipOfferedEvent(@Nonnull ChatMessageSource chatMessageSource, @Nonnull UUID uuid, ImprovedInstantMessage improvedInstantMessage) {
        super(chatMessageSource, uuid, improvedInstantMessage, null);
        this.sessionID = improvedInstantMessage.MessageBlock_Field.ID;
    }

    @Override
    @Nonnull
    protected SLChatEvent.ChatMessageType getMessageType() {
        return SLChatEvent.ChatMessageType.FriendshipOffered;
    }

    @Override
    public String getNoButton(Context context) {
        return context.getString(R.string.friendship_request_no);
    }

    @Override
    public String getNoMessage(Context context) {
        return context.getString(R.string.friendship_request_declined);
    }

    @Override
    public String getQuestion(Context context) {
        return context.getString(R.string.friendship_request_question);
    }

    @Override
    public String getYesButton(Context context) {
        return context.getString(R.string.friendship_request_yes);
    }

    @Override
    public String getYesMessage(Context context) {
        return context.getString(R.string.friendship_request_accepted);
    }

    @Override
    public void onYesAction(Context context, UserManager userManager) {
        super.onYesAction(context, userManager);
        UUID sourceUUID = this.source.getSourceUUID();
        SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit();
        if (sourceUUID == null || activeAgentCircuit == null) {
            return;
        }
        activeAgentCircuit.AcceptFriendship(sourceUUID, this.sessionID);
    }

    @Override
    public void serializeToDatabaseObject(@Nonnull ChatMessage chatMessage) {
        super.serializeToDatabaseObject(chatMessage);
        chatMessage.setSessionID(this.sessionID);
    }
}
