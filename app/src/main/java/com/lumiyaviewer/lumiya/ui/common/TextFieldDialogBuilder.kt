package com.lumiyaviewer.lumiya.ui.common

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.util.TypedValue
import android.widget.EditText
import android.widget.FrameLayout

open class TextFieldDialogBuilder {
    private Context context
    private String title = null
    private String defaultText = ""
    private OnTextEnteredListener listener = null
    private OnTextCancelledListener cancelledListener = null

    interface OnTextCancelledListener {
        fun onTextCancelled()
    }

    interface OnTextEnteredListener {
        fun onTextEntered(str: String)
    }

    constructor(context: Context) {
        this.context = context
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
        AlertDialog.Builder builder = new AlertDialog.Builder(this.context)
        builder.setTitle(this.title)
        EditText editText = EditText(this.context)
        editText.setText(this.defaultText)
        editText.setSingleLine(true)
        FrameLayout frameLayout = FrameLayout(this.context)
        int applyDimension = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 10.0f, this.context.getResources().getDisplayMetrics())
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2)
        layoutParams.leftMargin = applyDimension
        layoutParams.rightMargin = applyDimension
        editText.setLayoutParams(layoutParams)
        frameLayout.addView(editText)
        builder.setView(frameLayout)
        builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                TextFieldDialogBuilder.this.m559x76be5af0(dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {