package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.slproto.messages.SLMessageHandler
import java.nio.ByteBuffer

open class SLDefaultMessage : SLMessage() {
    fun CalcPayloadSize(): Int {
        return 0
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.DefaultMessageHandler(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
    }
}
