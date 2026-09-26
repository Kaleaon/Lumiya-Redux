package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * GroupTitlesReply
 * dataserver -> simulator -> viewer
 *
 * <p>Template: {@code GroupTitlesReply Low 376 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLGroupMgr::processGroupTitlesReply()} in indra/newview/llgroupmgr.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GroupTitlesReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val GroupData_Fields = ArrayList<GroupData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var GroupID: UUID? = null
        @JvmField var RequestID: UUID? = null
    }

    /** Block GroupData, Variable. */
    open class GroupData {
        @JvmField var RoleID: UUID? = null
        @JvmField var Selected: Boolean = false
        @JvmField var Title: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 53
        val it = GroupData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().Title!!.size + 1 + 16 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupTitlesReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 376 (GroupTitlesReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x78).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.GroupID)
        packUUID(byteBuffer, AgentData_Field.RequestID)
        byteBuffer.put((GroupData_Fields.size.toByte()))
        for (groupData in GroupData_Fields) {
            packVariable(byteBuffer, groupData.Title, 1)
            packUUID(byteBuffer, groupData.RoleID)
            packBoolean(byteBuffer, groupData.Selected)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.GroupID = unpackUUID(byteBuffer)
        AgentData_Field.RequestID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val groupData = GroupData()
            groupData.Title = unpackVariable(byteBuffer, 1)
            groupData.RoleID = unpackUUID(byteBuffer)
            groupData.Selected = unpackBoolean(byteBuffer)
            GroupData_Fields.add(groupData)
        }
    }
}
