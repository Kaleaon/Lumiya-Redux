package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.UUID

/**
 * RebakeAvatarTextures
 * simulator -> viewer request when a temporary baked avatar texture is not found
 *
 * <p>Template: {@code RebakeAvatarTextures Low 87 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class RebakeAvatarTextures : SLMessage() {
    @JvmField var TextureData_Field: TextureData = TextureData()

    /** Block TextureData, Single. */
    open class TextureData {
        @JvmField var TextureID: UUID? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 20
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleRebakeAvatarTextures(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 87 (RebakeAvatarTextures).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x57).toByte())
        packUUID(byteBuffer, TextureData_Field.TextureID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        TextureData_Field.TextureID = unpackUUID(byteBuffer)
    }
}
