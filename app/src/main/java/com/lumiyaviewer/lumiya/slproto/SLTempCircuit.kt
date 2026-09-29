package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import com.lumiyaviewer.lumiya.slproto.messages.UseCircuitCode
import java.io.IOException
import java.util.LinkedList

open class SLTempCircuit @Throws(IOException::class) constructor(
    gridConnection: SLGridConnection,
    circuitInfo: SLCircuitInfo,
    authReply: SLAuthReply
) : SLCircuit(gridConnection, circuitInfo, authReply, null) {
    private var pendingMessages: MutableList<SLMessage> = LinkedList()

    override fun DefaultMessageHandler(message: SLMessage) {
        this.pendingMessages.add(message)
    }

    override fun ProcessNetworkError() {
        this.gridConn.removeTempCircuit(this)
    }

    override fun ProcessTimeout() {
        this.gridConn.removeTempCircuit(this)
    }

    fun SendUseCode() {
        val useCircuitCode = UseCircuitCode()
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
