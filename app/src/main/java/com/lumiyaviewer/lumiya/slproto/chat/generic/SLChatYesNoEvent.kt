package com.lumiyaviewer.lumiya.slproto.chat.generic

import android.content.Context
import android.view.View
import android.widget.Button
import android.widget.TextView
import androidx.cardview.widget.CardView
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatEventTimestampUpdater
import java.util.UUID

abstract class SLChatYesNoEvent : SLChatTextEvent() {

    private var eventState: EventState = null

    enum class EventState {
        EventNew,
        EventAccepted,
        EventCancelled

        Array<EventState> VALUES = valuesCustom()

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<EventState> {
            return values()
        }
    }

    constructor(chatMessage: ChatMessage, uuid: UUID) : super(chatMessage, uuid) {
        this.eventState = EventState.EventNew
        this.eventState = EventState.VALUES[chatMessage.getEventState()]
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, improvedInstantMessage: ImprovedInstantMessage, str: String) : super(chatMessageSource, uuid, improvedInstantMessage, str) {
        this.eventState = EventState.EventNew
    }

    constructor(chatMessageSource: ChatMessageSource, uuid: UUID, str: String) : super(chatMessageSource, uuid, str) {
        this.eventState = EventState.EventNew
    }
    fun bindViewHolder(chatEventViewHolder: ChatEventViewHolder, userManager: UserManager, chatEventTimestampUpdater: ChatEventTimestampUpdater) {
        super.bindViewHolder(chatEventViewHolder, userManager, chatEventTimestampUpdater)
        if (chatEventViewHolder is ChatYesNoEventViewHolder) {
            var chatYesNoEventViewHolder: ChatYesNoEventViewHolder = chatEventViewHolder as ChatYesNoEventViewHolder
            chatYesNoEventViewHolder.setEvent(this)
            var textView: TextView = chatYesNoEventViewHolder.questionMsg
            var button: Button = chatYesNoEventViewHolder.yesButton
            var noButton: Button = chatYesNoEventViewHolder.noButton
            var cardView: CardView = chatYesNoEventViewHolder.cardView
            when (this.eventState) {
                EventAccepted ->
                    textView.setText(getYesMessage(textView.getContext()))
                    button.setVisibility(View.GONE)
                    noButton.setVisibility(View.GONE)
                    if (getYesMessage(textView.getContext()).equals("")) {
                        textView.setVisibility(View.GONE)
                    } else {
                        textView.setVisibility(View.VISIBLE)
                    }
                    chatYesNoEventViewHolder.makeCardViewDisabled()

                EventCancelled ->
                    textView.setText(getNoMessage(textView.getContext()))
                    button.setVisibility(View.GONE)
                    noButton.setVisibility(View.GONE)
                    if (getNoMessage(textView.getContext()).equals("")) {
                        textView.setVisibility(View.GONE)
                    } else {
                        textView.setVisibility(View.VISIBLE)
                    }
                    chatYesNoEventViewHolder.makeCardViewDisabled()

                EventNew ->
                    textView.setText(getQuestion(textView.getContext()))
                    textView.setVisibility(View.VISIBLE)
                    button.setVisibility(View.VISIBLE)
                    noButton.setVisibility(View.VISIBLE)
                    button.setText(getYesButton(button.getContext()))
                    noButton.setText(getNoButton(noButton.getContext()))
                    chatYesNoEventViewHolder.makeCardViewEnabled()

            }
        }
    }

    fun getEventState(): EventState {
        return this.eventState
    }

    protected abstract String getNoButton(Context context)

    protected abstract String getNoMessage(Context context)

    protected abstract String getQuestion(Context context)
    fun getViewType(): SLChatEvent.ChatMessageViewType {
        return SLChatEvent.ChatMessageViewType.VIEW_TYPE_YESNO
    }

    protected abstract String getYesButton(Context context)

    protected abstract String getYesMessage(Context context)

    protected fun onNoAction(context: Context, userManager: UserManager) {
        this.eventState = EventState.EventCancelled
        notifyEventUpdated(userManager)
    }

    fun onYesAction(context: Context, userManager: UserManager) {
        this.eventState = EventState.EventAccepted
        notifyEventUpdated(userManager)
    }
    fun serializeToDatabaseObject(chatMessage: ChatMessage) {
        super.serializeToDatabaseObjectchatMessag(e)
        chatMessage.setEventState(this.eventState.ordinal())
    }
}
