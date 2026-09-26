package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * GroupNoticeAdd
 * Add a group notice.
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code GroupNoticeAdd Low 61 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class GroupNoticeAdd : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MessageBlock_Field: MessageBlock = MessageBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block MessageBlock, Single. */
    open class MessageBlock {
        @JvmField var BinaryBucket: ByteArray? = null
        @JvmField var Dialog: Int = 0
        @JvmField var FromAgentName: ByteArray? = null
        @JvmField var ID: UUID? = null
        @JvmField var Message: ByteArray? = null
        @JvmField var ToGroupID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return MessageBlock_Field.FromAgentName!!.size + 34 + 2 + MessageBlock_Field.Message!!.size + 2 + MessageBlock_Field.BinaryBucket!!.size + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGroupNoticeAdd(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 61 (GroupNoticeAdd).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x3D).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, MessageBlock_Field.ToGroupID)
        packUUID(byteBuffer, MessageBlock_Field.ID)
        packByte(byteBuffer, (MessageBlock_Field.Dialog).toByte())
        packVariable(byteBuffer, MessageBlock_Field.FromAgentName, 1)
        packVariable(byteBuffer, MessageBlock_Field.Message, 2)
        packVariable(byteBuffer, MessageBlock_Field.BinaryBucket, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        MessageBlock_Field.ToGroupID = unpackUUID(byteBuffer)
        MessageBlock_Field.ID = unpackUUID(byteBuffer)
        MessageBlock_Field.Dialog = unpackByte(byteBuffer).toInt() and 0xFF
        MessageBlock_Field.FromAgentName = unpackVariable(byteBuffer, 1)
        MessageBlock_Field.Message = unpackVariable(byteBuffer, 2)
        MessageBlock_Field.BinaryBucket = unpackVariable(byteBuffer, 2)
    }
}
