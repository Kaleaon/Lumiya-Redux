.class public Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# static fields
.field private static final INVALID_PARCEL_ID:I = -0x1

.field private static final LOGIN_DELAY:I = 0x5

.field private static final MAX_LOGIN_ATTEMPTS:I = 0x3


# instance fields
.field private final capURL:Ljava/lang/String;

.field private final chatSessionRequestURL:Ljava/lang/String;

.field private volatile connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

.field private currentParcelID:I

.field private currentParcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

.field private loginAttempts:I

.field private final parcelVoiceCapURL:Ljava/lang/String;

.field private final parcelVoiceChannelLock:Ljava/lang/Object;

.field private final requestedGroupChats:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field private requestedParcelID:I

.field private volatile shutdown:Z

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

.field private voiceCredentialsRequested:Z

.field private volatile voiceEnabled:Z

.field private volatile voiceLoggedIn:Z

.field private final voiceLoggedInSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private volatile voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private volatile voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    return-object v0
.end method

.method static synthetic -get2(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    return v0
.end method

.method static synthetic -get3(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedIn:Z

    return v0
.end method

.method static synthetic -get4(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;)Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    return-object v0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;)V
    .locals 6

    const/4 v5, -0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->requestedGroupChats:Ljava/util/Set;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedInSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedIn:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceCredentialsRequested:Z

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iput-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->shutdown:Z

    iput v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->loginAttempts:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceChannelLock:Ljava/lang/Object;

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->requestedParcelID:I

    iput v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->currentParcelID:I

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->currentParcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ProvisionVoiceAccountRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->capURL:Ljava/lang/String;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ParcelVoiceInfoRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceCapURL:Ljava/lang/String;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->ChatSessionRequest:Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->chatSessionRequestURL:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedInSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getVoiceLoggedIn()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->capURL:Ljava/lang/String;

    if-eqz v0, :cond_1

    const-string/jumbo v0, "Voice cap: \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->capURL:Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->updateVoiceEnabledStatus()V

    return-void

    :cond_1
    const-string/jumbo v0, "Voice cap not supported"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private onParcelVoiceInfoResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 4

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SLVoice: parcel voice info \'%s\'"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private onProvisionVoiceAccountResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 6

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->serializeToXML()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SLVoice: result \'%s\'"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    const-string/jumbo v1, "voice_sip_uri_hostname"

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "voice_account_server_name"

    invoke-virtual {p1, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v3

    const-string/jumbo v4, "username"

    invoke-virtual {p1, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "password"

    invoke-virtual {p1, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->updateVoiceEnabledStatus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "SLVoice: null result"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->shutdown:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->loginAttempts:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->loginAttempts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->loginAttempts:I

    const-wide/16 v0, 0x1388

    :try_start_1
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->shutdown:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->capURL:Ljava/lang/String;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$2;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$2;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "SLVoice: giving up"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private onVoiceLoginStatusChanged(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedIn:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice-mthref-0(Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onVoiceLoginStatusChanged(Ljava/lang/Boolean;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onProvisionVoiceAccountResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice-mthref-2(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onProvisionVoiceAccountResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice-mthref-3(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onParcelVoiceInfoResult(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->shutdown:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedInSubscription:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public getCurrentParcelVoiceChannel()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceChannelLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->currentParcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getVoiceLoginInfo()Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    return-object v0
.end method

.method public groupVoiceChatRequest(Ljava/util/UUID;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedIn:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->chatSessionRequestURL:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->requestedGroupChats:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->StartGroupSessionForVoice(Ljava/util/UUID;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice_12525(ILcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 9

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->currentParcelID:I

    if-eqz p2, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceChannelLock:Ljava/lang/Object;

    monitor-enter v4

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    const-string/jumbo v5, "voice_credentials"

    invoke-virtual {p2, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    const-string/jumbo v6, "channel_uri"

    invoke-virtual {v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    const/4 v7, 0x1

    invoke-direct {v0, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;-><init>(Ljava/lang/String;ZZ)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    :try_start_1
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->currentParcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-static {v3, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->currentParcelVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v1

    :goto_1
    monitor-exit v4

    :goto_2
    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->minimap:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->requestUpdateAvatarParcelData()V

    :cond_0
    return-void

    :catch_0
    move-exception v0

    :try_start_2
    const-string/jumbo v5, "Voice: error retrieving parcel voice info for %d (%s)"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v7, 0x1

    aput-object v0, v6, v7

    invoke-static {v5, v6}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v0, v3

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v4

    throw v0

    :cond_1
    const-string/jumbo v0, "Voice: error retrieving parcel voice info for %d"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v2

    goto :goto_2

    :cond_2
    move v0, v2

    goto :goto_1
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice_14030(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;)V
    .locals 2

    const/4 v1, 0x0

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->loggedIn:Z

    if-eqz v0, :cond_0

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    :goto_0
    return-void

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice_14408(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;)V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->errorMessage:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    goto :goto_0

    :cond_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedIn:Z

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->updateSpatialVoicePosition()V

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_voice_SLVoice_4388()V
    .locals 4

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getVoiceEnabled()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceCredentialsRequested:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceCredentialsRequested:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->capURL:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->capURL:Ljava/lang/String;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$1;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedIn:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->startVoice(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopVoice()V

    goto :goto_0
.end method

.method public nearbyVoiceChatRequest(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedIn:Z

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->addChannel(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceConnectChannel:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceConnectChannel;

    invoke-direct {v2, p1, v3}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceConnectChannel;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    :cond_0
    return-void
.end method

.method public onGlobalOptionsChanged(Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;)V
    .locals 0
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->updateVoiceEnabledStatus()V

    return-void
.end method

.method public onGroupSessionReady(Ljava/util/UUID;)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->requestedGroupChats:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->chatSessionRequestURL:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v3, "method"

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    const-string/jumbo v5, "call"

    invoke-direct {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;

    const-string/jumbo v3, "session-id"

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;

    invoke-direct {v4, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUUID;-><init>(Ljava/util/UUID;)V

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;-><init>([Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->chatSessionRequestURL:Ljava/lang/String;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;

    invoke-direct {v3, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice$1;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;Ljava/util/UUID;)V

    invoke-direct {v1, v2, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V

    :cond_0
    return-void
.end method

.method public onVoiceChannelStatus(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$5;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$5;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onVoiceLoginStatus(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;

    invoke-direct {v1, p0, p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public requestParcelVoiceInfo()Z
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceCapURL:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceCapURL:Ljava/lang/String;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$3;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$3;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setCurrentParcel(I)V
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceChannelLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceCapURL:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->capURL:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->requestedParcelID:I

    if-eq v2, p1, :cond_0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->requestedParcelID:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    :cond_0
    monitor-exit v1

    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->parcelVoiceCapURL:Ljava/lang/String;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDUndefined;-><init>()V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$7;

    invoke-direct {v3, p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$7;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLAsyncRequest$LLSDXMLResultListener;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public updateSpatialVoicePosition()V
    .locals 13

    const/4 v12, 0x0

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->connectedVoiceChannel:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    if-eqz v6, :cond_0

    if-eqz v7, :cond_0

    iget-boolean v0, v7, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->isSpatial:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentGlobalPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->getAgentHeading()F

    move-result v0

    const v2, 0x3c8efa35

    mul-float/2addr v0, v2

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    float-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v0, v4

    invoke-static {v2, v0, v12}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->fromLLCoords(FFF)Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    move-result-object v3

    neg-float v0, v0

    invoke-static {v0, v2, v12}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->fromLLCoords(FFF)Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    move-result-object v5

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v12, v12, v0}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->fromLLCoords(FFF)Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    move-result-object v4

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;

    iget-wide v8, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->x:D

    double-to-float v2, v8

    iget-wide v8, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->y:D

    double-to-float v8, v8

    iget-wide v10, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->z:D

    double-to-float v1, v10

    invoke-static {v2, v8, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->fromLLCoords(FFF)Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    invoke-direct {v2, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;-><init>(FFF)V

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceSet3DPosition:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;

    invoke-direct {v2, v7, v0, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSet3DPosition;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;)V

    invoke-virtual {v6, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    :cond_0
    return-void
.end method

.method public updateVoiceEnabledStatus()V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$4;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/-$Lambda$RETWaU3Ta92aG3GeBeXvI3Y9viY$4;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public userVoiceChatRequest(Ljava/util/UUID;)Z
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoginInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceEnabled:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->voiceLoggedIn:Z

    if-eqz v2, :cond_0

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v2, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;->voiceSipUriHostname:Ljava/lang/String;

    invoke-direct {v2, p1, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->addChannel(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceConnectChannel:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v3, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceConnectChannel;

    invoke-direct {v3, v2, v4}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceConnectChannel;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
