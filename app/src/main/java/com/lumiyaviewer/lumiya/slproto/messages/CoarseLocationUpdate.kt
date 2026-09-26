package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * The CoarseLocationUpdate message is sent to notify the viewer of
 * the location of mappable objects in the region. 1 meter resolution is
 * sufficient for  The index block is used to show where you are,
 * and where someone you are tracking is located. They are -1 if not
 * applicable.
 *
 * <p>Template: {@code CoarseLocationUpdate Medium 6 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLWorld::processCoarseUpdate()} in indra/newview/llworld.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class CoarseLocationUpdate : SLMessage() {
    @JvmField var Index_Field: Index = Index()
    @JvmField val Location_Fields = ArrayList<Location>()
    @JvmField val AgentData_Fields = ArrayList<AgentData>()

    /** Block AgentData, Variable. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block Index, Single. */
    open class Index {
        @JvmField var Prey: Int = 0
        @JvmField var You: Int = 0
    }

    /** Block Location, Variable. */
    open class Location {
        @JvmField var X: Int = 0
        @JvmField var Y: Int = 0
        @JvmField var Z: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (Location_Fields.size * 3) + 3 + 4 + 1 + (AgentData_Fields.size * 16)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleCoarseLocationUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 6 (CoarseLocationUpdate).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x06).toByte())
        byteBuffer.put((Location_Fields.size.toByte()))
        for (location in Location_Fields) {
            packByte(byteBuffer, (location.X).toByte())
            packByte(byteBuffer, (location.Y).toByte())
            packByte(byteBuffer, (location.Z).toByte())
        }
        packShort(byteBuffer, Index_Field.You.toShort())
        packShort(byteBuffer, Index_Field.Prey.toShort())
        byteBuffer.put((AgentData_Fields.size.toByte()))
        for (entry in AgentData_Fields) {
            packUUID(byteBuffer, entry.AgentID)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val location = Location()
            location.X = unpackByte(byteBuffer).toInt() and 0xFF
            location.Y = unpackByte(byteBuffer).toInt() and 0xFF
            location.Z = unpackByte(byteBuffer).toInt() and 0xFF
            Location_Fields.add(location)
        }
        Index_Field.You = unpackShort(byteBuffer).toInt()
        Index_Field.Prey = unpackShort(byteBuffer).toInt()
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val agentData = AgentData()
            agentData.AgentID = unpackUUID(byteBuffer)
            AgentData_Fields.add(agentData)
        }
    }
}
