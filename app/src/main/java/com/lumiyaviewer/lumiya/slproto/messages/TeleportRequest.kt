package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Teleport messages
 * The teleport messages are numerous, so I have attempted to give them a
 * consistent naming convention. Since there is a bit of glob pattern
 * aliasing, the rules are applied in order.
 * Teleport* - viewer->sim or sim->viewer message which announces a
 * teleportation request, progrees, start, or end.
 * Data* - sim->data or data->sim trusted message.
 * Space* - sim->space or space->sim trusted messaging
 * *Lure - A lure message to pass around information.
 * All actual viewer teleports will begin with a Teleport* message and
 * end in a TeleportStart, TeleportLocal or TeleportFailed message. The TeleportFailed
 * message may be returned by any process and must be routed through the
 * teleporting agent's simulator and back to the viewer.
 * TeleportRequest
 * viewer -> sim specifying exact teleport destination
 *
 * <p>Template: {@code TeleportRequest Low 62 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class TeleportRequest : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Info_Field: Info = Info()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Info, Single. */
    open class Info {
        @JvmField var LookAt: LLVector3? = null
        @JvmField var Position: LLVector3? = null
        @JvmField var RegionID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 76
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTeleportRequest(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 62 (TeleportRequest).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x3E).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packUUID(byteBuffer, Info_Field.RegionID)
        packLLVector3(byteBuffer, Info_Field.Position)
        packLLVector3(byteBuffer, Info_Field.LookAt)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        Info_Field.RegionID = unpackUUID(byteBuffer)
        Info_Field.Position = unpackLLVector3(byteBuffer)
        Info_Field.LookAt = unpackLLVector3(byteBuffer)
    }
}
