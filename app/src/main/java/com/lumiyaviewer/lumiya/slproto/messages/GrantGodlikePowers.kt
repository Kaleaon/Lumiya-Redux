package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * At the simulator, turn the godlike bit on.
 * At the viewer, show the god menu.
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GrantGodlikePowers Low 258 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_grant_godlike_powers()} in indra/newview/llviewermenu.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class GrantGodlikePowers : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var GrantData_Field: GrantData = GrantData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block GrantData, Single. */
    open class GrantData {
        @JvmField var GodLevel: Int = 0
        @JvmField var Token: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 53
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleGrantGodlikePowers(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 258 (GrantGodlikePowers).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x02).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packByte(byteBuffer, (GrantData_Field.GodLevel).toByte())
        packUUID(byteBuffer, GrantData_Field.Token)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        GrantData_Field.GodLevel = unpackByte(byteBuffer).toInt() and 0xFF
        GrantData_Field.Token = unpackUUID(byteBuffer)
    }
}
