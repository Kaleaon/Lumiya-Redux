.class public Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;
    }
.end annotation


# static fields
.field public static final ACTION_VOICE_ACCEPT:Ljava/lang/String; = "accept"

.field public static final ACTION_VOICE_REJECT:Ljava/lang/String; = "reject"

.field private static final INCOMING_CALL_NOTIFICATION_ID:I = 0x3e9

.field private static final INTENT_EXTRA_CHATTER_ID:Ljava/lang/String; = "chatterID"

.field private static final INTENT_EXTRA_OPEN_CHATTER:Ljava/lang/String; = "openChatterIntent"

.field private static final INTENT_EXTRA_RINGING_MESSSAGE:Ljava/lang/String; = "ringingMessage"

.field private static final REQUIRED_PLUGIN_VERSION:I = 0x3

.field private static final installOfferDisplayed:Ljava/util/concurrent/atomic/AtomicBoolean;


# instance fields
.field private final context:Landroid/content/Context;

.field private final fromPluginHandler:Landroid/os/Handler;

.field private final fromPluginMessenger:Landroid/os/Messenger;

.field private final incomingCallNotificationTags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mainThreadHandler:Landroid/os/Handler;

.field private ringingChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private toPluginMessenger:Landroid/os/Messenger;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final userManager:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;",
            ">;"
        }
    .end annotation
.end field

.field private final voiceChannels:Lcom/google/common/collect/BiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/BiMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final voiceInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final voiceLoginInfo:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->onVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->onVoiceChannelStatus(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->onVoiceInitializeReply(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->onVoiceLoginStatus(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->onVoiceRinging(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->installOfferDisplayed:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->mainThreadHandler:Landroid/os/Handler;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceLoginInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {}, Lcom/google/common/collect/HashBiMap;->create()Lcom/google/common/collect/HashBiMap;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Maps;->synchronizedBiMap(Lcom/google/common/collect/BiMap;)Lcom/google/common/collect/BiMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceChannels:Lcom/google/common/collect/BiMap;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->incomingCallNotificationTags:Ljava/util/Set;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->ringingChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection$1;-><init>(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->fromPluginHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    new-instance v0, Landroid/os/Messenger;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->fromPluginHandler:Landroid/os/Handler;

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->fromPluginMessenger:Landroid/os/Messenger;

    return-void
.end method

.method private cancelNotifications(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/16 v3, 0x3e9

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    const-string/jumbo v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1, v3}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->incomingCallNotificationTags:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->incomingCallNotificationTags:Ljava/util/Set;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->incomingCallNotificationTags:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    goto :goto_0
.end method

.method public static checkPluginInstalled(Landroid/content/Context;)Z
    .locals 5

    const/4 v0, 0x0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    new-instance v2, Landroid/content/ComponentName;

    const-string/jumbo v3, "com.lumiyaviewer.lumiya.voice"

    const-string/jumbo v4, "com.lumiyaviewer.lumiya.voice.VoiceService"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static isPluginSupported()Z
    .locals 7

    const/4 v2, 0x1

    const/4 v1, 0x0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v0, v3, :cond_2

    sget-object v0, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    move-object v3, v0

    :goto_0
    if-eqz v3, :cond_1

    move v0, v1

    :goto_1
    array-length v4, v3

    if-ge v0, v4, :cond_1

    aget-object v4, v3, v0

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "armeabi"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "arm64"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    :cond_0
    move v1, v2

    :cond_1
    return v1

    :cond_2
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    sget-object v3, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    aput-object v3, v0, v1

    sget-object v3, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    aput-object v3, v0, v2

    move-object v3, v0

    goto :goto_0

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private onVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V
    .locals 4

    const/4 v0, 0x0

    const-string/jumbo v1, "Voice: voice audio properties received, bluetooth state %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;->bluetoothState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceBluetoothState;

    :cond_0
    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAudioProperties;)V

    :cond_1
    return-void
.end method

.method private onVoiceChannelStatus(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;)V
    .locals 8

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->cancelNotifications(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceChannels:Lcom/google/common/collect/BiMap;

    invoke-interface {v1}, Lcom/google/common/collect/BiMap;->inverse()Lcom/google/common/collect/BiMap;

    move-result-object v1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->channelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-interface {v1, v2}, Lcom/google/common/collect/BiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-eqz v1, :cond_2

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setVoiceChatInfo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;)V

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v3, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->None:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v2, v3, :cond_1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->previousState:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v3, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Ringing:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v2, v3, :cond_1

    instance-of v2, v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/chat/SLMissedVoiceCallEvent;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;

    move-object v2, v1

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-direct {v5, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUser;-><init>(Ljava/util/UUID;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f0901ba

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLMissedVoiceCallEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {v3, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :cond_1
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;->chatInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v3, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v2, v3, :cond_2

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setVoiceActiveChatter(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_2
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onVoiceChannelStatus(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceChannelStatus;)V

    :cond_3
    return-void
.end method

.method private onVoiceInitializeReply(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;)V
    .locals 9

    const/4 v6, 0x1

    const/4 v8, 0x0

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->appVersionOk:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f090045

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya"

    invoke-direct {v3, v0, v4, v8, v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;-><init>(Ljava/util/UUID;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {v1, v2, v3, v8}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->pluginVersionCode:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f09027a

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.voice"

    invoke-direct {v3, v0, v4, v8, v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;-><init>(Ljava/util/UUID;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {v1, v2, v3, v8}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto :goto_0

    :cond_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->errorMessage:Ljava/lang/String;

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceLoginInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogin:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogin;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogin;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;)V

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v5

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitializeReply;->errorMessage:Ljava/lang/String;

    aput-object v7, v6, v8

    const v7, 0x7f09037f

    invoke-virtual {v5, v7, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatSystemMessageEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3, v8}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    goto/16 :goto_0
.end method

.method private onVoiceLoginStatus(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->voice:Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;

    invoke-virtual {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/voice/SLVoice;->onVoiceLoginStatus(Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;)V

    :cond_0
    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLoginStatus;->loggedIn:Z

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setVoiceLoggedIn(Z)V

    :cond_1
    return-void
.end method

.method private onVoiceRinging(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;)V
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->agentUUID:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceChannels:Lcom/google/common/collect/BiMap;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-interface {v1, v0, v2}, Lcom/google/common/collect/BiMap;->forcePut(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voiceintf/-$Lambda$KEiwggiQxhrsJugAMeHgzXJrgrA$1;

    invoke-direct {v2, p0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/-$Lambda$KEiwggiQxhrsJugAMeHgzXJrgrA$1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getSerialInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;Z)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->ringingChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->ringingChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->subscribe()V

    :cond_0
    return-void
.end method

.method public static setInstallOfferDisplayed(Z)V
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->installOfferDisplayed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public static shouldDisplayInstallOffer()Z
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->installOfferDisplayed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private showIncomingCallNotification(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 11

    const/4 v4, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    new-instance v10, Landroid/content/Intent;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    const-class v3, Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-direct {v10, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v0, "reject"

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->toUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string/jumbo v0, "ringingMessage"

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v10, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-static {p3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v0, v3, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->createIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v9

    const/high16 v0, 0x20000000

    invoke-virtual {v9, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-static {v9, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v8, :cond_0

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    sget-object v5, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-static {p3, v2, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->create(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;Ljava/util/List;I)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    move-result-object v6

    invoke-static {v1, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->create(IILcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v7

    move-object v3, v2

    invoke-static/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->create(Ljava/util/UUID;ILjava/util/List;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    move-result-object v0

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v2

    invoke-virtual {v2, v0, v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->captureNotify(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    :goto_0
    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    const-class v5, Lcom/lumiyaviewer/lumiya/GridConnectionService;

    invoke-direct {v2, v3, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v3, "accept"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->toUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string/jumbo v3, "ringingMessage"

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->toBundle()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    const-string/jumbo v3, "chatterID"

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->toBundle()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    const-string/jumbo v3, "openChatterIntent"

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-static {v5, v1, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    new-instance v3, Landroid/support/v7/app/NotificationCompat$Builder;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/support/v7/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f020076

    invoke-virtual {v3, v5}, Landroid/support/v7/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    invoke-virtual {v3, p2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    const v6, 0x7f09015c

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    const/4 v5, -0x1

    invoke-virtual {v3, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-static {v5, v1, v10, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-static {v5, v1, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    const v4, 0x7f090379

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-static {v4, v1, v2, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    const v4, 0x7f020088

    invoke-virtual {v0, v4, v3, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    const v3, 0x7f09037a

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-static {v3, v1, v10, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v3, 0x7f020089

    invoke-virtual {v0, v3, v2, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->incomingCallNotificationTags:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    const-string/jumbo v3, "notification"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/16 v3, 0x3e9

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    return-void

    :cond_0
    move-object v0, v9

    goto/16 :goto_0
.end method


# virtual methods
.method public acceptCall(Landroid/content/Intent;)V
    .locals 6

    const/4 v5, 0x0

    const-string/jumbo v0, "ringingMessage"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;

    const-string/jumbo v1, "ringingMessage"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;-><init>(Landroid/os/Bundle;)V

    const-string/jumbo v1, "Voice: accepting session \'%s\', url \'%s\'"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    aput-object v3, v2, v5

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAcceptCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAcceptCall;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-direct {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAcceptCall;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    :cond_0
    const-string/jumbo v0, "Voice: cancelling notifications"

    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->cancelNotifications(Ljava/lang/String;)V

    const-string/jumbo v0, "openChatterIntent"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "openChatterIntent"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    instance-of v1, v0, Landroid/app/PendingIntent;

    if-eqz v1, :cond_1

    :try_start_0
    const-string/jumbo v1, "Voice: starting pending open chatter intent"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    check-cast v0, Landroid/app/PendingIntent;

    invoke-virtual {v0}, Landroid/app/PendingIntent;->send()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public acceptVoiceCall(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceChannels:Lcom/google/common/collect/BiMap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/BiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    if-eqz v0, :cond_0

    const-string/jumbo v1, "Voice: cancelling notification"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->cancelNotifications(Ljava/lang/String;)V

    const-string/jumbo v1, "Voice: accepting voice call (chatterID %s)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAcceptCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAcceptCall;

    invoke-direct {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAcceptCall;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    :cond_0
    return-void
.end method

.method public acceptVoiceCall(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;)V
    .locals 4

    const/4 v3, 0x0

    const-string/jumbo v0, "Voice: cancelling notification"

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->cancelNotifications(Ljava/lang/String;)V

    const-string/jumbo v0, "Voice: accepting voice call (session handle %s)"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceAcceptCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAcceptCall;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceAcceptCall;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    return-void
.end method

.method public addChannel(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceChannels:Lcom/google/common/collect/BiMap;

    invoke-interface {v0, p1, p2}, Lcom/google/common/collect/BiMap;->forcePut(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public disconnect()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->mainThreadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/voiceintf/-$Lambda$KEiwggiQxhrsJugAMeHgzXJrgrA;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/voiceintf/-$Lambda$KEiwggiQxhrsJugAMeHgzXJrgrA;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public enableVoiceMic(Z)V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceEnableMic:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceEnableMic;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceEnableMic;-><init>(Z)V

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_voiceintf_VoicePluginServiceConnection_13701(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->ringingChatterNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-ne p2, v0, :cond_0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-direct {p0, p1, v0, v1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->showIncomingCallNotification(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_voiceintf_VoicePluginServiceConnection_17898()V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "LumiyaVoice: disconnecting from voice plugin"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setVoiceLoggedIn(Z)V

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogout:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogout;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogout;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    const/4 v1, 0x0

    const-string/jumbo v0, "LumiyaVoice: service connected"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Landroid/os/Messenger;

    invoke-direct {v0, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->toPluginMessenger:Landroid/os/Messenger;

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceInitialize:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitialize;

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceInitialize;-><init>(I)V

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "LumiyaCloud: service disconnected"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->setVoiceLoggedIn(Z)V

    :cond_0
    return-void
.end method

.method public rejectCall(Landroid/content/Intent;)V
    .locals 5

    const-string/jumbo v0, "ringingMessage"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;

    const-string/jumbo v1, "ringingMessage"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;-><init>(Landroid/os/Bundle;)V

    const-string/jumbo v1, "Voice: requesting to reject session \'%s\', url \'%s\'"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceRejectCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRejectCall;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->sessionHandle:Ljava/lang/String;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    invoke-direct {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRejectCall;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;->voiceChannelInfo:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;->voiceChannelURI:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->cancelNotifications(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->cancelNotifications(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->toPluginMessenger:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->toPluginMessenger:Landroid/os/Messenger;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->fromPluginMessenger:Landroid/os/Messenger;

    invoke-static {v0, p1, p2, v1}, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessenger;->sendMessage(Landroid/os/Messenger;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;Landroid/os/Messenger;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setVoiceAudioProperties(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceSetAudioProperties;)V
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceSetAudioProperties:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    invoke-virtual {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    return-void
.end method

.method public setVoiceLoginInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->userManager:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceLoginInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceLogin:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v1, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogin;

    invoke-direct {v1, p1}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceLogin;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;)V

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    :cond_0
    return-void
.end method

.method public terminateVoiceCall(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->voiceChannels:Lcom/google/common/collect/BiMap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/BiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;->VoiceTerminateCall:Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceTerminateCall;

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceTerminateCall;-><init>(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChannelInfo;)V

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessageType;Lcom/lumiyaviewer/lumiya/voice/common/VoicePluginMessage;)Z

    :cond_0
    return-void
.end method
