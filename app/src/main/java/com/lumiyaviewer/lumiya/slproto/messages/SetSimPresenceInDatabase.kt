package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * SetSimPresenceInDatabase
 * updates the "presence" table in the database to ensure
 * that a given simulator is present and valid for a set amount of
 * time
 *
 * <p>Template: {@code SetSimPresenceInDatabase Low 23 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 */
open class SetSimPresenceInDatabase : SLMessage() {
    @JvmField var SimData_Field: SimData = SimData()

    /** Block SimData, Single. */
    open class SimData {
        @JvmField var AgentCount: Int = 0
        @JvmField var GridX: Int = 0
        @JvmField var GridY: Int = 0
        @JvmField var HostName: ByteArray? = null
        @JvmField var PID: Int = 0
        @JvmField var RegionID: UUID? = null
        @JvmField var Status: ByteArray? = null
        @JvmField var TimeToLive: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return SimData_Field.HostName!!.size + 17 + 4 + 4 + 4 + 4 + 4 + 1 + SimData_Field.Status!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetSimPresenceInDatabase(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 23 (SetSimPresenceInDatabase).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x17).toByte())
        packUUID(byteBuffer, SimData_Field.RegionID)
        packVariable(byteBuffer, SimData_Field.HostName, 1)
        packInt(byteBuffer, SimData_Field.GridX)
        packInt(byteBuffer, SimData_Field.GridY)
        packInt(byteBuffer, SimData_Field.PID)
        packInt(byteBuffer, SimData_Field.AgentCount)
        packInt(byteBuffer, SimData_Field.TimeToLive)
        packVariable(byteBuffer, SimData_Field.Status, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SimData_Field.RegionID = unpackUUID(byteBuffer)
        SimData_Field.HostName = unpackVariable(byteBuffer, 1)
        SimData_Field.GridX = unpackInt(byteBuffer)
        SimData_Field.GridY = unpackInt(byteBuffer)
        SimData_Field.PID = unpackInt(byteBuffer)
        SimData_Field.AgentCount = unpackInt(byteBuffer)
        SimData_Field.TimeToLive = unpackInt(byteBuffer)
        SimData_Field.Status = unpackVariable(byteBuffer, 1)
    }
}
