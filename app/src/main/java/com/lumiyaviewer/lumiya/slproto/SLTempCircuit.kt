package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import com.lumiyaviewer.lumiya.slproto.messages.UseCircuitCode
import java.io.IOException
import java.util.LinkedList
import java.util.List

open class SLTempCircuit : SLCircuit() {
    private var pendingMessages: MutableList<SLMessage> = null

    public SLTempCircuit(SLGridConnection gridConnection, SLCircuitInfo circuitInfo, SLAuthReply authReply) throws IOException {
        super(gridConnection, circuitInfo, authReply, null)
        this.pendingMessages = LinkedList()
    }
    fun DefaultMessageHandler(message: SLMessage) {
        this.pendingMessages.add(message)
    }
    fun ProcessNetworkError() {
        this.gridConn.removeTempCircuit(this)
    }
    fun ProcessTimeout() {
        this.gridConn.removeTempCircuit(this)
    }

    fun SendUseCode() {
        var useCircuitCode: UseCircuitCode = UseCircuitCode()
        useCircuitCode.CircuitCode_Field.Code = this.circuitInfo.circuitCode
        useCircuitCode.CircuitCode_Field.SessionID = this.circuitInfo.sessionID
        useCircuitCode.CircuitCode_Field.ID = this.circuitInfo.agentID
        useCircuitCode.isReliable = true
        SendMessage(useCircuitCode)
    }

    fun getPendingMessages(): MutableList<SLMessage> {
        return this.pendingMessages
    }
}
