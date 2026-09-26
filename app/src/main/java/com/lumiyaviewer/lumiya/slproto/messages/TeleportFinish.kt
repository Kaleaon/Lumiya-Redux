package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.UUID

/**
 * TeleportFinish sim->viewer
 * called when all of the information has been collected and readied for
 * the agent.
 *
 * <p>Template: {@code TeleportFinish Low 69 Trusted Unencoded UDPBlackListed}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_finish()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TeleportFinish : SLMessage() {
    @JvmField var Info_Field: Info = Info()

    /** Block Info, Single. */
    open class Info {
        @JvmField var AgentID: UUID? = null
        @JvmField var LocationID: Int = 0
        @JvmField var RegionHandle: Long = 0L
        @JvmField var SeedCapability: ByteArray? = null
        @JvmField var SimAccess: Int = 0
        @JvmField var SimIP: Inet4Address? = null
        @JvmField var SimPort: Int = 0
        @JvmField var TeleportFlags: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return Info_Field.SeedCapability!!.size + 36 + 1 + 4 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportFinish(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 69 (TeleportFinish).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x45).toByte())
        packUUID(byteBuffer, Info_Field.AgentID)
        packInt(byteBuffer, Info_Field.LocationID)
        packIPAddress(byteBuffer, Info_Field.SimIP)
        packShort(byteBuffer, Info_Field.SimPort.toShort())
        packLong(byteBuffer, Info_Field.RegionHandle)
        packVariable(byteBuffer, Info_Field.SeedCapability, 2)
        packByte(byteBuffer, (Info_Field.SimAccess).toByte())
        packInt(byteBuffer, Info_Field.TeleportFlags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Info_Field.AgentID = unpackUUID(byteBuffer)
        Info_Field.LocationID = unpackInt(byteBuffer)
        Info_Field.SimIP = unpackIPAddress(byteBuffer)
        Info_Field.SimPort = unpackShort(byteBuffer).toInt() and 65535
        Info_Field.RegionHandle = unpackLong(byteBuffer)
        Info_Field.SeedCapability = unpackVariable(byteBuffer, 2)
        Info_Field.SimAccess = unpackByte(byteBuffer).toInt() and 0xFF
        Info_Field.TeleportFlags = unpackInt(byteBuffer)
    }
}
