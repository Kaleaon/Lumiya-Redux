package com.lumiyaviewer.lumiya.slproto.modules

import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLCircuitInfo
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.SLMessage

open class SLModule {
    protected var agentCircuit: SLAgentCircuit? = null
    protected var circuitInfo: SLCircuitInfo? = null
    protected var eventBus: EventBus = EventBus.getInstance()
    protected var gridConn: SLGridConnection? = null

    constructor(agentCircuit: SLAgentCircuit) {
        this.agentCircuit = agentCircuit
        this.circuitInfo = agentCircuit.circuitInfo
        this.gridConn = agentCircuit.getGridConnection()
        agentCircuit.RegisterMessageHandler(this)
    }

    fun HandleCircuitReady() {
    }

    fun HandleCloseCircuit() {
    }

    fun HandleGlobalOptionsChange() {
    }

    fun SendMessage(message: SLMessage) {
        this.agentCircuit.SendMessage(message)
    }

    fun getCircuitInfo(): SLCircuitInfo {
        return this.circuitInfo
    }
}
