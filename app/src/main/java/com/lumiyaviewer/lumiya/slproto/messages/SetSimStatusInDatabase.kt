package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * SetSimStatusInDatabase
 * alters the "simulator" table in the database
 * sim -> dataserver
 * reliable
 *
 * <p>Template: {@code SetSimStatusInDatabase Low 22 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SetSimStatusInDatabase : SLMessage() {
    @JvmField var Data_Field: Data = Data()

    /** Block Data, Single. */
    open class Data {
        @JvmField var AgentCount: Int = 0
        @JvmField var HostName: ByteArray? = null
        @JvmField var PID: Int = 0
        @JvmField var RegionID: UUID? = null
        @JvmField var Status: ByteArray? = null
        @JvmField var TimeToLive: Int = 0
        @JvmField var X: Int = 0
        @JvmField var Y: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.HostName!!.size + 17 + 4 + 4 + 4 + 4 + 4 + 1 + Data_Field.Status!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetSimStatusInDatabase(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 22 (SetSimStatusInDatabase).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x16).toByte())
        packUUID(byteBuffer, Data_Field.RegionID)
        packVariable(byteBuffer, Data_Field.HostName, 1)
        packInt(byteBuffer, Data_Field.X)
        packInt(byteBuffer, Data_Field.Y)
        packInt(byteBuffer, Data_Field.PID)
        packInt(byteBuffer, Data_Field.AgentCount)
        packInt(byteBuffer, Data_Field.TimeToLive)
        packVariable(byteBuffer, Data_Field.Status, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.RegionID = unpackUUID(byteBuffer)
        Data_Field.HostName = unpackVariable(byteBuffer, 1)
        Data_Field.X = unpackInt(byteBuffer)
        Data_Field.Y = unpackInt(byteBuffer)
        Data_Field.PID = unpackInt(byteBuffer)
        Data_Field.AgentCount = unpackInt(byteBuffer)
        Data_Field.TimeToLive = unpackInt(byteBuffer)
        Data_Field.Status = unpackVariable(byteBuffer, 1)
    }
}
