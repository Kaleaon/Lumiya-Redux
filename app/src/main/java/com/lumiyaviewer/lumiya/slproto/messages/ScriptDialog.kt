package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ScriptDialog
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code ScriptDialog Low 190 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_script_dialog()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ScriptDialog : SLMessage() {
    @JvmField var Data_Field: Data = Data()
    @JvmField val Buttons_Fields = ArrayList<Buttons>()
    @JvmField val OwnerData_Fields = ArrayList<OwnerData>()

    /** Block Buttons, Variable. */
    open class Buttons {
        @JvmField var ButtonLabel: ByteArray? = null
    }

    /** Block Data, Single. */
    open class Data {
        @JvmField var ChatChannel: Int = 0
        @JvmField var FirstName: ByteArray? = null
        @JvmField var ImageID: UUID? = null
        @JvmField var LastName: ByteArray? = null
        @JvmField var Message: ByteArray? = null
        @JvmField var ObjectID: UUID? = null
        @JvmField var ObjectName: ByteArray? = null
    }

    /** Block OwnerData, Variable. */
    open class OwnerData {
        @JvmField var OwnerID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var length = Data_Field.FirstName!!.size + 17 + 1 + Data_Field.LastName!!.size + 1 + Data_Field.ObjectName!!.size + 2 + Data_Field.Message!!.size + 4 + 16 + 4 + 1
        val it = Buttons_Fields.iterator()
        while (true) {
            val length2 = length
            if (!it.hasNext()) {
                return length2 + 1 + (OwnerData_Fields.size * 16)
            }
            length = it.next().ButtonLabel!!.size + 1 + length2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleScriptDialog(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 190 (ScriptDialog).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xBE).toByte())
        packUUID(byteBuffer, Data_Field.ObjectID)
        packVariable(byteBuffer, Data_Field.FirstName, 1)
        packVariable(byteBuffer, Data_Field.LastName, 1)
        packVariable(byteBuffer, Data_Field.ObjectName, 1)
        packVariable(byteBuffer, Data_Field.Message, 2)
        packInt(byteBuffer, Data_Field.ChatChannel)
        packUUID(byteBuffer, Data_Field.ImageID)
        byteBuffer.put((Buttons_Fields.size.toByte()))
        for (entry in Buttons_Fields) {
            packVariable(byteBuffer, entry.ButtonLabel, 1)
        }
        byteBuffer.put((OwnerData_Fields.size.toByte()))
        val iterator = OwnerData_Fields.iterator()
        while (iterator.hasNext()) {
            packUUID(byteBuffer, (iterator.next()).OwnerID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Data_Field.ObjectID = unpackUUID(byteBuffer)
        Data_Field.FirstName = unpackVariable(byteBuffer, 1)
        Data_Field.LastName = unpackVariable(byteBuffer, 1)
        Data_Field.ObjectName = unpackVariable(byteBuffer, 1)
        Data_Field.Message = unpackVariable(byteBuffer, 2)
        Data_Field.ChatChannel = unpackInt(byteBuffer)
        Data_Field.ImageID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val buttons = Buttons()
            buttons.ButtonLabel = unpackVariable(byteBuffer, 1)
            Buttons_Fields.add(buttons)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val ownerData = OwnerData()
            ownerData.OwnerID = unpackUUID(byteBuffer)
            OwnerData_Fields.add(ownerData)
        }
    }
}
