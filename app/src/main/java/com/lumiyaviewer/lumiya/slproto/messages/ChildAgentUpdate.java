package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Child Agent Update - agents send child agents to neighboring simulators.
 * This will create a child camera if there isn't one at the target already
 * Can't send viewer IP and port between simulators -- the port may get remapped
 * if the viewer is behind a Network Address Translation (NAT) box.
 * Note: some of the fields of this message really only need to be sent when an
 * agent crosses a region boundary and changes from a child to a main agent
 * (such as Head/BodyRotation, ControlFlags, Animations etc)
 * simulator -> simulator
 * reliable
 *
 * <p>Template: {@code ChildAgentUpdate High 25 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ChildAgentUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<GroupData> GroupData_Fields = new ArrayList<>();
    public ArrayList<AnimationData> AnimationData_Fields = new ArrayList<>();
    public ArrayList<GranterBlock> GranterBlock_Fields = new ArrayList<>();
    public ArrayList<NVPairData> NVPairData_Fields = new ArrayList<>();
    public ArrayList<VisualParam> VisualParam_Fields = new ArrayList<>();
    public ArrayList<AgentAccess> AgentAccess_Fields = new ArrayList<>();
    public ArrayList<AgentInfo> AgentInfo_Fields = new ArrayList<>();

    /** Block AgentAccess, Variable. */
    public static class AgentAccess {
        public int AgentLegacyAccess; // U8
        public int AgentMaxAccess; // U8
    }

    /** Block AgentData, Single. */
    public static class AgentData {
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
    public static class AgentInfo {
        public int Flags; // U32
    }

    /** Block AnimationData, Variable. */
    public static class AnimationData {
        public UUID Animation; // LLUUID
        public UUID ObjectID; // LLUUID
    }

    /** Block GranterBlock, Variable. */
    public static class GranterBlock {
        public UUID GranterID; // LLUUID
    }

    /** Block GroupData, Variable. */
    public static class GroupData {
        public boolean AcceptNotices; // BOOL
        public UUID GroupID; // LLUUID
        public long GroupPowers; // U64
    }

    /** Block NVPairData, Variable. */
    public static class NVPairData {
        public byte[] NVPairs; // Variable 2
    }

    /** Block VisualParam, Variable. */
    public static class VisualParam {
        public int ParamValue; // U8
    }

    public ChildAgentUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int length = this.AgentData_Field.Throttles.length + 138 + 4 + 12 + 12 + 4 + 4 + 1 + 1 + 16 + 1 + 2 + this.AgentData_Field.AgentTextures.length + 16 + 1 + 1 + (this.GroupData_Fields.size() * 25) + 1 + (this.AnimationData_Fields.size() * 32) + 1 + (this.GranterBlock_Fields.size() * 16) + 1;
        Iterator<?> it = this.NVPairData_Fields.iterator();
        while (true) {
            int length2 = length;
            if (!it.hasNext()) {
                return length2 + 1 + (this.VisualParam_Fields.size() * 1) + 1 + (this.AgentAccess_Fields.size() * 2) + 1 + (this.AgentInfo_Fields.size() * 4);
            }
            length = ((NVPairData) it.next()).NVPairs.length + 2 + length2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleChildAgentUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 25 (ChildAgentUpdate).
        byteBuffer.put((byte) 0x19);
        packLong(byteBuffer, this.AgentData_Field.RegionHandle);
        packInt(byteBuffer, this.AgentData_Field.ViewerCircuitCode);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packLLVector3(byteBuffer, this.AgentData_Field.AgentPos);
        packLLVector3(byteBuffer, this.AgentData_Field.AgentVel);
        packLLVector3(byteBuffer, this.AgentData_Field.Center);
        packLLVector3(byteBuffer, this.AgentData_Field.Size);
        packLLVector3(byteBuffer, this.AgentData_Field.AtAxis);
        packLLVector3(byteBuffer, this.AgentData_Field.LeftAxis);
        packLLVector3(byteBuffer, this.AgentData_Field.UpAxis);
        packBoolean(byteBuffer, this.AgentData_Field.ChangedGrid);
        packFloat(byteBuffer, this.AgentData_Field.Far);
        packFloat(byteBuffer, this.AgentData_Field.Aspect);
        packVariable(byteBuffer, this.AgentData_Field.Throttles, 1);
        packInt(byteBuffer, this.AgentData_Field.LocomotionState);
        packLLQuaternion(byteBuffer, this.AgentData_Field.HeadRotation);
        packLLQuaternion(byteBuffer, this.AgentData_Field.BodyRotation);
        packInt(byteBuffer, this.AgentData_Field.ControlFlags);
        packFloat(byteBuffer, this.AgentData_Field.EnergyLevel);
        packByte(byteBuffer, (byte) this.AgentData_Field.GodLevel);
        packBoolean(byteBuffer, this.AgentData_Field.AlwaysRun);
        packUUID(byteBuffer, this.AgentData_Field.PreyAgent);
        packByte(byteBuffer, (byte) this.AgentData_Field.AgentAccess);
        packVariable(byteBuffer, this.AgentData_Field.AgentTextures, 2);
        packUUID(byteBuffer, this.AgentData_Field.ActiveGroupID);
        byteBuffer.put((byte) this.GroupData_Fields.size());
        for (GroupData groupData : this.GroupData_Fields) {
            packUUID(byteBuffer, groupData.GroupID);
            packLong(byteBuffer, groupData.GroupPowers);
            packBoolean(byteBuffer, groupData.AcceptNotices);
        }
        byteBuffer.put((byte) this.AnimationData_Fields.size());
        for (AnimationData animationData : this.AnimationData_Fields) {
            packUUID(byteBuffer, animationData.Animation);
            packUUID(byteBuffer, animationData.ObjectID);
        }
        byteBuffer.put((byte) this.GranterBlock_Fields.size());
        Iterator<?> it = this.GranterBlock_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((GranterBlock) it.next()).GranterID);
        }
        byteBuffer.put((byte) this.NVPairData_Fields.size());
        Iterator<?> iterator = this.NVPairData_Fields.iterator();
        while (iterator.hasNext()) {
            packVariable(byteBuffer, ((NVPairData) iterator.next()).NVPairs, 2);
        }
        byteBuffer.put((byte) this.VisualParam_Fields.size());
        Iterator<?> iterator2 = this.VisualParam_Fields.iterator();
        while (iterator2.hasNext()) {
            packByte(byteBuffer, (byte) ((VisualParam) iterator2.next()).ParamValue);
        }
        byteBuffer.put((byte) this.AgentAccess_Fields.size());
        for (AgentAccess agentAccess : this.AgentAccess_Fields) {
            packByte(byteBuffer, (byte) agentAccess.AgentLegacyAccess);
            packByte(byteBuffer, (byte) agentAccess.AgentMaxAccess);
        }
        byteBuffer.put((byte) this.AgentInfo_Fields.size());
        Iterator<?> iterator3 = this.AgentInfo_Fields.iterator();
        while (iterator3.hasNext()) {
            packInt(byteBuffer, ((AgentInfo) iterator3.next()).Flags);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.RegionHandle = unpackLong(byteBuffer);
        this.AgentData_Field.ViewerCircuitCode = unpackInt(byteBuffer);
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.AgentPos = unpackLLVector3(byteBuffer);
        this.AgentData_Field.AgentVel = unpackLLVector3(byteBuffer);
        this.AgentData_Field.Center = unpackLLVector3(byteBuffer);
        this.AgentData_Field.Size = unpackLLVector3(byteBuffer);
        this.AgentData_Field.AtAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.LeftAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.UpAxis = unpackLLVector3(byteBuffer);
        this.AgentData_Field.ChangedGrid = unpackBoolean(byteBuffer);
        this.AgentData_Field.Far = unpackFloat(byteBuffer);
        this.AgentData_Field.Aspect = unpackFloat(byteBuffer);
        this.AgentData_Field.Throttles = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.LocomotionState = unpackInt(byteBuffer);
        this.AgentData_Field.HeadRotation = unpackLLQuaternion(byteBuffer);
        this.AgentData_Field.BodyRotation = unpackLLQuaternion(byteBuffer);
        this.AgentData_Field.ControlFlags = unpackInt(byteBuffer);
        this.AgentData_Field.EnergyLevel = unpackFloat(byteBuffer);
        this.AgentData_Field.GodLevel = unpackByte(byteBuffer) & 0xFF;
        this.AgentData_Field.AlwaysRun = unpackBoolean(byteBuffer);
        this.AgentData_Field.PreyAgent = unpackUUID(byteBuffer);
        this.AgentData_Field.AgentAccess = unpackByte(byteBuffer) & 0xFF;
        this.AgentData_Field.AgentTextures = unpackVariable(byteBuffer, 2);
        this.AgentData_Field.ActiveGroupID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            GroupData groupData = new GroupData();
            groupData.GroupID = unpackUUID(byteBuffer);
            groupData.GroupPowers = unpackLong(byteBuffer);
            groupData.AcceptNotices = unpackBoolean(byteBuffer);
            this.GroupData_Fields.add(groupData);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            AnimationData animationData = new AnimationData();
            animationData.Animation = unpackUUID(byteBuffer);
            animationData.ObjectID = unpackUUID(byteBuffer);
            this.AnimationData_Fields.add(animationData);
        }
        int i5 = byteBuffer.get() & 0xFF;
        for (int m = 0; m < i5; m++) {
            GranterBlock granterBlock = new GranterBlock();
            granterBlock.GranterID = unpackUUID(byteBuffer);
            this.GranterBlock_Fields.add(granterBlock);
        }
        int i7 = byteBuffer.get() & 0xFF;
        for (int n = 0; n < i7; n++) {
            NVPairData nvPairData = new NVPairData();
            nvPairData.NVPairs = unpackVariable(byteBuffer, 2);
            this.NVPairData_Fields.add(nvPairData);
        }
        int i9 = byteBuffer.get() & 0xFF;
        for (int i10 = 0; i10 < i9; i10++) {
            VisualParam visualParam = new VisualParam();
            visualParam.ParamValue = unpackByte(byteBuffer) & 0xFF;
            this.VisualParam_Fields.add(visualParam);
        }
        int i11 = byteBuffer.get() & 0xFF;
        for (int i12 = 0; i12 < i11; i12++) {
            AgentAccess agentAccess = new AgentAccess();
            agentAccess.AgentLegacyAccess = unpackByte(byteBuffer) & 0xFF;
            agentAccess.AgentMaxAccess = unpackByte(byteBuffer) & 0xFF;
            this.AgentAccess_Fields.add(agentAccess);
        }
        int i13 = byteBuffer.get() & 0xFF;
        for (int i14 = 0; i14 < i13; i14++) {
            AgentInfo agentInfo = new AgentInfo();
            agentInfo.Flags = unpackInt(byteBuffer);
            this.AgentInfo_Fields.add(agentInfo);
        }
    }
}
