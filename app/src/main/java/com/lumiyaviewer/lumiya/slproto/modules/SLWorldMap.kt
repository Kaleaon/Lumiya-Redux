package com.lumiyaviewer.lumiya.slproto.modules

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.events.SLTeleportResultEvent
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.FindAgent
import com.lumiyaviewer.lumiya.slproto.messages.MapBlockReply
import com.lumiyaviewer.lumiya.slproto.messages.MapNameRequest
import java.net.Inet4Address
import java.net.UnknownHostException
import java.util.Iterator
import java.util.UUID

open class SLWorldMap : SLModule() {
    private var teleportTargetName: String = ""
    private var teleportTargetX: Int = 0
    private var teleportTargetY: Int = 0
    private var teleportTargetZ: Int = 0
    private var teleportToAgentUUID: UUID = null

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.teleportToAgentUUID = null
    }

    fun CancelPendingTeleports() {
        this.teleportToAgentUUID = null
        this.teleportTargetName = null
    }

    @SLMessageHandler
    fun HandleFindAgent(findAgent: FindAgent) {
        if (this.teleportToAgentUUID == null || !findAgent.AgentBlock_Field.Prey.equals(this.teleportToAgentUUID)) {
            return
        }
        Debug.Printf("FindAgent: hunter %s prey %s", findAgent.AgentBlock_Field.Hunter.toString(), findAgent.AgentBlock_Field.Prey.toString())
        for (locationBlock in findAgent.LocationBlock_Fields) {
            Debug.Printf("FindAgent: GlobalX %f GlobalY %f", Double.valueOf(locationBlock.GlobalX), Double.valueOf(locationBlock.GlobalY))
        }
        if (findAgent.LocationBlock_Fields.size() > 0) {
            var d: Double = findAgent.LocationBlock_Fields.get(0).GlobalX
            var d2: Double = findAgent.LocationBlock_Fields.get(0).GlobalY
            if (d != 0.0d || d2 != 0.0d) {
                var floor: Int = Math as int.floor(d)
                var floor3: Int = Math as int.floor(d2)
                var i: Int = floor & 255
                var floor2: Int = floor3 & 255
                var j: Long = (((long) (floor & 0xFFFFFF00)) << 32) | (((long) (floor3 & 0xFFFFFF00)) & 0xFFFFFFFFL)
                Debug.Printf("Initiating teleport to regionHandle 0x%x x %d y %d", j, i, floor2)
                this.agentCircuit.TeleportToRegion(j, i, floor2, 0)
            }
        }
        this.teleportToAgentUUID = null
    }

    @SLMessageHandler
    fun HandleMapBlockReply(mapBlockReply: MapBlockReply) {
        var z: Boolean = false
        var z2: Boolean = false
        var z3: Boolean = false
        var it: Iterator<MapBlockReply.Data> = mapBlockReply.Data_Fields.iterator()
        while (true) {
            z = z3
            if (!it.hasNext()) {

            }
            var data: MapBlockReply.Data = (MapBlockReply.Data) it.next()
            var stringFromVariableOEM: String = SLMessage.stringFromVariableOEM(data.Name)
            var j: Long = (((long) (data.X * 256)) << 32) | (((long) (data.Y * 256)) & 0xFFFFFFFFL)
            if (this.teleportTargetName == null || !this.teleportTargetName.equalsIgnoreCase(stringFromVariableOEM)) {
                z3 = z
            } else if (j != 0) {
                Debug.Log("HandleMapBlockReply: regionName = '" + stringFromVariableOEM + "', X = " + data.X + " Y = " + data.Y)
                this.agentCircuit.TeleportToRegion(j, this.teleportTargetX, this.teleportTargetY, this.teleportTargetZ)
                this.teleportTargetName = null
                z3 = z
                z2 = true
            } else {
                z3 = true
            }
        }
        if (this.teleportTargetName != null && z && (!z2)) {
            this.teleportTargetName = null
            this.eventBus.publish(SLTeleportResultEvent(false, "Destination region not found."))
        }
    }

    fun TeleportToAgent(uuid: UUID): Boolean {
        if (!this.agentCircuit.getModules().rlvController.canTeleportToLocation()) {
        return false
        }
        this.teleportToAgentUUID = uuid
        var findAgent: FindAgent = FindAgent()
        findAgent.AgentBlock_Field.Hunter = this.circuitInfo.agentID
        findAgent.AgentBlock_Field.Prey = uuid
        try {
            findAgent.AgentBlock_Field.SpaceIP = Inet4Address as Inet4Address.getByAddress(new Array<byte>{0, 0, 0, 0})
            findAgent.LocationBlock_Fields.add(FindAgent.LocationBlock())
            findAgent.isReliable = true
            SendMessage(findAgent)
        return true
        } catch (e: UnknownHostException) {
        return false
        }
    }

    fun TeleportToRegionByName(teleportTargetName: String, teleportTargetX: Int, teleportTargetY: Int, teleportTargetZ: Int): Boolean {
        if (!this.agentCircuit.getModules().rlvController.canTeleportToLocation()) {
        return false
        }
        this.teleportTargetName = teleportTargetName
        this.teleportTargetX = teleportTargetX
        this.teleportTargetY = teleportTargetY
        this.teleportTargetZ = teleportTargetZ
        var mapNameRequest: MapNameRequest = MapNameRequest()
        mapNameRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        mapNameRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        mapNameRequest.NameData_Field.Name = SLMessage.stringToVariableOEMmapNameRequest as teleportTargetName.isReliable = true
        SendMessage(mapNameRequest)
        return true
    }
}
