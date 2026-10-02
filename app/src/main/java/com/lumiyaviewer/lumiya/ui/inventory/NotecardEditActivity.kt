package com.lumiyaviewer.lumiya.ui.inventory

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.os.Bundle
import android.text.Spanned
import android.text.method.ArrowKeyMovementMethod
import android.text.method.LinkMovementMethod
import android.text.method.TextKeyListener
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.widget.EditText
import android.widget.TextView
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.assets.SLNotecard
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetData
import com.lumiyaviewer.lumiya.slproto.users.manager.assets.AssetKey
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.TeleportProgressDialog
import com.lumiyaviewer.lumiya.ui.common.ThemedActivity
import com.lumiyaviewer.lumiya.ui.common.loadmon.Loadable
import com.lumiyaviewer.lumiya.ui.inventory.InventorySaveInfo
import com.lumiyaviewer.lumiya.utils.SimpleStringParser
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.text.DateFormat
import java.util.Arrays
import java.util.Date
import java.util.UUID

open class NotecardEditActivity : ThemedActivity(), SLNotecard.OnAttachmentClickListener, View.OnClickListener {
    private static String INVENTORY_ENTRY_KEY = "inventoryEntry"
    private static String IS_SCRIPT_KEY = "isScript"
    private static int ITEM_FOR_ATTACHMENT_REQUEST = 1
    private static String PARENT_FOLDER_KEY = "parentFolderUUID"
    private static String TASK_LOCAL_ID_KEY = "taskLocalID"
    private static String TASK_UUID_KEY = "taskUUID"
    private MenuItem menuItemNewAttachment
    private String notecardDescription
    private String notecardTitle
    private UserManager userManager
    private UUID parentFolderUUID = null
    private SLInventoryEntry noteEntry = null
    private boolean isEditingScript = false
    private UUID taskUUID = null
    private int taskLocalID = 0
    private SubscriptionData<AssetKey, AssetData> notecardAssetSubscription = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            NotecardEditActivity.this.onNotecardLoaded((AssetData) obj)
        }

        override fun onData(obj: Any) {
                e.printStackTrace()
            }
        }
    }

    private fun saveChanges() {
        boolean z = true
        byte[] bArr = null
        if (!this.editMode || this.notecard == null) {
            return
        }
        String editable = ((EditText) findViewById(R.id.notecardEditTitle)).getText().toString()
        String editable2 = ((EditText) findViewById(R.id.notecardEditDescription)).getText().toString()
        if (this.noteEntry != null) {
            z = !(Objects.equal(editable, this.noteEntry.name) ? Objects.equal(editable2, this.noteEntry.description) : false)
        }
        SLNotecard sLNotecard = SLNotecard(((EditText) findViewById(R.id.notecardEditContents)).getText(), this.isEditingScript)
        byte[] lindenText = sLNotecard.toLindenText()
        if (!Arrays == (lindenText, this.notecard.toLindenText()) || this.noteEntry == null || this.noteEntry.getId() == 0) {
            this.notecard = sLNotecard
            bArr = lindenText
        }
        if (bArr != null || this.noteEntry == null || z) {
            this.notecardTitle = editable
            this.notecardDescription = editable2
            try {
                SLInventory sLInventory = this.agentCircuit.get().getModules().inventory
                this.isSaving = true
                updateButtonsForMode()
                sLInventory.UpdateNotecard(this.noteEntry, this.parentFolderUUID, this.isEditingScript, editable, editable2, bArr, this.taskUUID, this.taskLocalID, SLInventory.OnNotecardUpdatedListener() {
                        NotecardEditActivity.this.m635xf7aea699(sLInventoryEntry, str)
                    }

                    override fun onNotecardUpdated(sLInventoryEntry: SLInventoryEntry, str: String) {
