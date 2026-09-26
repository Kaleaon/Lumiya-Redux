package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * TelehubInfo - fill in the UI for telehub creation floater.
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code TelehubInfo Low 10 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTelehubInfo()} in indra/newview/llfloatertelehub.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class TelehubInfo : SLMessage() {
    @JvmField val SpawnPointBlock_Fields = ArrayList<SpawnPointBlock>()
    @JvmField var TelehubBlock_Field: TelehubBlock = TelehubBlock()

    /** Block SpawnPointBlock, Variable. */
    open class SpawnPointBlock {
        @JvmField var SpawnPointPos: LLVector3? = null
    }

    /** Block TelehubBlock, Single. */
    open class TelehubBlock {
        @JvmField var ObjectID: UUID? = null
        @JvmField var ObjectName: ByteArray? = null
        @JvmField var TelehubPos: LLVector3? = null
        @JvmField var TelehubRot: LLQuaternion? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return TelehubBlock_Field.ObjectName!!.size + 17 + 12 + 12 + 4 + 1 + (SpawnPointBlock_Fields.size * 12)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleTelehubInfo(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 10 (TelehubInfo).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x0A).toByte())
        packUUID(byteBuffer, TelehubBlock_Field.ObjectID)
        packVariable(byteBuffer, TelehubBlock_Field.ObjectName, 1)
        packLLVector3(byteBuffer, TelehubBlock_Field.TelehubPos)
        packLLQuaternion(byteBuffer, TelehubBlock_Field.TelehubRot)
        byteBuffer.put((SpawnPointBlock_Fields.size.toByte()))
        for (entry in SpawnPointBlock_Fields) {
            packLLVector3(byteBuffer, entry.SpawnPointPos)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TelehubBlock_Field.ObjectID = unpackUUID(byteBuffer)
        TelehubBlock_Field.ObjectName = unpackVariable(byteBuffer, 1)
        TelehubBlock_Field.TelehubPos = unpackLLVector3(byteBuffer)
        TelehubBlock_Field.TelehubRot = unpackLLQuaternion(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val spawnPointBlock = SpawnPointBlock()
            spawnPointBlock.SpawnPointPos = unpackLLVector3(byteBuffer)
            SpawnPointBlock_Fields.add(spawnPointBlock)
        }
    }
}
