package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ParcelPropertiesRequest
 * SequenceID should be -1 or -2, and is echoed back in the
 * parcel properties message.
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelPropertiesRequest Medium 11 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ParcelPropertiesRequest : SLMessage() {
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
        @JvmField var SequenceID: Int = 0
        @JvmField var SnapSelection: Boolean = false
        @JvmField var South: Float = 0f
        @JvmField var West: Float = 0f
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 55
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleParcelPropertiesRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 11 (ParcelPropertiesRequest).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x0B).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ParcelData_Field.SequenceID)
        packFloat(byteBuffer, ParcelData_Field.West)
        packFloat(byteBuffer, ParcelData_Field.South)
        packFloat(byteBuffer, ParcelData_Field.East)
        packFloat(byteBuffer, ParcelData_Field.North)
        packBoolean(byteBuffer, ParcelData_Field.SnapSelection)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ParcelData_Field.SequenceID = unpackInt(byteBuffer)
        ParcelData_Field.West = unpackFloat(byteBuffer)
        ParcelData_Field.South = unpackFloat(byteBuffer)
        ParcelData_Field.East = unpackFloat(byteBuffer)
        ParcelData_Field.North = unpackFloat(byteBuffer)
        ParcelData_Field.SnapSelection = unpackBoolean(byteBuffer)
    }
}
