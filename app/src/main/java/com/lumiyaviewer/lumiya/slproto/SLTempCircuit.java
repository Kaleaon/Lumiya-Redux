package com.lumiyaviewer.lumiya.slproto;

import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply;
import com.lumiyaviewer.lumiya.slproto.messages.UseCircuitCode;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class SLTempCircuit extends SLCircuit {
    private List<SLMessage> pendingMessages;

    public SLTempCircuit(SLGridConnection sLGridConnection, SLCircuitInfo sLCircuitInfo, SLAuthReply sLAuthReply) throws IOException {
        super(sLGridConnection, sLCircuitInfo, sLAuthReply, null);
        this.pendingMessages = new LinkedList();
    }

    @Override
    public void DefaultMessageHandler(SLMessage sLMessage) {
        this.pendingMessages.add(sLMessage);
    }

    @Override
    public void ProcessNetworkError() {
        this.gridConn.removeTempCircuit(this);
    }

    @Override
    public void ProcessTimeout() {
        this.gridConn.removeTempCircuit(this);
    }

    public void SendUseCode() {
        UseCircuitCode useCircuitCode = new UseCircuitCode();
        useCircuitCode.CircuitCode_Field.Code = this.circuitInfo.circuitCode;
        useCircuitCode.CircuitCode_Field.SessionID = this.circuitInfo.sessionID;
        useCircuitCode.CircuitCode_Field.ID = this.circuitInfo.agentID;
        useCircuitCode.isReliable = true;
        SendMessage(useCircuitCode);
    }

    public List<SLMessage> getPendingMessages() {
        return this.pendingMessages;
    }
}
