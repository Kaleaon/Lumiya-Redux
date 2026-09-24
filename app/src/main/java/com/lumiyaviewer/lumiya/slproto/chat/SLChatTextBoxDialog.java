package com.lumiyaviewer.lumiya.slproto.chat;

import android.view.View;
import android.content.Context;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder;
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatTextBoxViewHolder;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatDialogEvent;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.messages.ScriptDialog;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.ChatEventTimestampUpdater;
import com.lumiyaviewer.lumiya.ui.common.TextFieldDialogBuilder;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public final class SLChatTextBoxDialog extends SLChatDialogEvent {
    private String enteredValue;
    private final int textBoxButtonIndex;

    public SLChatTextBoxDialog(ChatMessage chatMessage, @Nonnull UUID uuid) {
        super(chatMessage, uuid);
        this.enteredValue = null;
        this.textBoxButtonIndex = chatMessage.getTextBoxButtonIndex().intValue();
        this.enteredValue = chatMessage.getDialogSelectedOption();
    }

    public SLChatTextBoxDialog(ScriptDialog scriptDialog, @Nonnull UUID uuid, int i) {
        super(scriptDialog, uuid);
        this.enteredValue = null;
        this.textBoxButtonIndex = i;
    }

    @Override
    public void bindViewHolder(ChatEventViewHolder chatEventViewHolder, UserManager userManager, @Nullable ChatEventTimestampUpdater chatEventTimestampUpdater) {
        super.bindViewHolder(chatEventViewHolder, userManager, chatEventTimestampUpdater);
        if (chatEventViewHolder instanceof ChatTextBoxViewHolder) {
            ChatTextBoxViewHolder chatTextBoxViewHolder = (ChatTextBoxViewHolder) chatEventViewHolder;
            if (this.enteredValue != null || this.ignored) {
                if (this.ignored) {
                    chatTextBoxViewHolder.dialogResultTextView.setText(R.string.dialog_ignored);
                } else {
                    chatTextBoxViewHolder.dialogResultTextView.setText(chatTextBoxViewHolder.dialogResultTextView.getContext().getString(R.string.text_box_entered, this.enteredValue));
                }
                chatTextBoxViewHolder.dialogResultTextView.setVisibility(View.VISIBLE);
                chatTextBoxViewHolder.dialogButtonsLayout.setVisibility(View.GONE);
            } else {
                chatTextBoxViewHolder.dialogResultTextView.setVisibility(View.GONE);
                chatTextBoxViewHolder.dialogButtonsLayout.setVisibility(View.VISIBLE);
            }
            chatTextBoxViewHolder.setTextBoxEvent(this);
        }
    }

    @Override
    @Nonnull
    protected SLChatEvent.ChatMessageType getMessageType() {
        return SLChatEvent.ChatMessageType.TextBoxDialog;
    }

    @Override
    public SLChatEvent.ChatMessageViewType getViewType() {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_TEXTBOX;
    }

    @Override
    public boolean isObjectPopup() {
        return true;
    }

    @Override
    public void onDialogIgnored(UserManager userManager) {
        super.onDialogIgnored(userManager);
        userManager.getObjectPopupsManager().cancelObjectPopup(this);
    }

    public void onEnteredText(UserManager userManager, String str) {
        this.enteredValue = str;
        UUID sourceUUID = this.source.getSourceUUID();
        SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit();
        if (sourceUUID != null && activeAgentCircuit != null) {
            activeAgentCircuit.SendScriptDialogReply(sourceUUID, this.chatChannel, this.textBoxButtonIndex, str);
        }
        userManager.getObjectPopupsManager().cancelObjectPopup(this);
    }

    @Override
    public void serializeToDatabaseObject(@Nonnull ChatMessage chatMessage) {
        super.serializeToDatabaseObject(chatMessage);
        chatMessage.setTextBoxButtonIndex(Integer.valueOf(this.textBoxButtonIndex));
        chatMessage.setDialogSelectedOption(this.enteredValue);
    }

    @Override
    public void showDialog(Context context, final UserManager userManager) {
        new TextFieldDialogBuilder(context).setTitle(this.text).setOnTextEnteredListener(new TextFieldDialogBuilder.OnTextEnteredListener() {
            private final /* synthetic */ void $m$0(String str) {
                SLChatTextBoxDialog.this.onEnteredText((UserManager) userManager, str);
            }

            @Override
            public final void onTextEntered(String str) {
                $m$0(str);
            }
        }).setOnTextCancelledListener(new TextFieldDialogBuilder.OnTextCancelledListener() {
            private final /* synthetic */ void $m$0() {
                SLChatTextBoxDialog.this.onDialogIgnored((UserManager) userManager);
            }

            @Override
            public final void onTextCancelled() {
                $m$0();
            }
        }).show();
    }
}
