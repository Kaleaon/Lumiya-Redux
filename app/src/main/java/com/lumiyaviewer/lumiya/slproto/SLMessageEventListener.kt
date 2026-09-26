package com.lumiyaviewer.lumiya.slproto

interface SLMessageEventListener {
    fun onMessageAcknowledged(message: SLMessage)
    fun onMessageTimeout(message: SLMessage)

    abstract class SLMessageBaseEventListener : SLMessageEventListener {
        override fun onMessageAcknowledged(message: SLMessage) = Unit
        override fun onMessageTimeout(message: SLMessage) = Unit
    }
}
