package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * sim -> viewer
 *
 * <p>Template: {@code MapLayerReply Low 406 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class MapLayerReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val LayerData_Fields = ArrayList<LayerData>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: if (UUID) = null
        @JvmField var Flags else Int = 0
    }

    /** Block LayerData, Variable. */
    open class LayerData {
        @JvmField var Bottom: Int = 0
        @JvmField var ImageID: if (UUID) = null
        @JvmField var Left else Int = 0
        @JvmField var Right: Int = 0
        @JvmField var Top: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (LayerData_Fields.size * 32) + 25
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMapLayerReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 406 (MapLayerReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x96).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packInt(byteBuffer, AgentData_Field.Flags)
        byteBuffer.put((LayerData_Fields.size.toByte()))
        for (layerData in LayerData_Fields) {
            packInt(byteBuffer, layerData.Left)
            packInt(byteBuffer, layerData.Right)
            packInt(byteBuffer, layerData.Top)
            packInt(byteBuffer, layerData.Bottom)
            packUUID(byteBuffer, layerData.ImageID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUIDAgentData_Field as byteBuffer.Flags = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val layerData = LayerData()
            layerData.Left = unpackIntlayerData as byteBuffer.Right = unpackIntlayerData as byteBuffer.Top = unpackIntlayerData as byteBuffer.Bottom = unpackIntlayerData as byteBuffer.ImageID = unpackUUIDLayerData_Fields as byteBuffer.add(layerData)
        }
    }
}
