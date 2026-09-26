package com.lumiyaviewer.lumiya.slproto.users

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.DaoSession
import com.lumiyaviewer.lumiya.react.RequestSource
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.DataInputStream
import java.io.DataOutputStream
import java.io.IOException
import java.util.concurrent.Executor

open class LLSDResponseCacher<Key> : ResponseCacher<Key, LLSDNode>() {
    constructor(daoSession: DaoSession, executor: Executor, str: String) : super(daoSession, executor, str) {
    }
    public /* bridge */ /* synthetic */ Subscribable getPool() {
        return super.getPool()
    }
    public /* bridge */ /* synthetic */ RequestSource getRequestSource() {
        return super.getRequestSource()
    }

    /* JADX WARN: Can't rename method to resolve collision */
    fun loadCached(bytes: ByteArray): LLSDNode {
        try {
            return LLSDNode.fromBinary(DataInputStream(ByteArrayInputStream(bytes)))
        } catch (e: LLSDException) {
            Debug.Warning(e)
        return null
        }
    }
    fun storeCached(lsdNode: LLSDNode): ByteArray {
        var byteArrayOutputStream: ByteArrayOutputStream = ByteArrayOutputStream()
        var dataOutputStream: DataOutputStream = DataOutputStream(byteArrayOutputStream)
        try {
            lsdNode.toBinarydataOutputStream as dataOutputStream.flush()
            return byteArrayOutputStream.toByteArray()
        } catch (e: IOException) {
            Debug.Warning(e)
        return null
        }
    }
}
