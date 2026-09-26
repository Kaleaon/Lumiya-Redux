package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.Iterator
import java.util.UUID

/**
 * Can only fit around 7 items per packet - that's the way it goes. At
 * least many bulk updates can be packed.
 * Only from dataserver->sim->viewer
 *
 * <p>Template: {@code BulkUpdateInventory Low 281 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processBulkUpdateInventory()} in indra/newview/llinventorymodel.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class BulkUpdateInventory : SLMessage() {
    var AgentData_Field: AgentData = null
    var FolderData_Fields: ArrayList<FolderData> = ArrayList<>()
    var ItemData_Fields: ArrayList<ItemData> = ArrayList<>()

    /** Block AgentData, Single. */
    open class AgentData {
        public UUID AgentID; // LLUUID
        public UUID TransactionID; // LLUUID
    }

    /** Block FolderData, Variable. */
    open class FolderData {
        public UUID FolderID; // LLUUID
        public byte[] Name; // Variable 1
        public UUID ParentID; // LLUUID
        public int Type; // S8
    }

    /** Block ItemData, Variable. */
    open class ItemData {
        public UUID AssetID; // LLUUID
        public int BaseMask; // U32 - permissions
        public int CRC; // U32
        public int CallbackID; // U32 - Async Response
        public int CreationDate; // S32
        public UUID CreatorID; // LLUUID - permissions
        public byte[] Description; // Variable 1
        public int EveryoneMask; // U32 - permissions
        public int Flags; // U32
        public UUID FolderID; // LLUUID
        public UUID GroupID; // LLUUID - permissions
        public int GroupMask; // U32 - permissions
        public boolean GroupOwned; // BOOL - permissions
        public int InvType; // S8
        public UUID ItemID; // LLUUID
        public byte[] Name; // Variable 1
        public int NextOwnerMask; // U32 - permissions
        public UUID OwnerID; // LLUUID - permissions
        public int OwnerMask; // U32 - permissions
        public int SalePrice; // S32
        public int SaleType; // U8
        public int Type; // S8
    }

    constructor() {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
    }
    fun CalcPayloadSize(): Int {
        var i: Int = 0
        var i2: Int = 37
        var it: Iterator<?> = this.FolderData_Fields.iterator()
        while (true) {
            i = i2
            if (!it.hasNext()) {

            }
            i2 = (it as FolderData.next()).Name.length + 34 + i
        }
        var i3: Int = i + 1
        var iterator: Iterator<?> = this.ItemData_Fields.iterator()
        while (true) {
            var i4: Int = i3
            if (!iterator.hasNext()) {
        return i4
            }
            var itemData: ItemData = iterator as ItemData.next()
            i3 = itemData.Description.length + itemData.Name.length + 133 + 1 + 4 + 4 + i4
        }
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleBulkUpdateInventory(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 281 (BulkUpdateInventory).
        byteBuffer.putShort(0xFFFF as short)
        byteBuffer.put(0x01 as byte)
        byteBuffer.put(0x19 as byte)
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.TransactionID)
        byteBuffer.put(this as byte.FolderData_Fields.size())
        for (folderData in this.FolderData_Fields) {
            packUUID(byteBuffer, folderData.FolderID)
            packUUID(byteBuffer, folderData.ParentID)
            packByte(byteBuffer, folderData as byte.Type)
            packVariable(byteBuffer, folderData.Name, 1)
        }
        byteBuffer.put(this as byte.ItemData_Fields.size())
        for (itemData in this.ItemData_Fields) {
            packUUID(byteBuffer, itemData.ItemID)
            packInt(byteBuffer, itemData.CallbackID)
            packUUID(byteBuffer, itemData.FolderID)
            packUUID(byteBuffer, itemData.CreatorID)
            packUUID(byteBuffer, itemData.OwnerID)
            packUUID(byteBuffer, itemData.GroupID)
            packInt(byteBuffer, itemData.BaseMask)
            packInt(byteBuffer, itemData.OwnerMask)
            packInt(byteBuffer, itemData.GroupMask)
            packInt(byteBuffer, itemData.EveryoneMask)
            packInt(byteBuffer, itemData.NextOwnerMask)
            packBoolean(byteBuffer, itemData.GroupOwned)
            packUUID(byteBuffer, itemData.AssetID)
            packByte(byteBuffer, itemData as byte.Type)
            packByte(byteBuffer, itemData as byte.InvType)
            packInt(byteBuffer, itemData.Flags)
            packByte(byteBuffer, itemData as byte.SaleType)
            packInt(byteBuffer, itemData.SalePrice)
            packVariable(byteBuffer, itemData.Name, 1)
            packVariable(byteBuffer, itemData.Description, 1)
            packInt(byteBuffer, itemData.CreationDate)
            packInt(byteBuffer, itemData.CRC)
        }
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUIDthis as byteBuffer.AgentData_Field.TransactionID = unpackUUID(byteBuffer)
        var i: Int = byteBuffer.get() & 0xFF
        for (int j = 0; j < i; j++) {
            var folderData: FolderData = FolderData()
            folderData.FolderID = unpackUUIDfolderData as byteBuffer.ParentID = unpackUUIDfolderData as byteBuffer.Type = unpackBytefolderData as byteBuffer.Name = unpackVariable(byteBuffer, 1)
            this.FolderData_Fields.add(folderData)
        }
        var i3: Int = byteBuffer.get() & 0xFF
        for (int k = 0; k < i3; k++) {
            var itemData: ItemData = ItemData()
            itemData.ItemID = unpackUUIDitemData as byteBuffer.CallbackID = unpackIntitemData as byteBuffer.FolderID = unpackUUIDitemData as byteBuffer.CreatorID = unpackUUIDitemData as byteBuffer.OwnerID = unpackUUIDitemData as byteBuffer.GroupID = unpackUUIDitemData as byteBuffer.BaseMask = unpackIntitemData as byteBuffer.OwnerMask = unpackIntitemData as byteBuffer.GroupMask = unpackIntitemData as byteBuffer.EveryoneMask = unpackIntitemData as byteBuffer.NextOwnerMask = unpackIntitemData as byteBuffer.GroupOwned = unpackBooleanitemData as byteBuffer.AssetID = unpackUUIDitemData as byteBuffer.Type = unpackByteitemData as byteBuffer.InvType = unpackByteitemData as byteBuffer.Flags = unpackIntitemData as byteBuffer.SaleType = unpackByte(byteBuffer) & 0xFF
            itemData.SalePrice = unpackIntitemData as byteBuffer.Name = unpackVariable(byteBuffer, 1)
            itemData.Description = unpackVariable(byteBuffer, 1)
            itemData.CreationDate = unpackIntitemData as byteBuffer.CRC = unpackIntthis as byteBuffer.ItemData_Fields.add(itemData)
        }
    }
}
