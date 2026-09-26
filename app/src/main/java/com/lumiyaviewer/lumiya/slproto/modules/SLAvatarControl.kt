package com.lumiyaviewer.lumiya.slproto.modules

import androidx.core.view.InputDeviceCompat
import com.google.common.base.Strings
import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.RequestHandler
import com.lumiyaviewer.lumiya.react.ResultHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.render.HeadTransformCompat
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.SLParcelInfo
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.chat.SLChatPermissionRequestEvent
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.AgentAnimation
import com.lumiyaviewer.lumiya.slproto.messages.AgentRequestSit
import com.lumiyaviewer.lumiya.slproto.messages.AgentSit
import com.lumiyaviewer.lumiya.slproto.messages.AgentUpdate
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAnimation
import com.lumiyaviewer.lumiya.slproto.messages.AvatarSitResponse
import com.lumiyaviewer.lumiya.slproto.messages.ScriptAnswerYes
import com.lumiyaviewer.lumiya.slproto.messages.ScriptQuestion
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.types.AgentPosition
import com.lumiyaviewer.lumiya.slproto.types.CameraParams
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.manager.MyAvatarState
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.Collection
import java.util.HashSet
import java.util.Iterator
import java.util.NoSuchElementException
import java.util.Set
import java.util.Timer
import java.util.TimerTask
import java.util.UUID

open class SLAvatarControl : SLModule() {
    @JvmStatic private var IDLE_AGENT_UPDATE_INTERVAL: Int = 2000
    @JvmStatic var MANUAL_FLY_SPEED: Float = 1.0f
    @JvmStatic var MANUAL_MOVE_SPEED: Float = 1.0f
    @JvmStatic var MANUAL_STRAFE_SPEED: Float = 1.0f
    @JvmStatic var MANUAL_TURN_SPEED: Float = 45.0f
    @JvmStatic private var MIN_AGENT_UPDATE_INTERVAL: Int = 200
    private var ActiveMotionMask: Int = 0
    private var AgentMotionMask: Int = 0
    private var AgentWantStand: Boolean = false
    private var agentHeading: Float = 0.0f
    private var agentPosition: AgentPosition = null
    private var agentUpdateCameraCenter: LLVector3 = null
    private var agentUpdateScheduleLock: Any = null
    private var agentUpdateTask: AgentUpdateTimerTask = null
    private var avatarStateRequestHandler: RequestHandler<SubscriptionSingleKey> = null
    private var cameraParams: CameraParams = null
    private var cammingLock: Any = null
    private var enableAgentUpdates: Boolean = false
    private var initialAnimCount: Int = 0
    private var isCamming: Boolean = false
    private var isFlying: Boolean = false
    private var isManualCamming: Boolean = false
    private var isTurning: Boolean = false
    private var lastTurnedAngle: Float = 0.0f
    private var myAvatarStateResultHandler: ResultHandler<SubscriptionSingleKey, MyAvatarState> = null
    private var needClearAnims: Boolean = false
    private var needFastUpdates: Int = 0
    private var parcelInfo: SLParcelInfo = null
    private var turningLock: Any = null
    private var turningSpeed: Float = 0.0f
    private var turningStartTime: Long = 0L
    private var userManager: UserManager = null
    @JvmStatic private var animUUID_PreJump: UUID = UUID.fromString("7a4e87fe-de39-6fcb-6223-024b00893244")
    @JvmStatic private var animUUID_Softland: UUID = UUID.fromString("f4f00d6e-b9fe-9292-f4cb-0ae06ea58d57")
    @JvmStatic private var animUUID_Falldown: UUID = UUID.fromString("666307d9-a860-572d-6fd4-c3ab8865c094")
    @JvmStatic private var animUUID_Land: UUID = UUID.fromString("7a17b059-12b2-41b1-570a-186368b6aa6f")
    @JvmStatic private var animUUID_Run: UUID = UUID.fromString("05ddbff8-aaa9-92a1-2b74-8fe77a29b445")
    @JvmStatic private var animUUID_Walk: UUID = UUID.fromString("6ed24bd8-91aa-4b12-ccc7-c97c857ab4e0")
    @JvmStatic private var animUUID_Stand: UUID = UUID.fromString("2408fe9e-df1d-1d7d-f4ff-1384fa7b350f")
    @JvmStatic private var animUUID_Standup: UUID = UUID.fromString("3da1d753-028a-5446-24f3-9c9b856d9422")

    private open class AgentUpdateTimerTask : TimerTask() {
        private int scheduledInterval

        fun AgentUpdateTimerTask(scheduledInterval: Int): private {
            this.scheduledInterval = scheduledInterval
        }

            fun getScheduledInterval(): Int {
            return this.scheduledInterval
        }
        fun run() {
            if (SLAvatarControl.this.enableAgentUpdates) {
                SLAvatarControl.this.SendAgentUpdate(SLAvatarControl.this.agentCircuit.getModules().drawDistance)
            }
        }
    }

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.enableAgentUpdates = false
        this.agentHeading = 0.0f
        this.AgentMotionMask = 0
        this.ActiveMotionMask = 0
        this.AgentWantStand = true
        this.needClearAnims = true
        this.initialAnimCount = 5
        this.needFastUpdates = 10
        this.cammingLock = Object()
        this.isCamming = false
        this.isManualCamming = false
        this.agentPosition = AgentPosition()
        this.cameraParams = CameraParams()
        this.turningLock = Object()
        this.isTurning = false
        this.turningSpeed = 0.0f
        this.turningStartTime = 0L
        this.lastTurnedAngle = 0.0f
        this.isFlying = false
        this.agentUpdateScheduleLock = Object()
        this.avatarStateRequestHandler = AsyncRequestHandler(this.agentCircuit, SimpleRequestHandler<SubscriptionSingleKey>() {
            fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
                if (SLAvatarControl.this.myAvatarStateResultHandler != null) {
                    SLAvatarControl.this.myAvatarStateResultHandler.onResultData(subscriptionSingleKey, SLAvatarControl.this.getMyAvatarState())
                }
            }
        })
        this.agentUpdateCameraCenter = LLVector3()
        this.parcelInfo = this.agentCircuit.getGridConnection().parcelInfo
        this.userManager = UserManager.getUserManager(this.agentCircuit.getAgentUUID())
        if (this.userManager != null) {
            this.myAvatarStateResultHandler = this.userManager.getObjectsManager().myAvatarState().attachRequestHandler(this.avatarStateRequestHandler)
        } else {
            this.myAvatarStateResultHandler = null
        }
    }

    private fun SendAgentAnimation() {
        var agentAnimation: AgentAnimation = AgentAnimation()
        agentAnimation.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentAnimation.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var animationList: AgentAnimation.AnimationList = AgentAnimation.AnimationList()
        animationList.AnimID = UUIDPool.ZeroUUID
        animationList.StartAnim = false
        agentAnimation.AnimationList_Fields.addagentAnimation as animationList.isReliable = true
        SendMessage(agentAnimation)
        var agentAnimation2: AgentAnimation = AgentAnimation()
        agentAnimation2.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentAnimation2.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var animationList2: AgentAnimation.AnimationList = AgentAnimation.AnimationList()
        animationList2.AnimID = animUUID_Stand
        animationList2.StartAnim = true
        agentAnimation2.AnimationList_Fields.addagentAnimation2 as animationList2.isReliable = true
        SendMessage(agentAnimation2)
    }

    fun SendAgentUpdate(drawDistance: SLDrawDistance) {
        if (this.agentPosition.getPosition(this.agentUpdateCameraCenter)) {
            this.ActiveMotionMask = this.AgentMotionMask
            var agentUpdate: AgentUpdate = AgentUpdate()
            agentUpdate.AgentData_Field.AgentID = this.circuitInfo.agentID
            agentUpdate.AgentData_Field.SessionID = this.circuitInfo.sessionID
            if (!this.isCamming) {
                this.agentHeading = this.cameraParams.getHeading()
            }
            var d: Double = (this.agentHeading * 3.141592653589793d) / 180.0d
            Debug.Printf("AgentUpdate: agent heading %.2f", this.agentHeading)
            var cos: Float = Math as float.cos(d)
            var sin: Float = Math as float.sin(d)
            var mayaQ: LLQuaternion = LLQuaternion.mayaQ(0.0f, 0.0f, this.agentHeading, LLQuaternion.Order.YZX)
            agentUpdate.AgentData_Field.BodyRotation = mayaQ
            agentUpdate.AgentData_Field.HeadRotation = mayaQ
            agentUpdate.AgentData_Field.CameraCenter = this.agentUpdateCameraCenter
            if (drawDistance.is3DViewEnabled()) {
                agentUpdate.AgentData_Field.CameraAtAxis = LLVector3(cos, sin, 0.0f)
                agentUpdate.AgentData_Field.CameraLeftAxis = LLVector3(-sin, cos, 0.0f)
                agentUpdate.AgentData_Field.CameraUpAxis = LLVector3(0.0f, 0.0f, 1.0f)
            } else {
                agentUpdate.AgentData_Field.CameraAtAxis = LLVector3(0.0f, 0.0f, 1.0f)
                agentUpdate.AgentData_Field.CameraLeftAxis = LLVector3(1.0f, 0.0f, 0.0f)
                agentUpdate.AgentData_Field.CameraUpAxis = LLVector3(0.0f, 1.0f, 0.0f)
            }
            agentUpdate.AgentData_Field.Far = drawDistance.getDrawDistanceForUpdate()
            if (this.needClearAnims) {
                agentUpdate.AgentData_Field.ControlFlags |= 49152
            }
            if (this.initialAnimCount > 0) {
                agentUpdate.AgentData_Field.ControlFlags |= 49152
                this.initialAnimCount--
            }
            if (this.AgentWantStand) {
                agentUpdate.AgentData_Field.ControlFlags |= 114688
                this.AgentWantStand = false
                this.needClearAnims = true
                this.needFastUpdates = 10
            } else {
                if ((this.ActiveMotionMask & 2) != 0) {
                    agentUpdate.AgentData_Field.ControlFlags |= InputDeviceCompat.SOURCE_GAMEPAD
                }
                if ((this.ActiveMotionMask & 4) != 0) {
                    agentUpdate.AgentData_Field.ControlFlags |= 1026
                }
                if ((this.ActiveMotionMask & 32) != 0) {
                    agentUpdate.AgentData_Field.ControlFlags |= 2052
                }
                if ((this.ActiveMotionMask & 64) != 0) {
                    agentUpdate.AgentData_Field.ControlFlags |= 2056
                }
                if ((this.ActiveMotionMask & 8) != 0) {
                    agentUpdate.AgentData_Field.ControlFlags |= 4112
                }
                if ((this.ActiveMotionMask & 16) != 0) {
                    agentUpdate.AgentData_Field.ControlFlags |= 4128
                }
            }
            if (this.isFlying) {
                agentUpdate.AgentData_Field.ControlFlags |= 8192
            }
            agentUpdate.isReliable = false
            SendMessage(agentUpdate)
            if (this.needClearAnims) {
                SendAgentAnimation()
                this.needClearAnims = false
            }
            if (this.needFastUpdates > 0) {
                this.needFastUpdates--
            }
        }
        rescheduleAgentUpdate()
    }

    private fun getIsFlying(): Boolean {
        return this.isFlying
    }

    fun getMyAvatarState(): MyAvatarState {
        var localID2: Int = 0
        var z: Boolean = false
        var localID: Int = 0
        var z2: Boolean = false
        var z3: Boolean = false
        var attachmentID: Int = 0
        var attachmentPoint: SLAttachmentPoint = null
        var z4: Boolean = false
        var isFlying: Boolean = getIsFlying()
        var agentAvatar: SLObjectAvatarInfo = this.parcelInfo.getAgentAvatar()
        if (agentAvatar != null) {
            var parentObject: SLObjectInfo = agentAvatar.getParentObject()
            if (parentObject != null) {
                localID = parentObject.localID
                z2 = true
            } else {
                localID = 0
                z2 = false
            }
            try {
                var it: Iterator<SLObjectInfo> = agentAvatar.treeNode.iterator()
                while (true) {
                    if (!it.hasNext()) {
                        z3 = false

                    }
                    var next: SLObjectInfo = it.next()
                    if (!Strings.nullToEmpty(next.getName()).startsWith("#") && (attachmentID = next.attachmentID) >= 0 && attachmentID < 56 && (attachmentPoint = SLAttachmentPoint.attachmentPoints[attachmentID]) != null && attachmentPoint.isHUD) {
                        z3 = true

                    }
                }
                z4 = z3
                z = z2
                localID2 = localID
            } catch (e: NoSuchElementException) {
                Debug.Warning(e)
                localID2 = localID
                z = z2
            }
        } else {
            localID2 = 0
            z = false
        }
        return MyAvatarState.create(z, localID2, isFlying, z4)
    }

    private fun processStopAvatarAnimations() {
        var agentAvatar: SLObjectAvatarInfo = null
        var set: MutableSet<UUID> = null
        var agentAnimation: AgentAnimation = AgentAnimation()
        agentAnimation.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentAnimation.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var animationList: AgentAnimation.AnimationList = AgentAnimation.AnimationList()
        animationList.AnimID = UUIDPool.ZeroUUID
        animationList.StartAnim = false
        agentAnimation.AnimationList_Fields.addagentAnimation as animationList.isReliable = true
        SendMessage(agentAnimation)
        var agentAnimation2: AgentAnimation = AgentAnimation()
        agentAnimation2.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentAnimation2.AgentData_Field.SessionID = this.circuitInfo.sessionID
        if (this.gridConn != null && this.gridConn.parcelInfo != null && (agentAvatar = this.gridConn.parcelInfo.getAgentAvatar()) != null) {
            set = agentAvatar.getAvatarVisualState().getRunningAnimations()
        }
        if (set != null) {
            for (uuid in set) {
                if (!uuid.equals(animUUID_Stand)) {
                    var animationList2: AgentAnimation.AnimationList = AgentAnimation.AnimationList()
                    animationList2.AnimID = uuid
                    animationList2.StartAnim = false
                    agentAnimation2.AnimationList_Fields.add(animationList2)
                }
            }
        }
        if (agentAnimation2.AnimationList_Fields.size() != 0) {
            agentAnimation2.isReliable = true
            SendMessage(agentAnimation2)
        }
        var agentAnimation3: AgentAnimation = AgentAnimation()
        agentAnimation3.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentAnimation3.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var animationList3: AgentAnimation.AnimationList = AgentAnimation.AnimationList()
        animationList3.AnimID = UUIDPool.ZeroUUID
        animationList3.StartAnim = false
        agentAnimation3.AnimationList_Fields.addagentAnimation3 as animationList3.isReliable = true
        SendMessage(agentAnimation3)
    }

    private fun rescheduleAgentUpdate() {
        var i: Int = 0
        var z: Boolean = true
        var i2: Int = 0
        if (!this.enableAgentUpdates) {
            i = 0
        } else if (this.agentPosition.isValid()) {
            var drawDistance: SLDrawDistance = this.agentCircuit.getModules().drawDistance
            if (this.AgentMotionMask == this.ActiveMotionMask && !drawDistance.needUpdateDrawDistance() && !drawDistance.is3DViewEnabled() && !this.AgentWantStand && this.needFastUpdates <= 0) {
                z = false
            }
            if (i = z) 200 else 2000
            if (this.AgentMotionMask != this.ActiveMotionMask || this.AgentWantStand) {
                i2 = i
                i = 0
            } else {
                i2 = i
            }
        } else {
            i = 0
        }
        scheduleAgentUpdate(i, i2)
    }

    private fun scheduleAgentUpdate(i: Int, i2: Int) {
        var gridConnection: SLGridConnection = null
        var timer: Timer = null
        if (this.agentCircuit == null || (gridConnection = this.agentCircuit.getGridConnection()) == null || (timer = gridConnection.getTimer()) == null) {
            return
        }
        synchronized(this.agentUpdateScheduleLock) {
            var agentUpdateTimerTask: AgentUpdateTimerTask = this.agentUpdateTask
            if ((if (agentUpdateTimerTask != null) agentUpdateTimerTask.getScheduledInterval() else 0) != i2 || i < i2) {
                if (agentUpdateTimerTask != null) {
                    agentUpdateTimerTask.cancel()
                    this.agentUpdateTask = null
                }
                if (i2 != 0) {
                    this.agentUpdateTask = AgentUpdateTimerTasktimer as i2.schedule(this.agentUpdateTask, i, i2)
                }
            }
        }
    }

    fun ApplyAvatarAnimation(objectAvatarInfo: SLObjectAvatarInfo, avatarAnimation: AvatarAnimation) {
        var hashSet: HashSet = HashSet()
        synchronized(this) {
            for (animationList in avatarAnimation.AnimationList_Fields) {
                var uuid: UUID = animationList.AnimID
                Debug.Log("Own animation: " + uuid.toString() + ", sequence ID = " + animationList.AnimSequenceID)
                if (uuid.equals(animUUID_PreJump) || uuid.equals(animUUID_Land) || uuid.equals(animUUID_Softland) || uuid.equals(animUUID_Standup)) {
                    this.needClearAnims = true
                }
                hashSet.add(uuid)
            }
        }
        var copyOf: ImmutableSet<UUID> = ImmutableSet.copyOf(hashSet as Collection)
        if (this.userManager != null) {
            this.userManager.getObjectsManager().runningAnimations().setData(SubscriptionSingleKey.Value, copyOf)
        }
    }

    fun DisableFastUpdates() {
        Debug.Log("AgentUpdate: Disabling fast updates.")
        rescheduleAgentUpdate()
    }

    fun EnableFastUpdates() {
        Debug.Log("AgentUpdate: Enabling fast updates.")
        rescheduleAgentUpdate()
    }

    fun ForceSitOnObject(uuid: UUID) {
        if (uuid != null) {
            Debug.Log("AvatarSit: Attempting to sit on object " + uuid.toString())
            var agentRequestSit: AgentRequestSit = AgentRequestSit()
            agentRequestSit.AgentData_Field.AgentID = this.circuitInfo.agentID
            agentRequestSit.AgentData_Field.SessionID = this.circuitInfo.sessionID
            agentRequestSit.TargetObject_Field.TargetID = uuid
            agentRequestSit.TargetObject_Field.Offset = LLVector3()
            agentRequestSit.isReliable = true
            SendMessage(agentRequestSit)
        }
    }

    fun ForceStand() {
        this.AgentWantStand = true
        rescheduleAgentUpdate()
    }

    @SLMessageHandler
    fun HandleAvatarSitResponse(avatarSitResponse: AvatarSitResponse) {
        var uuid: UUID = avatarSitResponse.SitObject_Field.ID
        if (uuid.getLeastSignificantBits() == 0 && uuid.getMostSignificantBits() == 0) {
            Debug.Log("AvatarSit: Got null sit response")
            return
        }
        Debug.Log("AvatarSit: Got sit response for object " + uuid.toString())
        var agentSit: AgentSit = AgentSit()
        agentSit.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentSit.AgentData_Field.SessionID = this.circuitInfo.sessionID
        agentSit.isReliable = true
        SendMessage(agentSit)
    }
    fun HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getObjectsManager().myAvatarState().detachRequestHandler(this.avatarStateRequestHandler)
        }
        scheduleAgentUpdate(0, 0)
    }

    @SLMessageHandler
    fun HandleScriptQuestion(scriptQuestion: ScriptQuestion) {
        Debug.Log("ScriptQuestion: ItemID = " + scriptQuestion.Data_Field.ItemID + ", questions = " + String.format("%08x", scriptQuestion.Data_Field.Questions))
        var chatPermissionRequestEvent: SLChatPermissionRequestEvent = SLChatPermissionRequestEvent(scriptQuestion, this.agentCircuit.getAgentUUID())
        if (chatPermissionRequestEvent.getQuestions() != 0) {
            this.agentCircuit.HandleChatEvent(this.agentCircuit.getLocalChatterID(), chatPermissionRequestEvent, true)
        }
    }

    fun ScriptAnswerYes(uuid: UUID, uuid2: UUID, i: Int) {
        var scriptAnswerYes: ScriptAnswerYes = ScriptAnswerYes()
        scriptAnswerYes.AgentData_Field.AgentID = this.circuitInfo.agentID
        scriptAnswerYes.AgentData_Field.SessionID = this.circuitInfo.sessionID
        scriptAnswerYes.Data_Field.TaskID = uuid2
        scriptAnswerYes.Data_Field.ItemID = uuid
        scriptAnswerYes.Data_Field.Questions = i
        scriptAnswerYes.isReliable = true
        SendMessage(scriptAnswerYes)
    }

    fun SitOnObject(uuid: UUID) {
        if (this.agentCircuit.getModules().rlvController.canSit()) {
            try {
                if (this.parcelInfo != null) {
                    var objectInfo: SLObjectInfo = this.parcelInfo.allObjectsNearby.get(uuid)
                    var immutablePosition: ImmutableVector = this.agentPosition.getImmutablePosition()
                    if (objectInfo != null && immutablePosition != null) {
                        var distanceTo: Float = immutablePosition.getDistanceTo(objectInfo.getAbsolutePosition())
                        Debug.Printf("RLV: Distance to object for sitting: %f", distanceTo)
                        if (distanceTo > 1.5f) {
                            if (!this.gridConn.getModules().rlvController.canTeleportBySitting()) {
                                return
                            }
                        }
                    }
                }
            } catch (e: Exception) {
                Debug.Warning(e)
            }
            ForceSitOnObject(uuid)
        }
    }

    fun Stand() {
        if (this.agentCircuit.getModules().rlvController.canStandUp()) {
            ForceStand()
        }
    }

    fun StartAgentMotion(i: Int) {
        var z: Boolean = false
        synchronized(this) {
            if ((i & 8) != 0 || (i & 16) != 0) {
                if (!this.isFlying) {
                    this.isFlying = true
                    z = true
                }
            }
            this.AgentMotionMask = i
            rescheduleAgentUpdate()
        }
        if (z) {
            this.userManager.getObjectsManager().myAvatarState().requestUpdate(SubscriptionSingleKey.Value)
        }
    }

    fun StopAgentMotion() {
        if (this.AgentMotionMask != 0) {
            this.AgentMotionMask = 0
            this.needClearAnims = true
        }
        rescheduleAgentUpdate()
    }

    fun StopAvatarAnimations() {
        processStopAvatarAnimations()
        this.needClearAnims = true
        this.needFastUpdates = 10
        this.AgentMotionMask = 0
        rescheduleAgentUpdate()
    }

    fun getAgentAndCameraPosition(vector3: LLVector3, cameraParams: CameraParams): Boolean {
        var f: Float = 0.0f
        this.agentPosition.getInterpolatedPosition(vector3)
        synchronized(this.turningLock) {
            if (this.isTurning) {
                var currentTimeMillis: Float = this.turningSpeed * ((System.currentTimeMillis() - this.turningStartTime) / 1000.0f)
                f = currentTimeMillis - this.lastTurnedAngle
                this.lastTurnedAngle = currentTimeMillis
            } else {
                f = 0.0f
            }
        }
        synchronized(this.cammingLock) {
            if (this.isCamming || !(!this.isManualCamming)) {
                this.agentHeading = CameraParams.wrapAngle(f + this.agentHeading)
            } else {
                if (f != 0.0f) {
                    this.cameraParams.rotate(f, 0.0f)
                }
                this.cameraParams.setPosition(vector3)
            }
        }
        cameraParams.copyFrom(this.cameraParams)
        return this.cameraParams.isFlinging()
    }

    fun getAgentHeading(): Float {
        return this.agentHeading
    }

    fun getAgentPosition(): AgentPosition {
        return this.agentPosition
    }

    fun getIsManualCamming(): Boolean {
        var isManualCamming: Boolean = false
        synchronized(this.cammingLock) {
            isManualCamming = this.isManualCamming
        }
        return isManualCamming
    }

    fun getVRCamera(headTransformCompat: HeadTransformCompat, vector3: LLVector3, cameraParams: CameraParams) {
        this.agentPosition.getInterpolatedPosition(vector3)
        synchronized(this.cammingLock) {
            if (!this.isManualCamming) {
                this.cameraParams.setPosition(vector3)
            }
        }
        cameraParams.getVRCamera(this.cameraParams, headTransformCompat)
    }

    fun playAnimation(uuid: UUID, z: Boolean) {
        var agentAnimation: AgentAnimation = AgentAnimation()
        agentAnimation.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentAnimation.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var animationList: AgentAnimation.AnimationList = AgentAnimation.AnimationList()
        animationList.AnimID = uuid
        animationList.StartAnim = z
        agentAnimation.AnimationList_Fields.addagentAnimation as animationList.isReliable = true
        SendMessage(agentAnimation)
    }

    fun processCameraFling(f: Float, f2: Float) {
        synchronized(this.cammingLock) {
            this.cameraParams.fling(f, f2)
        }
    }

    fun processCameraRotate(f: Float, f2: Float) {
        synchronized(this.cammingLock) {
            this.cameraParams.rotate(f, f2)
            if (!this.isCamming) {
                this.agentHeading = this.cameraParams.getHeading()
            }
        }
    }

    fun processCameraZoom(f: Float, f2: Float, f3: Float, f4: Float, f5: Float) {
        synchronized(this.cammingLock) {
            this.isCamming = true
            this.cameraParams.zoom(f, f2, f3, f4, f5)
        }
    }

    fun setAgentHeading(agentHeading: Float) {
        synchronized(this.cammingLock) {
            this.cameraParams.setHeadingthis as agentHeading.agentHeading = this.cameraParams.getHeading()
        }
    }

    fun setAgentPosition(vector3: LLVector3, vector33: LLVector3) {
        synchronized(this.cammingLock) {
            this.agentPosition.set(vector3, vector33)
            if (!this.cameraParams.isValid() || (!this.isCamming && (!this.isManualCamming))) {
                this.cameraParams.setPosition(vector3)
            }
        }
        var modules: SLModules = this.agentCircuit.getModules()
        if (modules != null) {
            modules.voice.updateSpatialVoicePosition()
        }
    }

    fun setCameraManualControl(isManualCamming: Boolean) {
        synchronized(this.cammingLock) {
            this.isManualCamming = isManualCamming
            if (!isManualCamming) {
                this.isCamming = false
            }
            if (!this.isCamming && (!isManualCamming)) {
                this.cameraParams.setPosition(this.agentPosition.getPosition(), this.agentHeading)
            }
        }
    }

    fun setEnableAgentUpdates(enableAgentUpdates: Boolean) {
        this.enableAgentUpdates = enableAgentUpdates
        if (enableAgentUpdates) {
            scheduleAgentUpdate(0, 1000)
        } else {
            scheduleAgentUpdate(0, 0)
        }
    }

    fun startCameraManualControl(f: Float, f2: Float, f3: Float, f4: Float) {
        synchronized(this.cammingLock) {
            this.isCamming = true
            this.isManualCamming = true
            this.cameraParams.startManualControl(f, f2, f3, f4)
        }
    }

    fun startTurning(turningSpeed: Float) {
        synchronized(this.turningLock) {
            if (!this.isTurning || this.turningSpeed != turningSpeed) {
                this.isTurning = true
                this.turningSpeed = turningSpeed
                this.turningStartTime = System.currentTimeMillis()
                this.lastTurnedAngle = 0.0f
            }
        }
    }

    fun stopCameraManualControl() {
        synchronized(this.cammingLock) {
            this.cameraParams.stopManualControl()
        }
    }

    fun stopCamming() {
        synchronized(this.cammingLock) {
            if (this.isCamming) {
                this.isCamming = false
                if (!this.isManualCamming) {
                    this.cameraParams.setPosition(this.agentPosition.getPosition(), this.agentHeading)
                }
            }
        }
    }

    fun stopFlying() {
        var z: Boolean = true
        synchronized(this) {
            if (this.isFlying) {
                this.isFlying = false
                this.AgentWantStand = true
            } else {
                z = false
            }
        }
        if (z) {
            this.userManager.getObjectsManager().myAvatarState().requestUpdate(SubscriptionSingleKey.Value)
        }
    }

    fun stopTurning() {
        synchronized(this.turningLock) {
            this.isTurning = false
        }
    }
}
