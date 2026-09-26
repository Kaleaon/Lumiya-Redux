package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ScriptSensorRequest - causes the receiving sim to run a script sensor and return the results
 *
 * <p>Template: {@code ScriptSensorRequest Low 247 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ScriptSensorRequest : SLMessage() {
    @JvmField var Requester_Field: Requester = Requester()

    /** Block Requester, Single. */
    open class Requester {
        @JvmField var Arc: Float = 0f
        @JvmField var Range: Float = 0f
        @JvmField var RegionHandle: Long = 0L
        @JvmField var RequestID: UUID? = null
        @JvmField var SearchDir: LLQuaternion? = null
        @JvmField var SearchID: UUID? = null
        @JvmField var SearchName: ByteArray? = null
        @JvmField var SearchPos: LLVector3? = null
        @JvmField var SearchRegions: Int = 0
        @JvmField var SourceID: UUID? = null
        @JvmField var Type: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return Requester_Field.SearchName!!.size + 73 + 4 + 4 + 4 + 8 + 1 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptSensorRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 247 (ScriptSensorRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xF7).toByte())
        packUUID(byteBuffer, Requester_Field.SourceID)
        packUUID(byteBuffer, Requester_Field.RequestID)
        packUUID(byteBuffer, Requester_Field.SearchID)
        packLLVector3(byteBuffer, Requester_Field.SearchPos)
        packLLQuaternion(byteBuffer, Requester_Field.SearchDir)
        packVariable(byteBuffer, Requester_Field.SearchName, 1)
        packInt(byteBuffer, Requester_Field.Type)
        packFloat(byteBuffer, Requester_Field.Range)
        packFloat(byteBuffer, Requester_Field.Arc)
        packLong(byteBuffer, Requester_Field.RegionHandle)
        packByte(byteBuffer, (Requester_Field.SearchRegions).toByte())
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Requester_Field.SourceID = unpackUUID(byteBuffer)
        Requester_Field.RequestID = unpackUUID(byteBuffer)
        Requester_Field.SearchID = unpackUUID(byteBuffer)
        Requester_Field.SearchPos = unpackLLVector3(byteBuffer)
        Requester_Field.SearchDir = unpackLLQuaternion(byteBuffer)
        Requester_Field.SearchName = unpackVariable(byteBuffer, 1)
        Requester_Field.Type = unpackInt(byteBuffer)
        Requester_Field.Range = unpackFloat(byteBuffer)
        Requester_Field.Arc = unpackFloat(byteBuffer)
        Requester_Field.RegionHandle = unpackLong(byteBuffer)
        Requester_Field.SearchRegions = unpackByte(byteBuffer).toInt() and 0xFF
    }
}
