package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * LoadURL
 * sim -> viewer
 * Ask the user if they would like to load a URL
 * reliable
 *
 * <p>Template: {@code LoadURL Low 194 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_load_url()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class LoadURL : SLMessage() {
    @JvmField var Data_Field: Data = Data()

    /** Block Data, Single. */
    open class Data {
        @JvmField var Message: ByteArray? = null
        @JvmField var ObjectID: UUID? = null
        @JvmField var ObjectName: ByteArray? = null
        @JvmField var OwnerID: UUID? = null
        @JvmField var OwnerIsGroup: Boolean = false
        @JvmField var URL: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Data_Field.ObjectName!!.size + 1 + 16 + 16 + 1 + 1 + Data_Field.Message!!.size + 1 + Data_Field.URL!!.size + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLoadURL(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 194 (LoadURL).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xC2).toByte())
        packVariable(byteBuffer, Data_Field.ObjectName, 1)
        packUUID(byteBuffer, Data_Field.ObjectID)
        packUUID(byteBuffer, Data_Field.OwnerID)
        packBoolean(byteBuffer, Data_Field.OwnerIsGroup)
        packVariable(byteBuffer, Data_Field.Message, 1)
        packVariable(byteBuffer, Data_Field.URL, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.ObjectName = unpackVariable(byteBuffer, 1)
        Data_Field.ObjectID = unpackUUID(byteBuffer)
        Data_Field.OwnerID = unpackUUID(byteBuffer)
        Data_Field.OwnerIsGroup = unpackBoolean(byteBuffer)
        Data_Field.Message = unpackVariable(byteBuffer, 1)
        Data_Field.URL = unpackVariable(byteBuffer, 1)
    }
}
