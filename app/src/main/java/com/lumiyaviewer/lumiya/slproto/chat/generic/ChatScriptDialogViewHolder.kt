package com.lumiyaviewer.lumiya.slproto.chat.generic

import android.view.View
import android.widget.Button
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.chat.SLChatScriptDialog
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager

open class ChatScriptDialogViewHolder : ChatEventViewHolder(), View.OnClickListener {
    @JvmStatic private var dialogButtonIds: IntArray = {R.id.buttonDialog1, R.id.buttonDialog2, R.id.buttonDialog3, R.id.buttonDialog4, R.id.buttonDialog5, R.id.buttonDialog6, R.id.buttonDialog7, R.id.buttonDialog8, R.id.buttonDialog9, R.id.buttonDialog10, R.id.buttonDialog11, R.id.buttonDialog12}
    var cardView: CardView = null
    var dialogButtonIgnore: Button = null
    var dialogButtons: Array<Button> = null
    var dialogButtonsLayout: View = null

    private var dialogEvent: SLChatScriptDialog = null
    var dialogResultTextView: TextView = null

    constructor(view: View, adapter: RecyclerView.Adapter) : super(view, adapter) {
        this.dialogResultTextView = view as TextView.findViewById(R.id.dialogResultTextView)
        this.dialogButtonsLayout = view.findViewById(R.id.dialogButtonsLayout)
        this.cardView = view as CardView.findViewById(R.id.chatMessageCardView)
        this.dialogButtons = arrayOfNulls<Button>(dialogButtonIds.length)
        var i: Int = 0
        while (true) {
            var i2: Int = i
            if (i2 >= dialogButtonIds.length) {

            }
            this.dialogButtons[i2] = view as Button.findViewById(dialogButtonIds[i2])
            if (this.dialogButtons[i2] != null) {
                this.dialogButtons[i2].setOnClickListener(this)
            }
            i = i2 + 1
        }
        this.dialogButtonIgnore = view as Button.findViewById(R.id.buttonDialogIgnore)
        if (this.dialogButtonIgnore != null) {
            this.dialogButtonIgnore.setOnClickListener(this)
        }
    }
    fun onClick(view: View) {
        switch (view.getId()) {
            R.id.buttonDialogIgnore ->
                if (this.dialogEvent != null) {
                    this.dialogEvent.onDialogIgnored(UserManager.getUserManager(this.dialogEvent.getAgentUUID()))
                    requestAdapterUpdate()

                }

            else ->
                for (int i = 0; i < dialogButtonIds.length; i++) {
                    if (view.getId() == dialogButtonIds[i]) {
                        if (this.dialogEvent != null) {
                            this.dialogEvent.onDialogButton(UserManager.getUserManager(this.dialogEvent.getAgentUUID()), i)
                            requestAdapterUpdate()

                        }
                    }
                }

        }
    }

    fun setDialogEvent(chatScriptDialog: SLChatScriptDialog) {
        this.dialogEvent = chatScriptDialog
    }
}
