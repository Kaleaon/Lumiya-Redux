package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * SetStartLocation
 * sim -> dataserver
 *
 * <p>Template: {@code SetStartLocation Low 325 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class SetStartLocation : SLMessage() {
    @JvmField var StartLocationData_Field: StartLocationData = StartLocationData()

    /** Block StartLocationData, Single. */
    open class StartLocationData {
        @JvmField var AgentID: UUID? = null
        @JvmField var LocationID: Int = 0
        @JvmField var LocationLookAt: LLVector3? = null
        @JvmField var LocationPos: LLVector3? = null
        @JvmField var RegionHandle: Long = 0L
        @JvmField var RegionID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return 72
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSetStartLocation(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 325 (SetStartLocation).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x45).toByte())
        packUUID(byteBuffer, StartLocationData_Field.AgentID)
        packUUID(byteBuffer, StartLocationData_Field.RegionID)
        packInt(byteBuffer, StartLocationData_Field.LocationID)
        packLong(byteBuffer, StartLocationData_Field.RegionHandle)
        packLLVector3(byteBuffer, StartLocationData_Field.LocationPos)
        packLLVector3(byteBuffer, StartLocationData_Field.LocationLookAt)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        StartLocationData_Field.AgentID = unpackUUID(byteBuffer)
        StartLocationData_Field.RegionID = unpackUUID(byteBuffer)
        StartLocationData_Field.LocationID = unpackInt(byteBuffer)
        StartLocationData_Field.RegionHandle = unpackLong(byteBuffer)
        StartLocationData_Field.LocationPos = unpackLLVector3(byteBuffer)
        StartLocationData_Field.LocationLookAt = unpackLLVector3(byteBuffer)
    }
}
