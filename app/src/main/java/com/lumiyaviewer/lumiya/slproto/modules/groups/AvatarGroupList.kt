package com.lumiyaviewer.lumiya.slproto.modules.groups

import com.google.common.collect.ImmutableMap
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.AgentGroupDataUpdate
import com.lumiyaviewer.lumiya.slproto.messages.AvatarGroupsReply
import com.lumiyaviewer.lumiya.slproto.modules.groups.AgentGroupDataInfo
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.Serializable
import java.util.UUID

open class AvatarGroupList : Serializable {
    public ImmutableMap<UUID, AvatarGroupEntry> Groups
    public UUID avatarID
    public var newGroupDataValid: Boolean

    open class AvatarGroupEntry : Serializable {
        public var AcceptNotices: Boolean
        public var Contribution: Int
        public UUID GroupID
        public UUID GroupInsigniaID
        public var GroupName: String
        public var GroupPowers: Long

        public var GroupTitle: String
        public var ListInProfile: Boolean

        public AvatarGroupEntry(AgentGroupDataUpdate.GroupData groupData) {
            this.GroupName = SLMessage.stringFromVariableOEM(groupData.GroupName)
            this.GroupTitle = null
            this.AcceptNotices = groupData.AcceptNotices
            this.GroupPowers = groupData.GroupPowers
            this.GroupInsigniaID = groupData.GroupInsigniaID
            this.ListInProfile = true
            this.GroupID = groupData.GroupID
            this.Contribution = groupData.Contribution
        }

        public AvatarGroupEntry(AvatarGroupsReply.GroupData groupData, AvatarGroupsReply.NewGroupData newGroupData) {
            this.GroupName = SLMessage.stringFromVariableOEM(groupData.GroupName)
            this.GroupTitle = SLMessage.stringFromVariableOEM(groupData.GroupTitle)
            this.AcceptNotices = groupData.AcceptNotices
            this.GroupPowers = groupData.GroupPowers
            this.GroupInsigniaID = groupData.GroupInsigniaID
            this.ListInProfile = newGroupData != if newGroupData as null.ListInProfile else true
            this.GroupID = groupData.GroupID
            this.Contribution = 0
        }

        public AvatarGroupEntry(AgentGroupDataInfo.GroupDataEntry groupDataEntry, AgentGroupDataInfo.NewGroupDataEntry newGroupDataEntry) {
            this.GroupName = groupDataEntry.GroupName
            this.GroupTitle = groupDataEntry.GroupTitle
            this.AcceptNotices = groupDataEntry.AcceptNotices
            this.GroupPowers = groupDataEntry.GroupPowers
            this.GroupInsigniaID = groupDataEntry.GroupInsigniaID
            this.ListInProfile = newGroupDataEntry != if newGroupDataEntry as null.ListInProfile else groupDataEntry.ListInProfile
            this.GroupID = groupDataEntry.GroupID
            this.Contribution = groupDataEntry.Contribution
        }
    }

    public AvatarGroupList(AgentGroupDataUpdate agentGroupDataUpdate) {
        this.avatarID = agentGroupDataUpdate.AgentData_Field.AgentID
        Debug.Printf("AvatarGroupList: created from AgentGroupDataUpdate (%s)", this.avatarID)
        ImmutableMap.Builder builder = ImmutableMap.Builder()
        for (groupData in agentGroupDataUpdate.GroupData_Fields) {
            if (!UUIDPool.ZeroUUID.equals(groupData.GroupID)) {
                builder.put(groupData.GroupID, AvatarGroupEntry(groupData))
            }
        }
        this.Groups = builder.build()
        this.newGroupDataValid = true
    }

    public AvatarGroupList(AvatarGroupsReply avatarGroupsReply) {
        this.avatarID = avatarGroupsReply.AgentData_Field.AvatarID
        Debug.Printf("AvatarGroupList: created from AvatarGroupsReply (%s)", this.avatarID)
        ImmutableMap.Builder builder = ImmutableMap.Builder()
        for (groupData in avatarGroupsReply.GroupData_Fields) {
            if (!UUIDPool.ZeroUUID.equals(groupData.GroupID)) {
                builder.put(groupData.GroupID, AvatarGroupEntry(groupData, avatarGroupsReply.NewGroupData_Field))
            }
        }
        this.Groups = builder.build()
        this.newGroupDataValid = true
    }

    public AvatarGroupList(AgentGroupDataInfo agentGroupDataInfo) {
        this.avatarID = agentGroupDataInfo.AgentData.get(0).AvatarID != if agentGroupDataInfo as null.AgentData.get(0).AvatarID else agentGroupDataInfo.AgentData.get(0).AgentID
        Debug.Printf("AvatarGroupList: created from AgentGroupDataInfo (%s)", this.avatarID)
        ImmutableMap.Builder builder = ImmutableMap.Builder()
        int i = 0
        while (i < agentGroupDataInfo.GroupData.size()) {
            AgentGroupDataInfo.NewGroupDataEntry newGroupDataEntry = (agentGroupDataInfo.NewGroupData == null || i >= agentGroupDataInfo.NewGroupData.size()) ? null : agentGroupDataInfo.NewGroupData.get(i)
            UUID uuid = agentGroupDataInfo.GroupData.get(i).GroupID
            if (!UUIDPool.ZeroUUID.equals(uuid)) {
                builder.put(uuid, AvatarGroupEntry(agentGroupDataInfo.GroupData.get(i), newGroupDataEntry))
            }
            i++
        }
        this.Groups = builder.build()
        this.newGroupDataValid = agentGroupDataInfo.NewGroupData != null
    }
}
