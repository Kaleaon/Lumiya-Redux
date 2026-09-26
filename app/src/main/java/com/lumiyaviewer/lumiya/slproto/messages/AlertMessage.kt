package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * Simulator to Viewer Messages
 * AlertMessage
 * Specifies the text to be posted in an alert dialog
 * Also sent from dataserver to simulator with AgentInfo block
 * Simulator doesn't include AgentInfo block to viewer
 *
 * <p>Template: {@code AlertMessage Low 134 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_alert_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AlertMessage : SLMessage() {
    @JvmField var AlertData_Field: AlertData = AlertData()
    @JvmField val AlertInfo_Fields = ArrayList<AlertInfo>()

    /** Block AlertData, Single. */
    open class AlertData {
        @JvmField var Message: ByteArray? = null
    }

    /** Block AlertInfo, Variable. */
    open class AlertInfo {
        @JvmField var ExtraParams: ByteArray? = null
        @JvmField var Message: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var length = AlertData_Field.Message!!.size + 1 + 4 + 1
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
        messageHandler.HandleAlertMessage(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 134 (AlertMessage).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x86).toByte())
        packVariable(byteBuffer, AlertData_Field.Message, 1)
        byteBuffer.put((AlertInfo_Fields.size.toByte()))
        for (alertInfo in AlertInfo_Fields) {
            packVariable(byteBuffer, alertInfo.Message, 1)
            packVariable(byteBuffer, alertInfo.ExtraParams, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AlertData_Field.Message = unpackVariable(byteBuffer, 1)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val alertInfo = AlertInfo()
            alertInfo.Message = unpackVariable(byteBuffer, 1)
            alertInfo.ExtraParams = unpackVariable(byteBuffer, 1)
            AlertInfo_Fields.add(alertInfo)
        }
    }
}
