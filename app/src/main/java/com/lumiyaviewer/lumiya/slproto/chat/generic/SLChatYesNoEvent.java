package com.lumiyaviewer.lumiya.slproto.chat.generic;

import android.view.View;
import android.content.Context;
import androidx.cardview.widget.CardView;
import android.widget.Button;
import android.widget.TextView;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextEvent;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.ChatEventTimestampUpdater;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class SLChatYesNoEvent extends SLChatTextEvent {

    /* renamed from: -com-lumiyaviewer-lumiya-slproto-chat-generic-SLChatYesNoEvent$EventStateSwitchesValues, reason: not valid java name */
    private static /* synthetic */ int[] f74x99a8895a = null;

    @Nonnull
    private EventState eventState;

    public enum EventState {
        EventNew,
        EventAccepted,
        EventCancelled;

        public static final EventState[] VALUES = valuesCustom();

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static EventState[] valuesCustom() {
            return values();
        }
    }

    /* renamed from: -getcom-lumiyaviewer-lumiya-slproto-chat-generic-SLChatYesNoEvent$EventStateSwitchesValues, reason: not valid java name */
    private static /* synthetic */ int[] m167xa6852036() {
        if (f74x99a8895a != null) {
            return f74x99a8895a;
        }
        int[] iArr = new int[EventState.values().length];
        try {
            iArr[EventState.EventAccepted.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[EventState.EventCancelled.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[EventState.EventNew.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
        f74x99a8895a = iArr;
        return iArr;
    }

    public SLChatYesNoEvent(ChatMessage chatMessage, @Nonnull UUID uuid) {
        super(chatMessage, uuid);
        this.eventState = EventState.EventNew;
        this.eventState = EventState.VALUES[chatMessage.getEventState().intValue()];
    }

    public SLChatYesNoEvent(@Nonnull ChatMessageSource chatMessageSource, @Nonnull UUID uuid, ImprovedInstantMessage improvedInstantMessage, String str) {
        super(chatMessageSource, uuid, improvedInstantMessage, str);
        this.eventState = EventState.EventNew;
    }

    public SLChatYesNoEvent(@Nonnull ChatMessageSource chatMessageSource, @Nonnull UUID uuid, String str) {
        super(chatMessageSource, uuid, str);
        this.eventState = EventState.EventNew;
    }

    @Override
    public void bindViewHolder(ChatEventViewHolder chatEventViewHolder, UserManager userManager, @Nullable ChatEventTimestampUpdater chatEventTimestampUpdater) {
        super.bindViewHolder(chatEventViewHolder, userManager, chatEventTimestampUpdater);
        if (chatEventViewHolder instanceof ChatYesNoEventViewHolder) {
            ChatYesNoEventViewHolder chatYesNoEventViewHolder = (ChatYesNoEventViewHolder) chatEventViewHolder;
            chatYesNoEventViewHolder.setEvent(this);
            TextView textView = chatYesNoEventViewHolder.questionMsg;
            Button button = chatYesNoEventViewHolder.yesButton;
            Button button2 = chatYesNoEventViewHolder.noButton;
            CardView cardView = chatYesNoEventViewHolder.cardView;
            switch (m167xa6852036()[this.eventState.ordinal()]) {
                case 1:
                    textView.setText(getYesMessage(textView.getContext()));
                    button.setVisibility(View.GONE);
                    button2.setVisibility(View.GONE);
                    if (getYesMessage(textView.getContext()).equals("")) {
                        textView.setVisibility(View.GONE);
                    } else {
                        textView.setVisibility(View.VISIBLE);
                    }
                    chatYesNoEventViewHolder.makeCardViewDisabled();
                    break;
                case 2:
                    textView.setText(getNoMessage(textView.getContext()));
                    button.setVisibility(View.GONE);
                    button2.setVisibility(View.GONE);
                    if (getNoMessage(textView.getContext()).equals("")) {
                        textView.setVisibility(View.GONE);
                    } else {
                        textView.setVisibility(View.VISIBLE);
                    }
                    chatYesNoEventViewHolder.makeCardViewDisabled();
                    break;
                case 3:
                    textView.setText(getQuestion(textView.getContext()));
                    textView.setVisibility(View.VISIBLE);
                    button.setVisibility(View.VISIBLE);
                    button2.setVisibility(View.VISIBLE);
                    button.setText(getYesButton(button.getContext()));
                    button2.setText(getNoButton(button2.getContext()));
                    chatYesNoEventViewHolder.makeCardViewEnabled();
                    break;
            }
        }
    }

    @Nonnull
    public EventState getEventState() {
        return this.eventState;
    }

    protected abstract String getNoButton(Context context);

    protected abstract String getNoMessage(Context context);

    protected abstract String getQuestion(Context context);

    @Override
    public SLChatEvent.ChatMessageViewType getViewType() {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_YESNO;
    }

    protected abstract String getYesButton(Context context);

    protected abstract String getYesMessage(Context context);

    protected void onNoAction(Context context, UserManager userManager) {
        this.eventState = EventState.EventCancelled;
        notifyEventUpdated(userManager);
    }

    public void onYesAction(Context context, UserManager userManager) {
        this.eventState = EventState.EventAccepted;
        notifyEventUpdated(userManager);
    }

    @Override
    public void serializeToDatabaseObject(@Nonnull ChatMessage chatMessage) {
        super.serializeToDatabaseObject(chatMessage);
        chatMessage.setEventState(Integer.valueOf(this.eventState.ordinal()));
    }
}
