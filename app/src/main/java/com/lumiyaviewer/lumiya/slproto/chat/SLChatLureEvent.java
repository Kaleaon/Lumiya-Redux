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
import com.lumiyaviewer.lumiya.ui.common.TeleportProgressDialog;
import java.util.UUID;
import javax.annotation.Nonnull;

public final class SLChatLureEvent extends SLChatYesNoEvent {
    private final UUID lureID;

    public SLChatLureEvent(ChatMessage chatMessage, @Nonnull UUID uuid) {
        super(chatMessage, uuid);
        this.lureID = chatMessage.getSessionID();
    }

    public SLChatLureEvent(@Nonnull ChatMessageSource chatMessageSource, @Nonnull UUID uuid, ImprovedInstantMessage improvedInstantMessage) {
        super(chatMessageSource, uuid, improvedInstantMessage, null);
        this.lureID = improvedInstantMessage.MessageBlock_Field.ID;
    }

    @Override
    @Nonnull
    protected SLChatEvent.ChatMessageType getMessageType() {
        return SLChatEvent.ChatMessageType.Lure;
    }

    @Override
    public String getNoButton(Context context) {
        return context.getString(R.string.teleport_lure_no);
    }

    @Override
    public String getNoMessage(Context context) {
        return context.getString(R.string.teleport_lure_declined);
    }

    @Override
    public String getQuestion(Context context) {
        return context.getString(R.string.teleport_lure_question);
    }

    @Override
    public String getYesButton(Context context) {
        return context.getString(R.string.teleport_lure_yes);
    }

    @Override
    public String getYesMessage(Context context) {
        return context.getString(R.string.teleport_lure_accepted);
    }

    @Override
    public void onYesAction(Context context, UserManager userManager) {
        super.onYesAction(context, userManager);
        SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit();
        if (activeAgentCircuit != null) {
            new TeleportProgressDialog(context, userManager, R.string.teleporting_progress_message).show();
            activeAgentCircuit.TeleportToLure(this.lureID);
        }
    }

    @Override
    public void serializeToDatabaseObject(@Nonnull ChatMessage chatMessage) {
        super.serializeToDatabaseObject(chatMessage);
        chatMessage.setSessionID(this.lureID);
    }
}
