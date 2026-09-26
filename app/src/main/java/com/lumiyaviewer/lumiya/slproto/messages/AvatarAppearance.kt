package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AvatarAppearance - Update visual params
 *
 * <p>Template: {@code AvatarAppearance Low 158 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_avatar_appearance()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AvatarAppearance : SLMessage() {
    @JvmField var ObjectData_Field: ObjectData = ObjectData()
    @JvmField var Sender_Field: Sender = Sender()
    @JvmField val VisualParam_Fields = ArrayList<VisualParam>()
    @JvmField val AppearanceData_Fields = ArrayList<AppearanceData>()

    /** Block AppearanceData, Variable. */
    open class AppearanceData {
        @JvmField var AppearanceVersion: Int = 0
        @JvmField var CofVersion: Int = 0
        @JvmField var Flags: Int = 0
    }

    /** Block ObjectData, Single. */
    open class ObjectData {
        @JvmField var TextureEntry: ByteArray? = null
    }

    /** Block Sender, Single. */
    open class Sender {
        @JvmField var ID: UUID? = null
        @JvmField var IsTrial: Boolean = false
    }

    /** Block VisualParam, Variable. */
    open class VisualParam {
        @JvmField var ParamValue: Int = 0
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return ObjectData_Field.TextureEntry!!.size + 2 + 21 + 1 + (VisualParam_Fields.size * 1) + 1 + (AppearanceData_Fields.size * 9)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAvatarAppearance(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 158 (AvatarAppearance).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x9E).toByte())
        packUUID(byteBuffer, Sender_Field.ID)
        packBoolean(byteBuffer, Sender_Field.IsTrial)
        packVariable(byteBuffer, ObjectData_Field.TextureEntry, 2)
        byteBuffer.put((VisualParam_Fields.size.toByte()))
        for (entry in VisualParam_Fields) {
            packByte(byteBuffer, (entry.ParamValue).toByte())
        }
        byteBuffer.put((AppearanceData_Fields.size.toByte()))
        for (appearanceData in AppearanceData_Fields) {
            packByte(byteBuffer, (appearanceData.AppearanceVersion).toByte())
            packInt(byteBuffer, appearanceData.CofVersion)
            packInt(byteBuffer, appearanceData.Flags)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Sender_Field.ID = unpackUUID(byteBuffer)
        Sender_Field.IsTrial = unpackBoolean(byteBuffer)
        ObjectData_Field.TextureEntry = unpackVariable(byteBuffer, 2)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val visualParam = VisualParam()
            visualParam.ParamValue = unpackByte(byteBuffer).toInt() and 0xFF
            VisualParam_Fields.add(visualParam)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val appearanceData = AppearanceData()
            appearanceData.AppearanceVersion = unpackByte(byteBuffer).toInt() and 0xFF
            appearanceData.CofVersion = unpackInt(byteBuffer)
            appearanceData.Flags = unpackInt(byteBuffer)
            AppearanceData_Fields.add(appearanceData)
        }
    }
}
