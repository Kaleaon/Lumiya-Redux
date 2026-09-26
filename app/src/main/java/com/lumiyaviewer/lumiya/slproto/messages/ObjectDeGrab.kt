package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ObjectDeGrab
 *
 * <p>Template: {@code ObjectDeGrab Low 119 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class ObjectDeGrab : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var ObjectData_Field: ObjectData = ObjectData()
    @JvmField val SurfaceInfo_Fields = ArrayList<SurfaceInfo>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var LocalID: Int = 0
    }

    /** Block SurfaceInfo, Variable. */
    open class SurfaceInfo {
        @JvmField var Binormal: LLVector3? = null
        @JvmField var FaceIndex: Int = 0
        @JvmField var Normal: LLVector3? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var STCoord: LLVector3? = null
        @JvmField var UVCoord: LLVector3? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (SurfaceInfo_Fields.size * 64) + 41
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectDeGrab(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 119 (ObjectDeGrab).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x77).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packInt(byteBuffer, ObjectData_Field.LocalID)
        byteBuffer.put((SurfaceInfo_Fields.size.toByte()))
        for (surfaceInfo in SurfaceInfo_Fields) {
            packLLVector3(byteBuffer, surfaceInfo.UVCoord)
            packLLVector3(byteBuffer, surfaceInfo.STCoord)
            packInt(byteBuffer, surfaceInfo.FaceIndex)
            packLLVector3(byteBuffer, surfaceInfo.Position)
            packLLVector3(byteBuffer, surfaceInfo.Normal)
            packLLVector3(byteBuffer, surfaceInfo.Binormal)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        ObjectData_Field.LocalID = unpackInt(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val surfaceInfo = SurfaceInfo()
            surfaceInfo.UVCoord = unpackLLVector3(byteBuffer)
            surfaceInfo.STCoord = unpackLLVector3(byteBuffer)
            surfaceInfo.FaceIndex = unpackInt(byteBuffer)
            surfaceInfo.Position = unpackLLVector3(byteBuffer)
            surfaceInfo.Normal = unpackLLVector3(byteBuffer)
            surfaceInfo.Binormal = unpackLLVector3(byteBuffer)
            SurfaceInfo_Fields.add(surfaceInfo)
        }
    }
}
