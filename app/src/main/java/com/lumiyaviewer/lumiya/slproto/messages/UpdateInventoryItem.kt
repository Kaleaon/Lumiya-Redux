package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.Iterator
import java.util.UUID

/**
 * This is used bi-directionally between sim, dataserver, and viewer.
 * THIS MESSAGE CAN NOT CREATE NEW INVENTORY ITEMS.
 *
 * <p>Template: {@code UpdateInventoryItem Low 266 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class UpdateInventoryItem : SLMessage() {
    var AgentData_Field: AgentData = null
    var InventoryData_Fields: ArrayList<InventoryData> = ArrayList<>()

    /** Block AgentData, Single. */
    open class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
        public UUID TransactionID; // LLUUID
    }

    /** Block InventoryData, Variable. */
    open class InventoryData {
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
        public UUID TransactionID; // LLUUID
        public int Type; // S8
    }

    constructor() {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
    }
    fun CalcPayloadSize(): Int {
        var i: Int = 53
        var it: Iterator<?> = this.InventoryData_Fields.iterator()
        while (true) {
            var i2: Int = i
            if (!it.hasNext()) {
        return i2
            }
            var inventoryData: InventoryData = it as InventoryData.next()
            i = inventoryData.Description.length + inventoryData.Name.length + 133 + 1 + 4 + 4 + i2
        }
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleUpdateInventoryItem(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 266 (UpdateInventoryItem).
        byteBuffer.putShort(0xFFFF as short)
        byteBuffer.put(0x01 as byte)
        byteBuffer.put(0x0A as byte)
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packUUID(byteBuffer, this.AgentData_Field.TransactionID)
        byteBuffer.put(this as byte.InventoryData_Fields.size())
        for (inventoryData in this.InventoryData_Fields) {
            packUUID(byteBuffer, inventoryData.ItemID)
            packUUID(byteBuffer, inventoryData.FolderID)
            packInt(byteBuffer, inventoryData.CallbackID)
            packUUID(byteBuffer, inventoryData.CreatorID)
            packUUID(byteBuffer, inventoryData.OwnerID)
            packUUID(byteBuffer, inventoryData.GroupID)
            packInt(byteBuffer, inventoryData.BaseMask)
            packInt(byteBuffer, inventoryData.OwnerMask)
            packInt(byteBuffer, inventoryData.GroupMask)
            packInt(byteBuffer, inventoryData.EveryoneMask)
            packInt(byteBuffer, inventoryData.NextOwnerMask)
            packBoolean(byteBuffer, inventoryData.GroupOwned)
            packUUID(byteBuffer, inventoryData.TransactionID)
            packByte(byteBuffer, inventoryData as byte.Type)
            packByte(byteBuffer, inventoryData as byte.InvType)
            packInt(byteBuffer, inventoryData.Flags)
            packByte(byteBuffer, inventoryData as byte.SaleType)
            packInt(byteBuffer, inventoryData.SalePrice)
            packVariable(byteBuffer, inventoryData.Name, 1)
            packVariable(byteBuffer, inventoryData.Description, 1)
            packInt(byteBuffer, inventoryData.CreationDate)
            packInt(byteBuffer, inventoryData.CRC)
        }
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.AgentID = unpackUUIDthis as byteBuffer.AgentData_Field.SessionID = unpackUUIDthis as byteBuffer.AgentData_Field.TransactionID = unpackUUID(byteBuffer)
        var i: Int = byteBuffer.get() & 0xFF
        for (int j = 0; j < i; j++) {
            var inventoryData: InventoryData = InventoryData()
            inventoryData.ItemID = unpackUUIDinventoryData as byteBuffer.FolderID = unpackUUIDinventoryData as byteBuffer.CallbackID = unpackIntinventoryData as byteBuffer.CreatorID = unpackUUIDinventoryData as byteBuffer.OwnerID = unpackUUIDinventoryData as byteBuffer.GroupID = unpackUUIDinventoryData as byteBuffer.BaseMask = unpackIntinventoryData as byteBuffer.OwnerMask = unpackIntinventoryData as byteBuffer.GroupMask = unpackIntinventoryData as byteBuffer.EveryoneMask = unpackIntinventoryData as byteBuffer.NextOwnerMask = unpackIntinventoryData as byteBuffer.GroupOwned = unpackBooleaninventoryData as byteBuffer.TransactionID = unpackUUIDinventoryData as byteBuffer.Type = unpackByteinventoryData as byteBuffer.InvType = unpackByteinventoryData as byteBuffer.Flags = unpackIntinventoryData as byteBuffer.SaleType = unpackByte(byteBuffer) & 0xFF
            inventoryData.SalePrice = unpackIntinventoryData as byteBuffer.Name = unpackVariable(byteBuffer, 1)
            inventoryData.Description = unpackVariable(byteBuffer, 1)
            inventoryData.CreationDate = unpackIntinventoryData as byteBuffer.CRC = unpackIntthis as byteBuffer.InventoryData_Fields.add(inventoryData)
        }
    }
}
