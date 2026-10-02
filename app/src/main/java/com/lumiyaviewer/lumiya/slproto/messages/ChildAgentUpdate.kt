package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

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
open class ChildAgentUpdate : SLMessage() {
    @JvmField var AgentData_Field: AgentData = AgentData()
    @JvmField val GroupData_Fields = ArrayList<GroupData>()
    @JvmField val AnimationData_Fields = ArrayList<AnimationData>()
    @JvmField val GranterBlock_Fields = ArrayList<GranterBlock>()
    @JvmField val NVPairData_Fields = ArrayList<NVPairData>()
    @JvmField val VisualParam_Fields = ArrayList<VisualParam>()
    @JvmField val AgentAccess_Fields = ArrayList<AgentAccess>()
    @JvmField val AgentInfo_Fields = ArrayList<AgentInfo>()

    /** Block AgentAccess, Variable. */
    open class AgentAccess {
        @JvmField var AgentLegacyAccess: Int = 0 // U8
        @JvmField var AgentMaxAccess: Int = 0 // U8
    }

    /** Block AgentData, Single. */
    open class AgentData {
        @JvmField var ActiveGroupID: UUID? = null // LLUUID
        @JvmField var AgentAccess: Int = 0 // U8
        @JvmField var AgentID: UUID? = null // LLUUID
        @JvmField var AgentPos: LLVector3? = null // LLVector3
        @JvmField var AgentTextures: ByteArray? = null // Variable 2
        @JvmField var AgentVel: LLVector3? = null // LLVector3
        @JvmField var AlwaysRun: Boolean = false // BOOL
        @JvmField var Aspect: Float = 0f // F32
        @JvmField var AtAxis: LLVector3? = null // LLVector3
        @JvmField var BodyRotation: LLQuaternion? = null // LLQuaternion
        @JvmField var Center: LLVector3? = null // LLVector3
        @JvmField var ChangedGrid: Boolean = false // BOOL
        @JvmField var ControlFlags: Int = 0 // U32
        @JvmField var EnergyLevel: Float = 0f // F32
        @JvmField var Far: Float = 0f // F32
        @JvmField var GodLevel: Int = 0 // U8 - Changed from BOOL to U8, and renamed GodLevel (from Godlike)
        @JvmField var HeadRotation: LLQuaternion? = null // LLQuaternion
        @JvmField var LeftAxis: LLVector3? = null // LLVector3
        @JvmField var LocomotionState: Int = 0 // U32
        @JvmField var PreyAgent: UUID? = null // LLUUID
        @JvmField var RegionHandle: Long = 0L // U64
        @JvmField var SessionID: UUID? = null // LLUUID
        @JvmField var Size: LLVector3? = null // LLVector3
        @JvmField var Throttles: ByteArray? = null // Variable 1
        @JvmField var UpAxis: LLVector3? = null // LLVector3
        @JvmField var ViewerCircuitCode: Int = 0 // U32
    }

    /** Block AgentInfo, Variable. */
    open class AgentInfo {
        @JvmField var Flags: Int = 0 // U32
    }

    /** Block AnimationData, Variable. */
    open class AnimationData {
        @JvmField var Animation: UUID? = null // LLUUID
        @JvmField var ObjectID: UUID? = null // LLUUID
    }

    /** Block GranterBlock, Variable. */
    open class GranterBlock {
        @JvmField var GranterID: UUID? = null // LLUUID
    }

    /** Block GroupData, Variable. */
    open class GroupData {
        @JvmField var AcceptNotices: Boolean = false // BOOL
        @JvmField var GroupID: UUID? = null // LLUUID
        @JvmField var GroupPowers: Long = 0L // U64
    }

    /** Block NVPairData, Variable. */
    open class NVPairData {
        @JvmField var NVPairs: ByteArray? = null // Variable 2
    }

    /** Block VisualParam, Variable. */
    open class VisualParam {
        @JvmField var ParamValue: Int = 0 // U8
    }

    init {
        this.zeroCoded = true
        this.AgentData_Field = AgentData()
    }

    override fun CalcPayloadSize(): Int {
        var length = this.AgentData_Field.Throttles.size + 138 + 4 + 12 + 12 + 4 + 4 + 1 + 1 + 16 + 1 + 2 + this.AgentData_Field.AgentTextures.size + 16 + 1 + 1 + (this.GroupData_Fields.size * 25) + 1 + (this.AnimationData_Fields.size * 32) + 1 + (this.GranterBlock_Fields.size * 16) + 1
        for (entry in this.NVPairData_Fields) {
            length = entry.NVPairs.size + 2 + length
        }
        return length + 1 + (this.VisualParam_Fields.size * 1) + 1 + (this.AgentAccess_Fields.size * 2) + 1 + (this.AgentInfo_Fields.size * 4)
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleChildAgentUpdate(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: High 25 (ChildAgentUpdate).
        byteBuffer.put((0x19).toByte())
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
        packByte(byteBuffer, (this.AgentData_Field.GodLevel).toByte())
        packBoolean(byteBuffer, this.AgentData_Field.AlwaysRun)
        packUUID(byteBuffer, this.AgentData_Field.PreyAgent)
        packByte(byteBuffer, (this.AgentData_Field.AgentAccess).toByte())
        packVariable(byteBuffer, this.AgentData_Field.AgentTextures, 2)
        packUUID(byteBuffer, this.AgentData_Field.ActiveGroupID)
        byteBuffer.put((this.GroupData_Fields.size).toByte())
        for (groupData in this.GroupData_Fields) {
            packUUID(byteBuffer, groupData.GroupID)
            packLong(byteBuffer, groupData.GroupPowers)
            packBoolean(byteBuffer, groupData.AcceptNotices)
        }
        byteBuffer.put((this.AnimationData_Fields.size).toByte())
        for (animationData in this.AnimationData_Fields) {
            packUUID(byteBuffer, animationData.Animation)
            packUUID(byteBuffer, animationData.ObjectID)
        }
        byteBuffer.put((this.GranterBlock_Fields.size).toByte())
        for (entry in this.GranterBlock_Fields) {
            packUUID(byteBuffer, entry.GranterID)
        }
        byteBuffer.put((this.NVPairData_Fields.size).toByte())
        for (entry in this.NVPairData_Fields) {
            packVariable(byteBuffer, entry.NVPairs, 2)
        }
        byteBuffer.put((this.VisualParam_Fields.size).toByte())
        for (entry in this.VisualParam_Fields) {
            packByte(byteBuffer, (entry.ParamValue).toByte())
        }
        byteBuffer.put((this.AgentAccess_Fields.size).toByte())
        for (agentAccess in this.AgentAccess_Fields) {
            packByte(byteBuffer, (agentAccess.AgentLegacyAccess).toByte())
            packByte(byteBuffer, (agentAccess.AgentMaxAccess).toByte())
        }
        byteBuffer.put((this.AgentInfo_Fields.size).toByte())
        for (entry in this.AgentInfo_Fields) {
            packInt(byteBuffer, entry.Flags)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        this.AgentData_Field.RegionHandle = unpackLong(byteBuffer)
        this.AgentData_Field.ViewerCircuitCode = unpackInt(byteBuffer)
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer)
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer)
        this.AgentData_Field.AgentPos = unpackLLVector3(byteBuffer)
        this.AgentData_Field.AgentVel = unpackLLVector3(byteBuffer)
        this.AgentData_Field.Center = unpackLLVector3(byteBuffer)
        this.AgentData_Field.Size = unpackLLVector3(byteBuffer)
        this.AgentData_Field.AtAxis = unpackLLVector3(byteBuffer)
        this.AgentData_Field.LeftAxis = unpackLLVector3(byteBuffer)
        this.AgentData_Field.UpAxis = unpackLLVector3(byteBuffer)
        this.AgentData_Field.ChangedGrid = unpackBoolean(byteBuffer)
        this.AgentData_Field.Far = unpackFloat(byteBuffer)
        this.AgentData_Field.Aspect = unpackFloat(byteBuffer)
        this.AgentData_Field.Throttles = unpackVariable(byteBuffer, 1)
        this.AgentData_Field.LocomotionState = unpackInt(byteBuffer)
        this.AgentData_Field.HeadRotation = unpackLLQuaternion(byteBuffer)
        this.AgentData_Field.BodyRotation = unpackLLQuaternion(byteBuffer)
        this.AgentData_Field.ControlFlags = unpackInt(byteBuffer)
        this.AgentData_Field.EnergyLevel = unpackFloat(byteBuffer)
        this.AgentData_Field.GodLevel = unpackByte(byteBuffer) & 0xFF
        this.AgentData_Field.AlwaysRun = unpackBoolean(byteBuffer)
        this.AgentData_Field.PreyAgent = unpackUUID(byteBuffer)
        this.AgentData_Field.AgentAccess = unpackByte(byteBuffer) & 0xFF
        this.AgentData_Field.AgentTextures = unpackVariable(byteBuffer, 2)
        this.AgentData_Field.ActiveGroupID = unpackUUID(byteBuffer)
        val i = byteBuffer.get().toInt() and 0xFF
        repeat(i) {
            val groupData = GroupData()
            groupData.GroupID = unpackUUID(byteBuffer)
            groupData.GroupPowers = unpackLong(byteBuffer)
            groupData.AcceptNotices = unpackBoolean(byteBuffer)
            this.GroupData_Fields.add(groupData)
        }
        val i3 = byteBuffer.get().toInt() and 0xFF
        repeat(i3) {
            val animationData = AnimationData()
            animationData.Animation = unpackUUID(byteBuffer)
            animationData.ObjectID = unpackUUID(byteBuffer)
            this.AnimationData_Fields.add(animationData)
        }
        val i5 = byteBuffer.get().toInt() and 0xFF
        repeat(i5) {
            val granterBlock = GranterBlock()
            granterBlock.GranterID = unpackUUID(byteBuffer)
            this.GranterBlock_Fields.add(granterBlock)
        }
        val i7 = byteBuffer.get().toInt() and 0xFF
        repeat(i7) {
            val nvPairData = NVPairData()
            nvPairData.NVPairs = unpackVariable(byteBuffer, 2)
            this.NVPairData_Fields.add(nvPairData)
        }
        val i9 = byteBuffer.get().toInt() and 0xFF
        repeat(i9) {
            val visualParam = VisualParam()
            visualParam.ParamValue = unpackByte(byteBuffer) & 0xFF
            this.VisualParam_Fields.add(visualParam)
        }
        val i11 = byteBuffer.get().toInt() and 0xFF
        repeat(i11) {
            val agentAccess = AgentAccess()
            agentAccess.AgentLegacyAccess = unpackByte(byteBuffer) & 0xFF
            agentAccess.AgentMaxAccess = unpackByte(byteBuffer) & 0xFF
            this.AgentAccess_Fields.add(agentAccess)
        }
        val i13 = byteBuffer.get().toInt() and 0xFF
        repeat(i13) {
            val agentInfo = AgentInfo()
            agentInfo.Flags = unpackInt(byteBuffer)
            this.AgentInfo_Fields.add(agentInfo)
        }
    }
}
