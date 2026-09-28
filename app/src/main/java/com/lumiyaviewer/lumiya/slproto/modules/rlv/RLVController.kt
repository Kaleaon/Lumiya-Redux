package com.lumiyaviewer.lumiya.slproto.modules.rlv

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.chat.SLEnableRLVOfferEvent
import com.lumiyaviewer.lumiya.slproto.messages.ChatFromSimulator
import com.lumiyaviewer.lumiya.slproto.messages.ChatFromViewer
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdVersion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.UUID

open class RLVController(agentCircuit: SLAgentCircuit) : SLModule(agentCircuit) {
    private var RLVEnabled: Boolean = false
    private var RLVEnablingCommand: String? = null
    private var RLVEnablingOffered: Boolean = false
    private var RLVEnablingUUID: UUID? = null
    private val restrictions: RLVRestrictions = RLVRestrictions()

    init {
        this.RLVEnabled = false
        this.RLVEnablingOffered = false
        this.RLVEnablingCommand = null
        this.RLVEnablingUUID = null
        this.RLVEnabled = GlobalOptions.getInstance().getRLVEnabled()
    }

    private fun handleRLVCommand(uuid: UUID?, strIn: String) {
        Debug.Printf("RLV command: '%s'", strIn)
        var str = strIn
        var str2 = ""
        var str3 = ""
        val indexOf = str.indexOf('=')
        if (indexOf >= 0) {
            str2 = str.substring(indexOf + 1)
            str = str.substring(0, indexOf)
        }
        val index = str.indexOf(':')
        if (index >= 0) {
            str3 = str.substring(index + 1)
            str = str.substring(0, index)
        }
        handleRLVCommandParsed(uuid, str, str2, str3)
    }

    private fun handleRLVCommandParsed(uuid: UUID?, str: String, str2: String, str3: String) {
        Debug.Printf("RLV command: '%s' param '%s' option '%s'", str, str2, str3)
        val command = RLVCommands.getCommand(str) ?: return
        val handler = command.getHandler() ?: return
        handler.Handle(this, uuid!!, command, str2, str3)
    }

    private fun handleRLVCommands(uuid: UUID?, str: String) {
        for (str2 in str.split(",")) {
            handleRLVCommand(uuid, str2)
        }
    }

    private fun offerRLVEnable(chatFromSimulator: ChatFromSimulator) {
        this.agentCircuit.HandleChatEvent(this.agentCircuit.getLocalChatterID(), SLEnableRLVOfferEvent(chatFromSimulator, this.agentCircuit.getAgentUUID()), true)
    }

    override fun HandleGlobalOptionsChange() {
        val rlvEnabled = GlobalOptions.getInstance().getRLVEnabled()
        if (rlvEnabled && !this.RLVEnabled && this.RLVEnablingOffered && this.RLVEnablingCommand != null) {
            this.RLVEnablingOffered = false
            Debug.Printf("Enabling accepted, original command: '%s'", this.RLVEnablingCommand)
            handleRLVCommands(this.RLVEnablingUUID, this.RLVEnablingCommand!!)
        }
        this.RLVEnabled = rlvEnabled
    }

    fun autoAcceptTeleport(uuid: UUID): Boolean {
        return this.RLVEnabled && this.restrictions.isAllowed(RLVRestrictionType.accepttp, uuid.toString(), null)
    }

    fun canDetachItem(i: Int, uuid: UUID?): Boolean {
        var str: String? = null
        if (!this.RLVEnabled) {
            return true
        }
        if (i >= 0 && i < 56) {
            val attachmentPoint = SLAttachmentPoint.attachmentPoints[i]
            if (attachmentPoint != null) {
                str = attachmentPoint.name
            }
        }
        return str == null || this.restrictions.isAllowed(RLVRestrictionType.detach, str, uuid)
    }

    fun canRecvChat(str: String, uuid: UUID): Boolean {
        return !this.RLVEnabled || str.startsWith("/") || this.restrictions.isAllowed(RLVRestrictionType.recvchat, uuid.toString(), null)
    }

    fun canRecvIM(uuid: UUID): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.recvim, uuid.toString(), null)
    }

    fun canSendIM(uuid: UUID): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.sendim, uuid.toString(), null)
    }

    fun canShowInventory(): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.showinv, "", null)
    }

    fun canSit(): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.sit, "", null)
    }

    fun canStandUp(): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.unsit, "", null)
    }

    fun canTakeItemOff(wearableType: SLWearableType): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.remoutfit, wearableType.getName(), null)
    }

    fun canTeleportBySitting(): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.sittp, "", null)
    }

    fun canTeleportToLandmark(): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.tplm, "", null)
    }

    fun canTeleportToLocation(): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.tploc, "", null)
    }

    fun canTeleportToLure(uuid: UUID): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.tplure, uuid.toString(), null)
    }

    fun canViewNotecard(): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.viewnote, "", null)
    }

    fun canWearItem(wearableType: SLWearableType): Boolean {
        return !this.RLVEnabled || this.restrictions.isAllowed(RLVRestrictionType.addoutfit, wearableType.getName(), null)
    }

    fun getModules(): SLModules {
        return this.agentCircuit.getModules()!!
    }

    fun getRestrictions(): RLVRestrictions {
        return this.restrictions
    }

    fun onIncomingChat(chatFromSimulator: ChatFromSimulator): Boolean {
        if (chatFromSimulator.ChatData_Field.SourceType.toInt() != 2 || chatFromSimulator.ChatData_Field.ChatType.toInt() != 8) {
            return false
        }
        val stringFromVariableUTF = SLMessage.stringFromVariableUTF(chatFromSimulator.ChatData_Field.Message)
        if (!stringFromVariableUTF.startsWith("@")) {
            return false
        }
        val uuid = chatFromSimulator.ChatData_Field.SourceID
        if (this.RLVEnabled) {
            handleRLVCommands(uuid, stringFromVariableUTF.substring(1))
        } else if (!this.RLVEnablingOffered) {
            this.RLVEnablingOffered = true
            this.RLVEnablingUUID = uuid
            this.RLVEnablingCommand = stringFromVariableUTF.substring(1)
            offerRLVEnable(chatFromSimulator)
        }
        return true
    }

    fun onIncomingIM(improvedInstantMessage: ImprovedInstantMessage): Boolean {
        if (!this.RLVEnabled) {
            return false
        }
        val i = improvedInstantMessage.MessageBlock_Field.Dialog
        val stringFromVariableOEM = SLMessage.stringFromVariableOEM(improvedInstantMessage.MessageBlock_Field.FromAgentName)
        val stringFromVariableUTF = SLMessage.stringFromVariableUTF(improvedInstantMessage.MessageBlock_Field.Message)
        Debug.Printf("IM: type %d from '%s' text '%s'", i, stringFromVariableOEM, stringFromVariableUTF)
        if (i.toInt() == 0) {
            if (stringFromVariableUTF.equals("@version", ignoreCase = true)) {
                this.agentCircuit.SendInstantMessage(improvedInstantMessage.AgentData_Field.AgentID, RLVCmdVersion.getManualVersionReply())
                return true
            }
        }
        return false
    }

    fun onSendLocalChat(i: Int, str: String): Boolean {
        if (!this.RLVEnabled) {
            return true
        }
        if (i == 0) {
            if (!str.startsWith("/")) {
                val targetsForRestriction = this.restrictions.getTargetsForRestriction(RLVRestrictionType.redirchat)
                if (targetsForRestriction != null) {
                    for (target in targetsForRestriction) {
                        try {
                            val parseInt = Integer.parseInt(target)
                            val chatFromViewer = ChatFromViewer()
                            chatFromViewer.AgentData_Field.AgentID = this.circuitInfo.agentID
                            chatFromViewer.AgentData_Field.SessionID = this.circuitInfo.sessionID
                            chatFromViewer.ChatData_Field.Channel = parseInt
                            chatFromViewer.ChatData_Field.Type = 1
                            chatFromViewer.ChatData_Field.Message = SLMessage.stringToVariableUTF(str)
                            chatFromViewer.isReliable = true
                            SendMessage(chatFromViewer)
                        } catch (e: NumberFormatException) {
                            Debug.Warning(e)
                        }
                    }
                }
                if (!this.restrictions.isAllowed(RLVRestrictionType.sendchat, "", null)) {
                    return false
                }
            }
        } else if (!this.restrictions.isAllowed(RLVRestrictionType.sendchannel, Integer.toString(i), null)) {
            return false
        }
        return true
    }

    fun sayOnChannel(i: Int, str: String) {
        Debug.Printf("RLV reply (%d): '%s'", i, str)
        val chatFromViewer = ChatFromViewer()
        chatFromViewer.AgentData_Field.AgentID = this.circuitInfo.agentID
        chatFromViewer.AgentData_Field.SessionID = this.circuitInfo.sessionID
        chatFromViewer.ChatData_Field.Channel = i
        chatFromViewer.ChatData_Field.Type = 1
        chatFromViewer.ChatData_Field.Message = SLMessage.stringToVariableUTF(str)
        chatFromViewer.isReliable = true
        SendMessage(chatFromViewer)
    }

    fun teleportToGlobalPos(uuid: UUID, vector3: LLVector3) {
        if (this.RLVEnabled && this.restrictions.isAllowed(RLVRestrictionType.tploc, "", null, uuid)) {
            this.agentCircuit.TeleportToGlobalPosition(vector3)
        }
    }
}
