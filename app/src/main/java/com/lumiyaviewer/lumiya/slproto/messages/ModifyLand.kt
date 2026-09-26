package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ModifyLand - sent to modify a piece of land on a simulator.
 * viewer -> sim
 *
 * <p>Template: {@code ModifyLand Low 124 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ModifyLand : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ModifyBlock_Field: ModifyBlock = ModifyBlock()
    @JvmField val ParcelData_Fields = ArrayList<ParcelData>()
    @JvmField val ModifyBlockExtended_Fields = ArrayList<ModifyBlockExtended>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ModifyBlock, Single. */
    open class ModifyBlock {
        @JvmField var Action: Int = 0
        @JvmField var BrushSize: Int = 0
        @JvmField var Height: Float = 0f
        @JvmField var Seconds: Float = 0f
    }

    /** Block ModifyBlockExtended, Variable. */
    open class ModifyBlockExtended {
        @JvmField var BrushSize: Float = 0f
    }

    /** Block ParcelData, Variable. */
    open class ParcelData {
        @JvmField var East: Float = 0f
        @JvmField var LocalID: Int = 0
        @JvmField var North: Float = 0f
        @JvmField var South: Float = 0f
        @JvmField var West: Float = 0f
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return (ParcelData_Fields.size * 20) + 47 + 1 + (ModifyBlockExtended_Fields.size * 4)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleModifyLand(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 124 (ModifyLand).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x7C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packByte(byteBuffer, (ModifyBlock_Field.Action).toByte())
        packByte(byteBuffer, (ModifyBlock_Field.BrushSize).toByte())
        packFloat(byteBuffer, ModifyBlock_Field.Seconds)
        packFloat(byteBuffer, ModifyBlock_Field.Height)
        byteBuffer.put((ParcelData_Fields.size.toByte()))
        for (parcelData in ParcelData_Fields) {
            packInt(byteBuffer, parcelData.LocalID)
            packFloat(byteBuffer, parcelData.West)
            packFloat(byteBuffer, parcelData.South)
            packFloat(byteBuffer, parcelData.East)
            packFloat(byteBuffer, parcelData.North)
        }
        byteBuffer.put((ModifyBlockExtended_Fields.size.toByte()))
        for (entry in ModifyBlockExtended_Fields) {
            packFloat(byteBuffer, entry.BrushSize)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ModifyBlock_Field.Action = unpackByte(byteBuffer).toInt() and 0xFF
        ModifyBlock_Field.BrushSize = unpackByte(byteBuffer).toInt() and 0xFF
        ModifyBlock_Field.Seconds = unpackFloat(byteBuffer)
        ModifyBlock_Field.Height = unpackFloat(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val parcelData = ParcelData()
            parcelData.LocalID = unpackInt(byteBuffer)
            parcelData.West = unpackFloat(byteBuffer)
            parcelData.South = unpackFloat(byteBuffer)
            parcelData.East = unpackFloat(byteBuffer)
            parcelData.North = unpackFloat(byteBuffer)
            ParcelData_Fields.add(parcelData)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val modifyBlockExtended = ModifyBlockExtended()
            modifyBlockExtended.BrushSize = unpackFloat(byteBuffer)
            ModifyBlockExtended_Fields.add(modifyBlockExtended)
        }
    }
}
