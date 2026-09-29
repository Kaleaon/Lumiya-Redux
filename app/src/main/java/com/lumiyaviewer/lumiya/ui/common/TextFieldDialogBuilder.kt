package com.lumiyaviewer.lumiya.ui.common

import android.app.AlertDialog
import android.content.Context
import android.util.TypedValue
import android.widget.EditText
import android.widget.FrameLayout

open class TextFieldDialogBuilder(private val context: Context) {
    private var title: String? = null
    private var defaultText: String = ""
    private var listener: OnTextEnteredListener? = null
    private var cancelledListener: OnTextCancelledListener? = null

    interface OnTextCancelledListener {
        fun onTextCancelled()
    }

    interface OnTextEnteredListener {
        fun onTextEntered(str: String)
    }

    open fun setDefaultText(defaultText: String): TextFieldDialogBuilder {
        this.defaultText = defaultText
        return this
    }

    open fun setOnTextCancelledListener(onTextCancelledListener: OnTextCancelledListener): TextFieldDialogBuilder {
        this.cancelledListener = onTextCancelledListener
        return this
    }

    open fun setOnTextEnteredListener(onTextEnteredListener: OnTextEnteredListener): TextFieldDialogBuilder {
        this.listener = onTextEnteredListener
        return this
    }

    open fun setTitle(title: String): TextFieldDialogBuilder {
        this.title = title
        return this
    }

    open fun show() {
        val builder = AlertDialog.Builder(this.context)
        builder.setTitle(this.title)
        val editText = EditText(this.context)
        editText.setText(this.defaultText)
        editText.setSingleLine(true)
        val frameLayout = FrameLayout(this.context)
        val applyDimension = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 10.0f, this.context.resources.displayMetrics).toInt()
        val layoutParams = FrameLayout.LayoutParams(-1, -2)
        layoutParams.leftMargin = applyDimension
        layoutParams.rightMargin = applyDimension
        editText.layoutParams = layoutParams
        frameLayout.addView(editText)
        builder.setView(frameLayout)
        builder.setNegativeButton("Cancel") { dialogInterface, _ ->
            dialogInterface.dismiss()
            cancelledListener?.onTextCancelled()
        }
        builder.setPositiveButton("OK") { dialogInterface, _ ->
            dialogInterface.dismiss()
            listener?.onTextEntered(editText.text.toString())
        }
        builder.create().show()
    }
}
