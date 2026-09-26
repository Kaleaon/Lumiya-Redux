package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * sim -> viewer
 *
 * <p>Template: {@code MapBlockReply Low 409 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLWorldMapMessage::processMapBlockReply()} in indra/newview/llworldmapmessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class MapBlockReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Data_Fields = ArrayList<Data>()
    @JvmField val Size_Fields = ArrayList<Size>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var Flags: Int = 0
    }

    /** Block Data, Variable. */
    open class Data {
        @JvmField var Access: Int = 0
        @JvmField var Agents: Int = 0
        @JvmField var MapImageID: UUID? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var RegionFlags: Int = 0
        @JvmField var WaterHeight: Int = 0
        @JvmField var X: Int = 0
        @JvmField var Y: Int = 0
    }

    open class Size {
        @JvmField var SizeX: Int = 0
        @JvmField var SizeY: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 25
        val it = Data_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2 + 1 + (Size_Fields.size * 4)
            }
            i = it.next().Name!!.size + 5 + 1 + 4 + 1 + 1 + 16 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMapBlockReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 409 (MapBlockReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x99).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packInt(byteBuffer, AgentData_Field.Flags)
        byteBuffer.put((Data_Fields.size.toByte()))
        for (data in Data_Fields) {
            packShort(byteBuffer, data.X.toShort())
            packShort(byteBuffer, data.Y.toShort())
            packVariable(byteBuffer, data.Name, 1)
            packByte(byteBuffer, (data.Access).toByte())
            packInt(byteBuffer, data.RegionFlags)
            packByte(byteBuffer, (data.WaterHeight).toByte())
            packByte(byteBuffer, (data.Agents).toByte())
            packUUID(byteBuffer, data.MapImageID)
        }
        byteBuffer.put((Size_Fields.size.toByte()))
        for (size in Size_Fields) {
            packShort(byteBuffer, size.SizeX.toShort())
            packShort(byteBuffer, size.SizeY.toShort())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.Flags = unpackInt(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val data = Data()
            data.X = unpackShort(byteBuffer).toInt() and 65535
            data.Y = unpackShort(byteBuffer).toInt() and 65535
            data.Name = unpackVariable(byteBuffer, 1)
            data.Access = unpackByte(byteBuffer).toInt() and 0xFF
            data.RegionFlags = unpackInt(byteBuffer)
            data.WaterHeight = unpackByte(byteBuffer).toInt() and 0xFF
            data.Agents = unpackByte(byteBuffer).toInt() and 0xFF
            data.MapImageID = unpackUUID(byteBuffer)
            Data_Fields.add(data)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val size = Size()
            size.SizeX = unpackShort(byteBuffer).toInt() and 65535
            size.SizeY = unpackShort(byteBuffer).toInt() and 65535
            Size_Fields.add(size)
        }
    }
}
