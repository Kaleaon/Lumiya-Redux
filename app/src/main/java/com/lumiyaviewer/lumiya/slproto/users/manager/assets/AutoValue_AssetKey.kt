package com.lumiyaviewer.lumiya.slproto.users.manager.assets

import java.util.UUID

class AutoValue_AssetKey : AssetKey() {
    private var assetType: Int = 0
    private var assetUUID: UUID = null
    private var channelType: Int = 0
    private var itemUUID: UUID = null
    private var ownerUUID: UUID = null
    private var sourceType: Int = 0
    private var taskUUID: UUID = null

    constructor(channelType: Int, sourceType: Int, uuid: UUID, assetType: Int, ownerUUID: UUID, itemUUID: UUID, taskUUID: UUID) {
        this.channelType = channelType
        this.sourceType = sourceType
        this.assetUUID = uuid
        this.assetType = assetType
        this.ownerUUID = ownerUUID
        this.itemUUID = itemUUID
        this.taskUUID = taskUUID
    }
    fun assetType(): Int {
        return this.assetType
    }
    fun assetUUID(): UUID {
        return this.assetUUID
    }
    fun channelType(): Int {
        return this.channelType
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is AssetKey)) {
        return false
        }
        var assetKey: AssetKey = obj as AssetKey
        if (this.channelType != assetKey.channelType() || this.sourceType != assetKey.sourceType() || (if (this.assetUUID != null) !this.assetUUID.equals(assetKey.assetUUID()) else assetKey.assetUUID() != null) || this.assetType != assetKey.assetType() || (if (this.ownerUUID != null) !this.ownerUUID.equals(assetKey.ownerUUID()) else assetKey.ownerUUID() != null) || (if (this.itemUUID != null) !this.itemUUID.equals(assetKey.itemUUID()) else assetKey.itemUUID() != null)) {
        return false
        }
        return if (this.taskUUID == null) assetKey.taskUUID() == null else this.taskUUID.equals(assetKey.taskUUID())
    }

    fun hashCode(): Int {
        return (((if (this.itemUUID == null) 0 else this.itemUUID.hashCode()) ^ (((if (this.ownerUUID == null) 0 else this.ownerUUID.hashCode()) ^ (((((if (this.assetUUID == null) 0 else this.assetUUID.hashCode()) ^ ((((this.channelType ^ 1000003) * 1000003) ^ this.sourceType) * 1000003)) * 1000003) ^ this.assetType) * 1000003)) * 1000003)) * 1000003) ^ (if (this.taskUUID != null) this.taskUUID.hashCode() else 0)
    }
    fun itemUUID(): UUID {
        return this.itemUUID
    }
    fun ownerUUID(): UUID {
        return this.ownerUUID
    }
    fun sourceType(): Int {
        return this.sourceType
    }
    fun taskUUID(): UUID {
        return this.taskUUID
    }
}
