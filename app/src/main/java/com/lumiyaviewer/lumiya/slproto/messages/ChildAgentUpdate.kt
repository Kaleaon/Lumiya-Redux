package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.Iterator
import java.util.UUID

/**
 * Child Agent Update - agents send child agents to neighboring simulators.
 * This will create a child camera if there isn't one at the target already
 * Can't send viewer IP and port between simulators -- the port may get remapped
 * if the viewer is behind a Network Address Translation box as NAT.
 * Note: some of the fields of this message really only need to be sent when an
 * agent crosses a region boundary and changes from a child to a main agent
 * (such as Head/BodyRotation, ControlFlags, Animations etc)
 * simulator -> simulator
 * reliable
 *
 * <p>Template: {@code ChildAgentUpdate High 25 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
open class ChildAgentUpdate : SLMessage() {
    var AgentData_Field: AgentData = null
    var GroupData_Fields: ArrayList<GroupData> = ArrayList<>()
    var AnimationData_Fields: ArrayList<AnimationData> = ArrayList<>()
    var GranterBlock_Fields: ArrayList<GranterBlock> = ArrayList<>()
    var NVPairData_Fields: ArrayList<NVPairData> = ArrayList<>()
    var VisualParam_Fields: ArrayList<VisualParam> = ArrayList<>()
    var AgentAccess_Fields: ArrayList<AgentAccess> = ArrayList<>()
    var AgentInfo_Fields: ArrayList<AgentInfo> = ArrayList<>()

    /** Block AgentAccess, Variable. */
    open class AgentAccess {
        public int AgentLegacyAccess; // U8
        public int AgentMaxAccess; // U8
    }

    /** Block AgentData, Single. */
    open class AgentData {
        public UUID ActiveGroupID; // LLUUID
        public int AgentAccess; // U8
        public UUID AgentID; // LLUUID
        public LLVector3 AgentPos; // LLVector3
        public byte[] AgentTextures; // Variable 2
        public LLVector3 AgentVel; // LLVector3
        public boolean AlwaysRun; // BOOL
        public float Aspect; // F32
        public LLVector3 AtAxis; // LLVector3
        public LLQuaternion BodyRotation; // LLQuaternion
        public LLVector3 Center; // LLVector3
        public boolean ChangedGrid; // BOOL
        public int ControlFlags; // U32
        public float EnergyLevel; // F32
        public float Far; // F32
        public int GodLevel; // U8 - Changed from BOOL to U8, and renamed GodLevel (from Godlike)
        public LLQuaternion HeadRotation; // LLQuaternion
        public LLVector3 LeftAxis; // LLVector3
        public int LocomotionState; // U32
        public UUID PreyAgent; // LLUUID
        public long RegionHandle; // U64
        public UUID SessionID; // LLUUID
        public LLVector3 Size; // LLVector3
        public byte[] Throttles; // Variable 1
        public LLVector3 UpAxis; // LLVector3
        public int ViewerCircuitCode; // U32
    }

    /** Block AgentInfo, Variable. */
    open class AgentInfo {
        public int Flags; // U32
    }

    /** Block AnimationData, Variable. */
    open class AnimationData {
        public UUID Animation; // LLUUID
        public UUID ObjectID; // LLUUID
    }

    /** Block GranterBlock, Variable. */
    open class GranterBlock {
        public UUID GranterID; // LLUUID
    }

    /** Block GroupData, Variable. */
    open class GroupData {
        public boolean AcceptNotices; // BOOL
        public UUID GroupID; // LLUUID
        public long GroupPowers; // U64
    }

    /** Block NVPairData, Variable. */
    open class NVPairData {
        public byte[] NVPairs; // Variable 2
    }

    /** Block VisualParam, Variable. */
    open class VisualParam {
        public int ParamValue; // U8
    }

    constructor() {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
    }
    fun CalcPayloadSize(): Int {
        var length: Int = this.AgentData_Field.Throttles.length + 138 + 4 + 12 + 12 + 4 + 4 + 1 + 1 + 16 + 1 + 2 + this.AgentData_Field.AgentTextures.length + 16 + 1 + 1 + (this.GroupData_Fields.size() * 25) + 1 + (this.AnimationData_Fields.size() * 32) + 1 + (this.GranterBlock_Fields.size() * 16) + 1
        var it: Iterator<?> = this.NVPairData_Fields.iterator()
        while (true) {
            var length2: Int = length
            if (!it.hasNext()) {
                return length2 + 1 + (this.VisualParam_Fields.size() * 1) + 1 + (this.AgentAccess_Fields.size() * 2) + 1 + (this.AgentInfo_Fields.size() * 4)
            }
            length = (it as NVPairData.next()).NVPairs.length + 2 + length2
        }
    }
    fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChildAgentUpdate(this)
    }
    fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 25 (ChildAgentUpdate).
        byteBuffer.put(0x19 as byte)
        packLong(byteBuffer, this.AgentData_Field.RegionHandle)
        packInt(byteBuffer, this.AgentData_Field.ViewerCircuitCode)
        packUUID(byteBuffer, this.AgentData_Field.AgentID)
        packUUID(byteBuffer, this.AgentData_Field.SessionID)
        packLLVector3(byteBuffer, this.AgentData_Field.AgentPos)
        packLLVector3(byteBuffer, this.AgentData_Field.AgentVel)
        packLLVector3(byteBuffer, this.AgentData_Field.Center)
        packLLVector3(byteBuffer, this.AgentData_Field.Size)
        packLLVector3(byteBuffer, this.AgentData_Field.AtAxis)
        packLLVector3(byteBuffer, this.AgentData_Field.LeftAxis)
        packLLVector3(byteBuffer, this.AgentData_Field.UpAxis)
        packBoolean(byteBuffer, this.AgentData_Field.ChangedGrid)
        packFloat(byteBuffer, this.AgentData_Field.Far)
        packFloat(byteBuffer, this.AgentData_Field.Aspect)
        packVariable(byteBuffer, this.AgentData_Field.Throttles, 1)
        packInt(byteBuffer, this.AgentData_Field.LocomotionState)
        packLLQuaternion(byteBuffer, this.AgentData_Field.HeadRotation)
        packLLQuaternion(byteBuffer, this.AgentData_Field.BodyRotation)
        packInt(byteBuffer, this.AgentData_Field.ControlFlags)
        packFloat(byteBuffer, this.AgentData_Field.EnergyLevel)
        packByte(byteBuffer, this as byte.AgentData_Field.GodLevel)
        packBoolean(byteBuffer, this.AgentData_Field.AlwaysRun)
        packUUID(byteBuffer, this.AgentData_Field.PreyAgent)
        packByte(byteBuffer, this as byte.AgentData_Field.AgentAccess)
        packVariable(byteBuffer, this.AgentData_Field.AgentTextures, 2)
        packUUID(byteBuffer, this.AgentData_Field.ActiveGroupID)
        byteBuffer.put(this as byte.GroupData_Fields.size())
        for (groupData in this.GroupData_Fields) {
            packUUID(byteBuffer, groupData.GroupID)
            packLong(byteBuffer, groupData.GroupPowers)
            packBoolean(byteBuffer, groupData.AcceptNotices)
        }
        byteBuffer.put(this as byte.AnimationData_Fields.size())
        for (animationData in this.AnimationData_Fields) {
            packUUID(byteBuffer, animationData.Animation)
            packUUID(byteBuffer, animationData.ObjectID)
        }
        byteBuffer.put(this as byte.GranterBlock_Fields.size())
        var it: Iterator<?> = this.GranterBlock_Fields.iterator()
        while (it.hasNext()) {
            packUUID(byteBuffer, (it as GranterBlock.next()).GranterID)
        }
        byteBuffer.put(this as byte.NVPairData_Fields.size())
        var iterator: Iterator<?> = this.NVPairData_Fields.iterator()
        while (iterator.hasNext()) {
            packVariable(byteBuffer, (iterator as NVPairData.next()).NVPairs, 2)
        }
        byteBuffer.put(this as byte.VisualParam_Fields.size())
        var iterator2: Iterator<?> = this.VisualParam_Fields.iterator()
        while (iterator2.hasNext()) {
            packByte(byteBuffer, (byte) (iterator2 as VisualParam.next()).ParamValue)
        }
        byteBuffer.put(this as byte.AgentAccess_Fields.size())
        for (agentAccess in this.AgentAccess_Fields) {
            packByte(byteBuffer, agentAccess as byte.AgentLegacyAccess)
            packByte(byteBuffer, agentAccess as byte.AgentMaxAccess)
        }
        byteBuffer.put(this as byte.AgentInfo_Fields.size())
        var iterator3: Iterator<?> = this.AgentInfo_Fields.iterator()
        while (iterator3.hasNext()) {
            packInt(byteBuffer, (iterator3 as AgentInfo.next()).Flags)
        }
    }
    fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.RegionHandle = unpackLongthis as byteBuffer.AgentData_Field.ViewerCircuitCode = unpackIntthis as byteBuffer.AgentData_Field.AgentID = unpackUUIDthis as byteBuffer.AgentData_Field.SessionID = unpackUUIDthis as byteBuffer.AgentData_Field.AgentPos = unpackLLVector3this as byteBuffer.AgentData_Field.AgentVel = unpackLLVector3this as byteBuffer.AgentData_Field.Center = unpackLLVector3this as byteBuffer.AgentData_Field.Size = unpackLLVector3this as byteBuffer.AgentData_Field.AtAxis = unpackLLVector3this as byteBuffer.AgentData_Field.LeftAxis = unpackLLVector3this as byteBuffer.AgentData_Field.UpAxis = unpackLLVector3this as byteBuffer.AgentData_Field.ChangedGrid = unpackBooleanthis as byteBuffer.AgentData_Field.Far = unpackFloatthis as byteBuffer.AgentData_Field.Aspect = unpackFloatthis as byteBuffer.AgentData_Field.Throttles = unpackVariable(byteBuffer, 1)
        this.AgentData_Field.LocomotionState = unpackIntthis as byteBuffer.AgentData_Field.HeadRotation = unpackLLQuaternionthis as byteBuffer.AgentData_Field.BodyRotation = unpackLLQuaternionthis as byteBuffer.AgentData_Field.ControlFlags = unpackIntthis as byteBuffer.AgentData_Field.EnergyLevel = unpackFloatthis as byteBuffer.AgentData_Field.GodLevel = unpackByte(byteBuffer) & 0xFF
        this.AgentData_Field.AlwaysRun = unpackBooleanthis as byteBuffer.AgentData_Field.PreyAgent = unpackUUIDthis as byteBuffer.AgentData_Field.AgentAccess = unpackByte(byteBuffer) & 0xFF
        this.AgentData_Field.AgentTextures = unpackVariable(byteBuffer, 2)
        this.AgentData_Field.ActiveGroupID = unpackUUID(byteBuffer)
        var i: Int = byteBuffer.get() & 0xFF
        for (int j = 0; j < i; j++) {
            var groupData: GroupData = GroupData()
            groupData.GroupID = unpackUUIDgroupData as byteBuffer.GroupPowers = unpackLonggroupData as byteBuffer.AcceptNotices = unpackBooleanthis as byteBuffer.GroupData_Fields.add(groupData)
        }
        var i3: Int = byteBuffer.get() & 0xFF
        for (int k = 0; k < i3; k++) {
            var animationData: AnimationData = AnimationData()
            animationData.Animation = unpackUUIDanimationData as byteBuffer.ObjectID = unpackUUIDthis as byteBuffer.AnimationData_Fields.add(animationData)
        }
        var i5: Int = byteBuffer.get() & 0xFF
        for (int m = 0; m < i5; m++) {
            var granterBlock: GranterBlock = GranterBlock()
            granterBlock.GranterID = unpackUUIDthis as byteBuffer.GranterBlock_Fields.add(granterBlock)
        }
        var i7: Int = byteBuffer.get() & 0xFF
        for (int n = 0; n < i7; n++) {
            var nvPairData: NVPairData = NVPairData()
            nvPairData.NVPairs = unpackVariable(byteBuffer, 2)
            this.NVPairData_Fields.add(nvPairData)
        }
        var i9: Int = byteBuffer.get() & 0xFF
        for (int i10 = 0; i10 < i9; i10++) {
            var visualParam: VisualParam = VisualParam()
            visualParam.ParamValue = unpackByte(byteBuffer) & 0xFF
            this.VisualParam_Fields.add(visualParam)
        }
        var i11: Int = byteBuffer.get() & 0xFF
        for (int i12 = 0; i12 < i11; i12++) {
            var agentAccess: AgentAccess = AgentAccess()
            agentAccess.AgentLegacyAccess = unpackByte(byteBuffer) & 0xFF
            agentAccess.AgentMaxAccess = unpackByte(byteBuffer) & 0xFF
            this.AgentAccess_Fields.add(agentAccess)
        }
        var i13: Int = byteBuffer.get() & 0xFF
        for (int i14 = 0; i14 < i13; i14++) {
            var agentInfo: AgentInfo = AgentInfo()
            agentInfo.Flags = unpackIntthis as byteBuffer.AgentInfo_Fields.add(agentInfo)
        }
    }
}
