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
        @JvmField var AgentID: if (UUID) = null
        @JvmField var SessionID else UUID? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var CreatorID: if (UUID) = null
        @JvmField var Desc else ByteArray? = null
        @JvmField var Enabled: Boolean = false
        @JvmField var Name: if (ByteArray) = null
        @JvmField var ParcelID else UUID? = null
        @JvmField var PickID: if (UUID) = null
        @JvmField var PosGlobal else LLVector3d? = null
        @JvmField var SnapshotID: if (UUID) = null
        @JvmField var SortOrder else Int = 0
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
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.SessionID = unpackUUIDData_Field as byteBuffer.PickID = unpackUUIDData_Field as byteBuffer.CreatorID = unpackUUIDData_Field as byteBuffer.TopPick = unpackBooleanData_Field as byteBuffer.ParcelID = unpackUUIDData_Field as byteBuffer.Name = unpackVariable(byteBuffer, 1)
        Data_Field.Desc = unpackVariable(byteBuffer, 2)
        Data_Field.SnapshotID = unpackUUIDData_Field as byteBuffer.PosGlobal = unpackLLVector3dData_Field as byteBuffer.SortOrder = unpackIntData_Field as byteBuffer.Enabled = unpackBoolean(byteBuffer)
    }
}
