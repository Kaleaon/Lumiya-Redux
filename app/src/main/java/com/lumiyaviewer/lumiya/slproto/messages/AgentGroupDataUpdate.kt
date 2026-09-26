package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AgentGroupDataUpdate
 * Updates a viewer or simulator's impression of the groups an agent is in.
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code AgentGroupDataUpdate Low 389 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAgent::processAgentGroupDataUpdate()} in indra/newview/llagent.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AgentGroupDataUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val GroupData_Fields = ArrayList<GroupData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block GroupData, Variable. */
    open class GroupData {
        @JvmField var AcceptNotices: Boolean = false
        @JvmField var Contribution: Int = 0
        @JvmField var GroupID: UUID? = null
        @JvmField var GroupInsigniaID: UUID? = null
        @JvmField var GroupName: ByteArray? = null
        @JvmField var GroupPowers: Long = 0L
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 21
        val it = GroupData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().GroupName!!.size + 46 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentGroupDataUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 389 (AgentGroupDataUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x85).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        byteBuffer.put((GroupData_Fields.size.toByte()))
        for (groupData in GroupData_Fields) {
            packUUID(byteBuffer, groupData.GroupID)
            packLong(byteBuffer, groupData.GroupPowers)
            packBoolean(byteBuffer, groupData.AcceptNotices)
            packUUID(byteBuffer, groupData.GroupInsigniaID)
            packInt(byteBuffer, groupData.Contribution)
            packVariable(byteBuffer, groupData.GroupName, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val groupData = GroupData()
            groupData.GroupID = unpackUUID(byteBuffer)
            groupData.GroupPowers = unpackLong(byteBuffer)
            groupData.AcceptNotices = unpackBoolean(byteBuffer)
            groupData.GroupInsigniaID = unpackUUID(byteBuffer)
            groupData.Contribution = unpackInt(byteBuffer)
            groupData.GroupName = unpackVariable(byteBuffer, 1)
            GroupData_Fields.add(groupData)
        }
    }
}
