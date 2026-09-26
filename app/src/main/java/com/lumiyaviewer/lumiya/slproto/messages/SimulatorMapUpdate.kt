package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer

/**
 * SimulatorMapUpdate
 * simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code SimulatorMapUpdate Low 5 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SimulatorMapUpdate : SLMessage() {
    @JvmField var MapData_Field: MapData = MapData()

    /** Block MapData, Single. */
    open class MapData {
        @JvmField var Flags: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 8
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimulatorMapUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 5 (SimulatorMapUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x05).toByte())
        packInt(byteBuffer, MapData_Field.Flags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        MapData_Field.Flags = unpackInt(byteBuffer)
    }
}
