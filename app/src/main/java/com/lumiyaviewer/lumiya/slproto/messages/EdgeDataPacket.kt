package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * Edge data - compressed edge data
 *
 * <p>Template: {@code EdgeDataPacket High 24 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class EdgeDataPacket : SLMessage() {
    @JvmField var EdgeData_Field: EdgeData = EdgeData()

    /** Block EdgeData, Single. */
    open class EdgeData {
        @JvmField var Direction: Int = 0
        @JvmField var LayerData: ByteArray? = null
        @JvmField var LayerType: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return EdgeData_Field.LayerData!!.size + 4 + 1
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEdgeDataPacket(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 24 (EdgeDataPacket).
        byteBuffer.put((0x18).toByte())
        packByte(byteBuffer, (EdgeData_Field.LayerType).toByte())
        packByte(byteBuffer, (EdgeData_Field.Direction).toByte())
        packVariable(byteBuffer, EdgeData_Field.LayerData, 2)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        EdgeData_Field.LayerType = unpackByte(byteBuffer).toInt() and 0xFF
        EdgeData_Field.Direction = unpackByte(byteBuffer).toInt() and 0xFF
        EdgeData_Field.LayerData = unpackVariable(byteBuffer, 2)
    }
}
