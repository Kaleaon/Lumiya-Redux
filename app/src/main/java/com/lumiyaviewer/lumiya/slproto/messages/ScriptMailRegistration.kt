package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ScriptMailRegistration
 * Simulator -> dataserver
 *
 * <p>Template: {@code ScriptMailRegistration Low 418 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ScriptMailRegistration : SLMessage() {
    @JvmField var DataBlock_Field: DataBlock = DataBlock()

    /** Block DataBlock, Single. */
    open class DataBlock {
        @JvmField var Flags: Int = 0
        @JvmField var TargetIP: ByteArray? = null
        @JvmField var TargetPort: Int = 0
        @JvmField var TaskID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return DataBlock_Field.TargetIP!!.size + 1 + 2 + 16 + 4 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptMailRegistration(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 418 (ScriptMailRegistration).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA2).toByte())
        packVariable(byteBuffer, DataBlock_Field.TargetIP, 1)
        packShort(byteBuffer, DataBlock_Field.TargetPort.toShort())
        packUUID(byteBuffer, DataBlock_Field.TaskID)
        packInt(byteBuffer, DataBlock_Field.Flags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        DataBlock_Field.TargetIP = unpackVariable(byteBuffer, 1)
        DataBlock_Field.TargetPort = unpackShort(byteBuffer).toInt() and 65535
        DataBlock_Field.TaskID = unpackUUID(byteBuffer)
        DataBlock_Field.Flags = unpackInt(byteBuffer)
    }
}
