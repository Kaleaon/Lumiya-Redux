package com.lumiyaviewer.lumiya.orm

import java.util.UUID

internal class AutoValue_InventoryQuery(
    private val folderId: UUID?,
    private val containsString: String?,
    private val includeFolders: Boolean,
    private val includeItems: Boolean,
    private val newestFirst: Boolean,
    private val folderType: Int,
    private val assetType: Int
) : InventoryQuery() {

    override fun assetType(): Int = assetType
    override fun containsString(): String? = containsString
    override fun folderId(): UUID? = folderId
    override fun folderType(): Int = folderType
    override fun includeFolders(): Boolean = includeFolders
    override fun includeItems(): Boolean = includeItems
    override fun newestFirst(): Boolean = newestFirst

    override fun equals(other: Any?): Boolean {
        if (other === this) return true
        if (other !is InventoryQuery) return false
        if (folderId != other.folderId()) return false
        if (containsString != other.containsString()) return false
        if (includeFolders != other.includeFolders()) return false
        if (includeItems != other.includeItems()) return false
        if (newestFirst != other.newestFirst()) return false
        if (folderType != other.folderType()) return false
        return assetType == other.assetType()
    }

    override fun hashCode(): Int {
        var h = (folderId?.hashCode() ?: 0) xor 1000003
        h = h * 1000003 xor (containsString?.hashCode() ?: 0)
        h = h * 1000003 xor (if (includeFolders) 1231 else 1237)
        h = h * 1000003 xor (if (includeItems) 1231 else 1237)
        h = h * 1000003 xor (if (newestFirst) 1231 else 1237)
        h = h * 1000003 xor folderType
        h = h * 1000003 xor assetType
        return h
    }

    override fun toString(): String {
        return "InventoryQuery{folderId=$folderId, containsString=$containsString, includeFolders=$includeFolders, includeItems=$includeItems, newestFirst=$newestFirst, folderType=$folderType, assetType=$assetType}"
    }
}
