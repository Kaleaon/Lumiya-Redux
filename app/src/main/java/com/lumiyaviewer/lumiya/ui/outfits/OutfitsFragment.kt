package com.lumiyaviewer.lumiya.ui.outfits

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ImageView
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import com.google.common.base.Objects
import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Table
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.orm.InventoryDB
import com.lumiyaviewer.lumiya.orm.InventoryEntryList
import com.lumiyaviewer.lumiya.orm.InventoryQuery
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.ui.inventory.InventoryFolderAdapter
import com.lumiyaviewer.lumiya.ui.inventory.InventoryFragmentHelper
import com.lumiyaviewer.lumiya.ui.inventory.InventorySortOrderChangedEvent
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class OutfitsFragment : FragmentWithTitle(), ReloadableFragment, View.OnClickListener, InventoryFolderAdapter.OnItemCheckboxClickListener {
    private static String FOLDER_ID_KEY = "folderID"
    private ViewGroup listHeader
    private InventoryFolderAdapter adapter = null
    private UUID myOutfitsFolderUUID = null
    private SubscriptionData<InventoryQuery, InventoryEntryList> entryList = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            OutfitsFragment.this.onInventoryEntryList((InventoryEntryList) obj)
        }

        override fun onData(obj: Any) {
        }
        agentCircuit.getModules().avatarAppearance.ChangeOutfit(builder.build(), z, data.getFolder())
    }

    private fun getFolderUUID(): UUID? {
        Bundle arguments = getArguments()
        return UUIDPool.getUUID(arguments != null ? arguments.getString(FOLDER_ID_KEY) : null)
    }

    private fun getInventoryQuery(uuid: UUID): InventoryQuery {
        return InventoryQuery.create(uuid, (String) null, true, true, InventoryFragmentHelper.getSortOrder(getContext()) == 0, (SLAssetType) null)
    }

    private fun getUserManager(): UserManager? {
        return ActivityUtils.getUserManager(getArguments())
    }

    @JvmStatic
    fun makeSelection(uuid: UUID, uuid2: UUID): Bundle {
        Bundle bundle = Bundle()
        ActivityUtils.setActiveAgentID(bundle, uuid)
        if (uuid2 != null) {
            bundle.putString(FOLDER_ID_KEY, uuid2.toString())
        }
        return bundle
    }

    private fun navigateToFolder(uuid: UUID) {
        getArguments().putString(FOLDER_ID_KEY, uuid.toString())
        showInventoryList(uuid)
    }

    open fun onAgentCircuit(agentCircuit: SLAgentCircuit) {
        if (this.adapter != null) {
            this.adapter.setAvatarAppearance(agentCircuit != null ? agentCircuit.getModules().avatarAppearance : null)
        }
    }

    open fun onInventoryEntryList(inventoryEntryList: InventoryEntryList) {
        Debug.Printf("InventoryFragment (%s): onInventoryEntryList: %d entries", this, Integer.valueOf(inventoryEntryList.size()))
        setTitle(inventoryEntryList.getTitle(), null)
        if (this.adapter != null) {
            this.adapter.setData(inventoryEntryList)
        }
        updateLoadingStatus()
    }

    open fun onLoadingStatusChanged(bool: Boolean) {
        updateLoadingStatus()
    }

    open fun onRootFolderEntryList(inventoryEntryList: InventoryEntryList) {
        if (inventoryEntryList != null) {
            for (inventoryEntry in inventoryEntryList) {
                if (inventoryEntry.isFolder && inventoryEntry.typeDefault == 48) {
                    this.myOutfitsFolderUUID = inventoryEntry.uuid
                    this.rootFolderEntryList.unsubscribe()
                    if (getFolderUUID() == null) {
                        showInventoryList(getFolderUUID())
                        return
                    }
                    return
                }
            }
        }
    }

    open fun onWornAttachmentsChanged(immutableMap: ImmutableMap<UUID, String>) {
        if (this.adapter != null) {
            this.adapter.setWornAttachments(immutableMap)
        }
    }

    open fun onWornOutfitFolder(uuid: UUID) {
        if (this.adapter != null) {
            this.adapter.setWornOutfitFolder(uuid)
        }
    }

    open fun onWornWearablesChanged(table: Table<SLWearableType, UUID, SLWearable>) {
        if (this.adapter != null) {
            this.adapter.setWornWearables(table)
        }
    }

    private fun showInventoryList(uuid: UUID) {
        UUID rootFolder
        Debug.Printf("OutfitsNewFragment (%s): showInventoryList '%s'", this, uuid)
        View view = getView()
        this.entryList.unsubscribe()
        this.agentCircuit.unsubscribe()
        this.folderLoading.unsubscribe()
        this.rootFolderEntryList.unsubscribe()
        UserManager userManager = getUserManager()
        if (userManager != null) {
            InventoryDB database = userManager.getInventoryManager().getDatabase()
            this.wornAttachments.subscribe(userManager.getWornAttachmentsPool(), SubscriptionSingleKey.Value)
            this.wornWearables.subscribe(userManager.getWornWearablesPool(), SubscriptionSingleKey.Value)
            this.wornOutfitFolder.subscribe(userManager.wornOutfitLink(), SubscriptionSingleKey.Value)
            this.agentCircuit.subscribe(UserManager.agentCircuits(), userManager.getUserID())
            if (uuid == null) {
                uuid = this.myOutfitsFolderUUID
            }
            Debug.Printf("After checking myoutfits: %s", uuid)
            if (uuid == null && (rootFolder = userManager.getInventoryManager().getRootFolder()) != null) {
                SLInventoryEntry findSpecialFolder = database.findSpecialFolder(rootFolder, 48)
                if (findSpecialFolder != null) {
                    this.myOutfitsFolderUUID = findSpecialFolder.uuid
                    uuid = findSpecialFolder.uuid
                    Debug.Printf("Found special folder: %s", uuid)
                } else {
                    Debug.Printf("Special folder not found", arrayOfNulls<Object>(0])
                }
            }
            if (uuid != null) {
                this.folderLoading.subscribe(userManager.getInventoryManager().getFolderLoading(), uuid)
                this.entryList.subscribe(userManager.getInventoryManager().getInventoryEntries(), getInventoryQuery(uuid))
                if (view != null && this.listHeader != null) {
                    if (Objects.equal(uuid, this.myOutfitsFolderUUID)) {
                        ((TextView) this.listHeader.findViewById(R.id.itemNameTextView)).setText(R.string.current_outfit)
                        ((ImageView) this.listHeader.findViewById(R.id.itemTypeIconView)).setImageResource(R.drawable.inv_folder)
                        view.findViewById(R.id.wear_buttons_layout).setVisibility(View.GONE)
                    } else {
                        ((TextView) this.listHeader.findViewById(R.id.itemNameTextView)).setText(R.string.inventory_go_up)
                        ((ImageView) this.listHeader.findViewById(R.id.itemTypeIconView)).setImageResource(R.drawable.inv_up)
                        view.findViewById(R.id.wear_buttons_layout).setVisibility(View.VISIBLE)
                    }
                    this.listHeader.findViewById(R.id.itemSubTypeIconView).setVisibility(View.GONE)
                    this.listHeader.setVisibility(View.VISIBLE)
                }
            } else {
                this.rootFolderEntryList.subscribe(userManager.getInventoryManager().getInventoryEntries(), InventoryQuery.create((UUID) null, (String) null, true, false, false, (SLAssetType) null))
                if (this.listHeader != null) {
                    this.listHeader.setVisibility(View.GONE)
                }
                if (view != null) {
                    view.findViewById(R.id.wear_buttons_layout).setVisibility(View.GONE)
                }
            }
            if (this.adapter != null) {
                this.adapter.setDatabase(database)
            }
        } else {
            this.wornAttachments.unsubscribe()
            this.wornWearables.unsubscribe()
            this.rootFolderEntryList.unsubscribe()
            this.adapter.setDatabase(null)
            this.wornOutfitFolder.unsubscribe()
        }
        updateLoadingStatus()
    }

    private fun updateLoadingStatus() {
        boolean z
        Context context = getContext()
        if (context != null) {
            if (this.folderLoading.isSubscribed()) {
                Boolean data = this.folderLoading.getData()
                z = data != null ? data.booleanValue() : false
            } else {
                z = false
            }
            boolean isEmpty = this.adapter != null ? this.adapter.isEmpty() : true
            this.loadableMonitor.setExtraLoading(isEmpty ? z : false)
            LoadableMonitor loadableMonitor = this.loadableMonitor
            if (isEmpty) {
                z = false
            }
            loadableMonitor.setButteryProgressBar(z)
            this.loadableMonitor.setEmptyMessage(isEmpty, context.getString(R.string.no_inventory_subentries))
        }
    }


    override fun onClick(view: View) {
        when (view.getId()) {
            R.id.outfit_folder_wear_button -> {
                changeOutfit(true)
                }
            R.id.outfit_folder_add_button -> {
                changeOutfit(false)
                }
        }
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View? {
        Debug.Printf("InventoryFragment: onCreateView", arrayOfNulls<Object>(0])
        View inflate = layoutInflater.inflate(R.layout.outfit_folder, viewGroup, false)
        this.loadableMonitor.setLoadingLayout((LoadingLayout) inflate.findViewById(R.id.loading_layout), getString(R.string.no_folder_selected), getString(R.string.inventory_folder_fail))
        this.listHeader = (ViewGroup) layoutInflater.inflate(R.layout.inventory_item, (ViewGroup) inflate.findViewById(R.id.item_list), false)
        this.adapter = InventoryFolderAdapter(layoutInflater, true)
        this.adapter.setOnItemCheckboxClickListener(this)
        ((ListView) inflate.findViewById(R.id.item_list)).addHeaderView(this.listHeader, this.listHeaderData, true)
        ((ListView) inflate.findViewById(R.id.item_list)).setAdapter((ListAdapter) this.adapter)
        ((ListView) inflate.findViewById(R.id.item_list)).setOnItemClickListener(this.itemClickListener)
        inflate.findViewById(R.id.outfit_folder_wear_button).setOnClickListener(this)
        inflate.findViewById(R.id.outfit_folder_add_button).setOnClickListener(this)
        return inflate
    }

    @EventHandler
    open fun onInventorySortOrderChanged(inventorySortOrderChangedEvent: InventorySortOrderChangedEvent) {
        if (isFragmentStarted()) {
            showInventoryList(getFolderUUID())
        }
    }

    override fun onItemCheckboxClicked(inventoryEntry: SLInventoryEntry) {
        SLInventoryEntry resolveLink
        UserManager userManager = getUserManager()
        SLAgentCircuit data = this.agentCircuit.getData()
        if (data == null || userManager == null) {
            return
        }
        SLAvatarAppearance avatarAppearance = data.getModules().avatarAppearance
        InventoryDB database = userManager.getInventoryManager().getDatabase()
        if (database != null && (resolveLink = database.resolveLink(inventoryEntry)) != null) {
            inventoryEntry = resolveLink
        }
        if (avatarAppearance.isItemWorn(inventoryEntry)) {
            if (inventoryEntry.isWearable()) {
                avatarAppearance.TakeItemOff(inventoryEntry)
                return
            } else {
                avatarAppearance.DetachInventoryItem(inventoryEntry)
                return
            }
        }
        if (inventoryEntry.isWearable()) {
            avatarAppearance.WearItem(inventoryEntry, false)
        } else {
            avatarAppearance.AttachInventoryItem(inventoryEntry, 0, false)
        }
    }

    override fun onStart() {
        super.onStart()
        EventBus.getInstance().subscribe(this)
        showInventoryList(getFolderUUID())
    }

    override fun onStop() {
        showInventoryList(null)
        EventBus.getInstance().unsubscribe(this)
        super.onStop()
    }

    override fun setFragmentArgs(intent: Intent, bundle: Bundle) {
        Debug.Printf("InventoryFragment: setFragmentArgs '%s'", bundle)
        if (bundle != null) {
            getArguments().putAll(bundle)
        }
        if (isFragmentStarted()) {
            showInventoryList(getFolderUUID())
        }
    }
}
