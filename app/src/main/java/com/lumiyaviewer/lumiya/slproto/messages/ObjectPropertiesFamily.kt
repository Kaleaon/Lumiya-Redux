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
        @JvmField var Description: ByteArray? = null
        @JvmField var EveryoneMask: Int = 0
        @JvmField var GroupID: UUID? = null
        @JvmField var GroupMask: Int = 0
        @JvmField var LastOwnerID: UUID? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var NextOwnerMask: Int = 0
        @JvmField var ObjectID: UUID? = null
        @JvmField var OwnerID: UUID? = null
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
        ObjectData_Field.RequestFlags = unpackInt(byteBuffer)
        ObjectData_Field.ObjectID = unpackUUID(byteBuffer)
        ObjectData_Field.OwnerID = unpackUUID(byteBuffer)
        ObjectData_Field.GroupID = unpackUUID(byteBuffer)
        ObjectData_Field.BaseMask = unpackInt(byteBuffer)
        ObjectData_Field.OwnerMask = unpackInt(byteBuffer)
        ObjectData_Field.GroupMask = unpackInt(byteBuffer)
        ObjectData_Field.EveryoneMask = unpackInt(byteBuffer)
        ObjectData_Field.NextOwnerMask = unpackInt(byteBuffer)
        ObjectData_Field.OwnershipCost = unpackInt(byteBuffer)
        ObjectData_Field.SaleType = unpackByte(byteBuffer).toInt() and 0xFF
        ObjectData_Field.SalePrice = unpackInt(byteBuffer)
        ObjectData_Field.Category = unpackInt(byteBuffer)
        ObjectData_Field.LastOwnerID = unpackUUID(byteBuffer)
        ObjectData_Field.Name = unpackVariable(byteBuffer, 1)
        ObjectData_Field.Description = unpackVariable(byteBuffer, 1)
    }
}
