.class public Lcom/lumiyaviewer/lumiya/GridConnectionService;
.super Landroid/app/Service;

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/GridConnectionService$1;,
        Lcom/lumiyaviewer/lumiya/GridConnectionService$2;,
        Lcom/lumiyaviewer/lumiya/GridConnectionService$3;,
        Lcom/lumiyaviewer/lumiya/GridConnectionService$GridServiceBinder;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues:[I = null

.field private static final synthetic -com-lumiyaviewer-lumiya-utils-LEDActionSwitchesValues:[I = null

.field public static final LOGIN_ACTION:Ljava/lang/String; = "com.lumiyaviewer.lumiya.ACTION_LOGIN"

.field private static final REQUEST_CODE_UNREAD_NOTIFY:I = 0x7f100040

.field private static gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

.field private static gridName:Ljava/lang/String;

.field private static notifyGroup:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

.field private static notifyLocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

.field private static notifyPrivate:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

.field private static onlineNotify:Z

.field private static serviceInstance:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/GridConnectionService;",
            ">;"
        }
    .end annotation
.end field

.field private static soundOnNotify:Z

.field private static visibleActivities:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final cloudPluginInstalledReceiver:Landroid/content/BroadcastReceiver;

.field private cloudPluginReceiverRegistered:Z

.field private cloudSyncEnabled:Z

.field private cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

.field private cloudSyncUserManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

.field private final currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

.field private licenseCheckHandler:Landroid/os/Handler;

.field private final mBinder:Landroid/os/IBinder;

.field private final mHandler:Landroid/os/Handler;

.field private final onActiveAgentNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

.field private onlineNotificationInfo:Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

.field private prefs:Landroid/content/SharedPreferences;

.field private final shownNotificationIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private unreadNotifySubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/lang/Boolean;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;",
            ">;"
        }
    .end annotation
.end field

.field private final voicePluginInstalledReceiver:Landroid/content/BroadcastReceiver;

.field private voicePluginReceiverRegistered:Z

.field private voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

.field private wifiLock:Landroid/net/wifi/WifiManager$WifiLock;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/GridConnectionService;)Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    return-object v0
.end method

.method static synthetic -get1()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    return-object v0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-com-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-com-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->values()[Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-com-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method private static synthetic -getcom-lumiyaviewer-lumiya-utils-LEDActionSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-com-lumiyaviewer-lumiya-utils-LEDActionSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-com-lumiyaviewer-lumiya-utils-LEDActionSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->values()[Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Always:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Fast:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->Slow:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-com-lumiyaviewer-lumiya-utils-LEDActionSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/GridConnectionService;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->performLogin(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/GridConnectionService;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->startCloudSync(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 3

    const/4 v2, 0x0

    sput-object v2, Lcom/lumiyaviewer/lumiya/GridConnectionService;->serviceInstance:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotify:Z

    const/4 v0, 0x1

    sput-boolean v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->soundOnNotify:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;-><init>(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyLocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;-><init>(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyPrivate:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;-><init>(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyGroup:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    const-string/jumbo v0, "Second Life"

    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridName:Ljava/lang/String;

    sput-object v2, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->visibleActivities:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    const/4 v1, 0x0

    const/4 v6, 0x0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->mHandler:Landroid/os/Handler;

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->prefs:Landroid/content/SharedPreferences;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncEnabled:Z

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncUserManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudPluginReceiverRegistered:Z

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginReceiverRegistered:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->shownNotificationIds:Ljava/util/Set;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    sget-boolean v1, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotify:Z

    sget-object v3, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridName:Ljava/lang/String;

    sget-object v4, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;-><init>(ZLandroid/content/Context;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotificationInfo:Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    new-instance v0, Lcom/lumiyaviewer/lumiya/GridConnectionService$GridServiceBinder;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService$GridServiceBinder;-><init>(Lcom/lumiyaviewer/lumiya/GridConnectionService;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->mBinder:Landroid/os/IBinder;

    new-instance v0, Lcom/lumiyaviewer/lumiya/GridConnectionService$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService$1;-><init>(Lcom/lumiyaviewer/lumiya/GridConnectionService;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->licenseCheckHandler:Landroid/os/Handler;

    new-instance v0, Lcom/lumiyaviewer/lumiya/GridConnectionService$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService$2;-><init>(Lcom/lumiyaviewer/lumiya/GridConnectionService;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudPluginInstalledReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/lumiyaviewer/lumiya/GridConnectionService$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService$3;-><init>(Lcom/lumiyaviewer/lumiya/GridConnectionService;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginInstalledReceiver:Landroid/content/BroadcastReceiver;

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    new-instance v0, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0$2;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0$2;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onActiveAgentNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0, v6, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Ljava/lang/Object;Landroid/app/Activity;Landroid/os/Handler;)V

    return-void
.end method

.method private connectToVoicePlugin(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 8

    const/4 v5, 0x0

    const/4 v7, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v2, Landroid/content/ComponentName;

    const-string/jumbo v3, "com.lumiyaviewer.lumiya.voice"

    const-string/jumbo v4, "com.lumiyaviewer.lumiya.voice.VoiceService"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    const-string/jumbo v2, "LumiyaVoice: bindService = %b"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez v0, :cond_1

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string/jumbo v2, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v2, "package"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_0

    const-string/jumbo v2, "com.lumiyaviewer.lumiya.voice"

    invoke-virtual {v0, v2, v1}, Landroid/content/IntentFilter;->addDataSchemeSpecificPart(Ljava/lang/String;I)V

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginInstalledReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    iput-boolean v7, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginReceiverRegistered:Z

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->shouldDisplayInstallOffer()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getChatterList()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterList;->getActiveChattersManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v4

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f090279

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.voice"

    invoke-direct {v3, v4, v5, v7, v6}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;-><init>(Ljava/util/UUID;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-virtual {v0, v2, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;->HandleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;Z)V

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->setVoiceLoginInfo(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    :cond_2
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move v0, v1

    goto :goto_0
.end method

.method public static getGridConnection()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    return-object v0
.end method

.method public static getServiceInstance()Lcom/lumiyaviewer/lumiya/GridConnectionService;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    sget-object v1, Lcom/lumiyaviewer/lumiya/GridConnectionService;->serviceInstance:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->serviceInstance:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;

    :cond_0
    return-object v0
.end method

.method private handleStartService(Landroid/content/Intent;)V
    .locals 4

    const-string/jumbo v1, "GridConnectionService: service is now started, intent is %s"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    if-eqz p1, :cond_1

    const-string/jumbo v0, "not null"

    :goto_0
    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.lumiyaviewer.lumiya.ACTION_LOGIN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;-><init>(Landroid/content/Intent;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/licensing/LicenseChecker;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->licenseCheckHandler:Landroid/os/Handler;

    invoke-direct {v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/licensing/LicenseChecker;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/Object;)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    const-string/jumbo v0, "null"

    goto :goto_0

    :cond_2
    const-string/jumbo v1, "reject"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->rejectCall(Landroid/content/Intent;)V

    goto :goto_1

    :cond_3
    const-string/jumbo v1, "accept"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->acceptCall(Landroid/content/Intent;)V

    goto :goto_1
.end method

.method public static hasVisibleActivities()Z
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->visibleActivities:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private hideUnreadNotificationSingle(I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->shownNotificationIds:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->shownNotificationIds:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const-string/jumbo v0, "notification"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_0
    return-void
.end method

.method private static notifySettingsByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-getcom-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyLocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    return-object v0

    :pswitch_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyLocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    return-object v0

    :pswitch_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyGroup:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    return-object v0

    :pswitch_2
    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyPrivate:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private onCurrentLocationInfo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    return-void
.end method

.method private onUnreadNotification(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->showUnreadNotification(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;)V

    return-void
.end method

.method private performLogin(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)V
    .locals 1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridName:Ljava/lang/String;

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->Connect(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)V

    return-void
.end method

.method private readPreferences(Landroid/content/SharedPreferences;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v1, 0x0

    const-string/jumbo v0, "onlineNotify"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotify:Z

    const-string/jumbo v0, "soundOnNotify"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->soundOnNotify:Z

    const-string/jumbo v0, "sync_to_gdrive"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncEnabled:Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyLocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->Load(Landroid/content/SharedPreferences;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyPrivate:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->Load(Landroid/content/SharedPreferences;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifyGroup:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->Load(Landroid/content/SharedPreferences;)V

    const-string/jumbo v0, "autoresponse"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const-string/jumbo v1, "autoresponseText"

    const-string/jumbo v2, "(Autoresponse) I have auto-response feature enabled. I will respond shortly."

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->setAutoresponseInfo(ZLjava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "GridConnectionService: prefs: onlineNotify = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v1, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotify:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "GridConnectionService: prefs: soundOnNotify = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v1, Lcom/lumiyaviewer/lumiya/GridConnectionService;->soundOnNotify:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    if-eqz v0, :cond_0

    :try_start_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->HandleGlobalOptionsChange()V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateCloudSyncStatus()V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static setActivityVisible(Landroid/app/Activity;Z)V
    .locals 2

    if-eqz p1, :cond_1

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->visibleActivities:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :goto_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->visibleActivities:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    if-eqz v0, :cond_0

    :try_start_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->UnpauseAgent()V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->visibleActivities:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;->printStackTrace()V

    goto :goto_1
.end method

.method private showUnreadNotification(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;)V
    .locals 9

    const v2, 0x7f10003d

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->useNotificationGroups()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->areNotificationsSystemControlled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v7, p0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getEnabledTypes(Landroid/content/Context;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->filter(Lcom/google/common/collect/ImmutableSet;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;

    move-result-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->notificationGroups()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->merge()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->mostImportantFreshType()Lcom/google/common/base/Optional;

    move-result-object v3

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->mostImportantType()Lcom/google/common/base/Optional;

    move-result-object v0

    sget-object v4, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v0, v4}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v3, v0}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v7, v0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getChannelByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    move-result-object v0

    invoke-virtual {v7, v0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "messageNotifications"

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->showUnreadNotificationSingle(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->VALUES:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_1
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v7, v0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getChannelByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->notificationGroups()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->getPriority()I

    move-result v0

    rsub-int/lit8 v0, v0, 0x9

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    iget v2, v3, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->notificationId:I

    invoke-virtual {v7, v3}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "messageNotifications"

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->showUnreadNotificationSingle(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->shownNotificationIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "notification"

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->shownNotificationIds:Ljava/util/Set;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->shownNotificationIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    :cond_4
    :goto_2
    return-void

    :cond_5
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->merge()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    move-result-object v1

    const-string/jumbo v3, "miscellaneous"

    move-object v0, p0

    move-object v4, v6

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->showUnreadNotificationSingle(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_2
.end method

.method private showUnreadNotificationSingle(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 17
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const-string/jumbo v2, "notification"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroid/app/NotificationManager;

    const/4 v11, 0x0

    if-eqz p1, :cond_1

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v11, 0x1

    :cond_1
    if-nez v11, :cond_2

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->hideUnreadNotificationSingle(I)V

    :goto_0
    return-void

    :cond_2
    const-string/jumbo v2, "GridConnectionService: updateUnreadNotification: notification state changed."

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v13, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v13, v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const v2, 0x7f020087

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    if-eqz p4, :cond_3

    move-object/from16 v0, p4

    invoke-virtual {v13, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setGroup(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;

    move/from16 v0, p5

    invoke-virtual {v13, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setGroupSummary(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    const/4 v2, 0x2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setGroupAlertBehavior(I)Landroid/support/v4/app/NotificationCompat$Builder;

    if-eqz p6, :cond_3

    move-object/from16 v0, p6

    invoke-virtual {v13, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSortKey(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;

    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->agentUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->unreadSources()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_5

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->unreadSources()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    move-object v10, v2

    :goto_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;

    move-result-object v3

    if-eqz v10, :cond_6

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    :goto_2
    move-object/from16 v0, p0

    invoke-virtual {v3, v0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatFragmentActivityFactory;->createIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v4

    const/high16 v2, 0x20000000

    invoke-virtual {v4, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->agentUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    const/4 v2, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->singleFreshSource()Lcom/google/common/base/Optional;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->singleFreshSource()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    :goto_3
    if-eqz v2, :cond_4

    const-string/jumbo v3, "weakSelection"

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v4, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_4
    if-eqz v5, :cond_36

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->captureNotify(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_36

    move-object v12, v2

    :goto_4
    if-eqz v10, :cond_e

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v2

    if-nez v2, :cond_e

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v13, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessagesCount()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_a

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_a

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v3

    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v2, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    :goto_5
    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_d

    new-instance v14, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-direct {v14}, Landroid/support/v4/app/NotificationCompat$InboxStyle;-><init>()V

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_6
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v4

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v3

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->User:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v3, v5, :cond_b

    const/4 v5, 0x1

    :goto_7
    const-string/jumbo v6, "  "

    const-string/jumbo v7, " "

    move-object/from16 v3, p0

    invoke-virtual/range {v2 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v14, v2}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    goto :goto_6

    :cond_5
    const/4 v2, 0x0

    move-object v10, v2

    goto/16 :goto_1

    :cond_6
    const/4 v2, 0x0

    goto/16 :goto_2

    :cond_7
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->unreadSources()Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move-object v3, v2

    :goto_8
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_37

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    if-eqz v3, :cond_8

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessagesCount()I

    move-result v7

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessagesCount()I

    move-result v9

    if-le v7, v9, :cond_9

    :cond_8
    :goto_9
    move-object v3, v2

    goto :goto_8

    :cond_9
    move-object v2, v3

    goto :goto_9

    :cond_a
    const v2, 0x7f090363

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v10}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessagesCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_5

    :cond_b
    const/4 v5, 0x0

    goto :goto_7

    :cond_c
    invoke-virtual {v14, v9}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    const v2, 0x7f090363

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-virtual {v13, v14}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    :cond_d
    move v2, v11

    :goto_a
    if-nez v2, :cond_1b

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->hideUnreadNotificationSingle(I)V

    goto/16 :goto_0

    :cond_e
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v2

    if-eqz v2, :cond_16

    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const v5, 0x7f110003

    invoke-virtual {v2, v5, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v3

    if-eqz v3, :cond_f

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const/high16 v6, 0x7f110000

    invoke-virtual {v3, v6, v4, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_f
    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v2

    if-nez v2, :cond_10

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v2

    if-nez v2, :cond_13

    :cond_10
    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const v5, 0x7f110003

    invoke-virtual {v2, v5, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    :goto_b
    const/4 v3, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->unreadSources()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_11
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v5

    if-eqz v5, :cond_11

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :goto_c
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->unreadSources()Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v3

    if-eqz v2, :cond_14

    const/4 v4, 0x1

    if-le v3, v4, :cond_34

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v4, 0x7f090253

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    add-int/lit8 v3, v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v6, 0x0

    aput-object v3, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v10, v2

    :goto_d
    invoke-virtual {v13, v10}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    new-instance v14, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-direct {v14}, Landroid/support/v4/app/NotificationCompat$InboxStyle;-><init>()V

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->unreadSources()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_12
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_e
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v4

    const-string/jumbo v6, "  "

    const-string/jumbo v7, " "

    const/4 v5, 0x0

    move-object/from16 v3, p0

    invoke-virtual/range {v2 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v14, v2}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    goto :goto_e

    :cond_13
    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const v5, 0x7f110004

    invoke-virtual {v2, v5, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_b

    :cond_14
    const v2, 0x7f0900b2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x0

    aput-object v3, v4, v5

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object v10, v2

    goto/16 :goto_d

    :cond_15
    const v2, 0x7f090363

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-virtual {v14, v10}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setSummaryText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-virtual {v13, v14}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    move v2, v11

    goto/16 :goto_a

    :cond_16
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v2

    if-eqz v2, :cond_1a

    const-string/jumbo v2, "objectPopupNotification"

    const/4 v3, 0x1

    invoke-virtual {v12, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string/jumbo v2, "selection"

    invoke-virtual {v12, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_17

    const-string/jumbo v2, "weakSelection"

    invoke-virtual {v12, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_17

    const-string/jumbo v2, "selection"

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->agentUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getLocalChatterID(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v12, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_17
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->lastObjectPopup()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->freshObjectPopupsCount()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_18

    if-eqz v2, :cond_18

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;->objectName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;->message()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move v2, v11

    goto/16 :goto_a

    :cond_18
    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const v6, 0x7f110004

    invoke-virtual {v3, v6, v4, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    if-eqz v2, :cond_19

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;->objectName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;->message()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move v2, v11

    goto/16 :goto_a

    :cond_19
    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const v5, 0x7f110004

    invoke-virtual {v2, v5, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move v2, v11

    goto/16 :goto_a

    :cond_1a
    const/4 v2, 0x0

    goto/16 :goto_a

    :cond_1b
    const/4 v2, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->freshMessagesCount()I

    move-result v3

    if-lez v3, :cond_2e

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->singleFreshSource()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    if-eqz v2, :cond_2d

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->freshMessagesCount()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_29

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v3

    if-lez v3, :cond_29

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v4

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v4, v5, :cond_27

    const v4, 0x7f0900b8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v4

    :goto_f
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v3, v0, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->getPlainTextMessage(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Z)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_1c

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :cond_1c
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x1e

    if-le v3, v4, :cond_1d

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    const/16 v5, 0x1e

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_1d
    :goto_10
    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v3

    invoke-virtual {v13, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setNumber(I)Landroid/support/v4/app/NotificationCompat$Builder;

    const v3, 0x7f100040

    const/high16 v4, 0x8000000

    move-object/from16 v0, p0

    invoke-static {v0, v3, v12, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-virtual {v13, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    if-eqz v2, :cond_1e

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    :cond_1e
    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    if-eqz p4, :cond_1f

    xor-int/lit8 v2, p5, 0x1

    if-eqz v2, :cond_26

    :cond_1f
    sget-object v4, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v5

    if-lez v5, :cond_20

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->mostImportantType()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    :cond_20
    if-nez v2, :cond_21

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v5

    if-eqz v5, :cond_21

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    :cond_21
    if-eqz v2, :cond_22

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifySettingsByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->getLEDAction()Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->getLEDColor()I

    move-result v2

    move-object v4, v3

    move v3, v2

    :cond_22
    const/4 v2, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->freshMessagesCount()I

    move-result v5

    if-eqz v5, :cond_23

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->mostImportantFreshType()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    :cond_23
    if-nez v2, :cond_24

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->freshObjectPopupsCount()I

    move-result v5

    if-eqz v5, :cond_24

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    :cond_24
    if-eqz v2, :cond_31

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->notifySettingsByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;

    move-result-object v2

    :goto_11
    const-string/jumbo v5, "GridConnectionService: updateUnreadNotification: ledAction = %s, color = %08x"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    aput-object v7, v6, v9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v9, 0x1

    aput-object v7, v6, v9

    invoke-static {v5, v6}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v5, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->None:Lcom/lumiyaviewer/lumiya/utils/LEDAction;

    if-eq v4, v5, :cond_25

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->-getcom-lumiyaviewer-lumiya-utils-LEDActionSwitchesValues()[I

    move-result-object v5

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/utils/LEDAction;->ordinal()I

    move-result v4

    aget v4, v5, v4

    packed-switch v4, :pswitch_data_0

    :cond_25
    :goto_12
    sget-boolean v3, Lcom/lumiyaviewer/lumiya/GridConnectionService;->soundOnNotify:Z

    if-eqz v3, :cond_32

    if-eqz v2, :cond_32

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationSettings;->getRingtone()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_26

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    const/4 v2, 0x0

    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    :cond_26
    :goto_13
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->shownNotificationIds:Ljava/util/Set;

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {v13}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    move/from16 v0, p2

    invoke-virtual {v8, v0, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_0

    :cond_27
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v4

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v4, v5, :cond_28

    const v4, 0x7f0900b6

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_f

    :cond_28
    const v4, 0x7f0900b7

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_f

    :cond_29
    const v3, 0x7f090363

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->freshMessagesCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v4

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v4, v5, :cond_2a

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v2

    const v5, 0x7f090192

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const v2, 0x7f0901b9

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v4}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_14
    if-eqz v2, :cond_33

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_10

    :cond_2a
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    move-result-object v4

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    if-ne v4, v5, :cond_2b

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v2

    const v5, 0x7f0900d9

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const v2, 0x7f0901b9

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v4}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_14

    :cond_2b
    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v4

    if-eqz v4, :cond_2c

    const v4, 0x7f09012d

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v2

    const/4 v6, 0x0

    aput-object v2, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_14

    :cond_2c
    const/4 v2, 0x0

    goto :goto_14

    :cond_2d
    const v2, 0x7f090363

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->freshMessagesCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_10

    :cond_2e
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->freshObjectPopupsCount()I

    move-result v3

    if-eqz v3, :cond_1d

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->lastObjectPopup()Lcom/google/common/base/Optional;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->freshObjectPopupsCount()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_30

    if-eqz v2, :cond_30

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;->objectName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;->message()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_2f

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :cond_2f
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x1e

    if-le v3, v4, :cond_1d

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    const/16 v5, 0x1e

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_10

    :cond_30
    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const v5, 0x7f110004

    invoke-virtual {v2, v5, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_10

    :cond_31
    const/4 v2, 0x0

    goto/16 :goto_11

    :pswitch_0
    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {v13, v3, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_12

    :pswitch_1
    const/16 v4, 0x12c

    const/16 v5, 0x64

    invoke-virtual {v13, v3, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_12

    :pswitch_2
    const/16 v4, 0x3e8

    const/16 v5, 0x1f4

    invoke-virtual {v13, v3, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_12

    :pswitch_3
    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v13, v3, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_12

    :cond_32
    const-string/jumbo v2, "GridConnectionService: will not emit sound."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_13

    :cond_33
    move-object v2, v3

    goto/16 :goto_10

    :cond_34
    move-object v10, v2

    goto/16 :goto_d

    :cond_35
    move-object v2, v3

    goto/16 :goto_c

    :cond_36
    move-object v12, v4

    goto/16 :goto_4

    :cond_37
    move-object v2, v3

    goto/16 :goto_3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private startCloudSync(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncUserManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateCloudSyncStatus()V

    return-void
.end method

.method private stopCloudSync()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncUserManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateCloudSyncStatus()V

    return-void
.end method

.method private updateCloudSyncStatus()V
    .locals 7

    const/4 v6, 0x1

    const/4 v1, 0x0

    const/4 v5, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncEnabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncUserManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncUserManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-direct {v0, p0, v2}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    new-instance v2, Landroid/content/ComponentName;

    const-string/jumbo v3, "com.lumiyaviewer.lumiya.cloud"

    const-string/jumbo v4, "com.lumiyaviewer.lumiya.cloud.DriveSyncService"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    :try_start_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    const-string/jumbo v2, "LumiyaCloud: bindService = %b"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->stopSyncing()V

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.cloud"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    const v3, 0x7f0900c6

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0900c7

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v0}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->showSyncingError(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string/jumbo v2, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string/jumbo v2, "package"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_0

    const-string/jumbo v2, "com.lumiyaviewer.lumiya.cloud"

    invoke-virtual {v0, v2, v1}, Landroid/content/IntentFilter;->addDataSchemeSpecificPart(Ljava/lang/String;I)V

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudPluginInstalledReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudPluginReceiverRegistered:Z

    :cond_1
    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->stopSyncing()V

    iput-object v5, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudSyncServiceConnection:Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;

    :cond_3
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudPluginReceiverRegistered:Z

    if-eqz v0, :cond_4

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudPluginInstalledReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    :cond_4
    :goto_2
    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->cloudPluginReceiverRegistered:Z

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method private updateOnlineNotification()V
    .locals 8

    const/4 v7, 0x1

    const/4 v1, 0x0

    const/4 v6, 0x0

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    if-eqz v0, :cond_9

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-eq v2, v0, :cond_3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getKeepWifiOn()Z

    move-result v0

    if-eqz v0, :cond_8

    move v0, v7

    :goto_0
    sget-object v3, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getActiveAgentUUID()Ljava/util/UUID;

    move-result-object v3

    if-eqz v3, :cond_4

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-eq v2, v4, :cond_4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-nez v2, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-static {v3, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onActiveAgentNameUpdated:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getSerialInstance()Ljava/util/concurrent/Executor;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever$OnChatterNameUpdated;Ljava/util/concurrent/Executor;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    :cond_0
    :goto_1
    if-eqz v0, :cond_6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    if-nez v2, :cond_6

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string/jumbo v2, "wifi"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    const-string/jumbo v2, "Lumiya"

    invoke-virtual {v0, v7, v2}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    const-string/jumbo v0, "WiFi lock acquired"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    :goto_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    sget-boolean v1, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotify:Z

    sget-object v3, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridName:Ljava/lang/String;

    sget-object v4, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;-><init>(ZLandroid/content/Context;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotificationInfo:Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotificationInfo:Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->getNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    if-eqz v0, :cond_7

    const v1, 0x7f100022

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->startForeground(ILandroid/app/Notification;)V

    :cond_2
    :goto_3
    return-void

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->dispose()V

    :cond_5
    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    goto :goto_1

    :cond_6
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    if-eqz v2, :cond_1

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    const-string/jumbo v0, "WiFi lock released"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    :cond_7
    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopForeground(Z)V

    goto :goto_3

    :cond_8
    move v0, v1

    goto/16 :goto_0

    :cond_9
    move v0, v1

    goto/16 :goto_1
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_GridConnectionService-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onCurrentLocationInfo(Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    return-void
.end method

.method synthetic -com_lumiyaviewer_lumiya_GridConnectionService-mthref-1(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onUnreadNotification(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;)V

    return-void
.end method

.method public acceptVoiceCall(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->acceptVoiceCall(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    return-void
.end method

.method public acceptVoiceCall(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->acceptVoiceCall(Lcom/lumiyaviewer/lumiya/voice/common/messages/VoiceRinging;)V

    :cond_0
    return-void
.end method

.method public enableVoiceMic(Z)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->enableVoiceMic(Z)V

    :cond_0
    return-void
.end method

.method public getVoicePluginServiceConnection()Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    return-object v0
.end method

.method public handleConnectEvent(Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->activeAgentUUID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUnreadNotificationManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->getUnreadNotifications()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationManager;->unreadNotificationKey:Ljava/lang/Boolean;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getSerialInstance()Ljava/util/concurrent/Executor;

    move-result-object v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0$1;

    invoke-direct {v4, p0}, Lcom/lumiyaviewer/lumiya/-$Lambda$3DowF6pLKgVjVrTY9aZKQ2J3cf0$1;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->unreadNotifySubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCurrentLocationInfo()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    sget-object v3, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->setInstallOfferDisplayed(Z)V

    iget-boolean v1, p1, Lcom/lumiyaviewer/lumiya/slproto/events/SLLoginResultEvent;->success:Z

    if-nez v1, :cond_1

    const-string/jumbo v0, "GridConnectionService: stopping self because of connect failed."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopCloudSync()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopSelf()V

    :goto_0
    return-void

    :cond_1
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->startCloudSync(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    goto :goto_0
.end method

.method public handleConnectionStateChangedEvent(Lcom/lumiyaviewer/lumiya/slproto/events/SLConnectionStateChangedEvent;)V
    .locals 0
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    return-void
.end method

.method public handleDisconnectEvent(Lcom/lumiyaviewer/lumiya/slproto/events/SLDisconnectEvent;)V
    .locals 1
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    const-string/jumbo v0, "GridConnectionService: stopping self because of disconnect."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopCloudSync()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopVoice()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopSelf()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->currentLocationInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->setInstallOfferDisplayed(Z)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_GridConnectionService_20777(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->mBinder:Landroid/os/IBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->serviceInstance:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->prefs:Landroid/content/SharedPreferences;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->prefs:Landroid/content/SharedPreferences;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->readPreferences(Landroid/content/SharedPreferences;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    return-void
.end method

.method public onDestroy()V
    .locals 7

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->prefs:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->prefs:Landroid/content/SharedPreferences;

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    sget-boolean v1, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotify:Z

    sget-object v3, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridName:Ljava/lang/String;

    sget-object v4, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectedAgentNameRetriever:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;-><init>(ZLandroid/content/Context;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->onlineNotificationInfo:Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopForeground(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->shownNotificationIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->unsubscribe(Ljava/lang/Object;)V

    :cond_1
    sput-object v6, Lcom/lumiyaviewer/lumiya/GridConnectionService;->serviceInstance:Ljava/lang/ref/WeakReference;

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onGlobalPreferencesChanged(Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;)V
    .locals 1
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/GlobalOptions$GlobalOptionsChangedEvent;->preferences:Landroid/content/SharedPreferences;

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->readPreferences(Landroid/content/SharedPreferences;)V

    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->readPreferences(Landroid/content/SharedPreferences;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->updateOnlineNotification()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6

    const/4 v1, 0x0

    const/4 v5, 0x2

    const/4 v4, 0x0

    const-string/jumbo v2, "onStartCommand: intent is %s, flags %08x"

    new-array v3, v5, [Ljava/lang/Object;

    if-eqz p1, :cond_1

    const-string/jumbo v0, "not null"

    :goto_0
    aput-object v0, v3, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_0

    move-object p1, v1

    :cond_0
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->handleStartService(Landroid/content/Intent;)V

    return v5

    :cond_1
    const-string/jumbo v0, "null"

    goto :goto_0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "GridConnectionService: onUnbind called, connection state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->gridConnection:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    if-ne v0, v1, :cond_0

    const-string/jumbo v0, "GridConnectionService: Stopping self because unbind and no clients are bound"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopCloudSync()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->stopSelf()V

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public startVoice(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/GridConnectionService;->connectToVoicePlugin(Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceLoginInfo;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-void
.end method

.method public stopVoice()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->disconnect()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    :cond_0
    return-void
.end method

.method public terminateVoiceCall(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/GridConnectionService;->voicePluginServiceConnection:Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/voiceintf/VoicePluginServiceConnection;->terminateVoiceCall(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    :cond_0
    return-void
.end method
