package com.lumiyaviewer.lumiya.slproto.modules.voice;

import androidx.core.app.NotificationCompat;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GlobalOptions;
import com.lumiyaviewer.lumiya.GridConnectionService;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.eventbus.EventBus;
import com.lumiyaviewer.lumiya.eventbus.EventHandler;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps;
import com.lumiyaviewer.lumiya.slproto.chat.SLChatSystemMessageEvent;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUndefined;
import com.lumiyaviewer.lumiya.slproto.modules.SLModule;
import com.lumiyaviewer.lumiya.slproto.modules.SLModules;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceUnknown;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLAsyncRequest;
import com.lumiyaviewer.lumiya.voice.common.messages.VoiceChannelStatus;
import com.lumiyaviewer.lumiya.voice.common.model.Voice3DPosition;
import com.lumiyaviewer.lumiya.voice.common.model.Voice3DVector;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChannelInfo;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceChatInfo;
import com.lumiyaviewer.lumiya.voice.common.model.VoiceLoginInfo;
import com.lumiyaviewer.lumiya.voice.webrtc.WebRTCVoiceClient;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import javax.annotation.Nullable;

public class SLVoice extends SLModule {
    private static final int INVALID_PARCEL_ID = -1;
    private final String capURL;
    private final String signalingCapURL;
    private final String chatSessionRequestURL;
    private volatile VoiceChannelInfo connectedVoiceChannel;
    private int currentParcelID;
    private VoiceChannelInfo currentParcelVoiceChannel;
    private final String parcelVoiceCapURL;
    private final Object parcelVoiceChannelLock;
    private final Set<UUID> requestedGroupChats;
    private int requestedParcelID;
    private volatile boolean shutdown;
    private final UserManager userManager;
    private volatile boolean voiceEnabled;
    private volatile boolean voiceLoggedIn;
    private final SubscriptionData<SubscriptionSingleKey, Boolean> voiceLoggedInSubscription;

    @Nullable
    private volatile VoiceLoginInfo voiceLoginInfo;

    @Nullable
    private volatile WebRTCVoiceClient webRTCVoiceClient;

    public SLVoice(SLAgentCircuit agentCircuit, SLCaps caps) {
        super(agentCircuit);
        this.requestedGroupChats = Collections.synchronizedSet(new HashSet());
        this.voiceLoggedInSubscription = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            @Override
            public final void onData(Object obj) {
                SLVoice.this.onVoiceLoginStatusChanged((Boolean) obj);
            }
        });
        this.voiceLoggedIn = false;
        this.voiceEnabled = false;
        this.connectedVoiceChannel = null;
        this.shutdown = false;
        this.parcelVoiceChannelLock = new Object();
        this.requestedParcelID = -1;
        this.currentParcelID = -1;
        this.currentParcelVoiceChannel = null;
        this.voiceLoginInfo = null;
        this.webRTCVoiceClient = null;
        this.userManager = UserManager.getUserManager(this.agentCircuit.getAgentUUID());
        this.capURL = caps.getCapability(SLCaps.SLCapability.ProvisionVoiceAccountRequest);
        this.parcelVoiceCapURL = caps.getCapability(SLCaps.SLCapability.ParcelVoiceInfoRequest);
        this.chatSessionRequestURL = caps.getCapability(SLCaps.SLCapability.ChatSessionRequest);
        this.signalingCapURL = caps.getCapability(SLCaps.SLCapability.VoiceSignalingRequest);
        if (this.userManager != null) {
            this.voiceLoggedInSubscription.subscribe(this.userManager.getVoiceLoggedIn(), SubscriptionSingleKey.Value);
        }
        if (this.capURL != null) {
            Debug.Printf("Voice cap: '%s'", this.capURL);
        } else {
            Debug.Printf("Voice cap not supported", new Object[0]);
        }
        if (this.signalingCapURL != null) {
            Debug.Printf("Voice signaling cap: '%s'", this.signalingCapURL);
        }
        EventBus.getInstance().subscribe(this);
        updateVoiceEnabledStatus();
    }

    public void onParcelVoiceInfoResult(LLSDNode lsdNode) {
        if (lsdNode != null) {
            try {
                Debug.Printf("SLVoice: parcel voice info '%s'", lsdNode.serializeToXML());
            } catch (Exception e) {
                Debug.Warning(e);
            }
        }
    }

    public void onVoiceLoginStatusChanged(Boolean bool) {
        this.voiceLoggedIn = bool != null ? bool.booleanValue() : false;
    }

    @Override
    public void HandleCloseCircuit() {
        this.shutdown = true;
        this.voiceLoggedInSubscription.unsubscribe();
        WebRTCVoiceClient client = this.webRTCVoiceClient;
        if (client != null) {
            client.logout();
        }
        super.HandleCloseCircuit();
    }

    public VoiceChannelInfo getCurrentParcelVoiceChannel() {
        VoiceChannelInfo voiceChannelInfo;
        synchronized (this.parcelVoiceChannelLock) {
            voiceChannelInfo = this.currentParcelVoiceChannel;
        }
        return voiceChannelInfo;
    }

    @Nullable
    public VoiceLoginInfo getVoiceLoginInfo() {
        return this.voiceLoginInfo;
    }

    public boolean groupVoiceChatRequest(UUID uuid) {
        if (!this.voiceEnabled || !this.voiceLoggedIn || this.chatSessionRequestURL == null) {
            return false;
        }
        this.requestedGroupChats.add(uuid);
        this.agentCircuit.StartGroupSessionForVoice(uuid);
        return true;
    }

    private void onParcelVoiceResult(int parcelId, LLSDNode lsdNode) {
        boolean changed;
        VoiceChannelInfo voiceChannelInfo;
        this.currentParcelID = parcelId;
        if (lsdNode != null) {
            synchronized (this.parcelVoiceChannelLock) {
                try {
                    String channelUri = lsdNode.byKey("voice_credentials").byKey("channel_uri").asString();
                    voiceChannelInfo = new VoiceChannelInfo(channelUri, true, true);
                } catch (LLSDException e) {
                    Debug.Printf("Voice: error retrieving parcel voice info for %d (%s)", Integer.valueOf(parcelId), e.getMessage());
                    voiceChannelInfo = null;
                }
                if (Objects.equal(this.currentParcelVoiceChannel, voiceChannelInfo)) {
                    changed = false;
                } else {
                    this.currentParcelVoiceChannel = voiceChannelInfo;
                    changed = true;
                }
            }
        } else {
            Debug.Printf("Voice: error retrieving parcel voice info for %d", Integer.valueOf(parcelId));
            changed = false;
        }
        if (changed) {
            this.agentCircuit.getModules().minimap.requestUpdateAvatarParcelData();
        }
    }

    private void onVoiceEnabled() {
        GridConnectionService serviceInstance;
        this.voiceEnabled = GlobalOptions.getInstance().getVoiceEnabled();
        if (!this.voiceEnabled) {
            GridConnectionService serviceInstance2 = GridConnectionService.getServiceInstance();
            if (serviceInstance2 != null) {
                serviceInstance2.stopVoice();
            }
            return;
        }
        if (this.voiceLoginInfo != null) {
            return;
        }
        if (this.capURL != null) {
            VoiceLoginInfo loginInfo = new VoiceLoginInfo(
                this.agentCircuit.getAgentUUID(),
                "webrtc",
                this.capURL,
                this.signalingCapURL
            );
            this.voiceLoginInfo = loginInfo;
            serviceInstance = GridConnectionService.getServiceInstance();
            if (serviceInstance != null) {
                serviceInstance.startVoice(loginInfo, UserManager.getUserManager(this.agentCircuit.getAgentUUID()));
            }
        }
    }

    public void nearbyVoiceChatRequest(VoiceChannelInfo voiceChannelInfo) {
        WebRTCVoiceClient client = this.webRTCVoiceClient;
        if (this.voiceEnabled && this.voiceLoggedIn && client != null) {
            client.addChannel(ChatterID.getLocalChatterID(this.userManager.getUserID()), voiceChannelInfo);
            client.connectChannel(voiceChannelInfo, null);
        }
    }

    @EventHandler
    public void onGlobalOptionsChanged(GlobalOptions.GlobalOptionsChangedEvent globalOptionsChangedEvent) {
        updateVoiceEnabledStatus();
    }

    public void onGroupSessionReady(final UUID uuid) {
        if (!this.requestedGroupChats.remove(uuid) || this.chatSessionRequestURL == null) {
            return;
        }
        new LLSDXMLAsyncRequest(this.chatSessionRequestURL, new LLSDMap(new LLSDMap.LLSDMapEntry("method", new LLSDString(NotificationCompat.CATEGORY_CALL)), new LLSDMap.LLSDMapEntry("session-id", new LLSDUUID(uuid))), new LLSDXMLAsyncRequest.LLSDXMLResultListener() {
            @Override
            public void onLLSDXMLResult(LLSDNode lsdNode) {
                ChatterID groupChatterID = ChatterID.getGroupChatterID(SLVoice.this.userManager.getUserID(), uuid);
                try {
                    if (lsdNode == null) {
                        throw new LLSDException("Null result");
                    }
                    String channelUri = lsdNode.byKey("voice_credentials").byKey("channel_uri").asString();
                    String channelCredentials = lsdNode.byKey("voice_credentials").byKey("channel_credentials").asString();
                    WebRTCVoiceClient client = SLVoice.this.webRTCVoiceClient;
                    if (SLVoice.this.voiceEnabled && SLVoice.this.voiceLoggedIn && client != null) {
                        VoiceChannelInfo voiceChannelInfo = new VoiceChannelInfo(channelUri, false, true);
                        client.addChannel(groupChatterID, voiceChannelInfo);
                        client.connectChannel(voiceChannelInfo, channelCredentials);
                    }
                } catch (LLSDException e) {
                    SLVoice.this.agentCircuit.HandleChatEvent(groupChatterID, new SLChatSystemMessageEvent(ChatMessageSourceUnknown.getInstance(), SLVoice.this.userManager.getUserID(), LumiyaApp.getContext().getString(R.string.failed_to_connect_group_voice)), false);
                    Debug.Warning(e);
                }
            }
        });
    }

    public void onVoiceChannelStatus(final VoiceChannelStatus voiceChannelStatus) {
        this.agentCircuit.execute(new Runnable() {
            @Override
            public final void run() {
                handleVoiceChannelStatus(voiceChannelStatus);
            }
        });
    }

    private void handleVoiceChannelStatus(VoiceChannelStatus voiceChannelStatus) {
        if (voiceChannelStatus.errorMessage != null) {
            if (this.connectedVoiceChannel == null || !Objects.equal(this.connectedVoiceChannel.voiceChannelURI, voiceChannelStatus.channelInfo.voiceChannelURI)) {
                return;
            }
            this.connectedVoiceChannel = null;
            return;
        }
        if (voiceChannelStatus.chatInfo.state == VoiceChatInfo.VoiceChatState.None) {
            if (this.connectedVoiceChannel == null || !Objects.equal(this.connectedVoiceChannel.voiceChannelURI, voiceChannelStatus.channelInfo.voiceChannelURI)) {
                return;
            }
            this.connectedVoiceChannel = null;
            return;
        }
        if (voiceChannelStatus.chatInfo.state == VoiceChatInfo.VoiceChatState.Active) {
            this.connectedVoiceChannel = voiceChannelStatus.channelInfo;
            if (this.voiceLoggedIn && voiceChannelStatus.channelInfo.isSpatial) {
                updateSpatialVoicePosition();
            }
        }
    }

    public void onVoiceLoggedIn(WebRTCVoiceClient client, boolean loggedIn) {
        this.agentCircuit.execute(new Runnable() {
            @Override
            public final void run() {
                if (loggedIn) {
                    SLVoice.this.webRTCVoiceClient = client;
                } else {
                    SLVoice.this.webRTCVoiceClient = null;
                    SLVoice.this.connectedVoiceChannel = null;
                }
            }
        });
    }

    public boolean requestParcelVoiceInfo() {
        if (this.parcelVoiceCapURL == null) {
            return false;
        }
        new LLSDXMLAsyncRequest(this.parcelVoiceCapURL, new LLSDUndefined(), new LLSDXMLAsyncRequest.LLSDXMLResultListener() {
            @Override
            public final void onLLSDXMLResult(LLSDNode lLSDNode) {
                SLVoice.this.onParcelVoiceInfoResult(lLSDNode);
            }
        });
        return true;
    }

    public void setCurrentParcel(final int i) {
        boolean z = false;
        synchronized (this.parcelVoiceChannelLock) {
            if (this.parcelVoiceCapURL != null && this.capURL != null && this.requestedParcelID != i) {
                this.requestedParcelID = i;
                z = true;
            }
        }
        if (z) {
            new LLSDXMLAsyncRequest(this.parcelVoiceCapURL, new LLSDUndefined(), new LLSDXMLAsyncRequest.LLSDXMLResultListener() {
                @Override
                public final void onLLSDXMLResult(LLSDNode lLSDNode) {
                    SLVoice.this.onParcelVoiceResult(i, lLSDNode);
                }
            });
        }
    }

    public void updateSpatialVoicePosition() {
        WebRTCVoiceClient client = this.webRTCVoiceClient;
        VoiceChannelInfo voiceChannelInfo = this.connectedVoiceChannel;
        if (client == null || voiceChannelInfo == null || !voiceChannelInfo.isSpatial) {
            return;
        }
        LLVector3d agentGlobalPosition = this.agentCircuit.getAgentGlobalPosition();
        SLModules modules = this.agentCircuit.getModules();
        if (agentGlobalPosition == null || modules == null) {
            return;
        }
        float agentHeading = modules.avatarControl.getAgentHeading() * 0.017453292f;
        float cos = (float) Math.cos(agentHeading);
        float sin = (float) Math.sin(agentHeading);
        Voice3DPosition voice3DPosition = new Voice3DPosition(
            Voice3DVector.fromLLCoords((float) agentGlobalPosition.x, (float) agentGlobalPosition.y, (float) agentGlobalPosition.z),
            new Voice3DVector(0.0f, 0.0f, 0.0f),
            Voice3DVector.fromLLCoords(cos, sin, 0.0f),
            Voice3DVector.fromLLCoords(0.0f, 0.0f, 1.0f),
            Voice3DVector.fromLLCoords(-sin, cos, 0.0f)
        );
        client.updateSpatialPosition(voiceChannelInfo, voice3DPosition);
    }

    public void updateVoiceEnabledStatus() {
        UIThreadExecutor.getInstance().execute(new Runnable() {
            @Override
            public final void run() {
                SLVoice.this.onVoiceEnabled();
            }
        });
    }

    public boolean userVoiceChatRequest(UUID uuid) {
        WebRTCVoiceClient client = this.webRTCVoiceClient;
        VoiceLoginInfo loginInfo = this.voiceLoginInfo;
        if (!this.voiceEnabled || !this.voiceLoggedIn || uuid == null || client == null || loginInfo == null || this.userManager == null) {
            return false;
        }
        VoiceChannelInfo voiceChannelInfo = VoiceChannelInfo.forUser(uuid);
        client.addChannel(ChatterID.getUserChatterID(this.userManager.getUserID(), uuid), voiceChannelInfo);
        client.connectChannel(voiceChannelInfo, null);
        return true;
    }
}
