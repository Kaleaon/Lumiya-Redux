package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * ReplyTaskInventory
 *
 * <p>Template: {@code ReplyTaskInventory Low 290 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLViewerObject::processTaskInv()} in indra/newview/llviewerobject.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class ReplyTaskInventory : SLMessage() {
    @JvmField var InventoryData_Field: InventoryData = InventoryData()

    /** Block InventoryData, Single. */
    open class InventoryData {
        @JvmField var Filename: ByteArray? = null
        @JvmField var Serial: Int = 0
        @JvmField var TaskID: UUID? = null
    }

    init {
        zeroCoded = true
    }

    override fun CalcPayloadSize(): Int {
        return InventoryData_Field.Filename!!.size + 19 + 4
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleReplyTaskInventory(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 290 (ReplyTaskInventory).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x22).toByte())
        packUUID(byteBuffer, InventoryData_Field.TaskID)
        packShort(byteBuffer, InventoryData_Field.Serial.toShort())
        packVariable(byteBuffer, InventoryData_Field.Filename, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        InventoryData_Field.TaskID = unpackUUID(byteBuffer)
        InventoryData_Field.Serial = unpackShort(byteBuffer).toInt()
        InventoryData_Field.Filename = unpackVariable(byteBuffer, 1)
    }
}
