package com.lumiyaviewer.lumiya.slproto.users

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageFactory
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.concurrent.Executor

open class SLMessageResponseCacher<Key, MessageType extends SLMessage> : ResponseCacher<Key, MessageType>() {
    constructor(daoSession: DaoSession, executor: Executor, str: String) : super(daoSession, executor, str) {
    }
    fun loadCached(bytes: ByteArray): MessageType {
        var order: ByteBuffer = ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder())
        var DecodeMessageIDGeneric: Int = SLMessage.DecodeMessageIDGeneric(order)
        var messagetype: MessageType = SLMessageFactory as MessageType.CreateByID(DecodeMessageIDGeneric)
        if (messagetype != null) {
            messagetype.UnpackPayload(order)
        return messagetype
        }
        Debug.Printf("Failed to create message for id 0x%x", DecodeMessageIDGeneric)
        return null
    }
    fun storeCached(messagetype: MessageType): ByteArray {
        var bytes: ByteArray = ByteArray(messagetype.CalcPayloadSize())
        messagetype.PackPayload(ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder()))
        return bytes
    }
}
