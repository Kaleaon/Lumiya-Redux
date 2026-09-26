package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * AgentHeightWidth - Update to height and aspect, sent as height/width to save space
 * Usually sent when window resized or created
 *
 * <p>Template: {@code AgentHeightWidth Low 83 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentHeightWidth : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var HeightWidthBlock_Field: HeightWidthBlock = HeightWidthBlock()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var CircuitCode: Int = 0
        @JvmField var SessionID: UUID? = null
    }

    /** Block HeightWidthBlock, Single. */
    open class HeightWidthBlock {
        @JvmField var GenCounter: Int = 0
        @JvmField var Height: Int = 0
        @JvmField var Width: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 48
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentHeightWidth(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 83 (AgentHeightWidth).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x53).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, AgentData_Field.CircuitCode)
        packInt(byteBuffer, HeightWidthBlock_Field.GenCounter)
        packShort(byteBuffer, HeightWidthBlock_Field.Height.toShort())
        packShort(byteBuffer, HeightWidthBlock_Field.Width.toShort())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.CircuitCode = unpackInt(byteBuffer)
        HeightWidthBlock_Field.GenCounter = unpackInt(byteBuffer)
        HeightWidthBlock_Field.Height = unpackShort(byteBuffer).toInt() and 65535
        HeightWidthBlock_Field.Width = unpackShort(byteBuffer).toInt() and 65535
    }
}
