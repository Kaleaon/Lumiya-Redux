package com.lumiyaviewer.lumiya.ui.inventory

import android.app.AlertDialog
import android.app.ProgressDialog
import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.graphics.Bitmap
import android.net.Uri
import android.os.Bundle
import android.provider.MediaStore
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import android.widget.Toast
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Table
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.ChatMessage
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.orm.InventoryEntryList
import com.lumiyaviewer.lumiya.orm.InventoryQuery
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.chat.SLChatInventoryItemOfferedEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoReply
import com.lumiyaviewer.lumiya.slproto.users.manager.InventoryManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.MasterDetailsActivity
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.ui.inventory.InventoryActivity
import com.lumiyaviewer.lumiya.ui.inventory.InventorySaveInfo
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.IOException
import java.util.Iterator
import java.util.Map
import java.util.UUID

open class InventoryFragment : FragmentWithTitle(), ReloadableFragment {

    private static String FOLDER_ID_KEY = "folderID"
    private static String IS_MASTER_FRAGMENT = "isMasterFragment"
    private static String IS_SEARCHING_KEY = "isSearching"
    private static String SEARCH_STRING_KEY = "searchString"
    public static String SELECTED_INVENTORY_ENTRY = "selectedInventoryEntry"
    private static int[] folderActionIds = {R.id.inventory_go_up_item, R.id.inventory_create_item, R.id.inventory_folder_create_item, R.id.inventory_folder_create_landmark, R.id.inventory_folder_create_notecard, R.id.inventory_folder_upload_picture, R.id.inventory_folder_delete_item, R.id.inventory_folder_rename_item, R.id.inventory_folder_share_item, R.id.inventory_folder_cut_item, R.id.inventory_folder_copy_item, R.id.inventory_folder_paste_item, R.id.inventory_folder_paste_as_link_item}
    private InventoryFragmentHelper inventoryFragmentHelper = InventoryFragmentHelper(this)
    private InventoryFolderAdapter adapter = null
    private InventorySaveInfo saveInfo = null

    private ImmutableMap<Integer, MenuItem> folderActionMenuItems = ImmutableMap.of()
    private SubscriptionData<InventoryQuery, InventoryEntryList> entryList = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            InventoryFragment.this.onInventoryEntryList((InventoryEntryList) obj)
        }

        override fun onData(obj: Any) {
                uuid = sLInventoryEntry.assetUUID
            }
            data.getModules().userProfiles.UpdateAvatarProperties(uuid, uuid2, SLMessage.stringFromVariableUTF(avatarPropertiesReply.PropertiesData_Field.AboutText), SLMessage.stringFromVariableOEM(avatarPropertiesReply.PropertiesData_Field.FLAboutText), (avatarPropertiesReply.PropertiesData_Field.Flags & 1) != 0, (avatarPropertiesReply.PropertiesData_Field.Flags & 2) != 0, SLMessage.stringFromVariableOEM(avatarPropertiesReply.PropertiesData_Field.ProfileURL))
        }
        FragmentActivity activity = getActivity()
        if (activity != null) {
            activity.finish()
        }
    }

    private fun folderActionsVisible(): Boolean {
        if (isMasterFragment()) {
            return !isSplitScreen()
        }
        return true
    }

    private fun forTransferToUUID(): UUID? {
        Intent intent
        String stringExtra
        FragmentActivity activity = getActivity()
        if (activity == null || (intent = activity.getIntent()) == null || (stringExtra = intent.getStringExtra("transferToID")) == null) {
            return null
        }
        return UUIDPool.getUUID(stringExtra)
    }

    private fun getFilterAssetType(): SLAssetType? {
        Intent intent
        SLAssetType byType
        FragmentActivity activity = getActivity()
        if (activity == null || (intent = activity.getIntent()) == null || (byType = SLAssetType.getByType(intent.getIntExtra("selectActionAssetType", SLAssetType.AT_UNKNOWN.getTypeCode()))) == SLAssetType.AT_UNKNOWN) {
            return null
        }
        return byType
    }

    private fun getInventoryQuery(): InventoryQuery {
        Bundle arguments = getArguments()
        UUID uuid = UUIDPool.getUUID(arguments.getString(FOLDER_ID_KEY))
        String string = arguments.getBoolean(IS_SEARCHING_KEY) ? arguments.getString(SEARCH_STRING_KEY) : null
        if (string != null) {
            string = string.trim()
        }
        String emptyToNull = Strings.emptyToNull(string)
        return InventoryQuery.create(emptyToNull != null ? null : uuid, emptyToNull, !isMasterFragment() ? !isSplitScreen() : true, isMasterFragment() ? !isSplitScreen() : true, InventoryFragmentHelper.getSortOrder(getContext()) == 0, getFilterAssetType())
    }

    private fun getSelectAction(): InventoryActivity.SelectAction? {
        Intent intent
        String stringExtra
        FragmentActivity activity = getActivity()
        if (activity == null || (intent = activity.getIntent()) == null || (stringExtra = intent.getStringExtra("selectAction")) == null) {
            return null
        }
        try {
            return InventoryActivity.SelectAction.valueOf(stringExtra)
        } catch (IllegalArgumentException e) {
            return null
        }
    }

    private fun getUserManager(): UserManager? {
        FragmentActivity activity = getActivity()
        if (activity != null) {
            return ActivityUtils.getUserManager(activity.getIntent())
        }
        return null
    }

    private fun isForSelectItem(): Boolean {
        Intent intent
        FragmentActivity activity = getActivity()
        if (activity == null || (intent = activity.getIntent()) == null) {
            return false
        }
        return intent.getBooleanExtra("forSelectItem", false)
    }

    private fun isMasterFragment(): Boolean {
        Bundle arguments = getArguments()
        if (arguments == null || !arguments.containsKey(IS_MASTER_FRAGMENT)) {
            return false
        }
        return arguments.getBoolean(IS_MASTER_FRAGMENT)
    }

    private fun isSplitScreen(): Boolean {
        FragmentActivity activity = getActivity()
        if (activity instanceof MasterDetailsActivity) {
            return ((MasterDetailsActivity) activity).isSplitScreen()
        }
        return false
    }

    @JvmStatic
    fun makeDetailsArguments(bundle: Bundle): Bundle {
        Bundle bundle2 = Bundle()
        bundle2.putString(FOLDER_ID_KEY, bundle.getString(FOLDER_ID_KEY))
        bundle2.putString(SEARCH_STRING_KEY, bundle.getString(SEARCH_STRING_KEY))
        bundle2.putBoolean(IS_SEARCHING_KEY, bundle.getBoolean(IS_SEARCHING_KEY))
        return bundle2
    }

    @JvmStatic
    fun makeSelection(uuid: UUID, str: String): Bundle {
        Bundle bundle = Bundle()
        if (uuid != null) {
            bundle.putString(FOLDER_ID_KEY, uuid.toString())
        }
        bundle.putBoolean(IS_SEARCHING_KEY, str != null)
        bundle.putString(SEARCH_STRING_KEY, str)
        return bundle
    }

    private fun navigateToFolder(uuid: UUID) {
        Bundle arguments = getArguments()
        arguments.putString(FOLDER_ID_KEY, uuid.toString())
        arguments.putBoolean(IS_SEARCHING_KEY, false)
        showInventoryList(getInventoryQuery())
        FragmentActivity activity = getActivity()
        if (activity instanceof InventoryActivity) {
            ((InventoryActivity) activity).clearSearchMode()
        }
    }

    @JvmStatic
    fun newInstance(bundle: Bundle, z: Boolean): Fragment {
        InventoryFragment inventoryFragment = InventoryFragment()
        Bundle bundle2 = Bundle()
        if (bundle != null) {
            bundle2.putAll(bundle)
        }
        bundle2.putBoolean(IS_MASTER_FRAGMENT, z)
        inventoryFragment.setArguments(bundle2)
        return inventoryFragment
    }

    open fun onAgentCircuit(sLAgentCircuit: SLAgentCircuit) {
        updateFolderActionItems()
    }

    open fun onClipboardEntry(inventoryClipboardEntry: InventoryManager.InventoryClipboardEntry) {
        updateFolderActionItems()
    }

    open fun onInventoryEntryList(inventoryEntryList: InventoryEntryList) {
        Debug.Printf("InventoryFragment (%s): onInventoryEntryList: %d entries", this, Integer.valueOf(inventoryEntryList.size()))
        if (isForSelectItem()) {
            InventoryActivity.SelectAction selectAction = getSelectAction()
            if (selectAction != null) {
                setTitle(inventoryEntryList.getTitle(), getString(selectAction.subtitleResourceId))
            } else {
                setTitle(inventoryEntryList.getTitle(), forTransferToUUID() != null ? getString(R.string.select_item_to_share_title) : getString(R.string.select_item_for_attachment_title))
            }
        } else {
            setTitle(inventoryEntryList.getTitle(), null)
        }
        if (this.adapter != null) {
            this.adapter.setData(inventoryEntryList)
        }
        updateLoadingStatus()
        updateFolderActionItems()
    }

    open fun onLoadingStatusChanged(bool: Boolean) {
        updateLoadingStatus()
    }

    open fun onWornAttachmentsChanged(immutableMap: ImmutableMap<UUID, String>) {
        if (this.adapter != null) {
            this.adapter.setWornAttachments(immutableMap)
        }
    }

    open fun onWornWearablesChanged(table: Table<SLWearableType, UUID, SLWearable>) {
        if (this.adapter != null) {
            this.adapter.setWornWearables(table)
        }
    }

    private fun performSelectAction(sLInventoryEntry: SLInventoryEntry, selectAction: InventoryActivity.SelectAction) {
        Intent intent
        Bundle bundle = null
        FragmentActivity activity = getActivity()
        if (activity != null && (intent = activity.getIntent()) != null) {
            bundle = intent.getBundleExtra("selectActionParams")
            Debug.Printf("InventoryAction: actionParams %s, has params %b", bundle, Boolean.valueOf(intent.hasExtra("selectActionParams")))
        }
        if (bundle == null) {
            bundle = Bundle()
        }
        internal fun switch(selectAction):  {
            applyFirstLife -> {
            applyUserProfile -> {
                applyProfilePic(sLInventoryEntry, selectAction == InventoryActivity.SelectAction.applyFirstLife, (AvatarPropertiesReply) bundle.getParcelable("oldProfileData"))
                }
            applyPickImage -> {
                applyPickImage(sLInventoryEntry, (PickInfoReply) bundle.getParcelable("oldPickData"))
                }
        }
    }

    private fun selectPictureForUpload() {
        Intent intent = Intent()
        intent.setType("image/*")
        intent.setAction("android.intent.action.GET_CONTENT")
        startActivityForResult(Intent.createChooser(intent, "Select Picture"), 10)
    }

    private fun shareItem(sLInventoryEntry: SLInventoryEntry, uuid: UUID) {
        Intent intent
        String str = null
        if ((sLInventoryEntry.baseMask & sLInventoryEntry.ownerMask & 8192) == 0) {
            AlertDialog.Builder(getContext()).setMessage(getString(R.string.item_is_no_transfer)).setCancelable(true).setNegativeButton("Dismiss", DialogInterface.OnClickListener() {
                    dialogInterface.cancel()
                }

                override fun onClick(dialogInterface: DialogInterface, i: Int) {

                    override fun run() {
