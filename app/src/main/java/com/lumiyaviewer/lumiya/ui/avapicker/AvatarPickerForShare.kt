package com.lumiyaviewer.lumiya.ui.avapicker

import android.os.Bundle
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.inventory.InventoryFragmentHelper
import java.util.UUID

class AvatarPickerForShare : AvatarPickerFragment() {
    private val inventoryFragmentHelper = InventoryFragmentHelper(this)

    override fun getTitle(): String = getString(R.string.share_with_title)

    override fun onAvatarSelected(chatterID: ChatterID, message: String?) {
        val args = arguments
        if (args == null || !args.containsKey(INVENTORY_ENTRY_KEY)) {
            return
        }
        inventoryFragmentHelper.ConfirmShareInventoryEntry(
            args.getParcelable<SLInventoryEntry>(INVENTORY_ENTRY_KEY),
            chatterID,
            message
        ) {
            val currentActivity = activity
            if (currentActivity is DetailsActivity) {
                currentActivity.closeDetailsFragment(this@AvatarPickerForShare)
            }
        }
    }

    companion object {
        private const val INVENTORY_ENTRY_KEY = "inventoryEntry"

        @JvmStatic
        fun makeArguments(uuid: UUID, inventoryEntry: SLInventoryEntry): Bundle {
            val bundle = Bundle()
            bundle.putString("activeAgentUUID", uuid.toString())
            bundle.putParcelable(INVENTORY_ENTRY_KEY, inventoryEntry)
            return bundle
        }
    }
}
