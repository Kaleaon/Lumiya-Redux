package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * SimulatorSetMap
 * simulator -> dataserver
 * reliable
 * Used to upload a map image into the database (currently used only for Land For Sale)
 *
 * <p>Template: {@code SimulatorSetMap Low 6 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SimulatorSetMap : SLMessage() {
    @JvmField var MapData_Field: MapData = MapData()

    /** Block MapData, Single. */
    open class MapData {
        @JvmField var MapImage: UUID? = null
        @JvmField var RegionHandle: Long = 0L
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 32
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimulatorSetMap(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 6 (SimulatorSetMap).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x06).toByte())
        packLong(byteBuffer, MapData_Field.RegionHandle)
        packInt(byteBuffer, MapData_Field.Type)
        packUUID(byteBuffer, MapData_Field.MapImage)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        MapData_Field.RegionHandle = unpackLong(byteBuffer)
        MapData_Field.Type = unpackInt(byteBuffer)
        MapData_Field.MapImage = unpackUUID(byteBuffer)
    }
}
