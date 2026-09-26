package com.lumiyaviewer.lumiya.ui.inventory

import android.os.Parcel
import android.os.Parcelable
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import java.util.UUID

open class InventorySaveInfo : Parcelable {
    public static Parcelable.Creator<InventorySaveInfo> CREATOR = new Parcelable.Creator<InventorySaveInfo>() {
        override fun createFromParcel(parcel: Parcel): InventorySaveInfo {
            return InventorySaveInfo(parcel)
        }

        override fun newArray(i: Int): Array<InventorySaveInfo> {
            return arrayOfNulls<InventorySaveInfo>(i]
        }
    }

    public SLAssetType assetType
    public long inventoryOfferMessageId

    public UUID notecardUUID

    public String saveItemName

    public UUID saveItemUUID

    public InventorySaveType saveType

    enum class InventorySaveType {
        NotecardItem,
        InventoryOffer

    }

    protected constructor(parcel: Parcel) {
        this.saveType = InventorySaveType.values()[parcel.readInt()]
        if (parcel.readByte() != 0) {
            this.saveItemUUID = UUID.fromString(parcel.readString())
        } else {
            this.saveItemUUID = null
        }
        this.saveItemName = parcel.readString()
        if (parcel.readByte() != 0) {
            this.notecardUUID = UUID.fromString(parcel.readString())
        } else {
            this.notecardUUID = null
        }
        if (parcel.readByte() != 0) {
            this.assetType = SLAssetType.getByType(parcel.readInt())
        } else {
            this.assetType = null
        }
        this.inventoryOfferMessageId = parcel.readLong()
    }

    constructor(inventorySaveType: InventorySaveType, uuid: UUID, saveItemName: String, notecardUUID: UUID, assetType: SLAssetType, inventoryOfferMessageId: Long) {
        this.saveType = inventorySaveType
        this.saveItemUUID = uuid
        this.saveItemName = saveItemName
        this.notecardUUID = notecardUUID
        this.assetType = assetType
        this.inventoryOfferMessageId = inventoryOfferMessageId
    }

    override fun describeContents(): Int {
        return 0
    }

    override fun writeToParcel(parcel: Parcel, i: Int) {
        parcel.writeInt(this.saveType.ordinal())
        internal fun if(null: this.saveItemUUID !=):  {
            parcel.writeByte((byte) 1)
            parcel.writeString(this.saveItemUUID.toString())
        } else {
            parcel.writeByte((byte) 0)
        }
        parcel.writeString(this.saveItemName)
        internal fun if(null: this.notecardUUID !=):  {
            parcel.writeByte((byte) 1)
            parcel.writeString(this.notecardUUID.toString())
        } else {
            parcel.writeByte((byte) 0)
        }
        internal fun if(null: this.assetType !=):  {
            parcel.writeByte((byte) 1)
            parcel.writeInt(this.assetType.getTypeCode())
        } else {
            parcel.writeByte((byte) 0)
        }
        parcel.writeLong(this.inventoryOfferMessageId)
    }
}
