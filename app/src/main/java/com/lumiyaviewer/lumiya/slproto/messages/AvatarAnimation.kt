package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * Avatar information
 * AvatarAnimation - Update animation state
 * simulator --> viewer
 *
 * <p>Template: {@code AvatarAnimation High 20 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_avatar_animation()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class AvatarAnimation : SLMessage() {
    @JvmField val AnimationList_Fields = ArrayList<AnimationList>()
    @JvmField val AnimationSourceList_Fields = ArrayList<AnimationSourceList>()
    @JvmField val PhysicalAvatarEventList_Fields = ArrayList<PhysicalAvatarEventList>()
    @JvmField var Sender_Field: Sender = Sender()

    /** Block AnimationList, Variable. */
    open class AnimationList {
        @JvmField var AnimID: UUID? = null
        @JvmField var AnimSequenceID: Int = 0
    }

    /** Block AnimationSourceList, Variable. */
    open class AnimationSourceList {
        @JvmField var ObjectID: UUID? = null
    }

    /** Block PhysicalAvatarEventList, Variable. */
    open class PhysicalAvatarEventList {
        @JvmField var TypeData: ByteArray? = null
    }

    /** Block Sender, Single. */
    open class Sender {
        @JvmField var ID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var size = (AnimationList_Fields.size * 20) + 18 + 1 + (AnimationSourceList_Fields.size * 16) + 1
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
        messageHandler.HandleAvatarAnimation(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 20 (AvatarAnimation).
        byteBuffer.put((0x14).toByte())
        packUUID(byteBuffer, Sender_Field.ID)
        byteBuffer.put((AnimationList_Fields.size.toByte()))
        for (animationList in AnimationList_Fields) {
            packUUID(byteBuffer, animationList.AnimID)
            packInt(byteBuffer, animationList.AnimSequenceID)
        }
        byteBuffer.put((AnimationSourceList_Fields.size.toByte()))
        for (entry in AnimationSourceList_Fields) {
            packUUID(byteBuffer, entry.ObjectID)
        }
        byteBuffer.put((PhysicalAvatarEventList_Fields.size.toByte()))
        val iterator = PhysicalAvatarEventList_Fields.iterator()
        while (iterator.hasNext()) {
            packVariable(byteBuffer, (iterator.next()).TypeData, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        Sender_Field.ID = unpackUUID(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val animationList = AnimationList()
            animationList.AnimID = unpackUUID(byteBuffer)
            animationList.AnimSequenceID = unpackInt(byteBuffer)
            AnimationList_Fields.add(animationList)
        }
        val i3 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i3) {
            val animationSourceList = AnimationSourceList()
            animationSourceList.ObjectID = unpackUUID(byteBuffer)
            AnimationSourceList_Fields.add(animationSourceList)
        }
        val i5 = (byteBuffer.get().toInt() and 0xFF)
        repeat(i5) {
            val physicalAvatarEventList = PhysicalAvatarEventList()
            physicalAvatarEventList.TypeData = unpackVariable(byteBuffer, 1)
            PhysicalAvatarEventList_Fields.add(physicalAvatarEventList)
        }
    }
}
