package com.lumiyaviewer.lumiya.cloud.common

import android.os.Bundle
import android.os.Message
import android.os.Messenger
import android.os.RemoteException

object CloudSyncMessenger {
    @JvmStatic
    fun sendMessage(messenger: Messenger?, messageType: MessageType, bundleable: Bundleable, replyTo: Messenger?): Boolean {
        if (messenger == null) return false
        val bundle = Bundle().apply {
            putString("messageType", messageType.toString())
            putBundle("message", bundleable.toBundle())
        }
        val msg = Message.obtain(null, 100, bundle).apply {
            this.replyTo = replyTo
        }
        return try {
            messenger.send(msg)
            true
        } catch (e: RemoteException) {
            false
        }
    }
}
