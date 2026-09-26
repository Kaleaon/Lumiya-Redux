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
        public boolean AcceptNotices

        @LLSDSerialized
        public int Contribution

        @LLSDSerialized
        public UUID GroupID

        @LLSDSerialized
        public UUID GroupInsigniaID

        @LLSDSerialized
        public String GroupName

        @LLSDSerialized
        public long GroupPowers

        @LLSDSerialized
        public String GroupTitle

        @LLSDSerialized
        public boolean ListInProfile
    }

    open class NewGroupDataEntry {

        @LLSDSerialized
        public boolean ListInProfile
    }
}
