package com.lumiyaviewer.lumiya.slproto

import android.annotation.SuppressLint
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.google.common.logging.nano.Vr
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GridConnectionService
import com.lumiyaviewer.lumiya.dao.UserName
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventRateLimiter
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.chat.SLChatBalanceChangedEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatFriendshipOfferedEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatFriendshipResultEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatGroupInvitationEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatInventoryItemOfferedByGroupNoticeEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatInventoryItemOfferedByYouEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatInventoryItemOfferedEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatLureEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatLureRequestEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatLureRequestedEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatOnlineOfflineEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatScriptDialog
import com.lumiyaviewer.lumiya.slproto.chat.SLChatSystemMessageEvent
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextBoxDialog
import com.lumiyaviewer.lumiya.slproto.chat.SLChatTextEvent
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.events.SLObjectPayInfoEvent
import com.lumiyaviewer.lumiya.slproto.events.SLRegionInfoChangedEvent
import com.lumiyaviewer.lumiya.slproto.events.SLTeleportResultEvent
import com.lumiyaviewer.lumiya.slproto.inventory.SLAssetType
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventoryEntry
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.messages.AcceptFriendship
import com.lumiyaviewer.lumiya.slproto.messages.AgentFOV
import com.lumiyaviewer.lumiya.slproto.messages.AgentMovementComplete
import com.lumiyaviewer.lumiya.slproto.messages.AgentPause
import com.lumiyaviewer.lumiya.slproto.messages.AgentResume
import com.lumiyaviewer.lumiya.slproto.messages.AlertMessage
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAnimation
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance
import com.lumiyaviewer.lumiya.slproto.messages.AvatarInterestsReply
import com.lumiyaviewer.lumiya.slproto.messages.ChatFromSimulator
import com.lumiyaviewer.lumiya.slproto.messages.ChatFromViewer
import com.lumiyaviewer.lumiya.slproto.messages.CompleteAgentMovement
import com.lumiyaviewer.lumiya.slproto.messages.DeRezObject
import com.lumiyaviewer.lumiya.slproto.messages.EstateOwnerMessage
import com.lumiyaviewer.lumiya.slproto.messages.GenericMessage
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedInstantMessage
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedTerseObjectUpdate
import com.lumiyaviewer.lumiya.slproto.messages.KillObject
import com.lumiyaviewer.lumiya.slproto.messages.LayerData
import com.lumiyaviewer.lumiya.slproto.messages.LoadURL
import com.lumiyaviewer.lumiya.slproto.messages.LogoutRequest
import com.lumiyaviewer.lumiya.slproto.messages.ObjectBuy
import com.lumiyaviewer.lumiya.slproto.messages.ObjectDeGrab
import com.lumiyaviewer.lumiya.slproto.messages.ObjectGrab
import com.lumiyaviewer.lumiya.slproto.messages.ObjectProperties
import com.lumiyaviewer.lumiya.slproto.messages.ObjectSelect
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdate
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdateCached
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdateCompressed
import com.lumiyaviewer.lumiya.slproto.messages.OfflineNotification
import com.lumiyaviewer.lumiya.slproto.messages.OnlineNotification
import com.lumiyaviewer.lumiya.slproto.messages.PayPriceReply
import com.lumiyaviewer.lumiya.slproto.messages.RegionHandshake
import com.lumiyaviewer.lumiya.slproto.messages.RegionHandshakeReply
import com.lumiyaviewer.lumiya.slproto.messages.RequestMultipleObjects
import com.lumiyaviewer.lumiya.slproto.messages.RequestPayPrice
import com.lumiyaviewer.lumiya.slproto.messages.RetrieveInstantMessages
import com.lumiyaviewer.lumiya.slproto.messages.RezObject
import com.lumiyaviewer.lumiya.slproto.messages.ScriptDialog
import com.lumiyaviewer.lumiya.slproto.messages.ScriptDialogReply
import com.lumiyaviewer.lumiya.slproto.messages.SimulatorViewerTimeMessage
import com.lumiyaviewer.lumiya.slproto.messages.StartLure
import com.lumiyaviewer.lumiya.slproto.messages.TeleportFailed
import com.lumiyaviewer.lumiya.slproto.messages.TeleportLandmarkRequest
import com.lumiyaviewer.lumiya.slproto.messages.TeleportLocal
import com.lumiyaviewer.lumiya.slproto.messages.TeleportLocationRequest
import com.lumiyaviewer.lumiya.slproto.messages.TeleportLureRequest
import com.lumiyaviewer.lumiya.slproto.messages.TeleportProgress
import com.lumiyaviewer.lumiya.slproto.messages.TeleportStart
import com.lumiyaviewer.lumiya.slproto.messages.TerminateFriendship
import com.lumiyaviewer.lumiya.slproto.messages.UseCircuitCode
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteType
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.SLMuteList
import com.lumiyaviewer.lumiya.slproto.objects.PayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData
import com.lumiyaviewer.lumiya.slproto.objects.UnsupportedObjectTypeException
import com.lumiyaviewer.lumiya.slproto.types.EDeRezDestination
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceObject
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUser
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.IOException
import java.io.UnsupportedEncodingException
import java.net.URLEncoder
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.ArrayList
import java.util.Collections
import java.util.HashSet
import java.util.Iterator
import java.util.LinkedList
import java.util.List
import java.util.Map
import java.util.Set
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.atomic.AtomicReference

open class SLAgentCircuit : SLThreadingCircuit(), SLCapEventQueue.ICapsEventHandler {

    private var agentNameSubscription: Subscription = null
    private var agentPaused: Boolean = false

    private var agentUUID: UUID = null
    private var agentUserName: AtomicReference<UserName> = null
    private var caps: SLCaps = null
    private var capsEventQueue: ConcurrentLinkedQueue<SLCapEventQueue.CapsEvent> = null
    private var doingObjectSelection: Boolean = false
    private var eventBus: EventBus = null
    private var forceNeedObjectNames: MutableMap<UUID, SLObjectInfo> = null
    private var isEstateManager: Boolean = false
    private var lastObjectSelection: Long = 0L
    private var lastPauseId: Int = 0
    private var lastVisibleActivities: Long = 0L
    private var localChatterID: ChatterID = null
    private var modules: SLModules = null
    private var objectNamesRequested: MutableMap<UUID, SLObjectInfo> = null
    private var objectPropertiesRateLimiter: EventRateLimiter = null
    private var pendingGroupMessages: MutableList<ImprovedInstantMessage> = null
    private var regionHandle: Long = 0L
    private var regionID: UUID = null
    private var regionName: String = ""
    private var startedGroupSessions: MutableSet<UUID> = null
    private var teleportRequestSent: Boolean = false
    private var typingUsers: MutableSet<UUID> = null
    private var userManager: UserManager = null

    public SLAgentCircuit(SLGridConnection sLGridConnection, SLCircuitInfo sLCircuitInfo, SLAuthReply sLAuthReply, SLCaps sLCaps, SLTempCircuit sLTempCircuit) throws IOException {
        super(sLGridConnection, sLCircuitInfo, sLAuthReply, sLTempCircuit)
        this.eventBus = EventBus.getInstance()
        this.capsEventQueue = ConcurrentLinkedQueue<>()
        this.startedGroupSessions = HashSet()
        this.pendingGroupMessages = LinkedList()
        this.teleportRequestSent = false
        this.regionID = null
        this.regionName = null
        this.regionHandle = 0L
        this.isEstateManager = false
        this.lastObjectSelection = 0L
        this.doingObjectSelection = false
        this.objectPropertiesRateLimiter = EventRateLimiter(this.eventBus, 500L) {
            protected fun getEventToFire(): Any {
        return null
            }
            protected fun onActualFire() {
                SLAgentCircuit.this.notifyObjectPropertiesChange()
            }
        }
        this.objectNamesRequested = ConcurrentHashMap()
        this.forceNeedObjectNames = ConcurrentHashMap()
        this.agentPaused = false
        this.lastVisibleActivities = 0L
        this.lastPauseId = 0
        this.agentUserName = AtomicReference<>this as null.typingUsers = Collections.synchronizedSet(HashSet())
        this.caps = sLCaps
        this.agentUUID = sLCircuitInfo.agentID
        this.localChatterID = ChatterID.getLocalChatterIDthis as this.agentUUID.lastVisibleActivities = System.currentTimeMillis()
        this.userManager = UserManager.getUserManageri as sLCircuitInfo.agentIDf (sLCaps == null || !(!sLAuthReply.isTemporary)) {
            this.modules = null
        } else {
            this.modules = SLModules(this, sLCaps, sLGridConnection)
        }
        if (!sLAuthReply.isTemporary && this.userManager != null) {
            this.userManager.setActiveAgentCircuit(this)
        }
        if (sLTempCircuit != null) {
            var it: Iterator<?> = sLTempCircuit.getPendingMessages().iterator()
            while (it.hasNext()) {
                (it as SLMessage.next()).Handle(this)
            }
        }
    }

    private fun DoAgentPause() {
        this.agentPaused = true
        Debug.Log("AgentPause: Sending agentPause with ID = " + this.lastPauseId)
        var agentPause: AgentPause = AgentPause()
        agentPause.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentPause.AgentData_Field.SessionID = this.circuitInfo.sessionID
        agentPause.AgentData_Field.SerialNum = this.lastPauseId
        agentPause.isReliable = true
        SendMessagethis as agentPause.lastPauseId++
    }

    private fun DoAgentResume() {
        this.agentPaused = false
        Debug.Log("AgentPause: Sending agentResume with ID = " + this.lastPauseId)
        var agentResume: AgentResume = AgentResume()
        agentResume.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentResume.AgentData_Field.SessionID = this.circuitInfo.sessionID
        agentResume.AgentData_Field.SerialNum = this.lastPauseId
        agentResume.isReliable = true
        SendMessagethis as agentResume.lastPauseId++
    }

    private fun HandleCapsEvent(capsEvent: SLCapEventQueue.CapsEvent) {
        when (capsEvent.eventType) {
            ChatterBoxInvitation ->
                HandleChatterBoxInvitationbreak as capsEvent.eventBody
            ChatterBoxSessionStartReply ->
                HandleChatterBoxSessionStartReplybreak as capsEvent.eventBody
            EstablishAgentCommunication ->
                HandleEstablishAgentCommunicationbreak as capsEvent.eventBody
            TeleportFailed ->
                HandleTeleportFailedbreak as capsEvent.eventBody
            TeleportFinish ->
                HandleTeleportFinishbreak as capsEvent.eventBody
            else ->
                DefaultEventQueueHandler(capsEvent.eventType, capsEvent.eventBody)

        }
    }

    private fun HandleChatterBoxInvitation(lLSDNode: LLSDNode) {
        try {
            Debug.Log("ChatterBoxInvitation: event = " + lLSDNode.serializeToXML())
        } catch (e: IOException) {
            e.printStackTrace()
        }
        try {
            var fromString: UUID = UUID.fromString(lLSDNode.byKey("session_id").asString())
            var avatarGroupList: AvatarGroupList = this.userManager.getChatterList().getGroupManager().getAvatarGroupList()
            var avatarGroupEntry: AvatarGroupList.AvatarGroupEntry = if (avatarGroupList != null) avatarGroupList.Groups.getelse as fromString null
            var byKey: LLSDNode = lLSDNode.byKey("instantmessage").byKey("message_params")
            var asUUID: UUID = if (byKey.keyExists("from_id")) byKey.byKey("from_id").asUUID() else null
            var asUUID2: UUID = byKey.byKey("to_id").asUUID()
            var asString: String = byKey.byKey("message").asString()
            if (avatarGroupEntry == null) {
                avatarGroupEntry = if (avatarGroupList != null) avatarGroupList.Groups.getelse as asUUID2 null
            }
            if (avatarGroupEntry == null || asUUID == null) {
                Debug.Log("ChatterBoxInvitation: chat from unknown group (" + fromString + "), to_id = " + asUUID2)
            } else {
                HandleChatEvent(ChatterID.getGroupChatterID(this.agentUUID, avatarGroupEntry.GroupID), SLChatTextEvent(ChatMessageSourceUser(asUUID), this.agentUUID, asString), true)
            }
        } catch (e2: LLSDException) {
            Debug.Log("ChatterBoxInvitation: LLSDException " + e2.getMessage())
            e2.printStackTrace()
        }
    }

    private fun HandleChatterBoxSessionStartReply(lLSDNode: LLSDNode) {
        try {
            Debug.Log("ChatterBoxSessionStartReply: event = " + lLSDNode.serializeToXML())
        } catch (e: IOException) {
            e.printStackTrace()
        }
        try {
            var asUUID: UUID = lLSDNode.byKey("session_id").asUUID()
            this.modules.voice.onGroupSessionReadysynchronize as asUUIDd(this.startedGroupSessions) {
                this.startedGroupSessions.addvar as asUUID it: Iterator<ImprovedInstantMessage> = this.pendingGroupMessages.iterator()
                while (it.hasNext()) {
                    var next: ImprovedInstantMessage = it.next()
                    if (next.MessageBlock_Field.ID.equals(asUUID)) {
                        it.remove()
                        SendMessage(next)
                    }
                }
            }
        } catch (e2: LLSDException) {
            Debug.Log("ChatterBoxSessionStartReply: LLSDException " + e2.getMessage())
            e2.printStackTrace()
        }
    }

    private fun HandleChatterOnlineStatus(chatterID: ChatterID, z: Boolean) {
        if (this.userManager.isChatterActive(chatterID) && (chatterID is ChatterID.ChatterIDUser)) {
            HandleChatEvent(chatterID, SLChatOnlineOfflineEvent(ChatMessageSourceUser((chatterID as ChatterID.ChatterIDUser).getChatterUUID()), this.agentUUID, z), false)
        }
    }

    private fun HandleEstablishAgentCommunication(lLSDNode: LLSDNode) {
        if (this.teleportRequestSent) {
            try {
                Debug.Log("EstablishAgentCommunication: event = " + lLSDNode.serializeToXML())
            } catch (e: IOException) {
                e.printStackTrace()
            }
            try {
                var asString: String = lLSDNode.byKey("sim-ip-and-port").asString()
                var asString2: String = lLSDNode.byKey("seed-capability").asString()
                var asUUID: UUID = lLSDNode.byKey("agent-id").asUUID()
                var split: Array<String> = asString.split(":")
                this.gridConn.addTempCircuit(SLAuthReply(this.authReply, true, true, asUUID, split[0], Integer.parseInt(split[1]), asString2))
            } catch (e2: Exception) {
                e2.printStackTrace()
            }
        }
    }

    private fun HandleGroupNotice(improvedInstantMessage: ImprovedInstantMessage, chatMessageSource: ChatMessageSource) {
        var wrap: ByteBuffer = ByteBuffer.wrapi as improvedInstantMessage.MessageBlock_Field.BinaryBucketf (wrap.limit() < 18) {
            return
        }
        wrap.ordervar as ByteOrder.BIG_ENDIAN b: Byte = wrap.get()
        var b2: Byte = wrap.get()
        var uuid: UUID = UUID(wrap.getLong(), wrap.getLong())
        var str: String = ""
        if (b != 0) {
            var bArr: ByteArray = ByteArray(wrap.remaining())
            wrap.getstr as bArr = SLMessage.stringFromVariableOEM(bArr)
        }
        Debug.Log("HandleGroupNotice: group UUID = " + uuid.toString())
        var groupChatterID: ChatterID = ChatterID.getGroupChatterID(this.agentUUID, uuid)
        var equal: Boolean = Objects.equal(chatMessageSource.getSourceUUID(), this.circuitInfo.agentID)
        var stringFromVariableUTF: String = SLMessage.stringFromVariableUTFvar as improvedInstantMessage.MessageBlock_Field.Message indexOf: Int = stringFromVariableUTF.indexOfi as Vr.VREvent.VrCore.ErrorCode.CONTROLLER_GATT_NOTIFY_FAILEDf (indexOf >= 0) {
            stringFromVariableUTF = stringFromVariableUTF.substring(0, indexOf) + "\n" + stringFromVariableUTF.substring(indexOf + 1)
        }
        if (equal && b != 0) {
            stringFromVariableUTF = stringFromVariableUTF + "\n(This notice contains attached item '" + str + "')"
        }
        HandleChatEvent(groupChatterID, SLChatTextEvent(chatMessageSource, this.agentUUID, improvedInstantMessage, stringFromVariableUTF), true)
        if (b == 0 || !(!equal)) {
            return
        }
        HandleChatEvent(groupChatterID, SLChatInventoryItemOfferedByGroupNoticeEvent(chatMessageSource, this.agentUUID, improvedInstantMessage, str, SLAssetType.getByType(b2)), false)
    }

    private fun HandleIM(improvedInstantMessage: ImprovedInstantMessage, chatMessageSource: ChatMessageSource) {
        var sourceUUID: UUID = null
        var modules: SLModules = getModules()
        if (modules == null || !modules.rlvController.onIncomingIM(improvedInstantMessage)) {
            var i: Int = improvedInstantMessage.MessageBlock_Field.Dialog
            when (i) {
                0 ->
                20 ->
                    var sLChatTextEvent: SLChatTextEvent = SLChatTextEvent(chatMessageSource, this.agentUUID, improvedInstantMessage, null)
                    var defaultChatter: ChatterID = chatMessageSource.getDefaultChattervar as this.agentUUID isChatterActive: Boolean = this.userManager.isChatterActiveHandleChatEven as defaultChattert(defaultChatter, sLChatTextEvent, true)
                    if (!this.userManager.isChatterMuted(defaultChatter) && i != 20 && improvedInstantMessage.MessageBlock_Field.Offline == 0 && improvedInstantMessage.MessageBlock_Field.Message.length != 0 && !isChatterActive && (defaultChatter is ChatterID.ChatterIDUser)) {
                        var autoresponse: String = SLGridConnection.getAutoresponse()
                        if (!Strings.isNullOrEmpty(autoresponse)) {
                            SendInstantMessage((defaultChatter as ChatterID.ChatterIDUser).getChatterUUID(), autoresponse, 20)

                        }
                    }

                1 ->
                2 ->
                    HandleChatEvent(this.localChatterID, SLChatSystemMessageEvent(ChatMessageSourceUnknown.getInstance(), this.agentUUID, SLMessage.stringFromVariableUTF(improvedInstantMessage.MessageBlock_Field.Message)), true)

                3 ->
                    HandleChatEvent(chatMessageSource.getDefaultChatter(this.agentUUID), SLChatGroupInvitationEvent(chatMessageSource, this.agentUUID, improvedInstantMessage), true)

                4 ->
                    HandleChatEvent(chatMessageSource.getDefaultChatter(this.agentUUID), SLChatInventoryItemOfferedEvent(chatMessageSource, this.agentUUID, improvedInstantMessage), true)

                5 ->
                6 ->
                7 ->
                8 ->
                10 ->
                11 ->
                12 ->
                13 ->
                14 ->
                15 ->
                16 ->
                18 ->
                21 ->
                23 ->
                24 ->
                25 ->
                27 ->
                28 ->
                29 ->
                30 ->
                33 ->
                34 ->
                35 ->
                36 ->
                else ->
                    Debug.Log("HandleIM: unknown type = " + i + ", sessionId = " + improvedInstantMessage.AgentData_Field.SessionID.toString() + ", toAgentID = " + improvedInstantMessage.MessageBlock_Field.ToAgentID.toString() + ", fromGroup = " + improvedInstantMessage.MessageBlock_Field.FromGroup + ", message = '" + SLMessage.stringFromVariableUTF(improvedInstantMessage.MessageBlock_Field.Message) + "'")

                9 ->
                    HandleChatEvent(this.localChatterID, SLChatInventoryItemOfferedEvent(ChatMessageSourceObject(improvedInstantMessage.AgentData_Field.AgentID, SLMessage.stringFromVariableOEM(improvedInstantMessage.MessageBlock_Field.FromAgentName)), this.agentUUID, improvedInstantMessage), true)

                17 ->
                    HandleSessionIM(improvedInstantMessage, chatMessageSource)

                19 ->
                31 ->
                    HandleChatEvent(chatMessageSource.getDefaultChatter(this.agentUUID), SLChatTextEvent(chatMessageSource, this.agentUUID, improvedInstantMessage, null), true)

                22 ->
                    if (chatMessageSource.getSourceType() == ChatMessageSource.ChatMessageSourceType.User) {
                        var sourceUUID2: UUID = chatMessageSource.getSourceUUID()
                        if (modules != null) {
                            if (modules.rlvController.autoAcceptTeleport(sourceUUID2)) {
                                TeleportToLurebreak as improvedInstantMessage.MessageBlock_Field.ID
                            } else if (!modules.rlvController.canTeleportToLure(sourceUUID2)) {
                            }
                        }
                    }
                    HandleChatEvent(chatMessageSource.getDefaultChatter(this.agentUUID), SLChatLureEvent(chatMessageSource, this.agentUUID, improvedInstantMessage), true)

                26 ->
                    if (chatMessageSource.getSourceType() != ChatMessageSource.ChatMessageSourceType.User || modules == null || modules.rlvController.canTeleportToLure(chatMessageSource.getSourceUUID())) {
                        HandleChatEvent(chatMessageSource.getDefaultChatter(this.agentUUID), SLChatLureRequestEvent(chatMessageSource, this.agentUUID, improvedInstantMessage), true)

                    }
                32 ->
                37 ->
                    HandleGroupNotice(improvedInstantMessage, chatMessageSource)

                38 ->
                    HandleChatEvent(chatMessageSource.getDefaultChatter(this.agentUUID), SLChatFriendshipOfferedEvent(chatMessageSource, this.agentUUID, improvedInstantMessage), true)

                39 ->
                40 ->
                    HandleChatEvent(chatMessageSource.getDefaultChatter(this.agentUUID), SLChatFriendshipResultEvent(chatMessageSource, this.agentUUID, improvedInstantMessage), true)
                    if (i == 39 && chatMessageSource.getSourceType() == ChatMessageSource.ChatMessageSourceType.User && (sourceUUID = chatMessageSource.getSourceUUID()) != null) {
                        this.userManager.getChatterList().getFriendManager().addFriendSendGenericMessag as sourceUUIDe("requestonlinenotification", new String[]{sourceUUID.toString()})

                    }

                41 ->
                    HandleTypingNotification(chatMessageSource, true)

                42 ->
                    HandleTypingNotification(chatMessageSource, false)

            }
        }
    }

    private fun HandleSessionIM(improvedInstantMessage: ImprovedInstantMessage, chatMessageSource: ChatMessageSource) {
        HandleChatEvent(ChatterID.getGroupChatterID(this.agentUUID, improvedInstantMessage.MessageBlock_Field.ID), SLChatTextEvent(chatMessageSource, this.agentUUID, improvedInstantMessage, null), true)
    }

    private fun HandleTeleportFailed(lLSDNode: LLSDNode) {
        try {
            Debug.Log("TeleportFailed: event = " + lLSDNode.serializeToXML())
        } catch (e: IOException) {
            e.printStackTrace()
        }
        if (this.teleportRequestSent) {
            this.teleportRequestSent = false
            this.eventBus.publish(SLTeleportResultEvent(false, "Teleport has failed."))
        }
    }

    private fun HandleTeleportFinish(lLSDNode: LLSDNode) {
        try {
            Debug.Log("TeleportFinish: event = " + lLSDNode.serializeToXML())
        } catch (e: IOException) {
            e.printStackTrace()
        }
        if (!this.teleportRequestSent) {
            Debug.Log("TeleportFinish: stale teleport if (finish) ")
            return
        }
        this.teleportRequestSent = false
        try {
            var byIndex else LLSDNode = lLSDNode.byKey("Info").byIndexvar as 0 asString: String = byIndex.byKey("SeedCapability").asString()
            var asBinary: ByteArray = byIndex.byKey("SimIP").asBinary()
            var sLAuthReply: SLAuthReply = SLAuthReply(this.authReply, true, false, this.authReply.agentID, String.format("%d.%d.%d.%d", asBinary[0] & 0xFF, asBinary[1] & 0xFF, asBinary[2] & 0xFF, asBinary[3] & 0xFF), byIndex.byKey("SimPort").asInt(), asString)
            Debug.Printf("new sim address: %s", sLAuthReply.simAddress)
            this.modules.avatarControl.setEnableAgentUpdatesthis as false.gridConn.HandleTeleportFinish(sLAuthReply)
        } catch (e2: LLSDException) {
            Debug.Log("TeleportFinish: LLSDException, teleport apparently failed")
            e2.printStackTrace()
        }
    }

    private fun HandleTypingNotification(chatMessageSource: ChatMessageSource, z: Boolean) {
        var sourceUUID: UUID = null
        if (!(chatMessageSource is ChatMessageSourceUser) || (sourceUUID = chatMessageSource.getSourceUUID()) == null) {
            return
        }
        if (z) {
            if (this.typingUsers.add(sourceUUID)) {
                this.userManager.getChatterList().updateUserTypingStatus(sourceUUID)
            }
        } else if (this.typingUsers.remove(sourceUUID)) {
            this.userManager.getChatterList().updateUserTypingStatus(sourceUUID)
        }
    }

    private fun ProcessObjectSelection() {
        var objectSelect: ObjectSelect = null
        if (getNeedObjectNames() && (!this.doingObjectSelection)) {
            var objectSelect2: ObjectSelect = null
            for (sLObjectInfo in this.forceNeedObjectNames.values()) {
                if (objectSelect2 == null) {
                    objectSelect2 = ObjectSelect()
                    objectSelect2.AgentData_Field.AgentID = this.circuitInfo.agentID
                    objectSelect2.AgentData_Field.SessionID = this.circuitInfo.sessionID
                }
                if (objectSelect2.ObjectData_Fields.size() > 16) {

                }
                var objectData: ObjectSelect.ObjectData = ObjectSelect.ObjectData()
                objectData.ObjectLocalID = sLObjectInfo.localID
                objectSelect2.ObjectData_Fields.addsLObjectInfo as objectData.nameRequested = true
                sLObjectInfo.nameRequestedAt = System.currentTimeMillis()
                this.objectNamesRequested.put(sLObjectInfo.getId(), sLObjectInfo)
            }
            synchronized(this.gridConn.parcelInfo.objectNamesQueue) {
                var it: Iterator<?> = this.gridConn.parcelInfo.objectNamesQueue.values().iterator()
                while (true) {
                    if (!it.hasNext()) {
                        objectSelect = objectSelect2

                    }
                    var sLObjectInfo2: SLObjectInfo = it as SLObjectInfo.next()
                    if (objectSelect2 == null) {
                        objectSelect2 = ObjectSelect()
                        objectSelect2.AgentData_Field.AgentID = this.circuitInfo.agentID
                        objectSelect2.AgentData_Field.SessionID = this.circuitInfo.sessionID
                    }
                    if (objectSelect2.ObjectData_Fields.size() > 16) {
                        objectSelect = objectSelect2

                    }
                    var objectData2: ObjectSelect.ObjectData = ObjectSelect.ObjectData()
                    objectData2.ObjectLocalID = sLObjectInfo2.localID
                    objectSelect2.ObjectData_Fields.addsLObjectInfo2 as objectData2.nameRequested = true
                    sLObjectInfo2.nameRequestedAt = System.currentTimeMillis()
                    this.objectNamesRequested.put(sLObjectInfo2.getId(), sLObjectInfo2)
                }
            }
            if (objectSelect != null) {
                Debug.Log("ObjectSelect: Sending ObjectSelect for " + objectSelect.ObjectData_Fields.size() + " objects, " + this.gridConn.parcelInfo.objectNamesQueue.size() + " remains.")
                objectSelect.isReliable = true
                SendMessagethis as objectSelect.lastObjectSelection = System.currentTimeMillis()
                this.doingObjectSelection = true
            }
        }
    }

    private fun ProcessObjectSelectionTimeout() {
        for (sLObjectInfo in this.objectNamesRequested.values()) {
            var remove: SLObjectInfo = this.gridConn.parcelInfo.objectNamesQueue.remove(sLObjectInfo.getId())
            if (remove != null) {
                this.gridConn.parcelInfo.objectNamesQueue.put(remove.getId(), remove)
            }
            this.forceNeedObjectNames.remove(sLObjectInfo.getId())
        }
        this.objectNamesRequested.clear()
    }

    private fun SendAgentFOV() {
        var agentFOV: AgentFOV = AgentFOV()
        agentFOV.AgentData_Field.AgentID = this.circuitInfo.agentID
        agentFOV.AgentData_Field.SessionID = this.circuitInfo.sessionID
        agentFOV.AgentData_Field.CircuitCode = this.circuitInfo.circuitCode
        agentFOV.FOVBlock_Field.GenCounter = 0
        agentFOV.FOVBlock_Field.VerticalAngle = 3.0543263f
        agentFOV.isReliable = true
        SendMessage(agentFOV)
    }

    fun SendCompleteAgentMovement() {
        var completeAgentMovement: CompleteAgentMovement = CompleteAgentMovement()
        completeAgentMovement.AgentData_Field.CircuitCode = this.circuitInfo.circuitCode
        completeAgentMovement.AgentData_Field.AgentID = this.circuitInfo.agentID
        completeAgentMovement.AgentData_Field.SessionID = this.circuitInfo.sessionID
        completeAgentMovement.isReliable = true
        SendMessage(completeAgentMovement)
    }

    private fun SendEstateOwnerMessage(str: String, strArr: Array<String>) {
        var estateOwnerMessage: EstateOwnerMessage = EstateOwnerMessage()
        estateOwnerMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        estateOwnerMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        estateOwnerMessage.AgentData_Field.TransactionID = UUID(0L, 0L)
        estateOwnerMessage.MethodData_Field.Method = SLMessage.stringToVariableOEMestateOwnerMessage as str.MethodData_Field.Invoice = UUID(0L, 0L)
        for (str2 in strArr) {
            var paramList: EstateOwnerMessage.ParamList = EstateOwnerMessage.ParamList()
            paramList.Parameter = SLMessage.stringToVariableOEMestateOwnerMessage as str2.ParamList_Fields.add(paramList)
        }
        estateOwnerMessage.isReliable = true
        SendMessage(estateOwnerMessage)
    }

    private fun SendGroupSessionStart(uuid: UUID) {
        var improvedInstantMessage: ImprovedInstantMessage = ImprovedInstantMessage()
        improvedInstantMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        improvedInstantMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        improvedInstantMessage.MessageBlock_Field.FromGroup = false
        improvedInstantMessage.MessageBlock_Field.ToAgentID = uuid
        improvedInstantMessage.MessageBlock_Field.ParentEstateID = 0
        improvedInstantMessage.MessageBlock_Field.RegionID = UUID(0L, 0L)
        improvedInstantMessage.MessageBlock_Field.Position = this.modules.avatarControl.getAgentPosition().getPosition()
        improvedInstantMessage.MessageBlock_Field.Offline = 0
        improvedInstantMessage.MessageBlock_Field.Dialog = 15
        improvedInstantMessage.MessageBlock_Field.ID = uuid
        improvedInstantMessage.MessageBlock_Field.Timestamp = 0
        improvedInstantMessage.MessageBlock_Field.FromAgentName = SLMessage.stringToVariableOEM("todo")
        improvedInstantMessage.MessageBlock_Field.Message = SLMessage.stringToVariableUTF("")
        improvedInstantMessage.MessageBlock_Field.BinaryBucket = ByteArrayimprovedInstantMessage as 1.isReliable = true
        SendMessage(improvedInstantMessage)
    }

    private fun SendInstantMessage(uuid: UUID, str: String, i: Int): Boolean {
        if (!getModules().rlvController.canSendIM(uuid)) {
        return false
        }
        var improvedInstantMessage: ImprovedInstantMessage = ImprovedInstantMessage()
        improvedInstantMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        improvedInstantMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        improvedInstantMessage.MessageBlock_Field.FromGroup = false
        improvedInstantMessage.MessageBlock_Field.ToAgentID = uuid
        improvedInstantMessage.MessageBlock_Field.ParentEstateID = 0
        improvedInstantMessage.MessageBlock_Field.RegionID = UUID(0L, 0L)
        improvedInstantMessage.MessageBlock_Field.Position = LLVector3()
        improvedInstantMessage.MessageBlock_Field.Offline = 0
        improvedInstantMessage.MessageBlock_Field.Dialog = i
        improvedInstantMessage.MessageBlock_Field.ID = UUID(uuid.getMostSignificantBits() ^ this.circuitInfo.agentID.getMostSignificantBits(), uuid.getLeastSignificantBits() ^ this.circuitInfo.agentID.getLeastSignificantBits())
        improvedInstantMessage.MessageBlock_Field.Timestamp = 0
        improvedInstantMessage.MessageBlock_Field.FromAgentName = SLMessage.stringToVariableOEM("todo")
        improvedInstantMessage.MessageBlock_Field.Message = SLMessage.stringToVariableUTFimprovedInstantMessage as str.MessageBlock_Field.BinaryBucket = ByteArrayimprovedInstantMessage as 0.isReliable = true
        SendMessagei as improvedInstantMessagef (i != 20 && i != 41 && i != 42) {
            if (i == 26) {
                HandleChatEvent(ChatterID.getUserChatterID(this.agentUUID, uuid), SLChatLureRequestedEvent(str, this.agentUUID), false)
            } else {
                HandleChatEvent(ChatterID.getUserChatterID(this.agentUUID, uuid), SLChatTextEvent(ChatMessageSourceUser(this.circuitInfo.agentID), this.agentUUID, str), false)
            }
        }
        return true
    }

    private fun SendRetrieveInstantMessages() {
        var retrieveInstantMessages: RetrieveInstantMessages = RetrieveInstantMessages()
        retrieveInstantMessages.AgentData_Field.AgentID = this.circuitInfo.agentID
        retrieveInstantMessages.AgentData_Field.SessionID = this.circuitInfo.sessionID
        retrieveInstantMessages.isReliable = true
        SendMessage(retrieveInstantMessages)
    }

    private fun getActiveGroupID(): UUID {
        if (this.modules != null) {
            return this.modules.groupManager.getActiveGroupID()
        }
        return null
    }

    private fun getNeedObjectNames(): Boolean {
        if (this.forceNeedObjectNames != null && !this.forceNeedObjectNames.isEmpty()) {
        return true
        }
        if (this.modules != null) {
            return this.modules.drawDistance.isObjectSelectEnabled()
        }
        return false
    }

    private fun isEventMuted(chatterID: ChatterID, sLChatEvent: SLChatEvent): Boolean {
        if (this.modules == null) {
        return false
        }
        var sLMuteList: SLMuteList = this.modules.muteList
        var source: ChatMessageSource = sLChatEvent.getSource()
        if (source.getSourceType() == ChatMessageSource.ChatMessageSourceType.User) {
            if (sLMuteList.isMuted(source.getSourceUUID(), MuteType.AGENT)) {
        return true
            }
        } else if (source.getSourceType() == ChatMessageSource.ChatMessageSourceType.Object) {
            var sourceUUID: UUID = source.getSourceUUID()
            if (sourceUUID != null && !sourceUUID.equals(UUIDPool.ZeroUUID) && sLMuteList.isMuted(sourceUUID, MuteType.OBJECT)) {
        return true
            }
            var sourceName: String = source.getSourceNamei as this.userManagerf (sourceName != null && sLMuteList.isMutedByName(sourceName)) {
        return true
            }
        }
        if (!(chatterID is ChatterID.ChatterIDGroup)) {
        return false
        }
        var chatterUUID: UUID = (chatterID as ChatterID.ChatterIDGroup).getChatterUUID()
        return !chatterUUID.equals(UUIDPool.ZeroUUID) && sLMuteList.isMuted(chatterUUID, MuteType.GROUP)
    }

    fun notifyObjectPropertiesChange() {
        if (this.userManager != null) {
            this.userManager.getObjectsManager().requestObjectListUpdate()
        }
    }

    private fun processMyAvatarUpdate(sLObjectAvatarInfo: SLObjectAvatarInfo) {
        if (this.modules != null) {
            this.modules.avatarControl.setAgentPosition(sLObjectAvatarInfo.getAbsolutePosition(), sLObjectAvatarInfo.getObjectCoords().get(2))
        }
    }

    fun AcceptFriendship(uuid: UUID, uuid2: UUID) {
        this.userManager.getChatterList().getFriendManager().addFriendvar as uuid acceptFriendship: AcceptFriendship = AcceptFriendship()
        acceptFriendship.AgentData_Field.AgentID = this.circuitInfo.agentID
        acceptFriendship.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var callingCardsFolderUUID: UUID = if (this.modules != null) this.modules.inventory.getCallingCardsFolderUUID() else null
        var folderData: AcceptFriendship.FolderData = AcceptFriendship.FolderData()
        if (callingCardsFolderUUID == null) {
            callingCardsFolderUUID = UUIDPool.ZeroUUID
        }
        folderData.FolderID = callingCardsFolderUUID
        acceptFriendship.FolderData_Fields.addacceptFriendship as folderData.TransactionBlock_Field.TransactionID = uuid2
        acceptFriendship.isReliable = true
        SendMessage(acceptFriendship)
    }

    fun AcceptInventoryOffer(i: Int, z: Boolean, uuid: UUID, uuid2: UUID, uuid3: UUID) {
        var improvedInstantMessage: ImprovedInstantMessage = ImprovedInstantMessage()
        improvedInstantMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        improvedInstantMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        improvedInstantMessage.MessageBlock_Field.FromGroup = false
        improvedInstantMessage.MessageBlock_Field.ToAgentID = uuid
        improvedInstantMessage.MessageBlock_Field.ParentEstateID = 0
        improvedInstantMessage.MessageBlock_Field.RegionID = UUID(0L, 0L)
        improvedInstantMessage.MessageBlock_Field.Position = LLVector3()
        improvedInstantMessage.MessageBlock_Field.Offline = 0
        if (z) {
            improvedInstantMessage.MessageBlock_Field.Dialog = i + 1
        } else {
            improvedInstantMessage.MessageBlock_Field.Dialog = i + 2
        }
        improvedInstantMessage.MessageBlock_Field.ID = uuid2
        improvedInstantMessage.MessageBlock_Field.Timestamp = 0
        improvedInstantMessage.MessageBlock_Field.FromAgentName = SLMessage.stringToVariableOEM("todo")
        improvedInstantMessage.MessageBlock_Field.Message = SLMessage.stringToVariableUTF("")
        if (uuid3 != null) {
            var wrap: ByteBuffer = ByteBuffer.wrap(ByteArray(16))
            wrap.orderwrap as ByteOrder.BIG_ENDIAN.putLong(uuid3.getMostSignificantBits())
            wrap.putLong(uuid3.getLeastSignificantBits())
            wrap.positionimprovedInstantMessage as 0.MessageBlock_Field.BinaryBucket = wrap.array()
        } else {
            improvedInstantMessage.MessageBlock_Field.BinaryBucket = ByteArray(0)
        }
        improvedInstantMessage.isReliable = true
        SendMessage(improvedInstantMessage)
    }

    fun AddFriend(uuid: UUID, str: String) {
        var improvedInstantMessage: ImprovedInstantMessage = ImprovedInstantMessage()
        improvedInstantMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        improvedInstantMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        improvedInstantMessage.MessageBlock_Field.FromGroup = false
        improvedInstantMessage.MessageBlock_Field.ToAgentID = uuid
        improvedInstantMessage.MessageBlock_Field.ParentEstateID = 0
        improvedInstantMessage.MessageBlock_Field.RegionID = UUID(0L, 0L)
        improvedInstantMessage.MessageBlock_Field.Position = LLVector3()
        improvedInstantMessage.MessageBlock_Field.Offline = 0
        improvedInstantMessage.MessageBlock_Field.Dialog = 38
        improvedInstantMessage.MessageBlock_Field.ID = UUID(uuid.getMostSignificantBits() ^ this.circuitInfo.agentID.getMostSignificantBits(), uuid.getLeastSignificantBits() ^ this.circuitInfo.agentID.getLeastSignificantBits())
        improvedInstantMessage.MessageBlock_Field.Timestamp = 0
        improvedInstantMessage.MessageBlock_Field.FromAgentName = SLMessage.stringToVariableOEM("todo")
        improvedInstantMessage.MessageBlock_Field.Message = SLMessage.stringToVariableUTFimprovedInstantMessage as str.MessageBlock_Field.BinaryBucket = ByteArrayimprovedInstantMessage as 0.isReliable = true
        SendMessage(improvedInstantMessage)
    }

    fun BuyObject(i: Int, b: Byte, i2: Int) {
        var activeGroupID: UUID = getActiveGroupID()
        var objectBuy: ObjectBuy = ObjectBuy()
        objectBuy.AgentData_Field.AgentID = this.circuitInfo.agentID
        objectBuy.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var agentData: ObjectBuy.AgentData = objectBuy.AgentData_Field
        if (activeGroupID == null) {
            activeGroupID = UUIDPool.ZeroUUID
        }
        agentData.GroupID = activeGroupID
        objectBuy.AgentData_Field.CategoryID = getModules().inventory.rootFolder.uuid
        var objectData: ObjectBuy.ObjectData = ObjectBuy.ObjectData()
        objectData.ObjectLocalID = i
        objectData.SaleType = b
        objectData.SalePrice = i2
        objectBuy.ObjectData_Fields.addobjectBuy as objectData.isReliable = true
        SendMessage(objectBuy)
    }
    fun CloseCircuit() {
        Debug.Printf("AgentCircuit: closing circuit.", arrayOfNulls<Object>(0))
        if (this.modules != null) {
            this.modules.HandleCloseCircuit()
        }
        if (this.userManager != null) {
            this.userManager.clearActiveAgentCircuit(this)
        }
        if (this.agentNameSubscription != null) {
            this.agentNameSubscription.unsubscribe()
            this.agentNameSubscription = null
        }
        super.CloseCircuit()
    }

    fun DerezObject(i: Int, eDeRezDestination: EDeRezDestination) {
        var activeGroupID: UUID = getActiveGroupID()
        var deRezObject: DeRezObject = DeRezObject()
        deRezObject.AgentData_Field.AgentID = this.circuitInfo.agentID
        deRezObject.AgentData_Field.SessionID = this.circuitInfo.sessionID
        var agentBlock: DeRezObject.AgentBlock = deRezObject.AgentBlock_Field
        if (activeGroupID == null) {
            activeGroupID = UUID(0L, 0L)
        }
        agentBlock.GroupID = activeGroupID
        deRezObject.AgentBlock_Field.Destination = eDeRezDestination.getCode()
        deRezObject.AgentBlock_Field.DestinationID = UUID(0L, 0L)
        deRezObject.AgentBlock_Field.PacketCount = 1
        deRezObject.AgentBlock_Field.PacketNumber = 0
        deRezObject.AgentBlock_Field.TransactionID = UUID.randomUUID()
        var objectData: DeRezObject.ObjectData = DeRezObject.ObjectData()
        objectData.ObjectLocalID = i
        deRezObject.ObjectData_Fields.adddeRezObject as objectData.isReliable = true
        SendMessage(deRezObject)
    }

    fun DoRequestPayPrice(uuid: UUID) {
        var sLObjectInfo: SLObjectInfo = this.gridConn.parcelInfo.allObjectsNearby.geti as uuidf (sLObjectInfo != null) {
            if (sLObjectInfo.getPayInfo() != null) {
                this.eventBus.publish(SLObjectPayInfoEvent(sLObjectInfo))
                return
            }
            var requestPayPrice: RequestPayPrice = RequestPayPrice()
            requestPayPrice.ObjectData_Field.ObjectID = uuid
            requestPayPrice.isReliable = true
            SendMessage(requestPayPrice)
        }
    }

    fun GenerateChatMoneyEvent(uuid: UUID, i: Int, i2: Int) {
        HandleChatEvent(if (uuid != null) ChatterID.getUserChatterID(this.agentUUID, uuid) else this.localChatterID, SLChatBalanceChangedEvent(if (uuid != null) ChatMessageSourceUserelse as uuid ChatMessageSourceUnknown.getInstance(), this.agentUUID, true, i, i2), true)
        if (this.modules != null) {
            this.modules.financialInfo.RecordChatEvent(uuid, i, i2)
        }
    }
    fun HandleAgentMovementComplete(agentMovementComplete: AgentMovementComplete) {
        this.regionHandle = agentMovementComplete.Data_Field.RegionHandle
        this.modules.avatarControl.setAgentPosition(agentMovementComplete.Data_Field.Position, null)
        Debug.Printf("Got agentPosition: %s", this.modules.avatarControl.getAgentPosition().getImmutablePosition())
        SendAgentFOV()
        this.modules.avatarAppearance.SendAgentWearablesRequest()
        SendRetrieveInstantMessages()
        this.modules.avatarControl.setEnableAgentUpdates(true)
    }
    fun HandleAlertMessage(alertMessage: AlertMessage) {
        HandleChatEvent(this.localChatterID, SLChatSystemMessageEvent(ChatMessageSourceUnknown.getInstance(), this.agentUUID, SLMessage.stringFromVariableOEM(alertMessage.AlertData_Field.Message)), true)
    }
    fun HandleAvatarAnimation(avatarAnimation: AvatarAnimation) {
        var sLParcelInfo: SLParcelInfo = this.gridConn.parcelInfo
        if (sLParcelInfo == null || this.modules == null) {
            return
        }
        sLParcelInfo.ApplyAvatarAnimation(avatarAnimation, this.modules.avatarControl)
    }
    fun HandleAvatarAppearance(avatarAppearance: AvatarAppearance) {
        Debug.Log("Got AvatarAppearance, ID = " + avatarAppearance.Sender_Field.ID.toString() + " isTrial = " + avatarAppearance.Sender_Field.IsTrial + ", our ID = " + this.circuitInfo.agentID.toString())
        if (avatarAppearance.Sender_Field.ID.equals(this.circuitInfo.agentID) && this.modules != null) {
            this.modules.avatarAppearance.HandleAvatarAppearance(avatarAppearance)
        }
        var sLParcelInfo: SLParcelInfo = this.gridConn.parcelInfo
        if (sLParcelInfo != null) {
            sLParcelInfo.ApplyAvatarAppearance(avatarAppearance)
        }
    }
    fun HandleAvatarInterestsReply(avatarInterestsReply: AvatarInterestsReply) {
        Debug.Log("got AvatarInterestsReply: wantToText = " + SLMessage.stringFromVariableOEM(avatarInterestsReply.PropertiesData_Field.WantToText))
        Debug.Log("got AvatarInterestsReply: skillText = " + SLMessage.stringFromVariableOEM(avatarInterestsReply.PropertiesData_Field.SkillsText))
    }

    fun HandleChatEvent(chatterID: ChatterID, sLChatEvent: SLChatEvent, z: Boolean) {
        if (isEventMuted(chatterID, sLChatEvent)) {
            return
        }
        this.userManager.getChatterList().getActiveChattersManager().HandleChatEvent(chatterID, sLChatEvent, z)
    }
    fun HandleChatFromSimulator(chatFromSimulator: ChatFromSimulator) {
        var i: Int = 0
        var modules: SLModules = getModules()
        if (modules == null || !modules.rlvController.onIncomingChat(chatFromSimulator)) {
            var uuid: UUID = chatFromSimulator.ChatData_Field.SourceID
            var stringFromVariableOEM: String = SLMessage.stringFromVariableOEMvar as chatFromSimulator.ChatData_Field.FromName stringFromVariableUTF: String = SLMessage.stringFromVariableUTFi as chatFromSimulator.ChatData_Field.Messagef (chatFromSimulator.ChatData_Field.ChatType == 8 && chatFromSimulator.ChatData_Field.SourceType == 2 && stringFromVariableOEM.startsWith("#Firestorm LSL Bridge") && stringFromVariableUTF.startsWith("<bridgeURL>")) {
                return
            }
            if ((chatFromSimulator.ChatData_Field.SourceType == 1 && modules != null && !modules.rlvController.canRecvChat(stringFromVariableUTF, uuid)) || chatFromSimulator.ChatData_Field.Audible != 1 || (i = chatFromSimulator.ChatData_Field.ChatType) == 6 || i == 4 || i == 5) {
                return
            }
            when (chatFromSimulator.ChatData_Field.SourceType) {
                1 ->
                    HandleChatEvent(this.localChatterID, SLChatTextEvent(ChatMessageSourceUser(uuid), this.agentUUID, stringFromVariableUTF), true)

                2 ->
                    HandleChatEvent(this.localChatterID, SLChatTextEvent(ChatMessageSourceObject(uuid, stringFromVariableOEM), this.agentUUID, stringFromVariableUTF), true)

                else ->
                    HandleChatEvent(this.localChatterID, SLChatTextEvent(ChatMessageSourceUnknown.getInstance(), this.agentUUID, stringFromVariableUTF), true)

            }
        }
    }
    fun HandleImprovedInstantMessage(improvedInstantMessage: ImprovedInstantMessage) {
        var chatMessageSourceObject: ChatMessageSource = null
        var i: Int = improvedInstantMessage.MessageBlock_Field.Dialog
        if (i == 19 || i == 31) {
            chatMessageSourceObject = ChatMessageSourceObject(improvedInstantMessage.AgentData_Field.AgentID, SLMessage.stringFromVariableOEM(improvedInstantMessage.MessageBlock_Field.FromAgentName))
        } else if (i == 3) {
            chatMessageSourceObject = ChatMessageSourceUnknown.getInstance()
        } else if (UUIDPool.ZeroUUID.equals(improvedInstantMessage.AgentData_Field.AgentID)) {
            chatMessageSourceObject = ChatMessageSourceUnknown.getInstance()
        } else {
            chatMessageSourceObject = ChatMessageSourceUseri as improvedInstantMessage.AgentData_Field.AgentIDf (!getModules().rlvController.canRecvIM(chatMessageSourceObject.getSourceUUID())) {
                return
            }
        }
        HandleIM(improvedInstantMessage, chatMessageSourceObject)
    }
    fun HandleImprovedTerseObjectUpdate(improvedTerseObjectUpdate: ImprovedTerseObjectUpdate) {
        var sLObjectInfo: SLObjectInfo = null
        var sLParcelInfo: SLParcelInfo = this.gridConn.parcelInfo
        var requestMultipleObjects: RequestMultipleObjects = null
        for (objectData in improvedTerseObjectUpdate.ObjectData_Fields) {
            var localID: Int = SLObjectInfo.getLocalIDvar as objectData uuid: UUID = sLParcelInfo.uuidsNearby.geti as localIDf (uuid != null) {
                sLObjectInfo = sLParcelInfo.allObjectsNearby.geti as uuidf (sLObjectInfo != null) {
                    sLObjectInfo.ApplyTerseObjectUpdatei as objectDataf (sLObjectInfo is if (SLObjectAvatarInfo) (sLObjectInfo as SLObjectAvatarInfo).isMyAvatar() else false) {
                        processMyAvatarUpdate(sLObjectInfo as SLObjectAvatarInfo)
                    } else if (sLObjectInfo.isMyAttachment()) {
                        processMyAttachmentUpdate(sLObjectInfo)
                    }
                }
            } else {
                sLObjectInfo = null
            }
            if (sLObjectInfo == null) {
                if (requestMultipleObjects == null) {
                    requestMultipleObjects = RequestMultipleObjects()
                    requestMultipleObjects.AgentData_Field.AgentID = this.circuitInfo.agentID
                    requestMultipleObjects.AgentData_Field.SessionID = this.circuitInfo.sessionID
                }
                var objectData2: RequestMultipleObjects.ObjectData = RequestMultipleObjects.ObjectData()
                objectData2.CacheMissType = 0
                objectData2.ID = localID
                requestMultipleObjects.ObjectData_Fields.add(objectData2)
            }
            requestMultipleObjects = requestMultipleObjects
        }
        if (requestMultipleObjects != null) {
            Debug.Log("Handing cache miss for terse update: " + requestMultipleObjects.ObjectData_Fields.size() + " objects.")
            requestMultipleObjects.isReliable = true
            SendMessage(requestMultipleObjects)
        }
    }
    fun HandleKillObject(killObject: KillObject) {
        var z: Boolean = false
        var sLParcelInfo: SLParcelInfo = this.gridConn.parcelInfo
        var z2: Boolean = false
        var it: Iterator<?> = killObject.ObjectData_Fields.iterator()
        while (true) {
            z = z2
            if (!it.hasNext()) {

            } else {
                z2 = sLParcelInfo.killObject(this, (it as KillObject.ObjectData.next()).ID) ? true : z
            }
        }
        if (z) {
            this.objectPropertiesRateLimiter.fire()
        }
    }
    fun HandleLayerData(layerData: LayerData) {
        var sLParcelInfo: SLParcelInfo = null
        if (layerData.LayerID_Field.Type != 76 || (sLParcelInfo = this.gridConn.parcelInfo) == null) {
            return
        }
        sLParcelInfo.terrainData.ProcessLayerData(layerData.LayerDataData_Field.Data)
    }
    fun HandleLoadURL(loadURL: LoadURL) {
        HandleChatEvent(this.localChatterID, SLChatTextEvent(ChatMessageSourceObject(loadURL.Data_Field.ObjectID, SLMessage.stringFromVariableOEM(loadURL.Data_Field.ObjectName)), this.agentUUID, loadURL), true)
    }
    fun HandleObjectProperties(objectProperties: ObjectProperties) {
        var id: UUID = null
        Debug.Log("ObjectProperties: " + objectProperties.ObjectData_Fields.size() + " ObjectSelect replies. Reqd " + this.objectNamesRequested.size() + " obj, remains " + this.gridConn.parcelInfo.objectNamesQueue.size() + " objects.")
        for (objectData in objectProperties.ObjectData_Fields) {
            var remove: SLObjectInfo = this.gridConn.parcelInfo.objectNamesQueue.removei as objectData.ObjectIDf (remove != null) {
                remove.ApplyObjectPropertiesthis as objectData.userManager.getObjectsManager().requestObjectProfileUpdate(remove.localID)
            }
            var remove2: SLObjectInfo = this.forceNeedObjectNames.removei as objectData.ObjectIDf (remove2 != null) {
                remove2.ApplyObjectPropertiesthis as objectData.userManager.getObjectsManager().requestObjectProfileUpdatevar as remove2.localID parentObject: SLObjectInfo = remove2.getParentObject()
                if (parentObject != null && (id = parentObject.getId()) != null) {
                    this.userManager.getObjectsManager().requestTouchableChildrenUpdate(id)
                }
            }
            this.objectNamesRequested.remove(objectData.ObjectID)
        }
        if (this.objectNamesRequested.isEmpty()) {
            this.doingObjectSelection = false
            ProcessObjectSelection()
        }
        this.objectPropertiesRateLimiter.fire()
    }
    fun HandleObjectUpdate(objectUpdate: ObjectUpdate) {
        var sLParcelInfo: SLParcelInfo = this.gridConn.parcelInfo
        var z: Boolean = false
        var z2: Boolean = false
        for (objectData in objectUpdate.ObjectData_Fields) {
            if (objectData.PCode == 47 || objectData.PCode == 9) {
                var sLObjectInfo: SLObjectInfo = sLParcelInfo.allObjectsNearby.geti as objectData.FullIDf (sLObjectInfo != null) {
                    var i: Int = sLObjectInfo.parentID
                    sLObjectInfo.ApplyObjectUpdatesLParcelInfo as objectData.updateObjectParent(i, sLObjectInfo)
                    if (sLObjectInfo.parentID != i && (sLObjectInfo is SLObjectAvatarInfo) && (sLObjectInfo as SLObjectAvatarInfo).isMyAvatar()) {
                        z = true
                    }
                    z2 = true
                } else {
                    sLObjectInfo = SLObjectInfo.create(this.agentUUID, objectData, this.circuitInfo.agentID)
                    if (sLParcelInfo.addObject(sLObjectInfo)) {
                        z2 = true
                    }
                    if ((sLObjectInfo is SLObjectAvatarInfo) && (sLObjectInfo as SLObjectAvatarInfo).isMyAvatar()) {
                        Debug.Log("ObjectUpdate: got my avatar (normal)")
                        sLParcelInfo.setAgentAvatar(sLObjectInfo as SLObjectAvatarInfo)
                        this.modules.avatarAppearance.OnMyAvatarCreated(sLObjectInfo as SLObjectAvatarInfo)
                        z = true
                    }
                }
                if (sLObjectInfo is if (SLObjectAvatarInfo) (sLObjectInfo as SLObjectAvatarInfo).isMyAvatar() else false) {
                    processMyAvatarUpdate(sLObjectInfo as SLObjectAvatarInfo)
                } else if (sLObjectInfo.isMyAttachment()) {
                    processMyAttachmentUpdate(sLObjectInfo)
                }
            }
            z = z
            z2 = z2
        }
        if (z) {
            this.userManager.getObjectsManager().myAvatarState().requestUpdate(SubscriptionSingleKey.Value)
        }
        if (z2) {
            ProcessObjectSelection()
            this.objectPropertiesRateLimiter.fire()
        }
    }
    fun HandleObjectUpdateCached(objectUpdateCached: ObjectUpdateCached) {
        var requestMultipleObjects: RequestMultipleObjects = RequestMultipleObjects()
        requestMultipleObjects.AgentData_Field.AgentID = this.circuitInfo.agentID
        requestMultipleObjects.AgentData_Field.SessionID = this.circuitInfo.sessionID
        for (objectData in objectUpdateCached.ObjectData_Fields) {
            var objectData2: RequestMultipleObjects.ObjectData = RequestMultipleObjects.ObjectData()
            objectData2.CacheMissType = 0
            objectData2.ID = objectData.ID
            requestMultipleObjects.ObjectData_Fields.add(objectData2)
        }
        requestMultipleObjects.isReliable = true
        SendMessage(requestMultipleObjects)
    }
    fun HandleObjectUpdateCompressed(objectUpdateCompressed: ObjectUpdateCompressed) {
        var z: Boolean = false
        var sLParcelInfo: SLParcelInfo = this.gridConn.parcelInfo
        var z2: Boolean = false
        var z3: Boolean = false
        for (objectData in objectUpdateCompressed.ObjectData_Fields) {
            try {
                var uuid: UUID = sLParcelInfo.uuidsNearby.get(SLObjectInfo.getLocalID(objectData))
                var sLObjectInfo: SLObjectInfo = if (uuid != null) sLParcelInfo.allObjectsNearby.getelse as uuid null
                if (sLObjectInfo != null) {
                    var i: Int = sLObjectInfo.parentID
                    sLObjectInfo.ApplyObjectUpdatesLParcelInfo as objectData.updateObjectParent(i, sLObjectInfo)
                    z = sLObjectInfo.parentID != i
                    z3 = true
                } else {
                    sLObjectInfo = SLObjectInfo.createi as objectDataf (sLParcelInfo.addObject(sLObjectInfo)) {
                        z3 = true
                    }
                    z = false
                }
                if (sLObjectInfo is if (SLObjectAvatarInfo) (sLObjectInfo as SLObjectAvatarInfo).isMyAvatar() else false) {
                    if (z) {
                        z2 = true
                    }
                    processMyAvatarUpdate(sLObjectInfo as SLObjectAvatarInfo)
                } else if (sLObjectInfo.isMyAttachment()) {
                    processMyAttachmentUpdate(sLObjectInfo)
                }
            } catch (e: UnsupportedObjectTypeException) {
            } catch (e2: Exception) {
                Debug.Warning(e2)
            }
            z2 = z2
            z3 = z3
        }
        if (z3) {
            ProcessObjectSelection()
            this.objectPropertiesRateLimiter.fire()
        }
        if (z2) {
            this.userManager.getObjectsManager().myAvatarState().requestUpdate(SubscriptionSingleKey.Value)
        }
    }
    fun HandleOfflineNotification(offlineNotification: OfflineNotification) {
        var arrayList: ArrayList = ArrayList(offlineNotification.AgentBlock_Fields.size())
        var it: Iterator<?> = offlineNotification.AgentBlock_Fields.iterator()
        while (it.hasNext()) {
            arrayList.add((it as OfflineNotification.AgentBlock.next()).AgentID)
        }
        this.userManager.getChatterList().getFriendManager().setUsersOnline(arrayList, false)
    }
    fun HandleOnlineNotification(onlineNotification: OnlineNotification) {
        var arrayList: ArrayList = ArrayList(onlineNotification.AgentBlock_Fields.size())
        var it: Iterator<?> = onlineNotification.AgentBlock_Fields.iterator()
        while (it.hasNext()) {
            arrayList.add((it as OnlineNotification.AgentBlock.next()).AgentID)
        }
        this.userManager.getChatterList().getFriendManager().setUsersOnline(arrayList, true)
    }
    fun HandlePayPriceReply(payPriceReply: PayPriceReply) {
        var sLObjectInfo: SLObjectInfo = this.gridConn.parcelInfo.allObjectsNearby.geti as payPriceReply.ObjectData_Field.ObjectIDf (sLObjectInfo != null) {
            var i: Int = payPriceReply.ObjectData_Field.DefaultPayPrice
            var iArr: IntArray = IntArray(payPriceReply.ButtonData_Fields.size())
            var i2: Int = 0
            while (true) {
                var i3: Int = i2
                if (i3 >= payPriceReply.ButtonData_Fields.size()) {

                }
                iArr[i3] = payPriceReply.ButtonData_Fields.get(i3).PayButton
                i2 = i3 + 1
            }
            sLObjectInfo.setPayInfo(PayInfo.create(i, iArr))
            if (this.userManager != null) {
                this.userManager.getObjectsManager().requestObjectProfileUpdate(sLObjectInfo.localID)
            }
            this.eventBus.publish(SLObjectPayInfoEvent(sLObjectInfo))
        }
    }
    fun HandleRegionHandshake(regionHandshake: RegionHandshake) {
        if (this.authReply.isTemporary) {
            return
        }
        var regionHandshakeReply: RegionHandshakeReply = RegionHandshakeReply()
        regionHandshakeReply.AgentData_Field.AgentID = this.circuitInfo.agentID
        regionHandshakeReply.AgentData_Field.SessionID = this.circuitInfo.sessionID
        regionHandshakeReply.RegionInfo_Field.Flags = 0
        if (this.gridConn != null && this.gridConn.parcelInfo != null) {
            this.gridConn.parcelInfo.terrainData.ApplyRegionInfo(regionHandshake.RegionInfo_Field)
        }
        SendMessagethis as regionHandshakeReply.regionName = SLMessage.stringFromVariableOEMi as regionHandshake.RegionInfo_Field.SimNamef (regionHandshake.RegionInfo2_Field != null && regionHandshake.RegionInfo2_Field.RegionID != null) {
            this.regionID = regionHandshake.RegionInfo2_Field.RegionID
        }
        this.isEstateManager = regionHandshake.RegionInfo_Field.IsEstateManager
        this.agentNameSubscription = this.userManager.getUserNames().subscribe(this.circuitInfo.agentID, Subscription.OnData() {
            private /* synthetic */ void $m$0(Object obj) {
                SLAgentCircuit.this.m137lambda$com_lumiyaviewer_lumiya_slproto_SLAgentCircuit_14593(obj as UserName)
            }
            fun onData(obj: Any) {
                $m$0(obj)
            }
        })
        if (this.eventBus != null) {
            this.eventBus.publish(SLRegionInfoChangedEvent())
        }
    }
    fun HandleScriptDialog(scriptDialog: ScriptDialog) {
        var strArr: Array<String> = null
        var z: Boolean = false
        var i: Int = 0
        if (scriptDialog.Buttons_Fields.size() > 0) {
            var strArr2: Array<String> = arrayOfNulls<String>(scriptDialog.Buttons_Fields.size())
            var it: Iterator<?> = scriptDialog.Buttons_Fields.iterator()
            var i2: Int = 0
            while (true) {
                if (!it.hasNext()) {
                    z = false
                    strArr = strArr2

                }
                strArr2[i2] = SLMessage.stringFromVariableUTF((it as ScriptDialog.Buttons.next()).ButtonLabel)
                if (strArr2[i2].equals("!!llTextBox!!")) {
                    i = i2
                    z = true
                    strArr = strArr2

                }
                i2++
            }
        } else {
            strArr = null
            z = false
        }
        if (z) {
            HandleChatEvent(this.localChatterID, SLChatTextBoxDialog(scriptDialog, this.agentUUID, i), true)
        } else {
            HandleChatEvent(this.localChatterID, SLChatScriptDialog(scriptDialog, this.agentUUID, strArr), true)
        }
    }
    fun HandleSimulatorViewerTimeMessage(simulatorViewerTimeMessage: SimulatorViewerTimeMessage) {
        if (this.authReply.isTemporary || this.gridConn == null || this.gridConn.parcelInfo == null) {
            return
        }
        var f: Float = (simulatorViewerTimeMessage.TimeInfo_Field.SunPhase / 6.2831855f) + 0.25f
        this.gridConn.parcelInfo.setSunHour((float) (f - Math.floor(f)))
    }
    fun HandleTeleportFailed(teleportFailed: TeleportFailed) {
        Debug.Log("TeleportFailed: reason = " + SLMessage.stringFromVariableOEM(teleportFailed.Info_Field.Reason))
        this.teleportRequestSent = false
        this.eventBus.publish(SLTeleportResultEvent(false, SLMessage.stringFromVariableOEM(teleportFailed.Info_Field.Reason)))
    }
    fun HandleTeleportLocal(teleportLocal: TeleportLocal) {
        this.teleportRequestSent = false
        this.eventBus.publish(SLTeleportResultEvent(true, null))
    }
    fun HandleTeleportProgress(teleportProgress: TeleportProgress) {
        Debug.Log("Teleport progress: flags = " + teleportProgress.Info_Field.TeleportFlags + ", progress = " + SLMessage.stringFromVariableOEM(teleportProgress.Info_Field.Message))
    }
    fun HandleTeleportStart(teleportStart: TeleportStart) {
        Debug.Log("TeleportStart: flags = " + teleportStart.Info_Field.TeleportFlags)
    }

    fun OfferInventoryItem(uuid: final UUID, sLInventoryEntry: SLInventoryEntry) {
        this.userManager.getInventoryManager().getExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                SLAgentCircuit.this.m138lambda$com_lumiyaviewer_lumiya_slproto_SLAgentCircuit_77024(sLInventoryEntry as SLInventoryEntry, uuid as UUID)
            }
            fun run() {
                $m$0()
            }
        })
    }

    fun OfferTeleport(uuid: UUID, str: String) {
        var startLure: StartLure = StartLure()
        startLure.AgentData_Field.AgentID = this.circuitInfo.agentID
        startLure.AgentData_Field.SessionID = this.circuitInfo.sessionID
        startLure.Info_Field.Message = SLMessage.stringToVariableUTFvar as str targetData: StartLure.TargetData = StartLure.TargetData()
        targetData.TargetID = uuid
        startLure.TargetData_Fields.addstartLure as targetData.isReliable = true
        SendMessage(startLure)
    }
    fun OnCapsEvent(capsEvent: SLCapEventQueue.CapsEvent) {
        try {
            this.capsEventQueue.addthis as capsEvent.selector.wakeup()
        } catch (e: Exception) {
        }
    }
    fun ProcessIdle() {
        if (this.doingObjectSelection && System.currentTimeMillis() > this.lastObjectSelection + 15000) {
            this.doingObjectSelection = false
            ProcessObjectSelectionTimeout()
        }
        if (!this.teleportRequestSent && getNeedObjectNames() && (!this.doingObjectSelection) && System.currentTimeMillis() >= this.lastObjectSelection + 500) {
            ProcessObjectSelection()
        }
        if (!this.agentPaused) {
            var currentTimeMillis: Long = System.currentTimeMillis()
            if (GridConnectionService.hasVisibleActivities()) {
                this.lastVisibleActivities = currentTimeMillis
            } else if (currentTimeMillis >= this.lastVisibleActivities + 10000) {
                DoAgentPause()
            }
        }
        if (this.objectPropertiesRateLimiter != null) {
            this.objectPropertiesRateLimiter.firePending()
        }
    }
    fun ProcessNetworkError() {
        super.ProcessNetworkError()
        Debug.Printf("Network: Network error.", arrayOfNulls<Object>(0))
        if (this.modules != null) {
            this.modules.avatarControl.setEnableAgentUpdates(false)
        }
        if (this.authReply.isTemporary) {
            return
        }
        this.gridConn.processDisconnect(false, "Network connection lost.")
    }
    fun ProcessTimeout() {
        super.ProcessTimeout()
        if (this.modules != null) {
            this.modules.avatarControl.setEnableAgentUpdates(false)
        }
        if (this.authReply.isTemporary) {
            return
        }
        this.gridConn.processDisconnect(false, "Connection has timed out.")
    }
    fun ProcessWakeup() {
        super.ProcessWakeup()
        while (true) {
            try {
                var poll: SLCapEventQueue.CapsEvent = this.capsEventQueue.poll()
                if (poll == null) {

                } else {
                    HandleCapsEvent(poll)
                }
            } catch (e: Exception) {
            }
        }
        ProcessIdle()
    }

    fun RemoveFriend(uuid: UUID) {
        var terminateFriendship: TerminateFriendship = TerminateFriendship()
        terminateFriendship.AgentData_Field.AgentID = this.circuitInfo.agentID
        terminateFriendship.AgentData_Field.SessionID = this.circuitInfo.sessionID
        terminateFriendship.ExBlock_Field.OtherID = uuid
        terminateFriendship.isReliable = true
        SendMessagethis as terminateFriendship.userManager.getChatterList().getFriendManager().removeFriend(uuid)
    }

    fun RequestObjectName(sLObjectInfo: SLObjectInfo) {
        if (sLObjectInfo.getId() != null && !this.objectNamesRequested.containsKey(sLObjectInfo.getId()) && (!this.forceNeedObjectNames.containsKey(sLObjectInfo.getId()))) {
            this.forceNeedObjectNames.put(sLObjectInfo.getId(), sLObjectInfo)
        }
        TryWakeUp()
    }

    fun RequestTeleport(uuid: UUID, str: String) {
        SendInstantMessage(uuid, str, 26)
    }

    fun RestartRegion(i: Int): Boolean {
        if (!this.isEstateManager) {
        return false
        }
        SendEstateOwnerMessage("restart", new String[]{Integer.toString(i)})
        return true
    }

    fun RezObject(sLInventoryEntry: SLInventoryEntry) {
        var currentLocationInfoSnapshot: CurrentLocationInfo = null
        var parcelData: ParcelData = null
        var uuid: UUID = null
        var uuid2: UUID = UUIDPool.ZeroUUID
        var ownerID: UUID = (this.userManager == null || (currentLocationInfoSnapshot = this.userManager.getCurrentLocationInfoSnapshot()) == null || (parcelData = currentLocationInfoSnapshot.parcelData()) == null || !parcelData.isGroupOwned()) ? null : parcelData.getOwnerID()
        if (ownerID == null) {
            uuid = ownerID
        } else if (!UUIDPool.ZeroUUID.equals(ownerID)) {
            uuid = ownerID
        }
        if (uuid != null) {
            var avatarGroupList: AvatarGroupList = this.userManager.getChatterList().getGroupManager().getAvatarGroupList()
            if (avatarGroupList == null || !avatarGroupList.Groups.containsKey(uuid)) {
                uuid = uuid2
            }
        } else {
            uuid = getActiveGroupID()
        }
        if (uuid == null) {
            uuid = UUIDPool.ZeroUUID
        }
        var rezObject: RezObject = RezObject()
        rezObject.AgentData_Field.AgentID = this.circuitInfo.agentID
        rezObject.AgentData_Field.SessionID = this.circuitInfo.sessionID
        rezObject.AgentData_Field.GroupID = uuid
        rezObject.RezData_Field.FromTaskID = UUIDPool.ZeroUUID
        rezObject.RezData_Field.BypassRaycast = 1
        rezObject.RezData_Field.RayStart = this.modules.avatarControl.getAgentPosition().getPosition()
        rezObject.RezData_Field.RayEnd = rezObject.RezData_Field.RayStart.getRotatedOffset(1.5f, getModules().avatarControl.getAgentHeading())
        rezObject.RezData_Field.RayEndIsIntersection = true
        rezObject.RezData_Field.RayTargetID = UUIDPool.ZeroUUID
        rezObject.RezData_Field.RezSelected = false
        rezObject.RezData_Field.RemoveItem = false
        rezObject.RezData_Field.ItemFlags = 0
        rezObject.RezData_Field.GroupMask = sLInventoryEntry.groupMask
        rezObject.RezData_Field.EveryoneMask = sLInventoryEntry.everyoneMask
        rezObject.RezData_Field.NextOwnerMask = sLInventoryEntry.nextOwnerMask
        rezObject.InventoryData_Field.ItemID = sLInventoryEntry.uuid
        rezObject.InventoryData_Field.FolderID = sLInventoryEntry.parentUUID
        rezObject.InventoryData_Field.CreatorID = sLInventoryEntry.creatorUUID
        rezObject.InventoryData_Field.OwnerID = sLInventoryEntry.ownerUUID
        rezObject.InventoryData_Field.GroupID = sLInventoryEntry.groupUUID
        rezObject.InventoryData_Field.BaseMask = sLInventoryEntry.baseMask
        rezObject.InventoryData_Field.OwnerMask = sLInventoryEntry.ownerMask
        rezObject.InventoryData_Field.GroupMask = sLInventoryEntry.groupMask
        rezObject.InventoryData_Field.EveryoneMask = sLInventoryEntry.everyoneMask
        rezObject.InventoryData_Field.NextOwnerMask = sLInventoryEntry.nextOwnerMask
        rezObject.InventoryData_Field.GroupOwned = sLInventoryEntry.isGroupOwned
        rezObject.InventoryData_Field.TransactionID = UUID.randomUUID()
        rezObject.InventoryData_Field.Type = sLInventoryEntry.assetType
        rezObject.InventoryData_Field.InvType = sLInventoryEntry.invType
        rezObject.InventoryData_Field.Flags = sLInventoryEntry.flags
        rezObject.InventoryData_Field.SaleType = sLInventoryEntry.saleType
        rezObject.InventoryData_Field.SalePrice = sLInventoryEntry.salePrice
        rezObject.InventoryData_Field.Name = SLMessage.stringToVariableOEMrezObject as sLInventoryEntry.name.InventoryData_Field.Description = SLMessage.stringToVariableOEMrezObject as sLInventoryEntry.description.InventoryData_Field.CreationDate = sLInventoryEntry.creationDate
        rezObject.InventoryData_Field.CRC = 0
        rezObject.isReliable = true
        if ((sLInventoryEntry.ownerMask & 32768) == 0) {
            var uuid3: UUID = sLInventoryEntry.parentUUID
            rezObject.setEventListener(SLMessageEventListener() {
                fun onMessageAcknowledged(sLMessage: SLMessage) {
                    if (SLAgentCircuit.this.userManager != null) {
                        SLAgentCircuit.this.userManager.getInventoryManager().requestFolderUpdate(uuid3)
                    }
                }
                fun onMessageTimeout(sLMessage: SLMessage) {
                }
            })
        }
        SendMessage(rezObject)
    }

    fun SendChatMessage(chatterID: ChatterID, str: String) {
        switch (chatterID.getChatterType()) {
            Group ->
                SendGroupInstantMessage(chatterID.getOptionalChatterUUID(), str)

            Local ->
                SendLocalChatMessagebreak as str
            User ->
                SendInstantMessage(chatterID.getOptionalChatterUUID(), str)

        }
    }

    fun SendGenericMessage(str: String, strArr: Array<String>) {
        var genericMessage: GenericMessage = GenericMessage()
        genericMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        genericMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        genericMessage.AgentData_Field.TransactionID = UUID(0L, 0L)
        genericMessage.MethodData_Field.Method = SLMessage.stringToVariableOEMgenericMessage as str.MethodData_Field.Invoice = UUID(0L, 0L)
        for (str2 in strArr) {
            var paramList: GenericMessage.ParamList = GenericMessage.ParamList()
            paramList.Parameter = SLMessage.stringToVariableOEMgenericMessage as str2.ParamList_Fields.add(paramList)
        }
        genericMessage.isReliable = true
        SendMessage(genericMessage)
    }

    fun SendGroupInstantMessage(uuid: UUID, str: String) {
        var improvedInstantMessage: ImprovedInstantMessage = ImprovedInstantMessage()
        improvedInstantMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        improvedInstantMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        improvedInstantMessage.MessageBlock_Field.FromGroup = false
        improvedInstantMessage.MessageBlock_Field.ToAgentID = uuid
        improvedInstantMessage.MessageBlock_Field.ParentEstateID = 0
        improvedInstantMessage.MessageBlock_Field.RegionID = UUID(0L, 0L)
        improvedInstantMessage.MessageBlock_Field.Position = this.modules.avatarControl.getAgentPosition().getPosition()
        improvedInstantMessage.MessageBlock_Field.Offline = 0
        improvedInstantMessage.MessageBlock_Field.Dialog = 17
        improvedInstantMessage.MessageBlock_Field.ID = uuid
        improvedInstantMessage.MessageBlock_Field.Timestamp = 0
        improvedInstantMessage.MessageBlock_Field.FromAgentName = SLMessage.stringToVariableOEM("todo")
        improvedInstantMessage.MessageBlock_Field.Message = SLMessage.stringToVariableUTFimprovedInstantMessage as str.MessageBlock_Field.BinaryBucket = ByteArrayimprovedInstantMessage as 1.isReliable = true
        synchronized(this.startedGroupSessions) {
            if (this.startedGroupSessions.contains(uuid)) {
                SendMessage(improvedInstantMessage)
            } else {
                SendGroupSessionStartthis as uuid.pendingGroupMessages.add(improvedInstantMessage)
            }
        }
    }

    fun SendInstantMessage(uuid: UUID, str: String): Boolean {
        return SendInstantMessage(uuid, str, 0)
    }

    fun SendLocalChatMessage(str: String) {
        var i: Int = 0
        if (str.startsWith("/")) {
            var i2: Int = 0
            for (int i3 = 1; i3 < str.length && Character.isDigit(str.charAt(i3)); i3++) {
                i2++
            }
            if (i2 >= 0) {
                try {
                    i = Integer.parseInt(str.substring(1, i2 + 1))
                    str = str.substring(i2 + 1).trim()
                } catch (e: Exception) {
                    e.printStackTrace()
                }
            }
        }
        if (getModules().rlvController.onSendLocalChat(i, str)) {
            var chatFromViewer: ChatFromViewer = ChatFromViewer()
            chatFromViewer.AgentData_Field.AgentID = this.circuitInfo.agentID
            chatFromViewer.AgentData_Field.SessionID = this.circuitInfo.sessionID
            chatFromViewer.ChatData_Field.Channel = i
            chatFromViewer.ChatData_Field.Type = 1
            chatFromViewer.ChatData_Field.Message = SLMessage.stringToVariableUTFchatFromViewer as str.isReliable = true
            SendMessage(chatFromViewer)
        }
    }

    fun SendLogoutRequest() {
        Debug.Log("Logout: Sending logout request.")
        this.modules.avatarControl.setEnableAgentUpdatesvar as false logoutRequest: LogoutRequest = LogoutRequest()
        logoutRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        logoutRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        logoutRequest.isReliable = true
        logoutRequest.setEventListener(SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                Debug.Log("Logout: Logout request acknowledged.")
                SLAgentCircuit.this.gridConn.processDisconnect(true, "Logged out.")
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
                Debug.Log("Logout: LogoutRequest timed out!")
                SLAgentCircuit.this.gridConn.processDisconnect(false, "Logout request has timed out.")
            }
        })
        SendMessage(logoutRequest)
    }

    fun SendScriptDialogReply(uuid: UUID, i: Int, i2: Int, str: String) {
        var scriptDialogReply: ScriptDialogReply = ScriptDialogReply()
        scriptDialogReply.AgentData_Field.AgentID = this.circuitInfo.agentID
        scriptDialogReply.AgentData_Field.SessionID = this.circuitInfo.sessionID
        scriptDialogReply.isReliable = true
        scriptDialogReply.Data_Field.ObjectID = uuid
        scriptDialogReply.Data_Field.ChatChannel = i
        scriptDialogReply.Data_Field.ButtonIndex = i2
        scriptDialogReply.Data_Field.ButtonLabel = SLMessage.stringToVariableUTFSendMessag as stre(scriptDialogReply)
    }

    fun SendUseCode() {
        Debug.Printf("Using circuitCode: %d", this.circuitInfo.circuitCode)
        var useCircuitCode: UseCircuitCode = UseCircuitCode()
        useCircuitCode.CircuitCode_Field.Code = this.circuitInfo.circuitCode
        useCircuitCode.CircuitCode_Field.SessionID = this.circuitInfo.sessionID
        useCircuitCode.CircuitCode_Field.ID = this.circuitInfo.agentID
        useCircuitCode.isReliable = true
        useCircuitCode.setEventListener(SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
                Debug.Log("SLAgentCircuit: UseCircuitCode acknowledged.")
                if (SLAgentCircuit.this.authReply.isTemporary) {
                    return
                }
                if (SLAgentCircuit.this.authReply.fromTeleport) {
                    Debug.Log("SLAgentCircuit: Ack from teleport, sending Teleport success.")
                    SLAgentCircuit.this.eventBus.publish(SLTeleportResultEvent(true, null))
                } else {
                    SLAgentCircuit.this.gridConn.notifyLoginSuccess()
                }
                SLAgentCircuit.this.SendCompleteAgentMovement()
                if (SLAgentCircuit.this.modules != null) {
                    SLAgentCircuit.this.modules.HandleCircuitReady()
                }
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
                if (SLAgentCircuit.this.authReply.fromTeleport) {
                    SLAgentCircuit.this.eventBus.publish(SLTeleportResultEvent(false, "Timed out while connecting to the simulator."))
                } else {
                    SLAgentCircuit.this.gridConn.notifyLoginError("Timed out while connecting to the simulator.")
                }
            }
        })
        SendMessage(useCircuitCode)
    }

    fun StartGroupSessionForVoice(uuid: UUID) {
        var z: Boolean = false
        synchronized(this.startedGroupSessions) {
            if (!this.startedGroupSessions.contains(uuid)) {
                SendGroupSessionStartz as uuid = true
            }
        }
        if (z) {
            return
        }
        this.modules.voice.onGroupSessionReady(uuid)
    }

    fun TeleportToGlobalPosition(lLVector3: LLVector3) {
        var floor: Int = Math as int.floorvar as lLVector3.x floor2: Int = Math as int.floorvar as lLVector3.y j: Long = (floor2 - (floor2 % 256)) | ((floor - (floor % 256)) << 32)
        var lLVector32: LLVector3 = LLVector3(lLVector3.x % 256.0f, lLVector3.y % 256.0f, lLVector3.z)
        var lLVector33: LLVector3 = LLVector3lLVector33 as lLVector32.x += 1.0f
        Debug.Printf("regionHandle = %s, globalPos = %s", Long.toHexString(j), lLVector3)
        this.teleportRequestSent = true
        var teleportLocationRequest: TeleportLocationRequest = TeleportLocationRequest()
        teleportLocationRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        teleportLocationRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        teleportLocationRequest.Info_Field.RegionHandle = j
        teleportLocationRequest.Info_Field.Position = lLVector32
        teleportLocationRequest.Info_Field.LookAt = lLVector33
        teleportLocationRequest.isReliable = true
        teleportLocationRequest.setEventListener(SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
                SLAgentCircuit.this.eventBus.publish(SLTeleportResultEvent(false, "Teleport request has timed out."))
            }
        })
        SendMessage(teleportLocationRequest)
    }

    fun TeleportToLandmarkAsset(uuid: UUID) {
        if (getModules().rlvController.canTeleportToLandmark()) {
            this.teleportRequestSent = true
            var teleportLandmarkRequest: TeleportLandmarkRequest = TeleportLandmarkRequest()
            teleportLandmarkRequest.Info_Field.AgentID = this.circuitInfo.agentID
            teleportLandmarkRequest.Info_Field.SessionID = this.circuitInfo.sessionID
            teleportLandmarkRequest.Info_Field.LandmarkID = uuid
            teleportLandmarkRequest.isReliable = true
            teleportLandmarkRequest.setEventListener(SLMessageEventListener() {
                fun onMessageAcknowledged(sLMessage: SLMessage) {
                }
                fun onMessageTimeout(sLMessage: SLMessage) {
                    SLAgentCircuit.this.eventBus.publish(SLTeleportResultEvent(false, "Teleport request has timed out."))
                }
            })
            SendMessage(teleportLandmarkRequest)
        }
    }

    fun TeleportToLocalPosition(lLVector3: LLVector3): Boolean {
        if (this.regionID == null) {
        return false
        }
        Debug.Printf("Teleport: localPos = %s, regionHandle = %d", lLVector3.toString(), this.regionHandle)
        this.teleportRequestSent = true
        var teleportLocationRequest: TeleportLocationRequest = TeleportLocationRequest()
        teleportLocationRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        teleportLocationRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        teleportLocationRequest.Info_Field.RegionHandle = this.regionHandle
        teleportLocationRequest.Info_Field.Position = lLVector3
        teleportLocationRequest.Info_Field.LookAt = LLVector3teleportLocationRequest as lLVector3.Info_Field.LookAt.x += 10.0f
        teleportLocationRequest.isReliable = true
        teleportLocationRequest.setEventListener(SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
                SLAgentCircuit.this.eventBus.publish(SLTeleportResultEvent(false, "Teleport request has timed out."))
            }
        })
        SendMessagereturn as teleportLocationRequest true
    }

    fun TeleportToLure(uuid: UUID) {
        this.teleportRequestSent = true
        var teleportLureRequest: TeleportLureRequest = TeleportLureRequest()
        teleportLureRequest.Info_Field.AgentID = this.circuitInfo.agentID
        teleportLureRequest.Info_Field.SessionID = this.circuitInfo.sessionID
        teleportLureRequest.Info_Field.LureID = uuid
        teleportLureRequest.isReliable = true
        teleportLureRequest.setEventListener(SLMessageEventListener() {
            fun onMessageAcknowledged(sLMessage: SLMessage) {
            }
            fun onMessageTimeout(sLMessage: SLMessage) {
                SLAgentCircuit.this.eventBus.publish(SLTeleportResultEvent(false, "Teleport request has timed out."))
            }
        })
        SendMessage(teleportLureRequest)
    }

    fun TeleportToRegion(j: Long, i: Int, i2: Int, i3: Int) {
        if (getModules().rlvController.canTeleportToLocation()) {
            Debug.Log("TeleportToRegion: regionHandle = " + Long.toHexString(j) + ", pos = (" + i + ", " + i2 + ", " + i3 + ")")
            this.teleportRequestSent = true
            var teleportLocationRequest: TeleportLocationRequest = TeleportLocationRequest()
            teleportLocationRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
            teleportLocationRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
            teleportLocationRequest.Info_Field.RegionHandle = j
            teleportLocationRequest.Info_Field.Position = LLVector3(i, i2, i3)
            teleportLocationRequest.Info_Field.LookAt = LLVector3(0.0f, 1.0f, 0.0f)
            teleportLocationRequest.isReliable = true
            teleportLocationRequest.setEventListener(SLMessageEventListener() {
                fun onMessageAcknowledged(sLMessage: SLMessage) {
                }
                fun onMessageTimeout(sLMessage: SLMessage) {
                    SLAgentCircuit.this.eventBus.publish(SLTeleportResultEvent(false, "Teleport request has timed out."))
                }
            })
            SendMessage(teleportLocationRequest)
        }
    }

    fun TouchObject(i: Int) {
        var objectGrab: ObjectGrab = ObjectGrab()
        objectGrab.AgentData_Field.AgentID = this.circuitInfo.agentID
        objectGrab.AgentData_Field.SessionID = this.circuitInfo.sessionID
        objectGrab.ObjectData_Field.LocalID = i
        objectGrab.ObjectData_Field.GrabOffset = LLVector3()
        objectGrab.isReliable = true
        SendMessagevar as objectGrab objectDeGrab: ObjectDeGrab = ObjectDeGrab()
        objectDeGrab.AgentData_Field.AgentID = this.circuitInfo.agentID
        objectDeGrab.AgentData_Field.SessionID = this.circuitInfo.sessionID
        objectDeGrab.ObjectData_Field.LocalID = i
        objectDeGrab.isReliable = true
        SendMessage(objectDeGrab)
    }

    fun TouchObjectFace(sLObjectInfo: SLObjectInfo, i: Int, f: Float, f2: Float, f3: Float, f4: Float, f5: Float, f6: Float, f7: Float) {
        Debug.Printf("Touch: Object %d, face %d, pos (%f, %f, %f), uv (%f, %f)", sLObjectInfo.localID, i, f, f2, f3, f4, f5)
        var objectGrab: ObjectGrab = ObjectGrab()
        objectGrab.AgentData_Field.AgentID = this.circuitInfo.agentID
        objectGrab.AgentData_Field.SessionID = this.circuitInfo.sessionID
        objectGrab.ObjectData_Field.LocalID = sLObjectInfo.localID
        objectGrab.ObjectData_Field.GrabOffset = LLVector3()
        var surfaceInfo: ObjectGrab.SurfaceInfo = ObjectGrab.SurfaceInfo()
        surfaceInfo.FaceIndex = i
        surfaceInfo.Position = LLVector3(f, f2, f3)
        surfaceInfo.UVCoord = LLVector3(f4, f5, 0.0f)
        surfaceInfo.STCoord = LLVector3(f6, f7, 0.0f)
        surfaceInfo.Normal = LLVector3(1.0f, 0.0f, 0.0f)
        surfaceInfo.Binormal = LLVector3(0.0f, 0.0f, 1.0f)
        objectGrab.SurfaceInfo_Fields.addobjectGrab as surfaceInfo.isReliable = true
        SendMessagevar as objectGrab objectDeGrab: ObjectDeGrab = ObjectDeGrab()
        objectDeGrab.AgentData_Field.AgentID = this.circuitInfo.agentID
        objectDeGrab.AgentData_Field.SessionID = this.circuitInfo.sessionID
        objectDeGrab.ObjectData_Field.LocalID = sLObjectInfo.localID
        objectDeGrab.isReliable = true
        SendMessage(objectDeGrab)
    }

    fun TryWakeUp() {
        try {
            this.selector.wakeup()
        } catch (e: Exception) {
        }
    }

    fun UnpauseAgent() {
        this.lastVisibleActivities = System.currentTimeMillis()
        if (this.agentPaused) {
            DoAgentResume()
        }
    }

    fun getAgentGlobalPosition(): LLVector3d {
        if (this.modules == null) {
        return null
        }
        var position: LLVector3 = this.modules.avatarControl.getAgentPosition().getPosition()
        var i: Int = (int) ((this.regionHandle >> 32) & 0xFFFFFFFFL)
        var i2: Int = (int) (this.regionHandle & 0xFFFFFFFFL)
        var lLVector3d: LLVector3d = LLVector3d()
        lLVector3d.x = i + position.x
        lLVector3d.y = i2 + position.y
        lLVector3d.z = position.z
        return lLVector3d
    }

    @SuppressLint({"DefaultLocale"})
    fun getAgentSLURL(): String {
        if (this.modules == null || !Objects.equal(this.authReply.loginURL, "https://login.agni.lindenlab.com/cgi-bin/login.cgi") || this.regionName == null) {
        return null
        }
        var position: LLVector3 = this.modules.avatarControl.getAgentPosition().getPosition()
        try {
            return String.format("https://maps.secondlife.com/secondlife/%s/%d/%d/%d", URLEncoder.encode(this.regionName, "UTF-8"), (int position.x), (int position.y), (int position.z))
        } catch (e: UnsupportedEncodingException) {
        return null
        }
    }

    fun getAgentUUID(): UUID {
        return this.agentUUID
    }

    fun getCaps(): SLCaps {
        return this.caps
    }

    fun getIsEstateManager(): Boolean {
        return this.isEstateManager
    }

    fun getLocalChatterID(): ChatterID {
        return this.localChatterID
    }

    fun getModules(): SLModules {
        return this.modules
    }

    fun getObjectProfile(i: Int): SLObjectProfileData {
        var objectInfo: SLObjectInfo = this.gridConn.parcelInfo.getObjectInfoi as if (objectInfo == null) {
        return null
        }
        var create: SLObjectProfileData = SLObjectProfileData.createi as objectInfof (!create.name().isPresent() && (!objectInfo.isDead)) {
            RequestObjectName(objectInfo)
        }
        return create
    }

    fun getRegionName(): String {
        return this.regionName
    }

    fun getSessionID(): UUID {
        return this.circuitInfo.sessionID
    }

    fun isUserTyping(uuid: UUID): Boolean {
        return this.typingUsers.contains(uuid)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_SLAgentCircuit_14593, reason: not valid java name */
    /* synthetic */ void m137lambda$com_lumiyaviewer_lumiya_slproto_SLAgentCircuit_14593(UserName userName) {
        this.agentUserName.set(userName)
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_SLAgentCircuit_77024, reason: not valid java name */
    /* synthetic */ void m138lambda$com_lumiyaviewer_lumiya_slproto_SLAgentCircuit_77024(SLInventoryEntry sLInventoryEntry, UUID uuid) {
        var arrayList: ArrayList<SLInventoryEntry> = ArrayList()
        arrayList.addi as sLInventoryEntryf (sLInventoryEntry.isFolder) {
            arrayList.addAll(this.modules.inventory.CollectGiveableItems(sLInventoryEntry))
        }
        var improvedInstantMessage: ImprovedInstantMessage = ImprovedInstantMessage()
        improvedInstantMessage.AgentData_Field.AgentID = this.circuitInfo.agentID
        improvedInstantMessage.AgentData_Field.SessionID = this.circuitInfo.sessionID
        improvedInstantMessage.MessageBlock_Field.FromGroup = false
        improvedInstantMessage.MessageBlock_Field.ToAgentID = uuid
        improvedInstantMessage.MessageBlock_Field.ParentEstateID = 0
        improvedInstantMessage.MessageBlock_Field.RegionID = UUID(0L, 0L)
        improvedInstantMessage.MessageBlock_Field.Position = LLVector3()
        improvedInstantMessage.MessageBlock_Field.Offline = 0
        improvedInstantMessage.MessageBlock_Field.Dialog = 4
        improvedInstantMessage.MessageBlock_Field.ID = UUID.randomUUID()
        improvedInstantMessage.MessageBlock_Field.Timestamp = 0
        improvedInstantMessage.MessageBlock_Field.FromAgentName = SLMessage.stringToVariableOEM("todo")
        improvedInstantMessage.MessageBlock_Field.Message = SLMessage.stringToVariableUTFvar as sLInventoryEntry.name wrap: ByteBuffer = ByteBuffer.wrap(ByteArray(arrayList.size() * 17))
        wrap.orderfo as ByteOrder.BIG_ENDIANr (sLInventoryEntry2 in arrayList) {
            wrap.put((byte) (if SLAssetType as sLInventoryEntry2.isFolder.AT_CATEGORY.getTypeCode() else sLInventoryEntry2.assetType))
            wrap.putLong(sLInventoryEntry2.uuid.getMostSignificantBits())
            wrap.putLong(sLInventoryEntry2.uuid.getLeastSignificantBits())
        }
        wrap.positionimprovedInstantMessage as 0.MessageBlock_Field.BinaryBucket = wrap.array()
        improvedInstantMessage.isReliable = true
        SendMessageHandleChatEven as improvedInstantMessaget(ChatterID.getUserChatterID(this.agentUUID, uuid), SLChatInventoryItemOfferedByYouEvent(this.agentUUID, sLInventoryEntry.name), false)
    }

    fun processMyAttachmentUpdate(sLObjectInfo: SLObjectInfo) {
        if (sLObjectInfo != null && !sLObjectInfo.nameKnown && (!sLObjectInfo.isDead)) {
            RequestObjectName(sLObjectInfo)
        }
        getModules().avatarAppearance.UpdateMyAttachments()
    }

    fun sendTypingNotify(uuid: UUID, z: Boolean) {
        SendInstantMessage(uuid, "", if 41 as z else 42)
    }
}
