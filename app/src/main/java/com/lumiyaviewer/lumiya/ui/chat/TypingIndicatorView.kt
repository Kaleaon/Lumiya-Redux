package com.lumiyaviewer.lumiya.ui.chat

import android.view.View
import android.content.Context
import android.graphics.drawable.AnimationDrawable
import android.util.AttributeSet
import android.widget.ImageView
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import java.util.UUID

class TypingIndicatorView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0,
    defStyleRes: Int = 0
) : ImageView(context, attributeSet, defStyleAttr, defStyleRes) {

    private var chatterID: ChatterID? = null

    private var subscription: com.lumiyaviewer.lumiya.react.Subscription<UUID, Boolean>? = null

    fun onUserTypingStatus(bool: Boolean?) {
        if (bool == null || this.subscription == null || this.chatterID !is ChatterID.ChatterIDUser) {
            return
        }
        if (bool && visibility != View.VISIBLE) {
            (drawable as AnimationDrawable).start()
        } else if (!bool && visibility == View.VISIBLE) {
            (drawable as AnimationDrawable).stop()
        }
        visibility = if (bool) View.VISIBLE else View.INVISIBLE
    }

    fun setChatterID(chatterID: ChatterID?) {
        if (Objects.equal(chatterID, this.chatterID)) {
            return
        }
        this.chatterID = chatterID
        if (this.subscription != null) {
            this.subscription!!.unsubscribe()
            this.subscription = null
        }
        val userManager = chatterID?.getUserManager()
        if (chatterID is ChatterID.ChatterIDUser && userManager != null) {
            this.subscription = userManager.getChatterList().getUserTypingStatus().subscribe(
                chatterID.getChatterUUID(), UIThreadExecutor.getInstance()
            ) { obj -> onUserTypingStatus(obj) }
        }
        if (this.subscription == null) {
            visibility = View.INVISIBLE
        }
    }
}
