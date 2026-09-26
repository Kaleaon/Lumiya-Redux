package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import java.nio.ByteBuffer
import java.util.UUID

/**
 * PickInfoUpdate
 * Update a pick.  ParcelID is set on the simulator as the message
 * passes through.
 * If TopPick is TRUE, the simulator will only pass on the message
 * if the agent_id is a god.
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code PickInfoUpdate Low 185 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class PickInfoUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Data_Field: Data = Data()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var CreatorID: UUID? = null
        @JvmField var Desc: ByteArray? = null
        @JvmField var Enabled: Boolean = false
        @JvmField var Name: ByteArray? = null
        @JvmField var ParcelID: UUID? = null
        @JvmField var PickID: UUID? = null
        @JvmField var PosGlobal: LLVector3d? = null
        @JvmField var SnapshotID: UUID? = null
        @JvmField var SortOrder: Int = 0
        @JvmField var TopPick: Boolean = false
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.Name!!.size + 50 + 2 + Data_Field.Desc!!.size + 16 + 24 + 4 + 1 + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandlePickInfoUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 185 (PickInfoUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xB9).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Data_Field.PickID)
        packUUID(byteBuffer, Data_Field.CreatorID)
        packBoolean(byteBuffer, Data_Field.TopPick)
        packUUID(byteBuffer, Data_Field.ParcelID)
        packVariable(byteBuffer, Data_Field.Name, 1)
        packVariable(byteBuffer, Data_Field.Desc, 2)
        packUUID(byteBuffer, Data_Field.SnapshotID)
        packLLVector3d(byteBuffer, Data_Field.PosGlobal)
        packInt(byteBuffer, Data_Field.SortOrder)
        packBoolean(byteBuffer, Data_Field.Enabled)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Data_Field.PickID = unpackUUID(byteBuffer)
        Data_Field.CreatorID = unpackUUID(byteBuffer)
        Data_Field.TopPick = unpackBoolean(byteBuffer)
        Data_Field.ParcelID = unpackUUID(byteBuffer)
        Data_Field.Name = unpackVariable(byteBuffer, 1)
        Data_Field.Desc = unpackVariable(byteBuffer, 2)
        Data_Field.SnapshotID = unpackUUID(byteBuffer)
        Data_Field.PosGlobal = unpackLLVector3d(byteBuffer)
        Data_Field.SortOrder = unpackInt(byteBuffer)
        Data_Field.Enabled = unpackBoolean(byteBuffer)
    }
}
