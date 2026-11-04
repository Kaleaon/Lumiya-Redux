package com.lumiyaviewer.lumiya.inventory

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryType
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.CopyOnWriteArrayList

/**
 * Unified OutfitManager reactive service encapsulating Current Outfit Folder (COF)
 * link creation, wear, attach, replace, detach, save outfit, and rebake operations.
 */
class OutfitManager private constructor(private val userManager: UserManager) {

    enum class CategoryFilter(val displayName: String) {
        ALL("All Items"),
        CLOTHING("Clothing"),
        ATTACHMENTS("Attachments"),
        BODY_PARTS("Body Parts"),
        HUDS("HUDs")
    }

    sealed class OutfitChangeEvent {
        object COFUpdated : OutfitChangeEvent()
        data class ItemWorn(val itemUUID: UUID, val isAttachment: Boolean) : OutfitChangeEvent()
        data class ItemDetached(val itemUUID: UUID) : OutfitChangeEvent()
        data class OutfitReplaced(val outfitFolderUUID: UUID?) : OutfitChangeEvent()
        data class OutfitSaved(val folderName: String, val folderUUID: UUID) : OutfitChangeEvent()
        data class RebakeTriggered(val throttled: Boolean) : OutfitChangeEvent()
    }

    interface OutfitChangeListener {
        fun onOutfitChanged(event: OutfitChangeEvent)
    }

    private val listeners = CopyOnWriteArrayList<OutfitChangeListener>()
    private var lastRebakeTimeMs: Long = 0L
    private val REBAKE_THROTTLE_MS = 2000L

    var activeCategoryFilter: CategoryFilter = CategoryFilter.ALL
        private set

    fun addChangeListener(listener: OutfitChangeListener) {
        if (!listeners.contains(listener)) {
            listeners.add(listener)
        }
    }

    fun removeChangeListener(listener: OutfitChangeListener) {
        listeners.remove(listener)
    }

    fun notifyListeners(event: OutfitChangeEvent) {
        for (listener in listeners) {
            try {
                listener.onOutfitChanged(event)
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }

    fun setCategoryFilter(filter: CategoryFilter) {
        activeCategoryFilter = filter
        notifyListeners(OutfitChangeEvent.COFUpdated)
    }

    fun getWornItems(): List<SLAvatarAppearance.WornItem> {
        val circuit = userManager.getActiveAgentCircuit() ?: return emptyList()
        val appearance = circuit.getModules()?.avatarAppearance ?: return emptyList()
        val items = appearance.getWornItems() ?: return emptyList()
        return filterWornItems(items, activeCategoryFilter)
    }

    fun filterWornItems(
        items: List<SLAvatarAppearance.WornItem>,
        filter: CategoryFilter
    ): List<SLAvatarAppearance.WornItem> {
        return items.filter { item ->
            val wornOn = item.getWornOn()
            val attachPt = item.getAttachedTo()
            when (filter) {
                CategoryFilter.ALL -> true
                CategoryFilter.CLOTHING -> wornOn != null && !wornOn.isBodyPart()
                CategoryFilter.BODY_PARTS -> wornOn != null && wornOn.isBodyPart()
                CategoryFilter.ATTACHMENTS -> wornOn == null && ((attachPt in 1..30) || (attachPt in 38..39))
                CategoryFilter.HUDS -> wornOn == null && (attachPt in 31..37)
            }
        }
    }

    fun wearItem(item: SLInventoryEntry, append: Boolean = false) {
        val circuit = userManager.getActiveAgentCircuit() ?: return
        val appearance = circuit.getModules()?.avatarAppearance ?: return
        val itemUUID = item.uuid ?: return
        if (item.isWearable()) {
            appearance.WearItem(item, append)
            notifyListeners(OutfitChangeEvent.ItemWorn(itemUUID, false))
        } else {
            attachItem(item, 0, append)
        }
    }

    fun attachItem(item: SLInventoryEntry, attachmentPoint: Int, append: Boolean = false) {
        val circuit = userManager.getActiveAgentCircuit() ?: return
        val appearance = circuit.getModules()?.avatarAppearance ?: return
        val itemUUID = item.uuid ?: return
        appearance.AttachInventoryItem(item, attachmentPoint, append)
        notifyListeners(OutfitChangeEvent.ItemWorn(itemUUID, true))
    }

    fun detachItem(item: SLInventoryEntry) {
        val circuit = userManager.getActiveAgentCircuit() ?: return
        val appearance = circuit.getModules()?.avatarAppearance ?: return
        val itemUUID = item.uuid ?: return
        if (item.isWearable()) {
            appearance.TakeItemOff(item)
        } else {
            appearance.DetachInventoryItem(item)
        }
        notifyListeners(OutfitChangeEvent.ItemDetached(itemUUID))
    }

    fun detachWornItem(wornItem: SLAvatarAppearance.WornItem) {
        val circuit = userManager.getActiveAgentCircuit() ?: return
        val appearance = circuit.getModules()?.avatarAppearance ?: return
        val itemID = wornItem.itemID() ?: return
        if (wornItem.getWornOn() != null) {
            appearance.TakeItemOff(itemID)
        } else {
            appearance.DetachItem(wornItem)
        }
        notifyListeners(OutfitChangeEvent.ItemDetached(itemID))
    }

    fun replaceOutfit(items: MutableList<SLInventoryEntry>, outfitFolder: SLInventoryEntry? = null) {
        val circuit = userManager.getActiveAgentCircuit() ?: return
        val appearance = circuit.getModules()?.avatarAppearance ?: return
        appearance.ChangeOutfit(items, true, outfitFolder)
        notifyListeners(OutfitChangeEvent.OutfitReplaced(outfitFolder?.uuid))
    }

    fun saveCurrentOutfit(folderName: String): UUID? {
        val circuit = userManager.getActiveAgentCircuit() ?: return null
        val appearance = circuit.getModules()?.avatarAppearance ?: return null
        val inv = circuit.getModules()?.inventory ?: return null
        val db = userManager.getInventoryManager().getDatabase() ?: return null
        val rootFolder = inv.rootFolder ?: return null

        val rootUUID = rootFolder.uuid ?: return null
        val myOutfitsFolder = db.findSpecialFolder(rootUUID, 48)
            ?: inv.DoCreateNewFolder(rootFolder, "My Outfits", false, null)?.let { db.findEntry(it) }
        val parentEntry = myOutfitsFolder ?: rootFolder

        val newFolderUUID = inv.DoCreateNewFolder(parentEntry, folderName, true, null) ?: return null
        val newFolderEntry = db.findEntry(newFolderUUID)

        val wornItems = appearance.getWornItems()
        if (wornItems != null && newFolderEntry != null) {
            for (wornItem in wornItems) {
                val itemUUID = wornItem.itemID() ?: continue
                val itemEntry = db.findEntry(itemUUID)
                if (itemEntry != null) {
                    val invType = if (wornItem.getWornOn() != null) SLInventoryType.IT_WEARABLE.typeCode else SLInventoryType.IT_OBJECT.typeCode
                    val assetType = SLAssetType.AT_LINK.typeCode
                    inv.LinkInventoryItem(newFolderEntry, itemUUID, invType, assetType, itemEntry.name ?: "", "")
                }
            }
        }

        notifyListeners(OutfitChangeEvent.OutfitSaved(folderName, newFolderUUID))
        return newFolderUUID
    }

    fun rebakeTextures(force: Boolean = false) {
        val now = System.currentTimeMillis()
        if (!force && (now - lastRebakeTimeMs) < REBAKE_THROTTLE_MS) {
            Debug.Log("OutfitManager: Rebake request throttled (${now - lastRebakeTimeMs}ms since last rebake)")
            notifyListeners(OutfitChangeEvent.RebakeTriggered(throttled = true))
            return
        }
        lastRebakeTimeMs = now
        val circuit = userManager.getActiveAgentCircuit()
        val appearance = circuit?.getModules()?.avatarAppearance
        appearance?.ForceUpdateAppearance(true)
        notifyListeners(OutfitChangeEvent.RebakeTriggered(throttled = false))
    }

    companion object {
        private val instances = ConcurrentHashMap<UUID, OutfitManager>()

        @JvmStatic
        fun getInstance(userManager: UserManager): OutfitManager {
            val userID = userManager.getUserID() ?: UUID.randomUUID()
            return instances.computeIfAbsent(userID) {
                OutfitManager(userManager)
            }
        }

        val ATTACHMENT_POINTS = mapOf(
            0 to "Default",
            1 to "Chest",
            2 to "Skull",
            3 to "Left Shoulder",
            4 to "Right Shoulder",
            5 to "Left Hand",
            6 to "Right Hand",
            7 to "Left Foot",
            8 to "Right Foot",
            9 to "Spine",
            10 to "Pelvis",
            11 to "Mouth",
            12 to "Chin",
            13 to "Left Ear",
            14 to "Right Ear",
            15 to "Left Eye",
            16 to "Right Eye",
            17 to "Nose",
            18 to "Right Upper Arm",
            19 to "Right Lower Arm",
            20 to "Left Upper Arm",
            21 to "Left Lower Arm",
            22 to "Right Hip",
            23 to "Right Upper Leg",
            24 to "Right Lower Leg",
            25 to "Left Hip",
            26 to "Left Upper Leg",
            27 to "Left Lower Leg",
            28 to "Stomach",
            29 to "Left Pec",
            30 to "Right Pec",
            31 to "HUD Top Left",
            32 to "HUD Top Center",
            33 to "HUD Top Right",
            34 to "HUD Center",
            35 to "HUD Bottom Left",
            36 to "HUD Bottom",
            37 to "HUD Bottom Right",
            38 to "Neck",
            39 to "Root"
        )
    }
}
