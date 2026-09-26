package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelJoin - Take all parcels which are owned by agent and inside
 * rectangle, and make them 1 parcel if they all are leased.
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelJoin Low 210 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelJoin : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ParcelData_Field: ParcelData = ParcelData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ParcelData, Single. */
    open class ParcelData {
        @JvmField var East: Float = 0f
        @JvmField var North: Float = 0f
        @JvmField var South: Float = 0f
        @JvmField var West: Float = 0f
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 52
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelJoin(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 210 (ParcelJoin).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xD2).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packFloat(byteBuffer, ParcelData_Field.West)
        packFloat(byteBuffer, ParcelData_Field.South)
        packFloat(byteBuffer, ParcelData_Field.East)
        packFloat(byteBuffer, ParcelData_Field.North)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ParcelData_Field.West = unpackFloat(byteBuffer)
        ParcelData_Field.South = unpackFloat(byteBuffer)
        ParcelData_Field.East = unpackFloat(byteBuffer)
        ParcelData_Field.North = unpackFloat(byteBuffer)
    }
}
