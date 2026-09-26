package com.lumiyaviewer.lumiya.ui.common

import android.text.Spannable
import android.text.method.LinkMovementMethod
import android.view.KeyEvent
import android.view.MotionEvent
import android.widget.TextView

class LinkMovementMethodSafe : LinkMovementMethod() {
    private var onLinkOpenErrorListener: OnLinkOpenErrorListener? = null

    fun interface OnLinkOpenErrorListener {
        fun OnLinkOpenError(message: String)
    }

    override fun onKeyDown(widget: TextView, buffer: Spannable, keyCode: Int, event: KeyEvent): Boolean {
        return try {
            super.onKeyDown(widget, buffer, keyCode, event)
        } catch (e: Exception) {
            onLinkOpenErrorListener?.OnLinkOpenError("Failed to open selected URL.")
            false
        }
    }

    override fun onKeyUp(widget: TextView, buffer: Spannable, keyCode: Int, event: KeyEvent): Boolean {
        return try {
            super.onKeyUp(widget, buffer, keyCode, event)
        } catch (e: Exception) {
            onLinkOpenErrorListener?.OnLinkOpenError("Failed to open selected URL.")
            false
        }
    }

    override fun onTouchEvent(widget: TextView, buffer: Spannable, event: MotionEvent): Boolean {
        return try {
            super.onTouchEvent(widget, buffer, event)
        } catch (e: Exception) {
            onLinkOpenErrorListener?.OnLinkOpenError("Failed to open selected URL.")
            false
        }
    }

    override fun onTrackballEvent(widget: TextView, buffer: Spannable, event: MotionEvent): Boolean {
        return try {
            super.onTrackballEvent(widget, buffer, event)
        } catch (e: Exception) {
            onLinkOpenErrorListener?.OnLinkOpenError("Failed to open selected URL.")
            false
        }
    }

    fun setOnLinkOpenErrorListener(onLinkOpenErrorListener: OnLinkOpenErrorListener?) {
        this.onLinkOpenErrorListener = onLinkOpenErrorListener
    }
}
