package com.lumiyaviewer.lumiya.slproto.chat;

import android.content.Context;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent;
import com.lumiyaviewer.lumiya.slproto.modules.SLModules;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.UUID;
import javax.annotation.Nonnull;

public final class SLMissedVoiceCallEvent extends SLChatYesNoEvent {
    public SLMissedVoiceCallEvent(ChatMessage chatMessage, @Nonnull UUID uuid) {
        super(chatMessage, uuid);
    }

    public SLMissedVoiceCallEvent(@Nonnull ChatMessageSource chatMessageSource, @Nonnull UUID uuid, String str) {
        super(chatMessageSource, uuid, str);
    }

    @Override
    @Nonnull
    protected SLChatEvent.ChatMessageType getMessageType() {
        return SLChatEvent.ChatMessageType.MissedVoiceCall;
    }

    @Override
    public String getNoButton(Context context) {
        return context.getString(R.string.missed_voice_call_no);
    }

    @Override
    public String getNoMessage(Context context) {
        return context.getString(R.string.missed_voice_call_declined);
    }

    @Override
    public String getQuestion(Context context) {
        return context.getString(R.string.missed_voice_call_question);
    }

    @Override
    public String getYesButton(Context context) {
        return context.getString(R.string.missed_voice_call_yes);
    }

    @Override
    public String getYesMessage(Context context) {
        return "";
    }

    @Override
    public void onYesAction(Context context, UserManager userManager) {
        SLModules modules;
        super.onYesAction(context, userManager);
        SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit();
        if (activeAgentCircuit == null || (modules = activeAgentCircuit.getModules()) == null) {
            return;
        }
        modules.voice.userVoiceChatRequest(this.source.getSourceUUID());
    }

    @Override
    public void serializeToDatabaseObject(@Nonnull ChatMessage chatMessage) {
        super.serializeToDatabaseObject(chatMessage);
    }
}
