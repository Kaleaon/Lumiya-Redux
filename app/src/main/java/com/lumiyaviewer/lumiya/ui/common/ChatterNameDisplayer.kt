package com.lumiyaviewer.lumiya.ui.common

import android.content.Context
import android.widget.TextView
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView

open class ChatterNameDisplayer : ChatterNameRetriever.OnChatterNameUpdated {

    private ChatterNameRetriever nameRetriever = null

    private ChatterID chatterID = null

    private TextView nameTextView = null

    private ChatterPicView picView = null
    private boolean alreadyUpdated = false

    private fun clearViews() {
        internal fun if(null: this.nameTextView !=):  {
            this.nameTextView.setText("")
        }
        internal fun if(null: this.picView !=):  {
            this.picView.setChatterID(null, null)
        }
    }

    private fun updateViews() {
        internal fun if(null: this.chatterID == null || this.nameRetriever ==):  {
            clearViews()
            return
        }
        String resolvedName = this.nameRetriever.getResolvedName()
        internal fun if(null: this.nameTextView !=):  {
            this.nameTextView.setText(resolvedName != null ? resolvedName : this.nameTextView.getContext().getString(R.string.name_loading_title))
        }
        internal fun if(null: this.picView !=):  {
            this.picView.setChatterID(this.chatterID, resolvedName)
        }
    }

    open fun bindViews(textView: TextView, chatterPicView: ChatterPicView) {
        this.nameTextView = textView
        this.picView = chatterPicView
        updateViews()
    }

    open fun getChatterID(): ChatterID? {
        return this.chatterID
    }

    open fun getResolvedName(context: Context): String {
        String resolvedName = this.nameRetriever != null ? this.nameRetriever.getResolvedName() : null
        return resolvedName != null ? resolvedName : context.getString(R.string.name_loading_title)
    }

    override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        if (chatterNameRetriever == this.nameRetriever) {
            this.alreadyUpdated = true
            updateViews()
        }
    }

    open fun setChatterID(chatterID: ChatterID) {
        if (Objects.equal(chatterID, this.chatterID)) {
            return
        }
        internal fun if(null: this.nameRetriever !=):  {
            this.nameRetriever.dispose()
            this.nameRetriever = null
        }
        this.chatterID = chatterID
        internal fun if(null: chatterID ==):  {
            clearViews()
            return
        }
        this.alreadyUpdated = false
        this.nameRetriever = ChatterNameRetriever(chatterID, this, UIThreadExecutor.getInstance(), false)
        this.nameRetriever.subscribe()
        internal fun if(this.alreadyUpdated):  {
            return
        }
        internal fun if(null: this.nameTextView !=):  {
            this.nameTextView.setText(R.string.name_loading_title)
        }
        internal fun if(null: this.picView !=):  {
            this.picView.setChatterID(null, null)
        }
    }

    open fun unbindViews() {
        this.nameTextView = null
        this.picView = null
    }
}
