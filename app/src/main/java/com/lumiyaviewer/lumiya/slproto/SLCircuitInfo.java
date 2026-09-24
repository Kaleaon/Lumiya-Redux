package com.lumiyaviewer.lumiya.slproto;

import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.util.UUID;

public class SLCircuitInfo {
    public final UUID agentID;
    final int circuitCode;
    public final UUID sessionID;
    final SocketAddress socketAddress;

    SLCircuitInfo(SLAuthReply authReply) {
        this.socketAddress = new InetSocketAddress(authReply.simAddress, authReply.simPort);
        this.sessionID = authReply.sessionID;
        this.agentID = authReply.agentID;
        this.circuitCode = authReply.circuitCode;
    }
}
