package com.lumiyaviewer.lumiya.orm;

import java.util.UUID;
import javax.annotation.Nullable;

final class AutoValue_InventoryQuery extends InventoryQuery {
    private final int assetType;
    private final String containsString;
    private final UUID folderId;
    private final int folderType;
    private final boolean includeFolders;
    private final boolean includeItems;
    private final boolean newestFirst;

    AutoValue_InventoryQuery(@Nullable UUID uuid, @Nullable String containsString, boolean includeFolders, boolean includeItems, boolean newestFirst, int folderType, int assetType) {
        this.folderId = uuid;
        this.containsString = containsString;
        this.includeFolders = includeFolders;
        this.includeItems = includeItems;
        this.newestFirst = newestFirst;
        this.folderType = folderType;
        this.assetType = assetType;
    }

    @Override
    public int assetType() {
        return this.assetType;
    }

    @Override
    @Nullable
    public String containsString() {
        return this.containsString;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof InventoryQuery)) {
            return false;
        }
        InventoryQuery inventoryQuery = (InventoryQuery) obj;
        if (this.folderId != null ? this.folderId.equals(inventoryQuery.folderId()) : inventoryQuery.folderId() == null) {
            if (this.containsString != null ? this.containsString.equals(inventoryQuery.containsString()) : inventoryQuery.containsString() == null) {
                if (this.includeFolders == inventoryQuery.includeFolders() && this.includeItems == inventoryQuery.includeItems() && this.newestFirst == inventoryQuery.newestFirst() && this.folderType == inventoryQuery.folderType()) {
                    return this.assetType == inventoryQuery.assetType();
                }
            }
        }
        return false;
    }

    @Override
    @Nullable
    public UUID folderId() {
        return this.folderId;
    }

    @Override
    public int folderType() {
        return this.folderType;
    }

    public int hashCode() {
        return (((((((this.includeItems ? 1231 : 1237) ^ (((this.includeFolders ? 1231 : 1237) ^ (((((this.folderId == null ? 0 : this.folderId.hashCode()) ^ 1000003) * 1000003) ^ (this.containsString != null ? this.containsString.hashCode() : 0)) * 1000003)) * 1000003)) * 1000003) ^ (this.newestFirst ? 1231 : 1237)) * 1000003) ^ this.folderType) * 1000003) ^ this.assetType;
    }

    @Override
    public boolean includeFolders() {
        return this.includeFolders;
    }

    @Override
    public boolean includeItems() {
        return this.includeItems;
    }

    @Override
    public boolean newestFirst() {
        return this.newestFirst;
    }

    public String toString() {
        return "InventoryQuery{folderId=" + this.folderId + ", containsString=" + this.containsString + ", includeFolders=" + this.includeFolders + ", includeItems=" + this.includeItems + ", newestFirst=" + this.newestFirst + ", folderType=" + this.folderType + ", assetType=" + this.assetType + "}";
    }
}
