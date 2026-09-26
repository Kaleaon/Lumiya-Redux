package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * Launcher messages
 * NetTest - This goes back and forth to the space server because of
 * problems determining the port
 *
 * <p>Template: {@code NetTest Low 326 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class NetTest : SLMessage() {
    @JvmField var NetBlock_Field: NetBlock = NetBlock()

    /** Block NetBlock, Single. */
    open class NetBlock {
        @JvmField var Port: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 6
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleNetTest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 326 (NetTest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x46).toByte())
        packShort(byteBuffer, NetBlock_Field.Port.toShort())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        NetBlock_Field.Port = unpackShort(byteBuffer).toInt() and 65535
    }
}
