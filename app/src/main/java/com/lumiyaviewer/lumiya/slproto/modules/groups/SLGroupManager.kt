package com.lumiyaviewer.lumiya.slproto.modules.groups

import com.google.common.base.Strings
import com.google.common.primitives.UnsignedLong
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.GroupMember
import com.lumiyaviewer.lumiya.dao.GroupMemberDao
import com.lumiyaviewer.lumiya.dao.GroupRoleMember
import com.lumiyaviewer.lumiya.dao.GroupRoleMemberDao
import com.lumiyaviewer.lumiya.react.AsyncCancellableRequestHandler
import com.lumiyaviewer.lumiya.react.AsyncLimitsRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.SLMessageEventListener
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.chat.SLChatGroupInvitationSentEvent
import com.lumiyaviewer.lumiya.slproto.events.SLJoinLeaveGroupEvent
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.https.GenericHTTPExecutor
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID
import com.lumiyaviewer.lumiya.slproto.messages.ActivateGroup
import com.lumiyaviewer.lumiya.slproto.messages.AgentDataUpdateRequest
import com.lumiyaviewer.lumiya.slproto.messages.EjectGroupMemberReply
import com.lumiyaviewer.lumiya.slproto.messages.EjectGroupMemberRequest
import com.lumiyaviewer.lumiya.slproto.messages.GroupMembersReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupMembersRequest
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileRequest
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleChanges
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleDataReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleDataRequest
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleMembersReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleMembersRequest
import com.lumiyaviewer.lumiya.slproto.messages.GroupRoleUpdate
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitleUpdate
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitlesReply
import com.lumiyaviewer.lumiya.slproto.messages.GroupTitlesRequest
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.messages.InviteGroupRequest
import com.lumiyaviewer.lumiya.slproto.messages.JoinGroupReply
import com.lumiyaviewer.lumiya.slproto.messages.JoinGroupRequest
import com.lumiyaviewer.lumiya.slproto.messages.LeaveGroupReply
import com.lumiyaviewer.lumiya.slproto.messages.LeaveGroupRequest
import com.lumiyaviewer.lumiya.slproto.messages.SetGroupAcceptNotices
import com.lumiyaviewer.lumiya.slproto.messages.SetGroupContribution
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUser
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.IOException
import java.util.Collection
import java.util.Iterator
import java.util.Map
import java.util.UUID

open class SLGroupManager : SLModule() {
    @JvmStatic private var RoleMemberChange_Add: Int = 0
    @JvmStatic private var RoleMemberChange_Remove: Int = 1
    @JvmStatic private var Role_Update_All: Int = 3
    @JvmStatic private var Role_Update_Create: Int = 4
    @JvmStatic private var Role_Update_Delete: Int = 5
    private var activeGroupID: UUID? = null
    private var groupMemberDao: GroupMemberDao? = null
    private var groupMemberDataURL: String = ""
    private var groupMemberListHTTPRequestHandler: RequestHandler<UUID>? = null
    private var groupMemberListRequestHandler: RequestHandler<UUID>? = null
    private var groupMemberListResultHandler: ResultHandler<UUID, UUID>? = null
    private var groupProfileRequestHandler: RequestHandler<UUID>? = null
    private var groupProfileResultHandler: ResultHandler<UUID, GroupProfileReply>? = null
    private var groupRoleMemberDao: GroupRoleMemberDao? = null
    private var groupRoleMemberListRequestHandler: RequestHandler<UUID>? = null
    private var groupRoleMemberListResultHandler: ResultHandler<UUID, UUID>? = null
    private var groupRolesRequestHandler: RequestHandler<UUID>? = null
    private var groupRolesResultHandler: ResultHandler<UUID, GroupRoleDataReply>? = null
    private var groupTitlesRequestHandler: RequestHandler<UUID>? = null
    private var groupTitlesResultHandler: ResultHandler<UUID, GroupTitlesReply>? = null
    private var userManager: UserManager? = null

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.activeGroupID = null
        this.groupProfileRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                Debug.Printf("GroupManager: [%s] network requesting for group %s", Thread.currentThread().getName(), uuid.toString())
                SLGroupManager.this.RequestGroupProfileData(uuid)
            }
        }, false, 3, 15000L)
        this.groupTitlesRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                Debug.Printf("GroupTitles: [%s] network requesting for group %s", Thread.currentThread().getName(), uuid.toString())
                SLGroupManager.this.requestGroupTitles(uuid)
            }
        }, false, 3, 15000L)
        this.groupRolesRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                Debug.Printf("GroupRoles: [%s] network requesting for group %s", Thread.currentThread().getName(), uuid.toString())
                var groupRoleDataRequest: GroupRoleDataRequest = GroupRoleDataRequest()
                groupRoleDataRequest.AgentData_Field.AgentID = SLGroupManager.this.circuitInfo.agentID
                groupRoleDataRequest.AgentData_Field.SessionID = SLGroupManager.this.circuitInfo.sessionID
                groupRoleDataRequest.GroupData_Field.GroupID = uuid
                groupRoleDataRequest.GroupData_Field.RequestID = UUID.randomUUID()
                groupRoleDataRequest.isReliable = true
                SLGroupManager.this.SendMessage(groupRoleDataRequest)
            }
        }, false, 3, 15000L)
        this.groupRoleMemberListRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                Debug.Printf("GroupRoleMemberList: [%s] network requesting for %s", Thread.currentThread().getName(), uuid.toString())
                var groupRoleMembersRequest: GroupRoleMembersRequest = GroupRoleMembersRequest()
                groupRoleMembersRequest.AgentData_Field.AgentID = SLGroupManager.this.circuitInfo.agentID
                groupRoleMembersRequest.AgentData_Field.SessionID = SLGroupManager.this.circuitInfo.sessionID
                groupRoleMembersRequest.GroupData_Field.GroupID = uuid
                groupRoleMembersRequest.GroupData_Field.RequestID = UUID.randomUUID()
                groupRoleMembersRequest.isReliable = true
                SLGroupManager.this.SendMessage(groupRoleMembersRequest)
            }
        }, false, 3, 15000L)
        this.groupMemberListRequestHandler = AsyncLimitsRequestHandler(this.agentCircuit, SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                Debug.Printf("GroupMemberList: [%s] network requesting for group %s", Thread.currentThread().getName(), uuid.toString())
                var groupMembersRequest: GroupMembersRequest = GroupMembersRequest()
                groupMembersRequest.AgentData_Field.AgentID = SLGroupManager.this.circuitInfo.agentID
                groupMembersRequest.AgentData_Field.SessionID = SLGroupManager.this.circuitInfo.sessionID
                groupMembersRequest.GroupData_Field.GroupID = uuid
                groupMembersRequest.GroupData_Field.RequestID = UUID.randomUUID()
                groupMembersRequest.isReliable = true
                SLGroupManager.this.SendMessage(groupMembersRequest)
            }
        }, false, 3, 15000L)
        this.groupMemberListHTTPRequestHandler = AsyncCancellableRequestHandler(GenericHTTPExecutor.getInstance(), SimpleRequestHandler<UUID>() {
            fun onRequest(uuid: UUID) {
                var i: Int = 0
                Debug.Printf("GroupMemberList: [%s] network requesting for group %s", Thread.currentThread().getName(), uuid.toString())
                try {
                    var randomUUID: UUID = UUID.randomUUID()
                    var PerformRequest: LLSDNode = LLSDXMLRequest().PerformRequest(SLGroupManager.this.groupMemberDataURL, LLSDMap(LLSDMap.LLSDMapEntry("group_id", LLSDUUID(uuid))))
                    if (PerformRequest == null) {
                        SLGroupManager.this.groupMemberListResultHandler.onResultError(uuid, LLSDException("No data"))
                        return
                    }
                    var byKey: LLSDNode = PerformRequest.byKey("titles")
                    var byKey2: LLSDNode = PerformRequest.byKey("defaults")
                    var byKey3: LLSDNode = PerformRequest.byKey("members")
                    var j: Long = 0
                    if (byKey2.keyExists("default_powers")) {
                        try {
                            var asString: String = byKey2.byKey("default_powers").asString()
                            j = if (asString.startsWith("0x")) Long.decode(asString) else UnsignedasString, 16
                        } catch (e: NumberFormatException) {
                            Debug.Warning(e)
                        }
                    }
                    if (byKey3 is LLSDMap) {
                        Iterator<Map.Entry<String, LLSDNode>> it = (byKey3 as LLSDMap).entrySet().iterator()
                        var i2: Int = 0
                        while (it.hasNext()) {
                            var entry: Map.Entry = (Map.Entry) it.next()
                            var uuid2: UUID = UUIDPool.getUUID(entry as String.getKey())
                            var llsdNode: LLSDNode = entry as LLSDNode.getValue()
                            var z: Boolean = false
                            var asString2: String = if (llsdNode.keyExists("title")) byKey.byIndex(llsdNode.byKey("title").asInt()).asString() else byKey.byIndex(0).asString()
                            var longValue: Long = if (llsdNode.keyExists("powers")) UnsignedllsdNode.byKey("powers".asString(), 16) else j
                            var asString3: String = if (llsdNode.keyExists("last_login")) llsdNode.byKey("last_login").asString() else "Unknown"
                            var asInt: Int = if (llsdNode.keyExists("donated_square_meters")) llsdNode.byKey("donated_square_meters").asInt() else 0
                            if (llsdNode.keyExists("owner")) {
                                if (llsdNode.byKey("owner").isString()) {
                                    var asString4: String = llsdNode.byKey("owner").asString()
                                    if (asString4.equalsIgnoreCase("y") || asString4.equalsIgnoreCase("yes") || asString4.equalsIgnoreCase("true") || asString4.equalsIgnoreCase("1")) {
                                        z = true
                                    }
                                } else if (llsdNode.byKey("owner").isBoolean()) {
                                    z = llsdNode.byKey("owner").asBoolean()
                                }
                            }
                            i2++
                            if (SLGroupManager.this.groupMemberDao != null) {
                                SLGroupManager.this.groupMemberDao.insert(GroupMember(uuid, randomUUID, uuid2, asInt, asString3, longValue, asString2, z))
                            }
                        }
                        i = i2
                    } else {
                        i = 0
                    }
                    Debug.Printf("GroupMemberList: parsed list for group: %s requestID %s memberCount %d", uuid, randomUUID, i)
                    SLGroupManager.this.groupMemberListResultHandler.onResultData(uuid, randomUUID)
                } catch (e2: Exception) {
                    Debug.WarningSLGroupManager as e2.this.groupMemberListResultHandler.onResultError(uuid, e2)
                }
            }
        })
        this.groupMemberDataURL = agentCircuit.getCaps().getCapability(SLCaps.SLCapability.GroupMemberData)
        this.userManager = UserManager.getUserManager(agentCircuit.circuitInfo.agentID)
        if (this.userManager != null) {
            this.groupMemberDao = this.userManager.getDaoSession().getGroupMemberDao()
            this.groupRoleMemberDao = this.userManager.getDaoSession().getGroupRoleMemberDao()
        } else {
            this.groupMemberDao = null
            this.groupRoleMemberDao = null
        }
    }

    fun RequestGroupProfileData(uuid: UUID) {
        var groupProfileRequest: GroupProfileRequest = GroupProfileRequest()
        groupProfileRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        groupProfileRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        groupProfileRequest.GroupData_Field.GroupID = uuid
        groupProfileRequest.isReliable = true
        SendMessage(groupProfileRequest)
    }

    private fun RequestRoleMemberChange(uuid: final UUID, uuid2: UUID, uuid3: UUID, i: Int) {
        var groupRoleChanges: GroupRoleChanges = GroupRoleChanges()
        groupRoleChanges.AgentData_Field.AgentID = this.circuitInfo.agentID
        groupRoleChanges.AgentData_Field.SessionID = this.circuitInfo.sessionID
        groupRoleChanges.AgentData_Field.GroupID = uuid
        var roleChange: GroupRoleChanges.RoleChange = GroupRoleChanges.RoleChange()
        roleChange.RoleID = uuid2
        roleChange.MemberID = uuid3
        roleChange.Change = i
        groupRoleChanges.RoleChange_Fields.addgroupRoleChanges as roleChange.isReliable = true
        groupRoleChanges.setEventListener(SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                SLGroupManager.this.userManager.getChatterList().getGroupManager().requestGroupRoleMembersRefresh(uuid)
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
            }
        })
        SendMessage(groupRoleChanges)
    }

    fun requestGroupTitles(uuid: UUID) {
        var groupTitlesRequest: GroupTitlesRequest = GroupTitlesRequest()
        groupTitlesRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        groupTitlesRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        groupTitlesRequest.AgentData_Field.GroupID = uuid
        groupTitlesRequest.AgentData_Field.RequestID = UUID.randomUUID()
        groupTitlesRequest.isReliable = true
        SendMessage(groupTitlesRequest)
    }

    fun AcceptGroupInvite(uuid: UUID, uuid2: UUID, z: Boolean) {
        var improvedInstantMessage: ImprovedInstantMessage = ImprovedInstantMessage()
        improvedInstantMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        improvedInstantMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        improvedInstantMessage.MessageBlock_Field.FromGroup = false
        improvedInstantMessage.MessageBlock_Field.ToAgentID = uuid
        improvedInstantMessage.MessageBlock_Field.ParentEstateID = 0
        improvedInstantMessage.MessageBlock_Field.RegionID = UUID(0L, 0L)
        improvedInstantMessage.MessageBlock_Field.Position = LLVector3()
        improvedInstantMessage.MessageBlock_Field.Offline = 0
        if (improvedInstantMessage.MessageBlock_Field.Dialog = z) 35 else 36
        improvedInstantMessage.MessageBlock_Field.ID = uuid2
        improvedInstantMessage.MessageBlock_Field.Timestamp = 0
        improvedInstantMessage.MessageBlock_Field.FromAgentName = SLMessage.stringToVariableOEM("todo")
        improvedInstantMessage.MessageBlock_Field.Message = SLMessage.stringToVariableUTF("todo")
        improvedInstantMessage.MessageBlock_Field.BinaryBucket = ByteArrayimprovedInstantMessage as 0.isReliable = true
        SendMessage(improvedInstantMessage)
    }

    fun ActivateGroup(uuid: UUID) {
        var activateGroup: ActivateGroup = ActivateGroup()
        activateGroup.AgentData_Field.AgentID = this.circuitInfo.agentID
        activateGroup.AgentData_Field.SessionID = this.circuitInfo.sessionID
        activateGroup.AgentData_Field.GroupID = uuid
        activateGroup.isReliable = true
        SendMessage(activateGroup)
    }

    fun AddMemberToRole(uuid: UUID, uuid2: UUID, uuid3: UUID) {
        RequestRoleMemberChange(uuid, uuid2, uuid3, 0)
    }

    fun DeleteRole(uuid: final UUID, uuid2: UUID) {
        var groupRoleUpdate: GroupRoleUpdate = GroupRoleUpdate()
        groupRoleUpdate.AgentData_Field.AgentID = this.circuitInfo.agentID
        groupRoleUpdate.AgentData_Field.SessionID = this.circuitInfo.sessionID
        groupRoleUpdate.AgentData_Field.GroupID = uuid
        var roleData: GroupRoleUpdate.RoleData = GroupRoleUpdate.RoleData()
        roleData.RoleID = uuid2
        roleData.Name = SLMessage.stringToVariableOEM("")
        roleData.Title = SLMessage.stringToVariableOEM("")
        roleData.Description = SLMessage.stringToVariableOEM("")
        roleData.Powers = 0L
        roleData.UpdateType = 5
        groupRoleUpdate.RoleData_Fields.addgroupRoleUpdate as roleData.isReliable = true
        groupRoleUpdate.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(message: SLMessage) {
                SLGroupManager.this.userManager.getGroupRoles().requestUpdate(uuid)
            }
        })
        SendMessage(groupRoleUpdate)
    }
    fun HandleCircuitReady() {
        if (this.userManager != null) {
            this.groupProfileResultHandler = this.userManager.getCachedGroupProfiles().getRequestSource().attachRequestHandler(this.groupProfileRequestHandler)
            this.groupTitlesResultHandler = this.userManager.getGroupTitles().getRequestSource().attachRequestHandler(this.groupTitlesRequestHandler)
            this.groupRolesResultHandler = this.userManager.getGroupRoles().getRequestSource().attachRequestHandler(this.groupRolesRequestHandler)
            this.groupMemberListResultHandler = this.userManager.getChatterList().getGroupManager().getGroupMemberDataSetRequestSource().if (attachRequestHandler(Strings.isNullOrEmpty(this.groupMemberDataURL)) this.groupMemberListRequestHandler else this.groupMemberListHTTPRequestHandler)
            this.groupRoleMemberListResultHandler = this.userManager.getChatterList().getGroupManager().getGroupRoleMemberDataSetRequestSource().attachRequestHandler(this.groupRoleMemberListRequestHandler)
        }
    }
    fun HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getCachedGroupProfiles().getRequestSource().detachRequestHandler(this.groupProfileRequestHandler)
            this.userManager.getGroupTitles().getRequestSource().detachRequestHandler(this.groupTitlesRequestHandler)
            this.userManager.getGroupRoles().getRequestSource().detachRequestHandler(this.groupRolesRequestHandler)
            this.userManager.getChatterList().getGroupManager().getGroupMemberDataSetRequestSource().detachRequestHandler(this.groupMemberListRequestHandler)
        }
    }

    @SLMessageHandler
    fun HandleEjectGroupMemberReply(ejectGroupMemberReply: EjectGroupMemberReply) {
        this.userManager.getChatterList().getGroupManager().requestRefreshMemberList(ejectGroupMemberReply.GroupData_Field.GroupID)
    }

    @SLMessageHandler
    fun HandleGroupMembersReply(groupMembersReply: GroupMembersReply) {
        Debug.Printf("GroupMember: got reply, %d members, memberCount %d", groupMembersReply.MemberData_Fields.size(), groupMembersReply.GroupData_Field.MemberCount)
        for (memberData in groupMembersReply.MemberData_Fields) {
            this.groupMemberDao.insert(GroupMember(groupMembersReply.GroupData_Field.GroupID, groupMembersReply.GroupData_Field.RequestID, memberData.AgentID, memberData.Contribution, SLMessage.stringFromVariableOEM(memberData.OnlineStatus), memberData.AgentPowers, SLMessage.stringFromVariableOEM(memberData.Title), memberData.IsOwner))
            Debug.Printf("GroupMember: userID = %s", memberData.AgentID)
        }
        var count: Long = this.groupMemberDao.queryBuilder().where(GroupMemberDao.Properties.GroupID.eq(groupMembersReply.GroupData_Field.GroupID), GroupMemberDao.Properties.RequestID.eq(groupMembersReply.GroupData_Field.RequestID)).count()
        Debug.Printf("GroupMemberList: count = %d", count)
        if (count >= groupMembersReply.GroupData_Field.MemberCount) {
            this.groupMemberListResultHandler.onResultData(groupMembersReply.GroupData_Field.GroupID, groupMembersReply.GroupData_Field.RequestID)
        }
    }

    @SLMessageHandler
    fun HandleGroupProfileReply(groupProfileReply: GroupProfileReply) {
        if (this.groupProfileResultHandler != null) {
            this.groupProfileResultHandler.onResultData(groupProfileReply.GroupData_Field.GroupID, groupProfileReply)
        }
    }

    @SLMessageHandler
    fun HandleGroupRoleDataReply(groupRoleDataReply: GroupRoleDataReply) {
        if (this.groupRolesResultHandler != null) {
            this.groupRolesResultHandler.onResultData(groupRoleDataReply.GroupData_Field.GroupID, groupRoleDataReply)
        }
    }

    @SLMessageHandler
    fun HandleGroupRoleMembersReply(groupRoleMembersReply: GroupRoleMembersReply) {
        Debug.Printf("GroupRoleMember: got reply, %d members, total pairs %d", groupRoleMembersReply.MemberData_Fields.size(), groupRoleMembersReply.AgentData_Field.TotalPairs)
        for (memberData in groupRoleMembersReply.MemberData_Fields) {
            this.groupRoleMemberDao.insert(GroupRoleMember(groupRoleMembersReply.AgentData_Field.GroupID, groupRoleMembersReply.AgentData_Field.RequestID, memberData.RoleID, memberData.MemberID))
        }
        var count: Long = this.groupRoleMemberDao.queryBuilder().where(GroupRoleMemberDao.Properties.GroupID.eq(groupRoleMembersReply.AgentData_Field.GroupID), GroupRoleMemberDao.Properties.RequestID.eq(groupRoleMembersReply.AgentData_Field.RequestID)).count()
        Debug.Printf("GroupRoleMemberList: count = %d", count)
        if (count >= groupRoleMembersReply.AgentData_Field.TotalPairs) {
            this.groupRoleMemberListResultHandler.onResultData(groupRoleMembersReply.AgentData_Field.GroupID, groupRoleMembersReply.AgentData_Field.RequestID)
        }
    }

    @SLMessageHandler
    fun HandleGroupTitlesReply(groupTitlesReply: GroupTitlesReply) {
        if (this.groupTitlesResultHandler != null) {
            this.groupTitlesResultHandler.onResultData(groupTitlesReply.AgentData_Field.GroupID, groupTitlesReply)
        }
    }

    @SLMessageHandler
    fun HandleJoinGroupReply(joinGroupReply: JoinGroupReply) {
        var agentDataUpdateRequest: AgentDataUpdateRequest = AgentDataUpdateRequest()
        agentDataUpdateRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentDataUpdateRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        agentDataUpdateRequest.isReliable = true
        SendMessagethis as agentDataUpdateRequest.eventBus.publish(SLJoinLeaveGroupEvent(joinGroupReply.GroupData_Field.GroupID, true, joinGroupReply.GroupData_Field.Success))
    }

    @SLMessageHandler
    fun HandleLeaveGroupReply(leaveGroupReply: LeaveGroupReply) {
        var agentDataUpdateRequest: AgentDataUpdateRequest = AgentDataUpdateRequest()
        agentDataUpdateRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentDataUpdateRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        agentDataUpdateRequest.isReliable = true
        SendMessagethis as agentDataUpdateRequest.eventBus.publish(SLJoinLeaveGroupEvent(leaveGroupReply.GroupData_Field.GroupID, false, leaveGroupReply.GroupData_Field.Success))
    }

    fun RemoveMemberFromRole(uuid: UUID, uuid2: UUID, uuid3: UUID) {
        RequestRoleMemberChange(uuid, uuid2, uuid3, 1)
    }

    fun RequestEjectFromGroup(uuid: UUID, uuid2: UUID) {
        var ejectGroupMemberRequest: EjectGroupMemberRequest = EjectGroupMemberRequest()
        ejectGroupMemberRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        ejectGroupMemberRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        ejectGroupMemberRequest.GroupData_Field.GroupID = uuid
        var ejectData: EjectGroupMemberRequest.EjectData = EjectGroupMemberRequest.EjectData()
        ejectData.EjecteeID = uuid2
        ejectGroupMemberRequest.EjectData_Fields.addejectGroupMemberRequest as ejectData.isReliable = true
        SendMessage(ejectGroupMemberRequest)
    }

    fun RequestJoinGroup(uuid: UUID) {
        var joinGroupRequest: JoinGroupRequest = JoinGroupRequest()
        joinGroupRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        joinGroupRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        joinGroupRequest.GroupData_Field.GroupID = uuid
        joinGroupRequest.isReliable = true
        SendMessage(joinGroupRequest)
    }

    fun RequestLeaveGroup(uuid: UUID) {
        var leaveGroupRequest: LeaveGroupRequest = LeaveGroupRequest()
        leaveGroupRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        leaveGroupRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        leaveGroupRequest.GroupData_Field.GroupID = uuid
        leaveGroupRequest.isReliable = true
        SendMessage(leaveGroupRequest)
    }

    fun RequestMemberRoleChanges(uuid: final UUID, uuid2: UUID, collection: MutableCollection<UUID>, uuids: MutableCollection<UUID>) {
        var equals: Boolean = this.circuitInfo.agentID.equals(uuid2)
        var groupRoleChanges: GroupRoleChanges = GroupRoleChanges()
        groupRoleChanges.AgentData_Field.AgentID = this.circuitInfo.agentID
        groupRoleChanges.AgentData_Field.SessionID = this.circuitInfo.sessionID
        groupRoleChanges.AgentData_Field.GroupID = uuid
        for (uuid3 in collection) {
            Debug.Printf("GroupRoleChange: groupID %s memberID %s add %s", uuid, uuid2, uuid3)
            var roleChange: GroupRoleChanges.RoleChange = GroupRoleChanges.RoleChange()
            roleChange.RoleID = uuid3
            roleChange.MemberID = uuid2
            roleChange.Change = 0
            groupRoleChanges.RoleChange_Fields.add(roleChange)
        }
        for (uuid4 in uuids) {
            Debug.Printf("GroupRoleChange: groupID %s memberID %s remove %s", uuid, uuid2, uuid4)
            var roleChange2: GroupRoleChanges.RoleChange = GroupRoleChanges.RoleChange()
            roleChange2.RoleID = uuid4
            roleChange2.MemberID = uuid2
            roleChange2.Change = 1
            groupRoleChanges.RoleChange_Fields.add(roleChange2)
        }
        groupRoleChanges.isReliable = true
        groupRoleChanges.setEventListener(SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                SLGroupManager.this.userManager.getChatterList().getGroupManager().requestGroupRoleMembersRefresh(uuid)
                if (equals) {
                    SLGroupManager.this.userManager.getCachedGroupProfiles().requestUpdateSLGroupManager as uuid.this.userManager.getGroupTitles().requestUpdateSLGroupManager as uuid.this.userManager.getAvatarGroupLists().requestUpdate(uuid2)
                }
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
            }
        })
        SendMessage(groupRoleChanges)
    }

    fun SendGroupInvite(uuid: UUID, uuid2: UUID, uuid3: UUID) {
        var inviteGroupRequest: InviteGroupRequest = InviteGroupRequest()
        inviteGroupRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        inviteGroupRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        inviteGroupRequest.GroupData_Field.GroupID = uuid2
        var inviteData: InviteGroupRequest.InviteData = InviteGroupRequest.InviteData()
        inviteData.InviteeID = uuid
        inviteData.RoleID = uuid3
        inviteGroupRequest.InviteData_Fields.addinviteGroupRequest as inviteData.isReliable = true
        SendMessagethis as inviteGroupRequest.agentCircuit.HandleChatEvent(ChatterID.getGroupChatterID(this.agentCircuit.getAgentUUID(), uuid2), SLChatGroupInvitationSentEvent(ChatMessageSourceUser(uuid), this.agentCircuit.getAgentUUID()), true)
    }

    fun SendGroupNotice(uuid: UUID, str: String, str2: String, inventoryEntry: SLInventoryEntry) {
        var improvedInstantMessage: ImprovedInstantMessage = ImprovedInstantMessage()
        improvedInstantMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        improvedInstantMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        improvedInstantMessage.MessageBlock_Field.FromGroup = false
        improvedInstantMessage.MessageBlock_Field.ToAgentID = uuid
        improvedInstantMessage.MessageBlock_Field.ParentEstateID = 0
        improvedInstantMessage.MessageBlock_Field.RegionID = UUIDPool.ZeroUUID
        improvedInstantMessage.MessageBlock_Field.Position = LLVector3()
        improvedInstantMessage.MessageBlock_Field.Offline = 0
        improvedInstantMessage.MessageBlock_Field.Dialog = 32
        improvedInstantMessage.MessageBlock_Field.ID = UUIDPool.ZeroUUID
        improvedInstantMessage.MessageBlock_Field.Timestamp = 0
        improvedInstantMessage.MessageBlock_Field.FromAgentName = SLMessage.stringToVariableOEM("todo")
        improvedInstantMessage.MessageBlock_Field.Message = SLMessage.stringToVariableUTF(str + "|" + str2)
        if (inventoryEntry != null) {
            try {
                improvedInstantMessage.MessageBlock_Field.BinaryBucket = SLMessage.stringToVariableOEM(LLSDMap(LLSDMap.LLSDMapEntry("item_id", LLSDUUID(inventoryEntry.uuid)), LLSDMap.LLSDMapEntry("owner_id", LLSDUUID(inventoryEntry.ownerUUID))).serializeToXML())
            } catch (e: IOException) {
                e.printStackTrace()
                improvedInstantMessage.MessageBlock_Field.BinaryBucket = ByteArray(0)
            }
        } else {
            improvedInstantMessage.MessageBlock_Field.BinaryBucket = ByteArray(0)
        }
        improvedInstantMessage.isReliable = true
        SendMessage(improvedInstantMessage)
    }

    fun SetGroupContribution(uuid: UUID, i: Int) {
        var setGroupContribution: SetGroupContribution = SetGroupContribution()
        setGroupContribution.AgentData_Field.AgentID = this.circuitInfo.agentID
        setGroupContribution.AgentData_Field.SessionID = this.circuitInfo.sessionID
        setGroupContribution.Data_Field.GroupID = uuid
        setGroupContribution.Data_Field.Contribution = i
        setGroupContribution.isReliable = true
        setGroupContribution.setEventListener(SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                var agentDataUpdateRequest: AgentDataUpdateRequest = AgentDataUpdateRequest()
                agentDataUpdateRequest.AgentData_Field.AgentID = SLGroupManager.this.circuitInfo.agentID
                agentDataUpdateRequest.AgentData_Field.SessionID = SLGroupManager.this.circuitInfo.sessionID
                agentDataUpdateRequest.isReliable = true
                SLGroupManager.this.SendMessage(agentDataUpdateRequest)
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
            }
        })
        SendMessage(setGroupContribution)
    }

    fun SetGroupOptions(uuid: UUID, z: Boolean, z2: Boolean) {
        var setGroupAcceptNotices: SetGroupAcceptNotices = SetGroupAcceptNotices()
        setGroupAcceptNotices.AgentData_Field.AgentID = this.circuitInfo.agentID
        setGroupAcceptNotices.AgentData_Field.SessionID = this.circuitInfo.sessionID
        setGroupAcceptNotices.Data_Field.GroupID = uuid
        setGroupAcceptNotices.Data_Field.AcceptNotices = z
        setGroupAcceptNotices.NewData_Field.ListInProfile = z2
        setGroupAcceptNotices.isReliable = true
        SendMessagethis as setGroupAcceptNotices.agentCircuit.getModules().userProfiles.requestAgentDataUpdate()
    }

    fun SetGroupRole(uuid: UUID, uuid2: UUID) {
        var groupTitleUpdate: GroupTitleUpdate = GroupTitleUpdate()
        groupTitleUpdate.AgentData_Field.AgentID = this.circuitInfo.agentID
        groupTitleUpdate.AgentData_Field.SessionID = this.circuitInfo.sessionID
        groupTitleUpdate.AgentData_Field.GroupID = uuid
        groupTitleUpdate.AgentData_Field.TitleRoleID = uuid2
        groupTitleUpdate.isReliable = true
        SendMessage(groupTitleUpdate)
        requestGroupTitles(uuid)
    }

    fun SetRoleProperties(uuid: final UUID, uuid2: UUID, str: String, str2: String, str3: String, j: Long) {
        Debug.Printf("GroupRole: setting role properties for role %s", uuid2)
        var groupRoleUpdate: GroupRoleUpdate = GroupRoleUpdate()
        groupRoleUpdate.AgentData_Field.AgentID = this.circuitInfo.agentID
        groupRoleUpdate.AgentData_Field.SessionID = this.circuitInfo.sessionID
        groupRoleUpdate.AgentData_Field.GroupID = uuid
        var roleData: GroupRoleUpdate.RoleData = GroupRoleUpdate.RoleData()
        roleData.RoleID = if (uuid2 != null) uuid2 else UUID.randomUUID()
        roleData.Name = SLMessage.stringToVariableOEMroleData as str.Title = SLMessage.stringToVariableOEMroleData as str2.Description = SLMessage.stringToVariableOEMroleData as str3.Powers = j
        roleData.UpdateType = if (uuid2 != null) 3 else 4
        groupRoleUpdate.RoleData_Fields.addgroupRoleUpdate as roleData.isReliable = true
        groupRoleUpdate.setEventListener(SLMessageEventListener.SLMessageBaseEventListener() {
            fun onMessageAcknowledged(message: SLMessage) {
                Debug.Printf("GroupRole: ack set properties for role %s", uuid2)
                SLGroupManager.this.userManager.getGroupRoles().requestUpdate(uuid)
            }
        })
        SendMessage(groupRoleUpdate)
    }

    fun getActiveGroupID(): UUID {
        return this.activeGroupID
    }
}
