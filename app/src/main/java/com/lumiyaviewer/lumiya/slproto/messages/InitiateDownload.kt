package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * sim -> viewer
 * initiate upload. primarily used for uploading raw files.
 *
 * <p>Template: {@code InitiateDownload Low 403 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_initiate_download()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class InitiateDownload : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField var FileData_Field: FileData = FileData()

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var AgentID: UUID? = null
    }

    /** Block FileData, Single. */
    open class FileData {
        @JvmField var SimFilename: ByteArray? = null
        @JvmField var ViewerFilename: ByteArray? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return FileData_Field.SimFilename!!.size + 1 + 1 + FileData_Field.ViewerFilename!!.size + 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleInitiateDownload(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 403 (InitiateDownload).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0x93).toByte())
        packUUID(byteBuffer, AgentData_Field.AgentID)
        packVariable(byteBuffer, FileData_Field.SimFilename, 1)
        packVariable(byteBuffer, FileData_Field.ViewerFilename, 1)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        AgentData_Field.AgentID = unpackUUID(byteBuffer)
        FileData_Field.SimFilename = unpackVariable(byteBuffer, 1)
        FileData_Field.ViewerFilename = unpackVariable(byteBuffer, 1)
    }
}
