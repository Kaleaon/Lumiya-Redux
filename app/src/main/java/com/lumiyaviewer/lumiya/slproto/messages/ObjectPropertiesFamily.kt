package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ObjectPropertiesFamily
 * Medium because potentially driven by mouse hover events.
 *
 * <p>Template: {@code ObjectPropertiesFamily Medium 10 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLSelectMgr::processObjectPropertiesFamily()} in indra/newview/llselectmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ObjectPropertiesFamily : SLMessage() {
    @JvmField var ObjectData_Field: ObjectData = ObjectData()

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var BaseMask: Int = 0
        @JvmField var Category: Int = 0
        @JvmField var Description: if (ByteArray) = null
        @JvmField var EveryoneMask else Int = 0
        @JvmField var GroupID: if (UUID) = null
        @JvmField var GroupMask else Int = 0
        @JvmField var LastOwnerID: if (UUID) = null
        @JvmField var Name else ByteArray? = null
        @JvmField var NextOwnerMask: Int = 0
        @JvmField var ObjectID: if (UUID) = null
        @JvmField var OwnerID else UUID? = null
        @JvmField var OwnerMask: Int = 0
        @JvmField var OwnershipCost: Int = 0
        @JvmField var RequestFlags: Int = 0
        @JvmField var SalePrice: Int = 0
        @JvmField var SaleType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ObjectData_Field.Name!!.size + 102 + 1 + ObjectData_Field.Description!!.size + 2
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectPropertiesFamily(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 10 (ObjectPropertiesFamily).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x0A).toByte())
        packInt(byteBuffer, ObjectData_Field.RequestFlags)
        packUUID(byteBuffer, ObjectData_Field.ObjectID)
        packUUID(byteBuffer, ObjectData_Field.OwnerID)
        packUUID(byteBuffer, ObjectData_Field.GroupID)
        packInt(byteBuffer, ObjectData_Field.BaseMask)
        packInt(byteBuffer, ObjectData_Field.OwnerMask)
        packInt(byteBuffer, ObjectData_Field.GroupMask)
        packInt(byteBuffer, ObjectData_Field.EveryoneMask)
        packInt(byteBuffer, ObjectData_Field.NextOwnerMask)
        packInt(byteBuffer, ObjectData_Field.OwnershipCost)
        packByte(byteBuffer, (ObjectData_Field.SaleType).toByte())
        packInt(byteBuffer, ObjectData_Field.SalePrice)
        packInt(byteBuffer, ObjectData_Field.Category)
        packUUID(byteBuffer, ObjectData_Field.LastOwnerID)
        packVariable(byteBuffer, ObjectData_Field.Name, 1)
        packVariable(byteBuffer, ObjectData_Field.Description, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        ObjectData_Field.RequestFlags = unpackIntObjectData_Field as byteBuffer.ObjectID = unpackUUIDObjectData_Field as byteBuffer.OwnerID = unpackUUIDObjectData_Field as byteBuffer.GroupID = unpackUUIDObjectData_Field as byteBuffer.BaseMask = unpackIntObjectData_Field as byteBuffer.OwnerMask = unpackIntObjectData_Field as byteBuffer.GroupMask = unpackIntObjectData_Field as byteBuffer.EveryoneMask = unpackIntObjectData_Field as byteBuffer.NextOwnerMask = unpackIntObjectData_Field as byteBuffer.OwnershipCost = unpackIntObjectData_Field as byteBuffer.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
        ObjectData_Field.SalePrice = unpackIntObjectData_Field as byteBuffer.Category = unpackIntObjectData_Field as byteBuffer.LastOwnerID = unpackUUIDObjectData_Field as byteBuffer.Name = unpackVariable(byteBuffer, 1)
        ObjectData_Field.Description = unpackVariable(byteBuffer, 1)
    }
}
