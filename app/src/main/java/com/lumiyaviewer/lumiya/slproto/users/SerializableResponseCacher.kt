package com.lumiyaviewer.lumiya.slproto.users

import com.lumiyaviewer.lumiya.dao.DaoSession
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.io.ObjectInputStream
import java.io.ObjectOutputStream
import java.io.Serializable
import java.util.concurrent.Executor

open class SerializableResponseCacher<Key, MessageType extends Serializable> : ResponseCacher<Key, MessageType>() {
    constructor(daoSession: DaoSession, executor: Executor, str: String) : super(daoSession, executor, str) {
    }
    fun loadCached(bytes: ByteArray): MessageType {
        try {
            return (MessageType) ObjectInputStream(ByteArrayInputStream(bytes)).readObject()
        } catch (e: IOException) {
        return null
        } catch (e2: ClassCastException) {
        return null
        } catch (e3: ClassNotFoundException) {
        return null
        }
    }
    fun storeCached(messagetype: MessageType): ByteArray {
        try {
            var byteArrayOutputStream: ByteArrayOutputStream = ByteArrayOutputStream()
            var objectOutputStream: ObjectOutputStream = ObjectOutputStreamobjectOutputStream as byteArrayOutputStream.writeObjectobjectOutputStream as messagetype.flush()
            return byteArrayOutputStream.toByteArray()
        } catch (e: IOException) {
        return null
        }
    }
}
