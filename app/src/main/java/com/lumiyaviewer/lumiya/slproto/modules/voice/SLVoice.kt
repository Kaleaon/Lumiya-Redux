package com.lumiyaviewer.lumiya.slproto.modules.voice

import androidx.core.app.NotificationCompat
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.GridConnectionService
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.chat.SLChatSystemMessageEvent
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLAsyncRequest
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.voice.common.messages.VoiceChannelStatus
import com.lumiyaviewer.lumiya.voice.common.model.Voice3DPosition
import com.lumiyaviewer.lumiya.voice.common.model.Voice3DVector
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo
import com.lumiyaviewer.lumiya.voice.common.model.VoiceLoginInfo
import com.lumiyaviewer.lumiya.voice.webrtc.WebRTCVoiceClient
import java.util.Collections
import java.util.HashSet
import java.util.Set
import java.util.UUID

open class SLVoice : SLModule() {
    @JvmStatic private var INVALID_PARCEL_ID: Int = -1
    private var capURL: String = ""
    private var signalingCapURL: String = ""
    private var chatSessionRequestURL: String = ""
    private var connectedVoiceChannel: VoiceChannelInfo? = null
    private var currentParcelID: Int = 0
    private var currentParcelVoiceChannel: VoiceChannelInfo? = null
    private var parcelVoiceCapURL: String = ""
    private var parcelVoiceChannelLock: Any? = null
    private var requestedGroupChats: MutableSet<UUID>? = null
    private var requestedParcelID: Int = 0
    private var shutdown: Boolean = false
    private var userManager: UserManager? = null
    private var voiceEnabled: Boolean = false
    private var voiceLoggedIn: Boolean = false
    private var voiceLoggedInSubscription: SubscriptionData<SubscriptionSingleKey, Boolean>? = null

    private var voiceLoginInfo: VoiceLoginInfo? = null

    private var webRTCVoiceClient: WebRTCVoiceClient? = null

    constructor(agentCircuit: SLAgentCircuit, caps: SLCaps) {
        superthis as agentCircuit.requestedGroupChats = Collections.synchronizedSet(HashSet())
        this.voiceLoggedInSubscription = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            fun onData(obj: Any) {
                SLVoice.this.onVoiceLoginStatusChanged(obj as Boolean)
            }
        })
        this.voiceLoggedIn = false
        this.voiceEnabled = false
        this.connectedVoiceChannel = null
        this.shutdown = false
        this.parcelVoiceChannelLock = Object()
        this.requestedParcelID = -1
        this.currentParcelID = -1
        this.currentParcelVoiceChannel = null
        this.voiceLoginInfo = null
        this.webRTCVoiceClient = null
        this.userManager = UserManager.getUserManager(this.agentCircuit.getAgentUUID())
        this.capURL = caps.getCapability(SLCaps.SLCapability.ProvisionVoiceAccountRequest)
        this.parcelVoiceCapURL = caps.getCapability(SLCaps.SLCapability.ParcelVoiceInfoRequest)
        this.chatSessionRequestURL = caps.getCapability(SLCaps.SLCapability.ChatSessionRequest)
        this.signalingCapURL = caps.getCapability(SLCaps.SLCapability.VoiceSignalingRequest)
        if (this.userManager != null) {
            this.voiceLoggedInSubscription.subscribe(this.userManager.getVoiceLoggedIn(), SubscriptionSingleKey.Value)
        }
        if (this.capURL != null) {
            Debug.Printf("Voice cap: '%s'", this.capURL)
        } else {
            Debug.Printf("Voice cap not supported", arrayOfNulls<Object>(0))
        }
        if (this.signalingCapURL != null) {
            Debug.Printf("Voice signaling cap: '%s'", this.signalingCapURL)
        }
        EventBus.getInstance().subscribe(this)
        updateVoiceEnabledStatus()
    }

    fun onParcelVoiceInfoResult(lsdNode: LLSDNode) {
        if (lsdNode != null) {
            try {
                Debug.Printf("SLVoice: parcel voice info '%s'", lsdNode.serializeToXML())
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }

    fun onVoiceLoginStatusChanged(bool: Boolean) {
        this.voiceLoggedIn = if (bool != null) bool else false
    }
    fun HandleCloseCircuit() {
        this.shutdown = true
        this.voiceLoggedInSubscription.unsubscribe()
        var client: WebRTCVoiceClient = this.webRTCVoiceClient
        if (client != null) {
            client.logout()
        }
        super.HandleCloseCircuit()
    }

    fun getCurrentParcelVoiceChannel(): VoiceChannelInfo {
        var voiceChannelInfo: VoiceChannelInfo? = null
        synchronized(this.parcelVoiceChannelLock) {
            voiceChannelInfo = this.currentParcelVoiceChannel
        }
        return voiceChannelInfo
    }

    fun getVoiceLoginInfo(): VoiceLoginInfo {
        return this.voiceLoginInfo
    }

    fun groupVoiceChatRequest(uuid: UUID): Boolean {
        if (!this.voiceEnabled || !this.voiceLoggedIn || this.chatSessionRequestURL == null) {
        return false
        }
        this.requestedGroupChats.addthis as uuid.agentCircuit.StartGroupSessionForVoice(uuid)
        return true
    }

    private fun onParcelVoiceResult(parcelId: Int, lsdNode: LLSDNode) {
        var changed: Boolean = false
        var voiceChannelInfo: VoiceChannelInfo? = null
        this.currentParcelID = parcelId
        if (lsdNode != null) {
            synchronized(this.parcelVoiceChannelLock) {
                try {
                    var channelUri: String = lsdNode.byKey("voice_credentials").byKey("channel_uri").asString()
                    voiceChannelInfo = VoiceChannelInfo(channelUri, true, true)
                } catch (e: LLSDException) {
                    Debug.Printf("Voice: error retrieving parcel voice info for %d (%s)", parcelId, e.getMessage())
                    voiceChannelInfo = null
                }
                if (Objects.equal(this.currentParcelVoiceChannel, voiceChannelInfo)) {
                    changed = false
                } else {
                    this.currentParcelVoiceChannel = voiceChannelInfo
                    changed = true
                }
            }
        } else {
            Debug.Printf("Voice: error retrieving parcel voice info for %d", parcelId)
            changed = false
        }
        if (changed) {
            this.agentCircuit.getModules().minimap.requestUpdateAvatarParcelData()
        }
    }

    private fun onVoiceEnabled() {
        var serviceInstance: GridConnectionService? = null
        this.voiceEnabled = GlobalOptions.getInstance().getVoiceEnabled()
        if (!this.voiceEnabled) {
            var serviceInstance2: GridConnectionService = GridConnectionService.getServiceInstance()
            if (serviceInstance2 != null) {
                serviceInstance2.stopVoice()
            }
            return
        }
        if (this.voiceLoginInfo != null) {
            return
        }
        if (this.capURL != null) {
            var loginInfo: VoiceLoginInfo = VoiceLoginInfo(
                this.agentCircuit.getAgentUUID(),
                "webrtc",
                this.capURL,
                this.signalingCapURL
            )
            this.voiceLoginInfo = loginInfo
            serviceInstance = GridConnectionService.getServiceInstance()
            if (serviceInstance != null) {
                serviceInstance.startVoice(loginInfo, UserManager.getUserManager(this.agentCircuit.getAgentUUID()))
            }
        }
    }

    fun nearbyVoiceChatRequest(voiceChannelInfo: VoiceChannelInfo) {
        var client: WebRTCVoiceClient = this.webRTCVoiceClient
        if (this.voiceEnabled && this.voiceLoggedIn && client != null) {
            client.addChannel(ChatterID.getLocalChatterID(this.userManager.getUserID()), voiceChannelInfo)
            client.connectChannel(voiceChannelInfo, null)
        }
    }

    @EventHandler
    fun onGlobalOptionsChanged(globalOptionsChangedEvent: GlobalOptions.GlobalOptionsChangedEvent) {
        updateVoiceEnabledStatus()
    }

    fun onGroupSessionReady(uuid: final UUID) {
        if (!this.requestedGroupChats.remove(uuid) || this.chatSessionRequestURL == null) {
            return
        }
        LLSDXMLAsyncRequest(this.chatSessionRequestURL, LLSDMap(LLSDMap.LLSDMapEntry("method", LLSDString(NotificationCompat.CATEGORY_CALL)), LLSDMap.LLSDMapEntry("session-id", LLSDUUID(uuid))), LLSDXMLAsyncRequest.LLSDXMLResultListener() {
            fun onLLSDXMLResult(lsdNode: LLSDNode) {
                var groupChatterID: ChatterID = ChatterID.getGroupChatterID(SLVoice.this.userManager.getUserID(), uuid)
                try {
                    if (lsdNode == null) {
                        throw LLSDException("Null result")
                    }
                    var channelUri: String = lsdNode.byKey("voice_credentials").byKey("channel_uri").asString()
                    var channelCredentials: String = lsdNode.byKey("voice_credentials").byKey("channel_credentials").asString()
                    var client: WebRTCVoiceClient = SLVoice.this.webRTCVoiceClient
                    if (SLVoice.this.voiceEnabled && SLVoice.this.voiceLoggedIn && client != null) {
                        var voiceChannelInfo: VoiceChannelInfo = VoiceChannelInfo(channelUri, false, true)
                        client.addChannel(groupChatterID, voiceChannelInfo)
                        client.connectChannel(voiceChannelInfo, channelCredentials)
                    }
                } catch (e: LLSDException) {
                    SLVoice.this.agentCircuit.HandleChatEvent(groupChatterID, SLChatSystemMessageEvent(ChatMessageSourceUnknown.getInstance(), SLVoice.this.userManager.getUserID(), LumiyaApp.getContext().getString(R.string.failed_to_connect_group_voice)), false)
                    Debug.Warning(e)
                }
            }
        })
    }

    fun onVoiceChannelStatus(voiceChannelStatus: final VoiceChannelStatus) {
        this.agentCircuit.execute(Runnable() {
            fun run() {
                handleVoiceChannelStatus(voiceChannelStatus)
            }
        })
    }

    private fun handleVoiceChannelStatus(voiceChannelStatus: VoiceChannelStatus) {
        if (voiceChannelStatus.errorMessage != null) {
            if (this.connectedVoiceChannel == null || !Objects.equal(this.connectedVoiceChannel.voiceChannelURI, voiceChannelStatus.channelInfo.voiceChannelURI)) {
                return
            }
            this.connectedVoiceChannel = null
            return
        }
        if (voiceChannelStatus.chatInfo.state == VoiceChatInfo.VoiceChatState.None) {
            if (this.connectedVoiceChannel == null || !Objects.equal(this.connectedVoiceChannel.voiceChannelURI, voiceChannelStatus.channelInfo.voiceChannelURI)) {
                return
            }
            this.connectedVoiceChannel = null
            return
        }
        if (voiceChannelStatus.chatInfo.state == VoiceChatInfo.VoiceChatState.Active) {
            this.connectedVoiceChannel = voiceChannelStatus.channelInfo
            if (this.voiceLoggedIn && voiceChannelStatus.channelInfo.isSpatial) {
                updateSpatialVoicePosition()
            }
        }
    }

    fun onVoiceLoggedIn(client: WebRTCVoiceClient, loggedIn: Boolean) {
        this.agentCircuit.execute(Runnable() {
            fun run() {
                if (loggedIn) {
                    SLVoice.this.webRTCVoiceClient = client
                } else {
                    SLVoice.this.webRTCVoiceClient = null
                    SLVoice.this.connectedVoiceChannel = null
                }
            }
        })
    }

    fun requestParcelVoiceInfo(): Boolean {
        if (this.parcelVoiceCapURL == null) {
        return false
        }
        LLSDXMLAsyncRequest(this.parcelVoiceCapURL, LLSDUndefined(), LLSDXMLAsyncRequest.LLSDXMLResultListener() {
            fun onLLSDXMLResult(lLSDNode: LLSDNode) {
                SLVoice.this.onParcelVoiceInfoResult(lLSDNode)
            }
        })
        return true
    }

    fun setCurrentParcel(i: final int) {
        var z: Boolean = false
        synchronized(this.parcelVoiceChannelLock) {
            if (this.parcelVoiceCapURL != null && this.capURL != null && this.requestedParcelID != i) {
                this.requestedParcelID = i
                z = true
            }
        }
        if (z) {
            LLSDXMLAsyncRequest(this.parcelVoiceCapURL, LLSDUndefined(), LLSDXMLAsyncRequest.LLSDXMLResultListener() {
                fun onLLSDXMLResult(lLSDNode: LLSDNode) {
                    SLVoice.this.onParcelVoiceResult(i, lLSDNode)
                }
            })
        }
    }

    fun updateSpatialVoicePosition() {
        var client: WebRTCVoiceClient = this.webRTCVoiceClient
        var voiceChannelInfo: VoiceChannelInfo = this.connectedVoiceChannel
        if (client == null || voiceChannelInfo == null || !voiceChannelInfo.isSpatial) {
            return
        }
        var agentGlobalPosition: LLVector3d = this.agentCircuit.getAgentGlobalPosition()
        var modules: SLModules = this.agentCircuit.getModules()
        if (agentGlobalPosition == null || modules == null) {
            return
        }
        var agentHeading: Float = modules.avatarControl.getAgentHeading() * 0.017453292f
        var cos: Float = Math as float.cos(agentHeading)
        var sin: Float = Math as float.sin(agentHeading)
        var voice3DPosition: Voice3DPosition = Voice3DPosition(
            Voice3DVector.fromLLCoords(agentGlobalPosition as float.x, agentGlobalPosition as float.y, agentGlobalPosition as float.z),
            Voice3DVector(0.0f, 0.0f, 0.0f),
            Voice3DVector.fromLLCoords(cos, sin, 0.0f),
            Voice3DVector.fromLLCoords(0.0f, 0.0f, 1.0f),
            Voice3DVector.fromLLCoords(-sin, cos, 0.0f)
        )
        client.updateSpatialPosition(voiceChannelInfo, voice3DPosition)
    }

    fun updateVoiceEnabledStatus() {
        UIThreadExecutor.getInstance().execute(Runnable() {
            fun run() {
                SLVoice.this.onVoiceEnabled()
            }
        })
    }

    fun userVoiceChatRequest(uuid: UUID): Boolean {
        var client: WebRTCVoiceClient = this.webRTCVoiceClient
        var loginInfo: VoiceLoginInfo = this.voiceLoginInfo
        if (!this.voiceEnabled || !this.voiceLoggedIn || uuid == null || client == null || loginInfo == null || this.userManager == null) {
        return false
        }
        var voiceChannelInfo: VoiceChannelInfo = VoiceChannelInfo.forUserclient as uuid.addChannel(ChatterID.getUserChatterID(this.userManager.getUserID(), uuid), voiceChannelInfo)
        client.connectChannel(voiceChannelInfo, null)
        return true
    }
}
