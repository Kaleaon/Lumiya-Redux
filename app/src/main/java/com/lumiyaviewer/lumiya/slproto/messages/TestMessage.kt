package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * The Version 2.0 template requires preservation of message
 * numbers. Each message must be numbered relative to the
 * other messages of that type. The current highest number
 * for each type is listed below:
 * Low: 431
 * Medium: 18
 * High: 32
 * PLEASE UPDATE THIS WHEN YOU ADD A NEW MESSAGE!
 * Test Message
 * Test Message
 *
 * <p>Template: {@code TestMessage Low 1 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class TestMessage : SLMessage() {
    @JvmField val NeighborBlock_Fields = Array(4) { NeighborBlock() }
    @JvmField var TestBlock1_Field: TestBlock1 = TestBlock1()

    /** Block NeighborBlock, Multiple 4. */
    open class NeighborBlock {
        @JvmField var Test0: Int = 0
        @JvmField var Test1: Int = 0
        @JvmField var Test2: Int = 0
    }

    /** Block TestBlock1, Single. */
    open class TestBlock1 {
        @JvmField var Test1: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 56
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTestMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 1 (TestMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x01).toByte())
        packInt(byteBuffer, TestBlock1_Field.Test1)
        (0 until 4).forEach { index ->
            packInt(byteBuffer, NeighborBlock_Fields[index].Test0)
            packInt(byteBuffer, NeighborBlock_Fields[index].Test1)
            packInt(byteBuffer, NeighborBlock_Fields[index].Test2)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TestBlock1_Field.Test1 = unpackInt(byteBuffer)
        (0 until 4).forEach { index ->
            NeighborBlock_Fields[index].Test0 = unpackInt(byteBuffer)
            NeighborBlock_Fields[index].Test1 = unpackInt(byteBuffer)
            NeighborBlock_Fields[index].Test2 = unpackInt(byteBuffer)
        }
    }
}
