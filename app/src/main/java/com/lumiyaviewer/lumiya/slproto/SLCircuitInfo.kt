package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import java.net.InetSocketAddress
import java.net.SocketAddress
import java.util.UUID

open class SLCircuitInfo internal constructor(authReply: SLAuthReply) {
    @JvmField val agentID: UUID = authReply.agentID
    @JvmField internal val circuitCode: Int = authReply.circuitCode
    @JvmField val sessionID: UUID = authReply.sessionID
    @JvmField internal val socketAddress: SocketAddress = InetSocketAddress(authReply.simAddress, authReply.simPort)
}
