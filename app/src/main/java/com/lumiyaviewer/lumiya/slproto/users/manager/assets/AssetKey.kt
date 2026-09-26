package com.lumiyaviewer.lumiya.slproto.users.manager.assets

import com.google.common.base.Joiner
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import java.util.UUID

abstract class AssetKey {
    @JvmStatic private var toStringJoiner: Joiner = Joiner.on(':').useForNull("null")

    fun createAssetKey(uuid: UUID, uuid2: UUID, uuid3: UUID, i: Int): AssetKey {
        return AutoValue_AssetKey(2, 2, uuid3, i, uuid2, uuid, null)
    }

    fun createInventoryKey(inventoryEntry: SLInventoryEntry, uuid: UUID): AssetKey {
        return AutoValue_AssetKey(2, 3, inventoryEntry.assetUUID, inventoryEntry.assetType, inventoryEntry.ownerUUID, inventoryEntry.uuid, uuid)
    }

    public abstract int assetType()

    public abstract UUID assetUUID()

    public abstract int channelType()

    public abstract UUID itemUUID()

    public abstract UUID ownerUUID()

    public abstract int sourceType()

    public abstract UUID taskUUID()

    fun toString(): String {
        return toStringJoiner.join(channelType(), sourceType(), assetUUID(), assetType(), ownerUUID(), itemUUID(), taskUUID())
    }
}
