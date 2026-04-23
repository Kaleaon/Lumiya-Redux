.class public Lcom/lumiyaviewer/lumiya/StreamingMediaService;
.super Landroid/app/Service;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;
    }
.end annotation


# static fields
.field public static final LOCATION_DESC_KEY:Ljava/lang/String; = "location_desc"

.field public static final LOCATION_NAME_KEY:Ljava/lang/String; = "location_name"

.field public static final MEDIA_URL_KEY:Ljava/lang/String; = "media_url"

.field private static final MSG_ON_AUDIO_FOCUS_CHANGE:I = 0x64

.field public static final isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

.field private lastActiveAgentUUID:Ljava/util/UUID;

.field private lastLocationDesc:Ljava/lang/String;

.field private lastLocationName:Ljava/lang/String;

.field private lastParcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

.field private lastURL:Ljava/lang/String;

.field private final mHandler:Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;

.field private mediaWrapper:Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;

.field private noisyReceiver:Lcom/lumiyaviewer/lumiya/media/AudioIntentReceiver;

.field private notify:Landroid/app/Notification;


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/StreamingMediaService;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->handleAudioFocusChange(I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/media/AudioIntentReceiver;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/media/AudioIntentReceiver;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->noisyReceiver:Lcom/lumiyaviewer/lumiya/media/AudioIntentReceiver;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->notify:Landroid/app/Notification;

    new-instance v0, Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->mediaWrapper:Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastURL:Ljava/lang/String;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastLocationName:Ljava/lang/String;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastLocationDesc:Ljava/lang/String;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastActiveAgentUUID:Ljava/util/UUID;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastParcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;-><init>(Lcom/lumiyaviewer/lumiya/StreamingMediaService;Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->mHandler:Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;

    return-void
.end method

.method private handleAudioFocusChange(I)V
    .locals 4

    const/4 v3, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "StreamingMediaService: focusChange = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->mediaWrapper:Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;->stop()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;->abandonAudioFocus()V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->safeUnregisterReceiver()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->stopForeground(Z)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->notify:Landroid/app/Notification;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->stopSelf()V

    :cond_1
    return-void
.end method

.method private handleStartService(Landroid/content/Intent;)V
    .locals 5

    const/4 v2, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :cond_0
    const-string/jumbo v3, "com.lumiyaviewer.lumiya.ACTION_PLAY_MEDIA"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "media_url"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "StreamingMediaService: service is started, playing "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastURL:Ljava/lang/String;

    const-string/jumbo v0, "location_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastLocationName:Ljava/lang/String;

    const-string/jumbo v0, "location_desc"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastLocationDesc:Ljava/lang/String;

    const-string/jumbo v0, "parcelData"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "parcelData"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastParcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastActiveAgentUUID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;->requestAudioFocus()Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->showNotification()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->safeRegisterReceiver()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->mediaWrapper:Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;->play(Ljava/lang/String;)V

    :cond_1
    :goto_2
    return-void

    :cond_2
    move-object v0, v1

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v3, v4}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->mediaWrapper:Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;->stop()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;->abandonAudioFocus()V

    :cond_4
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->safeUnregisterReceiver()V

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->stopForeground(Z)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->notify:Landroid/app/Notification;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->stopSelf()V

    goto :goto_2

    :cond_5
    move v0, v2

    goto :goto_1
.end method

.method private safeRegisterReceiver()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->noisyReceiver:Lcom/lumiyaviewer/lumiya/media/AudioIntentReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string/jumbo v2, "android.media.AUDIO_BECOMING_NOISY"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v0, "StreamingMediaService: Failed to register noisy receiver"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private safeUnregisterReceiver()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->noisyReceiver:Lcom/lumiyaviewer/lumiya/media/AudioIntentReceiver;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v0, "StreamingMediaService: Failed to un register noisy receiver"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private showNotification()V
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/lumiyaviewer/lumiya/StreamingMediaService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {p0, v5, v0, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/media/StreamingMediaActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastActiveAgentUUID:Ljava/util/UUID;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    const-string/jumbo v2, "parcelData"

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastParcelData:Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    new-instance v2, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v2, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f02007c

    invoke-virtual {v2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    const-string/jumbo v4, "Playing media"

    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->lastLocationName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    const/high16 v4, 0x8000000

    invoke-static {p0, v5, v1, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    const-string/jumbo v3, "Stop"

    const v4, 0x7f0200b6

    invoke-virtual {v1, v4, v3, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v2}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    const v1, 0x7f100017

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->startForeground(ILandroid/app/Notification;)V

    return-void
.end method

.method public static startStreamingMediaService(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 4

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfoSnapshot()Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getMediaURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getMediaURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/lumiyaviewer/lumiya/StreamingMediaService;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v3, "com.lumiyaviewer.lumiya.ACTION_PLAY_MEDIA"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    const-string/jumbo v3, "parcelData"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string/jumbo v3, "media_url"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "location_name"

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->mHandler:Lcom/lumiyaviewer/lumiya/StreamingMediaService$AudioFocusChangeHandler;

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;->setHandler(Landroid/os/Handler;I)V

    return-void
.end method

.method public onDestroy()V
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->mediaWrapper:Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/media/MediaPlayerWrapper;->release()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->audioManagerWrapper:Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/media/AudioManagerWrapper;->abandonAudioFocus()V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->safeUnregisterReceiver()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->stopForeground(Z)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->notify:Landroid/app/Notification;

    sget-object v0, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->isPlayingMedia:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;

    sget-object v1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleDataPool;->setData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/StreamingMediaService;->handleStartService(Landroid/content/Intent;)V

    const/4 v0, 0x2

    return v0
.end method
