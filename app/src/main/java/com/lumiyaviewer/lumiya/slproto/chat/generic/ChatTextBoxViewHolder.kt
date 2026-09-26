package com.lumiyaviewer.lumiya.slproto.chat.generic

import android.view.KeyEvent
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextBoxDialog
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager

open class ChatTextBoxViewHolder : ChatEventViewHolder(), View.OnClickListener, View.OnKeyListener, View.OnFocusChangeListener {
    private var dialogButtonIgnore: Button = null
    var dialogButtonsLayout: View = null
    var dialogResultTextView: TextView = null
    private var textBox: EditText = null

    private var textBoxEvent: SLChatTextBoxDialog = null
    private var textBoxSend: Button = null

    constructor(view: View, adapter: RecyclerView.Adapter) : super(view, adapter) {
        this.textBoxEvent = null
        this.dialogResultTextView = view as TextView.findViewById(R.id.dialogResultTextView)
        this.dialogButtonsLayout = view.findViewById(R.id.dialogButtonsLayout)
        this.textBoxSend = view as Button.findViewById(R.id.buttonTextBoxSend)
        this.dialogButtonIgnore = view as Button.findViewById(R.id.buttonDialogIgnore)
        this.textBox = view as EditText.findViewById(R.id.llTextBoxEdit)
        if (this.textBoxSend != null) {
            this.textBoxSend.setOnClickListener(this)
        }
        if (this.dialogButtonIgnore != null) {
            this.dialogButtonIgnore.setOnClickListener(this)
        }
        if (this.textBox != null) {
            this.textBox.setOnKeyListenerthis as this.textBox.setOnFocusChangeListener(this)
        }
    }
    fun onClick(view: View) {
        switch (view.getId()) {
            R.id.buttonDialogIgnore ->
                if (this.textBoxEvent != null) {
                    this.textBoxEvent.onDialogIgnored(UserManager.getUserManager(this.textBoxEvent.getAgentUUID()))
                    requestAdapterUpdate()

                }

            R.id.buttonTextBoxSend ->
                if (this.textBox.getVisibility() != 0) {
                    this.textBox.setVisibility(View.VISIBLE)
                    this.textBox.requestFocus()
                    this.textBoxSend.setText(R.string.textbox_send_caption)

                } else if (this.textBoxEvent != null) {
                    this.textBoxEvent.onEnteredText(UserManager.getUserManager(this.textBoxEvent.getAgentUUID()), this.textBox.getText().toString())
                    requestAdapterUpdate()

                }

        }
    }
    fun onFocusChange(view: View, z: Boolean) {
        if (view != this.textBox || this.textBox == null || z) {
            return
        }
        this.textBox.setVisibility(View.INVISIBLE)
        this.textBoxSend.setText(R.string.textbox_reply_caption)
    }
    fun onKey(view: View, i: Int, keyEvent: KeyEvent): Boolean {
        if (keyEvent.getAction() != 0 || i != 66 || view.getId() != R.id.llTextBoxEdit) {
        return false
        }
        if (this.textBoxEvent == null) {
        return true
        }
        this.textBoxEvent.onEnteredText(UserManager.getUserManager(this.textBoxEvent.getAgentUUID()), this.textBox.getText().toString())
        requestAdapterUpdate()
        return true
    }

    fun setTextBoxEvent(chatTextBoxDialog: SLChatTextBoxDialog) {
        if (this.textBoxEvent != chatTextBoxDialog) {
            this.textBoxEvent = chatTextBoxDialog
            if (this.textBox != null) {
                this.textBox.clearFocus()
                this.textBox.setVisibility(View.INVISIBLE)
                this.textBoxSend.setText(R.string.textbox_reply_caption)
                this.textBox.setText(null as CharSequence)
            }
        }
    }
}
