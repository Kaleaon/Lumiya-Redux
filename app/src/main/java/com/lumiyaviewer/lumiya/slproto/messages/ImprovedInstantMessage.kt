package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Instant Message
 * ImprovedInstantMessage
 * This message can potentially route all over the place
 * ParentEstateID: parent estate id of the source estate
 * RegionID: region id of the source of the IM.
 * Position: position of the sender in region local coordinates
 * Dialog   see llinstantmessage.h for values
 * ID       May be used by dialog. Interpretation depends on context.
 * BinaryBucket May be used by some dialog types
 * reliable
 *
 * <p>Template: {@code ImprovedInstantMessage Low 254 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_improved_im()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ImprovedInstantMessage : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var MessageBlock_Field: MessageBlock = MessageBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block MessageBlock, Single. */
    open class MessageBlock {
        @JvmField var BinaryBucket: ByteArray? = null
        @JvmField var Dialog: Int = 0
        @JvmField var FromAgentName: ByteArray? = null
        @JvmField var FromGroup: Boolean = false
        @JvmField var ID: UUID? = null
        @JvmField var Message: ByteArray? = null
        @JvmField var Offline: Int = 0
        @JvmField var ParentEstateID: Int = 0
        @JvmField var Position: LLVector3? = null
        @JvmField var RegionID: UUID? = null
        @JvmField var Timestamp: Int = 0
        @JvmField var ToAgentID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return MessageBlock_Field.FromAgentName!!.size + 72 + 2 + MessageBlock_Field.Message!!.size + 2 + MessageBlock_Field.BinaryBucket!!.size + 36
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleImprovedInstantMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 254 (ImprovedInstantMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xFE).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packBoolean(byteBuffer, MessageBlock_Field.FromGroup)
        packUUID(byteBuffer, MessageBlock_Field.ToAgentID)
        packInt(byteBuffer, MessageBlock_Field.ParentEstateID)
        packUUID(byteBuffer, MessageBlock_Field.RegionID)
        packLLVector3(byteBuffer, MessageBlock_Field.Position)
        packByte(byteBuffer, (MessageBlock_Field.Offline).toByte())
        packByte(byteBuffer, (MessageBlock_Field.Dialog).toByte())
        packUUID(byteBuffer, MessageBlock_Field.ID)
        packInt(byteBuffer, MessageBlock_Field.Timestamp)
        packVariable(byteBuffer, MessageBlock_Field.FromAgentName, 1)
        packVariable(byteBuffer, MessageBlock_Field.Message, 2)
        packVariable(byteBuffer, MessageBlock_Field.BinaryBucket, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        MessageBlock_Field.FromGroup = unpackBoolean(byteBuffer)
        MessageBlock_Field.ToAgentID = unpackUUID(byteBuffer)
        MessageBlock_Field.ParentEstateID = unpackInt(byteBuffer)
        MessageBlock_Field.RegionID = unpackUUID(byteBuffer)
        MessageBlock_Field.Position = unpackLLVector3(byteBuffer)
        MessageBlock_Field.Offline = unpackByte(byteBuffer).toInt() and 0xFF
        MessageBlock_Field.Dialog = unpackByte(byteBuffer).toInt() and 0xFF
        MessageBlock_Field.ID = unpackUUID(byteBuffer)
        MessageBlock_Field.Timestamp = unpackInt(byteBuffer)
        MessageBlock_Field.FromAgentName = unpackVariable(byteBuffer, 1)
        MessageBlock_Field.Message = unpackVariable(byteBuffer, 2)
        MessageBlock_Field.BinaryBucket = unpackVariable(byteBuffer, 2)
    }
}
