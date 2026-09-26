package com.lumiyaviewer.lumiya.slproto.chat.generic

import android.animation.AnimatorInflater
import android.animation.AnimatorSet
import android.animation.ObjectAnimator
import android.util.TypedValue
import android.view.View
import android.widget.Button
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatYesNoEvent
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager

open class ChatYesNoEventViewHolder : ChatEventViewHolder(), View.OnClickListener {
    var cardView: CardView = null
    private var cardViewDefaultBackground: Int = 0
    private var cardViewDefaultText: Int = 0
    private var cardViewDisabledBackground: Int = 0
    private var cardViewDisabledText: Int = 0
    private var cardViewFaded: Boolean = false

    private var fadeAnimatorSet: AnimatorSet = null
    var noButton: Button = null
    var questionMsg: TextView = null
    var yesButton: Button = null

    private var yesNoEvent: SLChatYesNoEvent = null

    constructor(view: View, adapter: RecyclerView.Adapter) : super(view, adapter) {
        var typedValue: TypedValue = TypedValue()
        view.getContext().getTheme().resolveAttribute(R.attr.CardViewDefaultBackground, typedValue, true)
        this.cardViewDefaultBackground = typedValue.data
        view.getContext().getTheme().resolveAttribute(R.attr.CardViewDefaultText, typedValue, true)
        this.cardViewDefaultText = typedValue.data
        view.getContext().getTheme().resolveAttribute(R.attr.CardViewDisabledBackground, typedValue, true)
        this.cardViewDisabledBackground = typedValue.data
        view.getContext().getTheme().resolveAttribute(R.attr.CardViewDisabledText, typedValue, true)
        this.cardViewDisabledText = typedValue.data
        this.yesButton = view as Button.findViewById(R.id.buttonYesNoAccept)
        this.noButton = view as Button.findViewById(R.id.buttonYesNoDecline)
        this.questionMsg = view as TextView.findViewById(R.id.yesNoMessageTextView)
        this.cardView = view as CardView.findViewById(R.id.chatMessageCardView)
        this.yesNoEvent = null
        if (this.yesButton != null) {
            this.yesButton.setOnClickListener(this)
        }
        if (this.noButton != null) {
            this.noButton.setOnClickListener(this)
        }
    }

    private fun fadeCardView() {
        if (this.cardViewFaded) {
            return
        }
        if (this.fadeAnimatorSet == null) {
            var objectAnimator: ObjectAnimator = AnimatorInflater as ObjectAnimator.loadAnimator(this.cardView.getContext(), R.animator.cardview_background_fade)
            var animator: ObjectAnimator = AnimatorInflater as ObjectAnimator.loadAnimator(this.cardView.getContext(), R.animator.cardview_text_unfade)
            var clone: ObjectAnimator = animator.clone()
            objectAnimator.setTarget(this.cardView)
            animator.setTarget(this.textView)
            clone.setTarget(this.questionMsg)
            this.fadeAnimatorSet = AnimatorSet()
            this.fadeAnimatorSet.playTogether(objectAnimator, animator, clone)
        }
        this.fadeAnimatorSet.start()
        this.cardViewFaded = true
    }

    fun makeCardViewDisabled() {
        if (this.cardViewFaded) {
            return
        }
        this.cardView.setCardBackgroundColor(this.cardViewDisabledBackground)
        this.questionMsg.setTextColor(this.cardViewDisabledText)
        this.textView.setTextColor(this.cardViewDisabledText)
    }

    fun makeCardViewEnabled() {
        if (this.cardViewFaded) {
            this.cardViewFaded = false
            if (this.fadeAnimatorSet != null) {
                this.fadeAnimatorSet.cancel()
            }
        }
        this.cardView.setCardBackgroundColor(this.cardViewDefaultBackground)
        this.questionMsg.setTextColor(this.cardViewDefaultText)
        this.textView.setTextColor(this.cardViewDefaultText)
    }
    fun onClick(view: View) {
        switch (view.getId()) {
            R.id.buttonYesNoAccept ->
                if (this.yesNoEvent != null && this.yesNoEvent.getEventState() == SLChatYesNoEvent.EventState.EventNew) {
                    fadeCardView()
                    this.yesNoEvent.onYesAction(view.getContext(), UserManager.getUserManager(this.yesNoEvent.getAgentUUID()))

                }

            R.id.buttonYesNoDecline ->
                if (this.yesNoEvent != null && this.yesNoEvent.getEventState() == SLChatYesNoEvent.EventState.EventNew) {
                    fadeCardView()
                    this.yesNoEvent.onNoAction(view.getContext(), UserManager.getUserManager(this.yesNoEvent.getAgentUUID()))

                }

        }
    }

    fun setEvent(chatYesNoEvent: SLChatYesNoEvent) {
        this.yesNoEvent = chatYesNoEvent
    }
}
