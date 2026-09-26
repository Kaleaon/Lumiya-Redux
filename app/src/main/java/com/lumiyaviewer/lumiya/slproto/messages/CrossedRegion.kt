package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.UUID

/**
 * CrossedRegion - new way to tell a viewer it has gone across a region
 * boundary
 *
 * <p>Template: {@code CrossedRegion Medium 7 Trusted Unencoded UDPBlackListed}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_crossed_region()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class CrossedRegion : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var Info_Field: Info = Info()
    @JvmField var RegionData_Field: RegionData = RegionData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Info, Single. */
    open class Info {
        @JvmField var LookAt: LLVector3? = null
        @JvmField var Position: LLVector3? = null
    }

    /** Block RegionData, Single. */
    open class RegionData {
        @JvmField var RegionHandle: Long = 0L
        @JvmField var SeedCapability: ByteArray? = null
        @JvmField var SimIP: Inet4Address? = null
        @JvmField var SimPort: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return RegionData_Field.SeedCapability!!.size + 16 + 34 + 24
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCrossedRegion(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 7 (CrossedRegion).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x07).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        packIPAddress(byteBuffer, RegionData_Field.SimIP)
        packShort(byteBuffer, RegionData_Field.SimPort.toShort())
        packLong(byteBuffer, RegionData_Field.RegionHandle)
        packVariable(byteBuffer, RegionData_Field.SeedCapability, 2)
        packLLVector3(byteBuffer, Info_Field.Position)
        packLLVector3(byteBuffer, Info_Field.LookAt)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        RegionData_Field.SimIP = unpackIPAddress(byteBuffer)
        RegionData_Field.SimPort = unpackShort(byteBuffer).toInt() and 65535
        RegionData_Field.RegionHandle = unpackLong(byteBuffer)
        RegionData_Field.SeedCapability = unpackVariable(byteBuffer, 2)
        Info_Field.Position = unpackLLVector3(byteBuffer)
        Info_Field.LookAt = unpackLLVector3(byteBuffer)
    }
}
