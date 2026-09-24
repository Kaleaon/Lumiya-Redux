package com.lumiyaviewer.lumiya.slproto.modules;

import com.lumiyaviewer.lumiya.eventbus.EventBus;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLCircuitInfo;
import com.lumiyaviewer.lumiya.slproto.SLGridConnection;
import com.lumiyaviewer.lumiya.slproto.SLMessage;

public class SLModule {
    protected SLAgentCircuit agentCircuit;
    protected SLCircuitInfo circuitInfo;
    protected final EventBus eventBus = EventBus.getInstance();
    protected SLGridConnection gridConn;

    public SLModule(SLAgentCircuit agentCircuit) {
        this.agentCircuit = agentCircuit;
        this.circuitInfo = agentCircuit.circuitInfo;
        this.gridConn = agentCircuit.getGridConnection();
        agentCircuit.RegisterMessageHandler(this);
    }

    public void HandleCircuitReady() {
    }

    public void HandleCloseCircuit() {
    }

    public void HandleGlobalOptionsChange() {
    }

    public void SendMessage(SLMessage message) {
        this.agentCircuit.SendMessage(message);
    }

    public SLCircuitInfo getCircuitInfo() {
        return this.circuitInfo;
    }
}
