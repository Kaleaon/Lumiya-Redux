package com.lumiyaviewer.lumiya.ui.chat

import android.view.View
import android.content.Context
import android.graphics.drawable.AnimationDrawable
import android.util.AttributeSet
import android.widget.ImageView
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import java.util.UUID

open class TypingIndicatorView : ImageView() {

    private ChatterID chatterID

    private Subscription<UUID, Boolean> subscription

    constructor(context: Context) {
        super(context)
        this.chatterID = null
        this.subscription = null
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.chatterID = null
        this.subscription = null
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.chatterID = null
        this.subscription = null
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        super(context, attributeSet, i, i2)
        this.chatterID = null
        this.subscription = null
    }

    open fun onUserTypingStatus(bool: Boolean) {
        if (bool == null || this.subscription == null || !(this.chatterID is ChatterID.ChatterIDUser)) {
            return
        }
        if (bool.booleanValue() && getVisibility() != 0) {
            ((AnimationDrawable) getDrawable()).start()
        } else if (!bool.booleanValue() && getVisibility() == 0) {
            ((AnimationDrawable) getDrawable()).stop()
        }
        setVisibility(bool.booleanValue() ? View.VISIBLE : View.INVISIBLE)
    }

    open fun setChatterID(chatterID: ChatterID) {
        if (Objects.equal(chatterID, this.chatterID)) {
            return
        }
        this.chatterID = chatterID
        internal fun if(null: this.subscription !=):  {
            this.subscription.unsubscribe()
            this.subscription = null
        }
        if ((chatterID is ChatterID.ChatterIDUser) && chatterID.getUserManager() != null) {
            this.subscription = chatterID.getUserManager().getChatterList().getUserTypingStatus().subscribe(((ChatterID.ChatterIDUser) chatterID).getChatterUUID(), UIThreadExecutor.getInstance(), new Subscription.OnData() {
                    TypingIndicatorView.this.onUserTypingStatus((Boolean) obj)
                }

                override fun onData(obj: Any) {