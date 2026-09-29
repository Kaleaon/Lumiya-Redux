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

    private var nameRetriever: ChatterNameRetriever? = null

    private var chatterID: ChatterID? = null

    private var nameTextView: TextView? = null

    private var picView: ChatterPicView? = null
    private var alreadyUpdated = false

    private fun clearViews() {
        if (this.nameTextView != null) {
            this.nameTextView!!.text = ""
        }
        if (this.picView != null) {
            this.picView!!.setChatterID(null, null)
        }
    }

    private fun updateViews() {
        if (this.chatterID == null || this.nameRetriever == null) {
            clearViews()
            return
        }
        val resolvedName = this.nameRetriever!!.getResolvedName()
        if (this.nameTextView != null) {
            this.nameTextView!!.text = resolvedName ?: this.nameTextView!!.context.getString(R.string.name_loading_title)
        }
        if (this.picView != null) {
            this.picView!!.setChatterID(this.chatterID, resolvedName)
        }
    }

    open fun bindViews(textView: TextView?, chatterPicView: ChatterPicView?) {
        this.nameTextView = textView
        this.picView = chatterPicView
        updateViews()
    }

    open fun getChatterID(): ChatterID? {
        return this.chatterID
    }

    open fun getResolvedName(context: Context): String {
        val resolvedName = this.nameRetriever?.getResolvedName()
        return resolvedName ?: context.getString(R.string.name_loading_title)
    }

    override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        if (chatterNameRetriever === this.nameRetriever) {
            this.alreadyUpdated = true
            updateViews()
        }
    }

    open fun setChatterID(chatterID: ChatterID?) {
        if (Objects.equal(chatterID, this.chatterID)) {
            return
        }
        if (this.nameRetriever != null) {
            this.nameRetriever!!.dispose()
            this.nameRetriever = null
        }
        this.chatterID = chatterID
        if (chatterID == null) {
            clearViews()
            return
        }
        this.alreadyUpdated = false
        this.nameRetriever = ChatterNameRetriever(chatterID, this, UIThreadExecutor.getInstance(), false)
        this.nameRetriever!!.subscribe()
        if (this.alreadyUpdated) {
            return
        }
        if (this.nameTextView != null) {
            this.nameTextView!!.setText(R.string.name_loading_title)
        }
        if (this.picView != null) {
            this.picView!!.setChatterID(null, null)
        }
    }

    open fun unbindViews() {
        this.nameTextView = null
        this.picView = null
    }
}
