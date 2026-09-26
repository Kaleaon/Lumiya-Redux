package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * AgentAnimation - Update animation state
 * viewer --> simulator
 *
 * <p>Template: {@code AgentAnimation High 5 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class AgentAnimation : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val AnimationList_Fields = ArrayList<AnimationList>()
    @JvmField val PhysicalAvatarEventList_Fields = ArrayList<PhysicalAvatarEventList>()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
        @JvmField var SessionID: UUID? = null
    }

    /** Block AnimationList, Variable. */
    open class AnimationList {
        @JvmField var AnimID: UUID? = null
        @JvmField var StartAnim: Boolean = false
    }

    /** Block PhysicalAvatarEventList, Variable. */
    open class PhysicalAvatarEventList {
        @JvmField var TypeData: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var size = (AnimationList_Fields.size * 17) + 34 + 1
        val it = PhysicalAvatarEventList_Fields.iterator()
        while (true) {
            val size2 = size
            if (!it.hasNext()) {
                return size2
            }
            size = it.next().TypeData!!.size + 1 + size2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleAgentAnimation(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 5 (AgentAnimation).
        byteBuffer.put((0x05).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packUUID(byteBuffer, AgentData_Field.SessionID)
        byteBuffer.put((AnimationList_Fields.size.toByte()))
        for (animationList in AnimationList_Fields) {
            packUUID(byteBuffer, animationList.AnimID)
            packBoolean(byteBuffer, animationList.StartAnim)
        }
        byteBuffer.put((PhysicalAvatarEventList_Fields.size.toByte()))
        for (entry in PhysicalAvatarEventList_Fields) {
            packVariable(byteBuffer, entry.TypeData, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        AgentData_Field.SessionID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val animationList = AnimationList()
            animationList.AnimID = unpackUUID(byteBuffer)
            animationList.StartAnim = unpackBoolean(byteBuffer)
            AnimationList_Fields.add(animationList)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val physicalAvatarEventList = PhysicalAvatarEventList()
            physicalAvatarEventList.TypeData = unpackVariable(byteBuffer, 1)
            PhysicalAvatarEventList_Fields.add(physicalAvatarEventList)
        }
    }
}
