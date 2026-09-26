package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import java.nio.ByteBuffer
import java.util.UUID

/**
 * EventInfoReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code EventInfoReply Low 180 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLEventNotifier::processEventInfoReply()} in indra/newview/lleventnotifier.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class EventInfoReply : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var EventData_Field: EventData = EventData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block EventData, Single. */
    open class EventData {
        @JvmField var Amount: Int = 0
        @JvmField var Category: ByteArray? = null
        @JvmField var Cover: Int = 0
        @JvmField var Creator: ByteArray? = null
        @JvmField var Date: ByteArray? = null
        @JvmField var DateUTC: Int = 0
        @JvmField var Desc: ByteArray? = null
        @JvmField var Duration: Int = 0
        @JvmField var EventFlags: Int = 0
        @JvmField var EventID: Int = 0
        @JvmField var GlobalPos: LLVector3d? = null
        @JvmField var Name: ByteArray? = null
        @JvmField var SimName: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return EventData_Field.Creator!!.size + 5 + 1 + EventData_Field.Name!!.size + 1 + EventData_Field.Category!!.size + 2 + EventData_Field.Desc!!.size + 1 + EventData_Field.Date!!.size + 4 + 4 + 4 + 4 + 1 + EventData_Field.SimName!!.size + 24 + 4 + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleEventInfoReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 180 (EventInfoReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xB4).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packInt(byteBuffer, EventData_Field.EventID)
        packVariable(byteBuffer, EventData_Field.Creator, 1)
        packVariable(byteBuffer, EventData_Field.Name, 1)
        packVariable(byteBuffer, EventData_Field.Category, 1)
        packVariable(byteBuffer, EventData_Field.Desc, 2)
        packVariable(byteBuffer, EventData_Field.Date, 1)
        packInt(byteBuffer, EventData_Field.DateUTC)
        packInt(byteBuffer, EventData_Field.Duration)
        packInt(byteBuffer, EventData_Field.Cover)
        packInt(byteBuffer, EventData_Field.Amount)
        packVariable(byteBuffer, EventData_Field.SimName, 1)
        packLLVector3d(byteBuffer, EventData_Field.GlobalPos)
        packInt(byteBuffer, EventData_Field.EventFlags)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        EventData_Field.EventID = unpackInt(byteBuffer)
        EventData_Field.Creator = unpackVariable(byteBuffer, 1)
        EventData_Field.Name = unpackVariable(byteBuffer, 1)
        EventData_Field.Category = unpackVariable(byteBuffer, 1)
        EventData_Field.Desc = unpackVariable(byteBuffer, 2)
        EventData_Field.Date = unpackVariable(byteBuffer, 1)
        EventData_Field.DateUTC = unpackInt(byteBuffer)
        EventData_Field.Duration = unpackInt(byteBuffer)
        EventData_Field.Cover = unpackInt(byteBuffer)
        EventData_Field.Amount = unpackInt(byteBuffer)
        EventData_Field.SimName = unpackVariable(byteBuffer, 1)
        EventData_Field.GlobalPos = unpackLLVector3d(byteBuffer)
        EventData_Field.EventFlags = unpackInt(byteBuffer)
    }
}
