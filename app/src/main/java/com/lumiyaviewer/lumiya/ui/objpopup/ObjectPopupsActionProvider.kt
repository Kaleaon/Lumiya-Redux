package com.lumiyaviewer.lumiya.ui.objpopup

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.core.view.ActionProvider
import com.lumiyaviewer.lumiya.R

class ObjectPopupsActionProvider(context: Context) : ActionProvider(context), View.OnClickListener {
    private var objectPopupCount = 0
    private var objectPopupsClickListener: ObjectPopupsClickListener? = null
    private var popupCountTextView: TextView? = null

    fun interface ObjectPopupsClickListener {
        fun onObjectPopupsClicked()
    }

    override fun isVisible(): Boolean = objectPopupCount != 0

    override fun onClick(view: View) {
        objectPopupsClickListener?.onObjectPopupsClicked()
    }

    override fun onCreateActionView(): View {
        val inflate = LayoutInflater.from(context).inflate(R.layout.object_popups_action_provider, null as ViewGroup?)
        val textView = inflate.findViewById<TextView>(R.id.popupCountTextView)
        popupCountTextView = textView
        textView?.text = objectPopupCount.toString()
        inflate.setOnClickListener(this)
        return inflate
    }

    override fun overridesItemVisibility(): Boolean = true

    fun setObjectPopupCount(objectPopupCount: Int) {
        if (this.objectPopupCount != objectPopupCount) {
            this.objectPopupCount = objectPopupCount
            popupCountTextView?.text = objectPopupCount.toString()
            refreshVisibility()
        }
    }

    fun setObjectPopupsClickListener(objectPopupsClickListener: ObjectPopupsClickListener?) {
        this.objectPopupsClickListener = objectPopupsClickListener
    }
}
