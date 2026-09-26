package com.lumiyaviewer.lumiya.orm

import android.annotation.SuppressLint
import android.os.Bundle
import android.os.Parcel
import android.os.Parcelable
import com.google.common.base.Joiner
import com.google.common.base.Strings
import com.google.common.collect.Iterables
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

abstract class InventoryQuery : Parcelable {

    abstract fun assetType(): Int
    abstract fun containsString(): String?
    abstract fun folderId(): UUID?
    abstract fun folderType(): Int
    abstract fun includeFolders(): Boolean
    abstract fun includeItems(): Boolean
    abstract fun newestFirst(): Boolean

    override fun describeContents(): Int = 0

    @SuppressLint("DefaultLocale")
    fun query(parentEntry: SLInventoryEntry?, inventoryDB: InventoryDB): InventoryEntryList {
        val conditions = ArrayList<String>()
        val args = ArrayList<String>()
        if (parentEntry != null) {
            conditions.add("parent_id = ?")
            args.add(parentEntry.getId().toString())
        }
        val search = containsString()
        if (!Strings.isNullOrEmpty(search)) {
            conditions.add("name LIKE ?")
            args.add("%$search%")
        }
        if (includeFolders() && !includeItems()) {
            conditions.add(String.format("(isFolder OR (invType == %d AND assetType == %d))", 8, SLAssetType.AT_LINK_FOLDER.typeCode))
        } else if (includeItems() && !includeFolders()) {
            conditions.add(String.format("(NOT (isFolder OR (invType == %d AND assetType == %d)))", 8, SLAssetType.AT_LINK_FOLDER.typeCode))
        }
        if (folderType() != FOLDER_TYPE_ANY) {
            conditions.add("(typeDefault = ?)")
            args.add(folderType().toString())
            conditions.add("isFolder")
        }
        if (assetType() != ASSET_TYPE_ANY) {
            conditions.add(String.format("(isFolder OR assetType == %d)", assetType()))
        }
        val orderBy = "isFolder DESC, (isFolder AND (typeDefault >= 0)) DESC, (assetType == 25) DESC, " +
                if (newestFirst()) "creationDate DESC, name" else "name, creationDate DESC"
        return InventoryEntryList(
            parentEntry?.name,
            parentEntry,
            SLInventoryEntry.query(
                inventoryDB.getDatabase(),
                Joiner.on(" AND ").join(conditions),
                Iterables.toArray(args, String::class.java),
                orderBy
            )
        )
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        val bundle = Bundle()
        val id = folderId()
        if (id != null) bundle.putString("folderId", id.toString())
        bundle.putString("containsString", containsString())
        bundle.putBoolean("includeFolders", includeFolders())
        bundle.putBoolean("includeItems", includeItems())
        bundle.putBoolean("newestFirst", newestFirst())
        bundle.putInt("assetType", assetType())
        parcel.writeBundle(bundle)
    }

    companion object {
        private const val ASSET_TYPE_ANY = -1
        private const val FOLDER_TYPE_ANY = -1

        @JvmField
        val CREATOR: Parcelable.Creator<InventoryQuery> = object : Parcelable.Creator<InventoryQuery> {
            override fun createFromParcel(parcel: Parcel): InventoryQuery {
                val bundle = parcel.readBundle(javaClass.classLoader)!!
                return create(
                    UUIDPool.getUUID(bundle.getString("folderId")),
                    bundle.getString("containsString"),
                    bundle.getBoolean("includeFolders"),
                    bundle.getBoolean("includeItems"),
                    bundle.getBoolean("newestFirst"),
                    bundle.getInt("assetType", ASSET_TYPE_ANY)
                )
            }

            override fun newArray(size: Int): Array<InventoryQuery?> = arrayOfNulls(size)
        }

        @JvmStatic
        fun create(uuid: UUID?, str: String?, includeFolders: Boolean, includeItems: Boolean, newestFirst: Boolean, assetType: Int): InventoryQuery {
            return AutoValue_InventoryQuery(uuid, str, includeFolders, includeItems, newestFirst, FOLDER_TYPE_ANY, assetType)
        }

        @JvmStatic
        fun create(uuid: UUID?, str: String?, includeFolders: Boolean, includeItems: Boolean, newestFirst: Boolean, assetType: SLAssetType?): InventoryQuery {
            return AutoValue_InventoryQuery(uuid, str, includeFolders, includeItems, newestFirst, FOLDER_TYPE_ANY, assetType?.typeCode ?: ASSET_TYPE_ANY)
        }

        @JvmStatic
        fun findFolderWithType(uuid: UUID?, folderType: Int): InventoryQuery {
            return AutoValue_InventoryQuery(uuid, null, true, false, false, folderType, ASSET_TYPE_ANY)
        }
    }
}
