package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupDataUpdate
 * This is a bunch of group data that needs to be appropriatly routed based on presence info.
 * dataserver -> simulator
 *
 * <p>Template: {@code GroupDataUpdate Low 388 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupDataUpdate : SLMessage() {
    @JvmField val AgentGroupData_Fields = ArrayList<AgentGroupData>()

    /** Block AgentGroupData, Variable. */
    open class AgentGroupData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AgentPowers: Long = 0L
        @JvmField var GroupID: UUID? = null
        @JvmField var GroupTitle: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 5
        val it = AgentGroupData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().GroupTitle!!.size + 41 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupDataUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 388 (GroupDataUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x84).toByte())
        byteBuffer.put((AgentGroupData_Fields.size.toByte()))
        for (agentGroupData in AgentGroupData_Fields) {
            packUUID(byteBuffer, agentGroupData.AgentID)
            packUUID(byteBuffer, agentGroupData.GroupID)
            packLong(byteBuffer, agentGroupData.AgentPowers)
            packVariable(byteBuffer, agentGroupData.GroupTitle, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val agentGroupData = AgentGroupData()
            agentGroupData.AgentID = unpackUUID(byteBuffer)
            agentGroupData.GroupID = unpackUUID(byteBuffer)
            agentGroupData.AgentPowers = unpackLong(byteBuffer)
            agentGroupData.GroupTitle = unpackVariable(byteBuffer, 1)
            AgentGroupData_Fields.add(agentGroupData)
        }
    }
}
