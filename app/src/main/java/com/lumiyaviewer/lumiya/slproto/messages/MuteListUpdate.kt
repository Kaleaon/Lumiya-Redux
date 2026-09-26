package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * userserver -> viewer, up-to-date inventory is here
 * could be sent as a result of spam
 * as well as in response to InventoryRequest
 * {
 * InventoryUpdate Low Trusted Unencoded
 * {
 * AgentData Single
 * {   AgentID LLUUID  }
 * }
 * {
 * InventoryData Single
 * {   IsComplete  U8          }
 * {   Filename    Variable 1  }
 * }
 * }
 * dataserver-> userserver -> viewer to move around the mute list
 *
 * <p>Template: {@code MuteListUpdate Low 318 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class MuteListUpdate : SLMessage() {
    @JvmField var MuteData_Field: MuteData = MuteData()

    /** Block MuteData, Single. */
    open class MuteData {
        @JvmField var AgentID: UUID? = null
        @JvmField var Filename: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return MuteData_Field.Filename!!.size + 17 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleMuteListUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 318 (MuteListUpdate).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x3E).toByte())
        packUUID(byteBuffer, MuteData_Field.AgentID)
        packVariable(byteBuffer, MuteData_Field.Filename, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        MuteData_Field.AgentID = unpackUUID(byteBuffer)
        MuteData_Field.Filename = unpackVariable(byteBuffer, 1)
    }
}
