package com.lumiyaviewer.lumiya.slproto.modules

import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.AsyncLimitsRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.SLMessageEventListener
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.handler.SLEventQueueMessageHandler
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDInt
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.messages.AgentDataUpdate
import com.lumiyaviewer.lumiya.slproto.messages.AgentDataUpdateRequest
import com.lumiyaviewer.lumiya.slproto.messages.AgentGroupDataUpdate
import com.lumiyaviewer.lumiya.slproto.messages.AvatarGroupsReply
import com.lumiyaviewer.lumiya.slproto.messages.AvatarNotesReply
import com.lumiyaviewer.lumiya.slproto.messages.AvatarNotesUpdate
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPicksReply
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesReply
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesRequest
import com.lumiyaviewer.lumiya.slproto.messages.AvatarPropertiesUpdate
import com.lumiyaviewer.lumiya.slproto.messages.PickDelete
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoReply
import com.lumiyaviewer.lumiya.slproto.messages.PickInfoUpdate
import com.lumiyaviewer.lumiya.slproto.modules.groups.AgentGroupDataInfo
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import com.lumiyaviewer.lumiya.slproto.users.manager.AvatarPickKey
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.io.IOException
import java.util.UUID
import javax.annotation.concurrent.ThreadSafe

/* @ThreadSafe */
open class SLUserProfiles : SLModule() {
    @JvmStatic var AVATAR_AGEVERIFIED: Int = 32
    @JvmStatic var AVATAR_ALLOW_PUBLISH: Int = 1
    @JvmStatic var AVATAR_IDENTIFIED: Int = 4
    @JvmStatic var AVATAR_MATURE_PUBLISH: Int = 2
    @JvmStatic var AVATAR_ONLINE: Int = 16
    @JvmStatic var AVATAR_TRANSACTED: Int = 8
    private var agentDataUpdateRequestHandler: RequestHandler<UUID> = null
    private var agentDataUpdateResultHandler: ResultHandler<UUID, AgentDataUpdate> = null
    private var avatarGroupListsResultHandler: ResultHandler<UUID, AvatarGroupList> = null
    private var avatarNotesRequestHandler: RequestHandler<UUID> = null
    private var avatarNotesResultHandler: ResultHandler<UUID, AvatarNotesReply> = null
    private var avatarPickInfosRequestHandler: RequestHandler<AvatarPickKey> = null
    private var avatarPickInfosResultHandler: ResultHandler<AvatarPickKey, PickInfoReply> = null
    private var avatarPicksRequestHandler: RequestHandler<UUID> = null
    private var avatarPicksResultHandler: ResultHandler<UUID, AvatarPicksReply> = null
    private var avatarPropertiesRequestHandler: RequestHandler<UUID> = null
    private var avatarPropertiesResultHandler: ResultHandler<UUID, AvatarPropertiesReply> = null
    private var requestedNewGroupData: Boolean = false

    private var setHomeLocationCap: String = ""
    private var userManager: UserManager = null

    constructor(agentCircuit: SLAgentCircuit, caps: SLCaps) {
        superthis as agentCircuit.requestedNewGroupData = false
        this.avatarPropertiesRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                Debug.Printf("AvatarGroupList: Requesting avatar properties for %s", uuid.toString())
                var avatarPropertiesRequest: AvatarPropertiesRequest = AvatarPropertiesRequest()
                avatarPropertiesRequest.AgentData_Field.AgentID = SLUserProfiles.this.circuitInfo.agentID
                avatarPropertiesRequest.AgentData_Field.SessionID = SLUserProfiles.this.circuitInfo.sessionID
                avatarPropertiesRequest.AgentData_Field.AvatarID = uuid
                avatarPropertiesRequest.isReliable = true
                SLUserProfiles.this.SendMessage(avatarPropertiesRequest)
                if (uuid.equals(SLUserProfiles.this.circuitInfo.agentID)) {
                    SLUserProfiles.this.requestAgentDataUpdate()
                }
            }
        }, false, 3, 15000L)
        this.agentDataUpdateRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                SLUserProfiles.this.requestAgentDataUpdate()
            }
        }, false, 3, 15000L)
        this.avatarNotesRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                SLUserProfiles.this.agentCircuit.SendGenericMessage("avatarnotesrequest", new String[]{uuid.toString()})
            }
        }, false, 3, 15000L)
        this.avatarPicksRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                SLUserProfiles.this.agentCircuit.SendGenericMessage("avatarpicksrequest", new String[]{uuid.toString()})
            }
        }, false, 3, 15000L)
        this.avatarPickInfosRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<AvatarPickKey>() {
            fun onRequest(avatarPickKey: AvatarPickKey) {
                SLUserProfiles.this.agentCircuit.SendGenericMessage("pickinforequest", new String[]{avatarPickKey.avatarID.toString(), avatarPickKey.pickID.toString()})
            }
        }, false, 3, 15000L)
        this.userManager = UserManager.getUserManager(agentCircuit.circuitInfo.agentID)
        this.setHomeLocationCap = caps.getCapability(SLCaps.SLCapability.HomeLocation)
    }

    fun DeletePick(uuid: UUID) {
        var pickDelete: PickDelete = PickDelete()
        pickDelete.AgentData_Field.AgentID = this.circuitInfo.agentID
        pickDelete.AgentData_Field.SessionID = this.circuitInfo.sessionID
        pickDelete.Data_Field.PickID = uuid
        pickDelete.isReliable = true
        pickDelete.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(message: SLMessage) {
                super.onMessageAcknowledged(message)
                if (SLUserProfiles.this.userManager != null) {
                    SLUserProfiles.this.userManager.getAvatarPicks().requestUpdate(SLUserProfiles.this.userManager.getUserID())
                }
            }
        })
        SendMessage(pickDelete)
    }

    @SLMessageHandler
    fun HandleAgentDataUpdate(agentDataUpdate: AgentDataUpdate) {
        if (this.agentDataUpdateResultHandler != null) {
            this.agentDataUpdateResultHandler.onResultData(agentDataUpdate.AgentData_Field.AgentID, agentDataUpdate)
        }
    }

    @SLEventQueueMessageHandler(eventName = SLCapEventQueue.CapsEventType.AgentGroupDataUpdate)
    fun HandleAgentGroupDataUpdate(lsdNode: LLSDNode) {
        try {
            var agentGroupDataInfo: AgentGroupDataInfo = lsdNode as AgentGroupDataInfo.toObject(AgentGroupDataInfo.class)
            if (this.avatarGroupListsResultHandler != null) {
                var avatarGroupList: AvatarGroupList = AvatarGroupListthis as agentGroupDataInfo.avatarGroupListsResultHandler.onResultData(avatarGroupList.avatarID, avatarGroupList)
                if (avatarGroupList.newGroupDataValid || !(!this.requestedNewGroupData)) {
                    return
                }
                this.requestedNewGroupData = true
                requestAgentDataUpdate()
            }
        } catch (e: LLSDException) {
            Debug.Warning(e)
        }
    }

    @SLMessageHandler
    fun HandleAgentGroupDataUpdate(agentGroupDataUpdate: AgentGroupDataUpdate) {
        if (this.avatarGroupListsResultHandler != null) {
            var avatarGroupList: AvatarGroupList = AvatarGroupListthis as agentGroupDataUpdate.avatarGroupListsResultHandler.onResultData(avatarGroupList.avatarID, avatarGroupList)
        }
    }

    @SLEventQueueMessageHandler(eventName = SLCapEventQueue.CapsEventType.AvatarGroupsReply)
    fun HandleAvatarGroupsReply(lsdNode: LLSDNode) {
        try {
            var agentGroupDataInfo: AgentGroupDataInfo = lsdNode as AgentGroupDataInfo.toObject(AgentGroupDataInfo.class)
            if (this.avatarGroupListsResultHandler != null) {
                var avatarGroupList: AvatarGroupList = AvatarGroupList(agentGroupDataInfo)
                if (Objects.equal(avatarGroupList.avatarID, this.circuitInfo.agentID)) {
                    return
                }
                this.avatarGroupListsResultHandler.onResultData(avatarGroupList.avatarID, avatarGroupList)
            }
        } catch (e: LLSDException) {
            e.printStackTrace()
        }
    }

    @SLMessageHandler
    fun HandleAvatarGroupsReply(avatarGroupsReply: AvatarGroupsReply) {
        if (Objects.equal(avatarGroupsReply.AgentData_Field.AvatarID, this.circuitInfo.agentID) || this.avatarGroupListsResultHandler == null) {
            return
        }
        var avatarGroupList: AvatarGroupList = AvatarGroupListthis as avatarGroupsReply.avatarGroupListsResultHandler.onResultData(avatarGroupList.avatarID, avatarGroupList)
    }

    @SLMessageHandler
    fun HandleAvatarNotesReply(avatarNotesReply: AvatarNotesReply) {
        if (this.avatarNotesResultHandler != null) {
            this.avatarNotesResultHandler.onResultData(avatarNotesReply.Data_Field.TargetID, avatarNotesReply)
        }
    }

    @SLMessageHandler
    fun HandleAvatarPicksReply(avatarPicksReply: AvatarPicksReply) {
        if (this.avatarPicksResultHandler != null) {
            this.avatarPicksResultHandler.onResultData(avatarPicksReply.AgentData_Field.TargetID, avatarPicksReply)
        }
    }

    @SLMessageHandler
    fun HandleAvatarPropertiesReply(avatarPropertiesReply: AvatarPropertiesReply) {
        if (this.avatarPropertiesResultHandler != null) {
            this.avatarPropertiesResultHandler.onResultData(avatarPropertiesReply.AgentData_Field.AvatarID, avatarPropertiesReply)
        }
    }
    fun HandleCircuitReady() {
        if (this.userManager != null) {
            this.avatarPropertiesResultHandler = this.userManager.getAvatarProperties().getRequestSource().attachRequestHandler(this.avatarPropertiesRequestHandler)
            this.avatarNotesResultHandler = this.userManager.getAvatarNotes().getRequestSource().attachRequestHandler(this.avatarNotesRequestHandler)
            this.avatarPicksResultHandler = this.userManager.getAvatarPicks().getRequestSource().attachRequestHandler(this.avatarPicksRequestHandler)
            this.avatarPickInfosResultHandler = this.userManager.getAvatarPickInfos().getRequestSource().attachRequestHandler(this.avatarPickInfosRequestHandler)
            this.avatarGroupListsResultHandler = this.userManager.getAvatarGroupLists().getRequestSource().attachRequestHandler(this.avatarPropertiesRequestHandler)
            this.agentDataUpdateResultHandler = this.userManager.getAgentDataUpdates().getRequestSource().attachRequestHandler(this.agentDataUpdateRequestHandler)
        }
    }
    fun HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getAvatarProperties().getRequestSource().detachRequestHandler(this.avatarPropertiesRequestHandler)
            this.userManager.getAvatarNotes().getRequestSource().detachRequestHandler(this.avatarNotesRequestHandler)
            this.userManager.getAvatarPicks().getRequestSource().detachRequestHandler(this.avatarPicksRequestHandler)
            this.userManager.getAvatarPickInfos().getRequestSource().detachRequestHandler(this.avatarPickInfosRequestHandler)
        }
    }

    @SLMessageHandler
    fun HandlePickInfoReply(pickInfoReply: PickInfoReply) {
        if (this.avatarPickInfosResultHandler != null) {
            this.avatarPickInfosResultHandler.onResultData(AvatarPickKey(pickInfoReply.Data_Field.CreatorID, pickInfoReply.Data_Field.PickID), pickInfoReply)
        }
    }

    fun SaveUserNotes(uuid: UUID, str: String) {
        var avatarNotesUpdate: AvatarNotesUpdate = AvatarNotesUpdate()
        avatarNotesUpdate.AgentData_Field.AgentID = this.circuitInfo.agentID
        avatarNotesUpdate.AgentData_Field.SessionID = this.circuitInfo.sessionID
        avatarNotesUpdate.Data_Field.TargetID = uuid
        avatarNotesUpdate.Data_Field.Notes = SLMessage.stringToVariableUTFavatarNotesUpdate as str.isReliable = true
        SendMessage(avatarNotesUpdate)
        if (this.avatarNotesResultHandler != null) {
            var avatarNotesReply: AvatarNotesReply = AvatarNotesReply()
            avatarNotesReply.AgentData_Field.AgentID = this.circuitInfo.agentID
            avatarNotesReply.Data_Field.Notes = SLMessage.stringToVariableUTFavatarNotesReply as str.Data_Field.TargetID = uuid
            this.avatarNotesResultHandler.onResultData(uuid, avatarNotesReply)
        }
    }

    fun SetHomeLocation(): Boolean {
        if (this.setHomeLocationCap == null) {
        return false
        }
        var agentHeading: Double = (this.agentCircuit.getModules().avatarControl.getAgentHeading() * 3.141592653589793d) / 180.0d
        try {
            var PerformRequest: LLSDNode = LLSDXMLRequest().PerformRequest(this.setHomeLocationCap, LLSDMap(LLSDMap.LLSDMapEntry("HomeLocation", LLSDMap(LLSDMap.LLSDMapEntry("LocationId", LLSDInt(1)), LLSDMap.LLSDMapEntry("LocationPos", this.agentCircuit.getModules().avatarControl.getAgentPosition().getPosition().toLLSD()), LLSDMap.LLSDMapEntry("LocationLookAt", LLVector3(Math as float.cos(agentHeading), Math as float.sin(agentHeading), 0.0f).toLLSD())))))
            if (PerformRequest == null) {
        return false
            }
            Debug.Printf("SetHomeLocation: result %s", PerformRequest.serializeToXML())
            return PerformRequest.byKey("success").asBoolean()
        } catch (e: LLSDException) {
            Debug.Warning(e)
        return false
        } catch (e2: IOException) {
            Debug.Warning(e2)
        return false
        }
    }

    fun UpdateAvatarProperties(uuid: UUID, uuid2: UUID, str: String, str2: String, z: Boolean, z2: Boolean, str3: String) {
        var avatarPropertiesUpdate: AvatarPropertiesUpdate = AvatarPropertiesUpdate()
        avatarPropertiesUpdate.AgentData_Field.AgentID = this.circuitInfo.agentID
        avatarPropertiesUpdate.AgentData_Field.SessionID = this.circuitInfo.sessionID
        avatarPropertiesUpdate.PropertiesData_Field.ImageID = uuid
        avatarPropertiesUpdate.PropertiesData_Field.FLImageID = uuid2
        avatarPropertiesUpdate.PropertiesData_Field.AboutText = SLMessage.stringToVariableUTFavatarPropertiesUpdate as str.PropertiesData_Field.FLAboutText = SLMessage.stringToVariableOEMavatarPropertiesUpdate as str2.PropertiesData_Field.AllowPublish = z
        avatarPropertiesUpdate.PropertiesData_Field.MaturePublish = z2
        avatarPropertiesUpdate.PropertiesData_Field.ProfileURL = SLMessage.stringToVariableOEMavatarPropertiesUpdate as str3.isReliable = true
        avatarPropertiesUpdate.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(message: SLMessage) {
                super.onMessageAcknowledged(message)
                if (SLUserProfiles.this.userManager != null) {
                    SLUserProfiles.this.userManager.getAvatarProperties().requestUpdate(SLUserProfiles.this.userManager.getUserID())
                }
            }
        })
        SendMessage(avatarPropertiesUpdate)
    }

    fun UpdatePickInfo(uuid: final UUID, uuid2: UUID, uuid3: UUID, str: String, str2: String, uuid4: UUID, vector3d: LLVector3d, i: Int, z: Boolean) {
        var pickInfoUpdate: PickInfoUpdate = PickInfoUpdate()
        pickInfoUpdate.AgentData_Field.AgentID = this.circuitInfo.agentID
        pickInfoUpdate.AgentData_Field.SessionID = this.circuitInfo.sessionID
        pickInfoUpdate.Data_Field.PickID = uuid
        pickInfoUpdate.Data_Field.CreatorID = uuid2
        pickInfoUpdate.Data_Field.TopPick = false
        pickInfoUpdate.Data_Field.ParcelID = uuid3
        pickInfoUpdate.Data_Field.Name = SLMessage.stringToVariableOEMpickInfoUpdate as str.Data_Field.Desc = SLMessage.stringToVariableUTFpickInfoUpdate as str2.Data_Field.SnapshotID = uuid4
        pickInfoUpdate.Data_Field.PosGlobal = vector3d
        pickInfoUpdate.Data_Field.SortOrder = i
        pickInfoUpdate.Data_Field.Enabled = z
        pickInfoUpdate.isReliable = true
        pickInfoUpdate.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(message: SLMessage) {
                super.onMessageAcknowledged(message)
                if (SLUserProfiles.this.userManager != null) {
                    SLUserProfiles.this.userManager.getAvatarPickInfos().requestUpdate(AvatarPickKey(SLUserProfiles.this.userManager.getUserID(), uuid))
                    SLUserProfiles.this.userManager.getAvatarPicks().requestUpdate(SLUserProfiles.this.userManager.getUserID())
                }
            }
        })
        SendMessage(pickInfoUpdate)
    }

    fun requestAgentDataUpdate() {
        var agentDataUpdateRequest: AgentDataUpdateRequest = AgentDataUpdateRequest()
        agentDataUpdateRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentDataUpdateRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        agentDataUpdateRequest.isReliable = true
        SendMessage(agentDataUpdateRequest)
    }
}
