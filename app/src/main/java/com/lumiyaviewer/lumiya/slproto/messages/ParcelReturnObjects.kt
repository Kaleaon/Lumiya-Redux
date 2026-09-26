package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ParcelReturnObjects
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelReturnObjects Low 199 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelReturnObjects : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()
    @JvmField val TaskIDs_Fields = ArrayList<TaskIDs>()
    @JvmField val OwnerIDs_Fields = ArrayList<OwnerIDs>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block OwnerIDs, Variable. */
    open class OwnerIDs {
        @JvmField var OwnerID: UUID? = null
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var LocalID: Int = 0
        @JvmField var ReturnType: Int = 0
    }

    /** Block TaskIDs, Variable. */
    open class TaskIDs {
        @JvmField var TaskID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (TaskIDs_Fields.size * 16) + 45 + 1 + (OwnerIDs_Fields.size * 16)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelReturnObjects(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 199 (ParcelReturnObjects).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xC7).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ParcelData_Field.LocalID)
        packInt(byteBuffer, ParcelData_Field.ReturnType)
        byteBuffer.put((TaskIDs_Fields.size.toByte()))
        for (entry in TaskIDs_Fields) {
            packUUID(byteBuffer, entry.TaskID)
        }
        byteBuffer.put((OwnerIDs_Fields.size.toByte()))
        val iterator = OwnerIDs_Fields.iterator()
        while (iterator.hasNext()) {
            packUUID(byteBuffer, (iterator.next()).OwnerID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ParcelData_Field.LocalID = unpackInt(byteBuffer)
        ParcelData_Field.ReturnType = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val taskIDs = TaskIDs()
            taskIDs.TaskID = unpackUUID(byteBuffer)
            TaskIDs_Fields.add(taskIDs)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val ownerIDs = OwnerIDs()
            ownerIDs.OwnerID = unpackUUID(byteBuffer)
            OwnerIDs_Fields.add(ownerIDs)
        }
    }
}
