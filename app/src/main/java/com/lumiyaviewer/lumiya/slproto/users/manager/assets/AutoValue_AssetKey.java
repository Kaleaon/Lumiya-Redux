package com.lumiyaviewer.lumiya.slproto.users.manager.assets;

import java.util.UUID;
import javax.annotation.Nullable;

final class AutoValue_AssetKey extends AssetKey {
    private final int assetType;
    private final UUID assetUUID;
    private final int channelType;
    private final UUID itemUUID;
    private final UUID ownerUUID;
    private final int sourceType;
    private final UUID taskUUID;

    AutoValue_AssetKey(int channelType, int sourceType, @Nullable UUID uuid, int assetType, @Nullable UUID ownerUUID, @Nullable UUID itemUUID, @Nullable UUID taskUUID) {
        this.channelType = channelType;
        this.sourceType = sourceType;
        this.assetUUID = uuid;
        this.assetType = assetType;
        this.ownerUUID = ownerUUID;
        this.itemUUID = itemUUID;
        this.taskUUID = taskUUID;
    }

    @Override
    public int assetType() {
        return this.assetType;
    }

    @Override
    @Nullable
    public UUID assetUUID() {
        return this.assetUUID;
    }

    @Override
    public int channelType() {
        return this.channelType;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof AssetKey)) {
            return false;
        }
        AssetKey assetKey = (AssetKey) obj;
        if (this.channelType != assetKey.channelType() || this.sourceType != assetKey.sourceType() || (this.assetUUID != null ? !this.assetUUID.equals(assetKey.assetUUID()) : assetKey.assetUUID() != null) || this.assetType != assetKey.assetType() || (this.ownerUUID != null ? !this.ownerUUID.equals(assetKey.ownerUUID()) : assetKey.ownerUUID() != null) || (this.itemUUID != null ? !this.itemUUID.equals(assetKey.itemUUID()) : assetKey.itemUUID() != null)) {
            return false;
        }
        return this.taskUUID == null ? assetKey.taskUUID() == null : this.taskUUID.equals(assetKey.taskUUID());
    }

    public int hashCode() {
        return (((this.itemUUID == null ? 0 : this.itemUUID.hashCode()) ^ (((this.ownerUUID == null ? 0 : this.ownerUUID.hashCode()) ^ (((((this.assetUUID == null ? 0 : this.assetUUID.hashCode()) ^ ((((this.channelType ^ 1000003) * 1000003) ^ this.sourceType) * 1000003)) * 1000003) ^ this.assetType) * 1000003)) * 1000003)) * 1000003) ^ (this.taskUUID != null ? this.taskUUID.hashCode() : 0);
    }

    @Override
    @Nullable
    public UUID itemUUID() {
        return this.itemUUID;
    }

    @Override
    @Nullable
    public UUID ownerUUID() {
        return this.ownerUUID;
    }

    @Override
    public int sourceType() {
        return this.sourceType;
    }

    @Override
    @Nullable
    public UUID taskUUID() {
        return this.taskUUID;
    }
}
