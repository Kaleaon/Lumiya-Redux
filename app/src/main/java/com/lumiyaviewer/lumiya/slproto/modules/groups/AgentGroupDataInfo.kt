package com.lumiyaviewer.lumiya.slproto.modules.groups

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDSerialized
import java.util.List
import java.util.UUID

open class AgentGroupDataInfo {

    @LLSDSerialized
    public List<AgentDataEntry> AgentData

    @LLSDSerialized
    public List<GroupDataEntry> GroupData

    @LLSDSerialized
    public List<NewGroupDataEntry> NewGroupData

    open class AgentDataEntry {

        @LLSDSerialized
        public UUID AgentID

        @LLSDSerialized
        public UUID AvatarID
    }

    open class GroupDataEntry {

        @LLSDSerialized
        public var AcceptNotices: Boolean

        @LLSDSerialized
        public var Contribution: Int

        @LLSDSerialized
        public UUID GroupID

        @LLSDSerialized
        public UUID GroupInsigniaID

        @LLSDSerialized
        public var GroupName: String

        @LLSDSerialized
        public var GroupPowers: Long

        @LLSDSerialized
        public var GroupTitle: String

        @LLSDSerialized
        public var ListInProfile: Boolean
    }

    open class NewGroupDataEntry {

        @LLSDSerialized
        public var ListInProfile: Boolean
    }
}
