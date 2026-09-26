package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * ObjectUpdateCached
 * reliable
 *
 * <p>Template: {@code ObjectUpdateCached High 14 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_cached_object_update()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ObjectUpdateCached : SLMessage() {
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()
    @JvmField var RegionData_Field: RegionData = RegionData()

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var CRC: Int = 0
        @JvmField var ID: Int = 0
        @JvmField var UpdateFlags: Int = 0
    }

    /** Block RegionData, Single. */
    open class RegionData {
        @JvmField var RegionHandle: Long = 0L
        @JvmField var TimeDilation: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (ObjectData_Fields.size * 12) + 12
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleObjectUpdateCached(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 14 (ObjectUpdateCached).
        byteBuffer.put((0x0E).toByte())
        packLong(byteBuffer, RegionData_Field.RegionHandle)
        packShort(byteBuffer, RegionData_Field.TimeDilation.toShort())
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packInt(byteBuffer, objectData.ID)
            packInt(byteBuffer, objectData.CRC)
            packInt(byteBuffer, objectData.UpdateFlags)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        RegionData_Field.RegionHandle = unpackLong(byteBuffer)
        RegionData_Field.TimeDilation = unpackShort(byteBuffer).toInt() and 65535
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.ID = unpackInt(byteBuffer)
            objectData.CRC = unpackInt(byteBuffer)
            objectData.UpdateFlags = unpackInt(byteBuffer)
            ObjectData_Fields.add(objectData)
        }
    }
}
