package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Postcard messages
 * reliable
 *
 * <p>Template: {@code SendPostcard Low 412 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SendPostcard : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var AllowPublish: Boolean = false
        @JvmField var AssetID: UUID? = null
        @JvmField var From: ByteArray? = null
        @JvmField var MaturePublish: Boolean = false
        @JvmField var Msg: ByteArray? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var PosGlobal: LLVector3d? = null
        @JvmField var SessionID: UUID? = null
        @JvmField var Subject: ByteArray? = null
        @JvmField var To: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return AgentData_Field.To!!.size + 73 + 1 + AgentData_Field.From!!.size + 1 + AgentData_Field.Name!!.size + 1 + AgentData_Field.Subject!!.size + 2 + AgentData_Field.Msg!!.size + 1 + 1 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSendPostcard(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 412 (SendPostcard).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x9C).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, AgentData_Field.AssetID)
        packLLVector3d(byteBuffer, AgentData_Field.PosGlobal)
        packVariable(byteBuffer, AgentData_Field.To, 1)
        packVariable(byteBuffer, AgentData_Field.From, 1)
        packVariable(byteBuffer, AgentData_Field.Name, 1)
        packVariable(byteBuffer, AgentData_Field.Subject, 1)
        packVariable(byteBuffer, AgentData_Field.Msg, 2)
        packBoolean(byteBuffer, AgentData_Field.AllowPublish)
        packBoolean(byteBuffer, AgentData_Field.MaturePublish)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        AgentData_Field.AssetID = unpackUUID(byteBuffer)
        AgentData_Field.PosGlobal = unpackLLVector3d(byteBuffer)
        AgentData_Field.To = unpackVariable(byteBuffer, 1)
        AgentData_Field.From = unpackVariable(byteBuffer, 1)
        AgentData_Field.Name = unpackVariable(byteBuffer, 1)
        AgentData_Field.Subject = unpackVariable(byteBuffer, 1)
        AgentData_Field.Msg = unpackVariable(byteBuffer, 2)
        AgentData_Field.AllowPublish = unpackBoolean(byteBuffer)
        AgentData_Field.MaturePublish = unpackBoolean(byteBuffer)
    }
}
