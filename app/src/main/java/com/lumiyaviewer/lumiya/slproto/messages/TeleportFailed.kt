package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * TeleportFailed somewhere->sim->viewer
 * announce failure of teleport request
 *
 * <p>Template: {@code TeleportFailed Low 74 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_failed()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TeleportFailed : SLMessage() {
    @JvmField val AlertInfo_Fields = ArrayList<AlertInfo>()
    @JvmField var Info_Field: Info = Info()

    /** Block AlertInfo, Variable. */
    open class AlertInfo {
        @JvmField var ExtraParams: ByteArray? = null
        @JvmField var Message: ByteArray? = null
    }

    /** Block Info, Single. */
    open class Info {
        @JvmField var AgentID: UUID? = null
        @JvmField var Reason: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var length = Info_Field.Reason!!.size + 17 + 4 + 1
        val it = AlertInfo_Fields.iterator()
        while (true) {
            val length2 = length
            if (!it.hasNext()) {
                return length2
            }
            val alertInfo = it.next()
            length = alertInfo.ExtraParams!!.size + alertInfo.Message!!.size + 1 + 1 + length2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportFailed(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 74 (TeleportFailed).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x4A).toByte())
        packUUID(byteBuffer, Info_Field.AgentID)
        packVariable(byteBuffer, Info_Field.Reason, 1)
        byteBuffer.put((AlertInfo_Fields.size.toByte()))
        for (alertInfo in AlertInfo_Fields) {
            packVariable(byteBuffer, alertInfo.Message, 1)
            packVariable(byteBuffer, alertInfo.ExtraParams, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.AgentID = unpackUUID(byteBuffer)
        Info_Field.Reason = unpackVariable(byteBuffer, 1)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val alertInfo = AlertInfo()
            alertInfo.Message = unpackVariable(byteBuffer, 1)
            alertInfo.ExtraParams = unpackVariable(byteBuffer, 1)
            AlertInfo_Fields.add(alertInfo)
        }
    }
}
