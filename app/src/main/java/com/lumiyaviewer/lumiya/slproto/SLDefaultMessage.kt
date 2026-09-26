package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.slproto.messages.SLMessageHandler
import java.nio.ByteBuffer

open class SLDefaultMessage : SLMessage() {
    override fun CalcPayloadSize(): Int {
        return 0
    }
    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.DefaultMessageHandler(this)
    }
    override fun PackPayload(byteBuffer: ByteBuffer) {
    }
    override fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
