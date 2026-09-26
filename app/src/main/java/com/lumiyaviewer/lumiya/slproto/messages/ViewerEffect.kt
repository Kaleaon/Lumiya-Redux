package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * ViewerEffect
 * Viewer side effect that's sent from one viewer, and broadcast to other agents nearby
 * viewer-->sim (single effect created by viewer)
 * sim-->viewer (multiple effects that can be seen by viewer)
 * the AgentData block used for authentication for viewer-->sim messages
 *
 * <p>Template: {@code ViewerEffect Medium 17 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLHUDManager::processViewerEffect()} in indra/newview/llhudmanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ViewerEffect : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val Effect_Fields = ArrayList<Effect>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block Effect, Variable. */
    open class Effect {
        @JvmField var AgentID: UUID? = null
        @JvmField var Color: ByteArray? = null
        @JvmField var Duration: Float = 0f
        @JvmField var ID: UUID? = null
        @JvmField var Type: Int = 0
        @JvmField var TypeData: ByteArray? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        var i = 35
        val it = Effect_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            i = it.next().TypeData!!.size + 42 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleViewerEffect(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Medium 17 (ViewerEffect).
        byteBuffer.put((0xFF).toByte())
        byteBuffer.put((0x11).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((Effect_Fields.size.toByte()))
        for (effect in Effect_Fields) {
            packUUID(byteBuffer, effect.ID)
            packUUID(byteBuffer, effect.AgentID)
            packByte(byteBuffer, (effect.Type).toByte())
            packFloat(byteBuffer, effect.Duration)
            packFixed(byteBuffer, effect.Color, 4)
            packVariable(byteBuffer, effect.TypeData, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val effect = Effect()
            effect.ID = unpackUUID(byteBuffer)
            effect.AgentID = unpackUUID(byteBuffer)
            effect.Type = unpackByte(byteBuffer).toInt() and 0xFF
            effect.Duration = unpackFloat(byteBuffer)
            effect.Color = unpackFixed(byteBuffer, 4)
            effect.TypeData = unpackVariable(byteBuffer, 1)
            Effect_Fields.add(effect)
        }
    }
}
