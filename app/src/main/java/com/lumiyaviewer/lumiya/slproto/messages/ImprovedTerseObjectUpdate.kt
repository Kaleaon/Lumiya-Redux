package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * packed terse object update format
 *
 * <p>Template: {@code ImprovedTerseObjectUpdate High 15 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_terse_object_update_improved()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ImprovedTerseObjectUpdate : SLMessage() {
    @JvmField val ObjectData_Fields = ArrayList<ObjectData>()
    @JvmField var RegionData_Field: RegionData = RegionData()

    /** Block ObjectData, Variable. */
    open class ObjectData {
        @JvmField var Data: ByteArray? = null
        @JvmField var TextureEntry: ByteArray? = null
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
        var i = 12
        val it = ObjectData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val objectData = it.next()
            i = objectData.TextureEntry!!.size + objectData.Data!!.size + 1 + 2 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleImprovedTerseObjectUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 15 (ImprovedTerseObjectUpdate).
        byteBuffer.put((0x0F).toByte())
        packLong(byteBuffer, RegionData_Field.RegionHandle)
        packShort(byteBuffer, RegionData_Field.TimeDilation.toShort())
        byteBuffer.put((ObjectData_Fields.size.toByte()))
        for (objectData in ObjectData_Fields) {
            packVariable(byteBuffer, objectData.Data, 1)
            packVariable(byteBuffer, objectData.TextureEntry, 2)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        RegionData_Field.RegionHandle = unpackLong(byteBuffer)
        RegionData_Field.TimeDilation = unpackShort(byteBuffer).toInt() and 65535
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val objectData = ObjectData()
            objectData.Data = unpackVariable(byteBuffer, 1)
            objectData.TextureEntry = unpackVariable(byteBuffer, 2)
            ObjectData_Fields.add(objectData)
        }
    }
}
