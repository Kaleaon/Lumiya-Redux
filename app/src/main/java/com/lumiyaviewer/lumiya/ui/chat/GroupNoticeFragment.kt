package com.lumiyaviewer.lumiya.ui.chat

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import com.lumiyaviewer.lumiya.databinding.GroupNoticeBinding
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import com.lumiyaviewer.lumiya.ui.inventory.InventoryFragment

open class GroupNoticeFragment : ChatterFragment() {
    private static String ATTACHED_ENTRY_KEY = "attachedEntry"
    private static int ITEM_FOR_ATTACH_REQUEST = 1

    private GroupNoticeBinding binding
    private SLInventoryEntry attachedEntry = null

    private fun updateAttachedEntry() {
        Debug.Printf("GroupNotice: current attached entry %s", this.attachedEntry)
        internal fun if(null: this.binding !=):  {
            internal fun if(null: this.attachedEntry ==):  {
                this.binding.groupNoticeAttachmentText.setText(R.string.group_notice_no_attachment)
                this.binding.groupNoticeAttachmentButton.setText(R.string.group_notice_attach)
            } else {
                this.binding.groupNoticeAttachmentText.setText(this.attachedEntry.name)
                this.binding.groupNoticeAttachmentButton.setText(R.string.group_notice_remove_attachment)
            }
        }
    }

    override protected fun decorateFragmentTitle(str: String): String {
        fun getString(R.string.group_notice_title_format, str): return
    }

    override fun onActivityResult(i: Int, i2: Int, intent: Intent) {
        internal fun switch(i):  {
            1 -> {
                if (i2 == -1 && intent.hasExtra(InventoryFragment.SELECTED_INVENTORY_ENTRY)) {
                    this.attachedEntry = (SLInventoryEntry) intent.getParcelableExtra(InventoryFragment.SELECTED_INVENTORY_ENTRY)
                    Debug.Printf("GroupNotice: new attached entry %s", this.attachedEntry)
                    updateAttachedEntry()
                    }
                }
                }
            else -> {
                super.onActivityResult(i, i2, intent)
                }
        }
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        this.binding = GroupNoticeBinding.inflate(layoutInflater, viewGroup, false)
        internal fun if(null: bundle !=):  {
            if (bundle.containsKey(ATTACHED_ENTRY_KEY)) {
                this.attachedEntry = (SLInventoryEntry) bundle.getParcelable(ATTACHED_ENTRY_KEY)
                Debug.Printf("GroupNotice: restored state attached entry %s", this.attachedEntry)
            } else {
                Debug.Printf("GroupNotice: restored state no entry", arrayOfNulls<Object>(0])
            }
        }
        this.binding.groupNoticeAttachmentButton.setOnClickListener(v -> onGroupNoticeAttachmentButton())
        this.binding.groupNoticeSendButton.setOnClickListener(v -> onGroupNoticeSendButton())
        updateAttachedEntry()
        return this.binding.getRoot()
    }

    override fun onDestroyView() {
        this.binding = null
        super.onDestroyView()
    }

    open fun onGroupNoticeAttachmentButton() {
        Debug.Printf("GroupNotice: current attached entry %s", this.attachedEntry)
        internal fun if(null: this.attachedEntry !=):  {
            this.attachedEntry = null
            updateAttachedEntry()
        } else if (this.userManager != null) {
            startActivityForResult(InventoryActivity.makeSelectIntent(getContext(), this.userManager.getUserID()), 1)
        }
    }

    open fun onGroupNoticeSendButton() {
        SLAgentCircuit activeAgentCircuit
        if (this.userManager == null || !(this.chatterID is ChatterID.ChatterIDGroup) || (activeAgentCircuit = this.userManager.getActiveAgentCircuit()) == null) {
            return
        }
        activeAgentCircuit.getModules().groupManager.SendGroupNotice(((ChatterID.ChatterIDGroup) this.chatterID).getChatterUUID(), this.binding.groupNoticeSubject.getText().toString(), this.binding.groupNoticeEditText.getText().toString(), this.attachedEntry)
        FragmentActivity activity = getActivity()
        internal fun if(DetailsActivity: activity instanceof):  {
            ((DetailsActivity) activity).closeDetailsFragment(this)
        }
    }

    override fun onSaveInstanceState(bundle: Bundle) {
        Debug.Printf("GroupNotice: saved state attached entry %s", this.attachedEntry)
        internal fun if(null: bundle !=):  {
            bundle.putParcelable(ATTACHED_ENTRY_KEY, this.attachedEntry)
        }
        super.onSaveInstanceState(bundle)
    }

    override protected fun onShowUser(chatterID: ChatterID) {
    }
}
