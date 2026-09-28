package com.lumiyaviewer.lumiya.ui.chat

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.lumiyaviewer.lumiya.databinding.GroupNoticeBinding
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.ChatterFragment
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import com.lumiyaviewer.lumiya.ui.inventory.InventoryFragment

class GroupNoticeFragment : ChatterFragment() {
    companion object {
        private const val ATTACHED_ENTRY_KEY = "attachedEntry"
        private const val ITEM_FOR_ATTACH_REQUEST = 1

        @JvmStatic
        fun makeSelection(chatterID: ChatterID?): Bundle = ChatterFragment.makeSelection(chatterID)
    }

    private var binding: GroupNoticeBinding? = null
    private var attachedEntry: SLInventoryEntry? = null

    private fun updateAttachedEntry() {
        Debug.Printf("GroupNotice: current attached entry %s", this.attachedEntry)
        val binding = this.binding
        if (binding != null) {
            val attachedEntry = this.attachedEntry
            if (attachedEntry == null) {
                binding.groupNoticeAttachmentText.setText(R.string.group_notice_no_attachment)
                binding.groupNoticeAttachmentButton.setText(R.string.group_notice_attach)
            } else {
                binding.groupNoticeAttachmentText.text = attachedEntry.name
                binding.groupNoticeAttachmentButton.setText(R.string.group_notice_remove_attachment)
            }
        }
    }

    override fun decorateFragmentTitle(str: String): String {
        return getString(R.string.group_notice_title_format, str)
    }

    override fun onActivityResult(i: Int, i2: Int, intent: Intent?) {
        when (i) {
            1 -> {
                if (i2 == -1 && intent != null && intent.hasExtra(InventoryFragment.SELECTED_INVENTORY_ENTRY)) {
                    this.attachedEntry = intent.getParcelableExtra(InventoryFragment.SELECTED_INVENTORY_ENTRY)
                    Debug.Printf("GroupNotice: new attached entry %s", this.attachedEntry)
                    updateAttachedEntry()
                }
            }
            else -> super.onActivityResult(i, i2, intent)
        }
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup?, bundle: Bundle?): View {
        val binding = GroupNoticeBinding.inflate(layoutInflater, viewGroup, false)
        this.binding = binding
        if (bundle != null) {
            if (bundle.containsKey(ATTACHED_ENTRY_KEY)) {
                this.attachedEntry = bundle.getParcelable(ATTACHED_ENTRY_KEY)
                Debug.Printf("GroupNotice: restored state attached entry %s", this.attachedEntry)
            } else {
                Debug.Printf("GroupNotice: restored state no entry")
            }
        }
        binding.groupNoticeAttachmentButton.setOnClickListener { onGroupNoticeAttachmentButton() }
        binding.groupNoticeSendButton.setOnClickListener { onGroupNoticeSendButton() }
        updateAttachedEntry()
        return binding.root
    }

    override fun onDestroyView() {
        this.binding = null
        super.onDestroyView()
    }

    fun onGroupNoticeAttachmentButton() {
        Debug.Printf("GroupNotice: current attached entry %s", this.attachedEntry)
        if (this.attachedEntry != null) {
            this.attachedEntry = null
            updateAttachedEntry()
        } else if (this.userManager != null) {
            startActivityForResult(InventoryActivity.makeSelectIntent(context, this.userManager!!.getUserID()), ITEM_FOR_ATTACH_REQUEST)
        }
    }

    fun onGroupNoticeSendButton() {
        val userManager = this.userManager
        val chatterID = this.chatterID
        if (userManager == null || chatterID !is ChatterID.ChatterIDGroup) {
            return
        }
        val activeAgentCircuit = userManager.getActiveAgentCircuit() ?: return
        val binding = this.binding ?: return
        activeAgentCircuit.getModules().groupManager.SendGroupNotice(chatterID.getChatterUUID(), binding.groupNoticeSubject.text.toString(), binding.groupNoticeEditText.text.toString(), this.attachedEntry)
        val activity = activity
        if (activity is DetailsActivity) {
            activity.closeDetailsFragment(this)
        }
    }

    override fun onSaveInstanceState(bundle: Bundle) {
        Debug.Printf("GroupNotice: saved state attached entry %s", this.attachedEntry)
        bundle.putParcelable(ATTACHED_ENTRY_KEY, this.attachedEntry)
        super.onSaveInstanceState(bundle)
    }

    override fun onShowUser(chatterID: ChatterID?) {
    }
}
