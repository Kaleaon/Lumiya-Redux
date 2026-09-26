package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * SimCrashed - Sent to dataserver when the sim goes down.
 * Maybe we should notify the spaceserver as well?
 *
 * <p>Template: {@code SimCrashed Low 328 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SimCrashed : SLMessage() {
    @JvmField var Data_Field: Data = Data()
    @JvmField val Users_Fields = ArrayList<Users>()

    /** Block Data, Single. */
    open class Data {
        @JvmField var RegionX: Int = 0
        @JvmField var RegionY: Int = 0
    }

    /** Block Users, Variable. */
    open class Users {
        @JvmField var AgentID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (Users_Fields.size * 16) + 13
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimCrashed(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 328 (SimCrashed).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x48).toByte())
        packInt(byteBuffer, Data_Field.RegionX)
        packInt(byteBuffer, Data_Field.RegionY)
        byteBuffer.put((Users_Fields.size.toByte()))
        for (entry in Users_Fields) {
            packUUID(byteBuffer, entry.AgentID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.RegionX = unpackInt(byteBuffer)
        Data_Field.RegionY = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val users = Users()
            users.AgentID = unpackUUID(byteBuffer)
            Users_Fields.add(users)
        }
    }
}
