.class public Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-cloud-common-LogSyncStatus$StatusSwitchesValues:[I = null

.field private static final REQUIRED_PLUGIN_VERSION:I = 0x1


# instance fields
.field private final context:Landroid/content/Context;

.field private final fromPluginHandler:Landroid/os/Handler;

.field private final fromPluginMessenger:Landroid/os/Messenger;

.field private final mainThreadHandler:Landroid/os/Handler;

.field private final syncingStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private toPluginMessenger:Landroid/os/Messenger;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-cloud-common-LogSyncStatus$StatusSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->-com-lumiyaviewer-lumiya-cloud-common-LogSyncStatus$StatusSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->-com-lumiyaviewer-lumiya-cloud-common-LogSyncStatus$StatusSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->values()[Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->AppVersionRejected:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->GoogleDriveError:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->Ready:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->-com-lumiyaviewer-lumiya-cloud-common-LogSyncStatus$StatusSwitchesValues:[I

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

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->onLogMessagesCompleted(Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->onLogMessagesFlushed(Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->onLogSyncStatus(Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->mainThreadHandler:Landroid/os/Handler;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->syncingStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection$1;-><init>(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->fromPluginHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    new-instance v0, Landroid/os/Messenger;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->fromPluginHandler:Landroid/os/Handler;

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->fromPluginMessenger:Landroid/os/Messenger;

    return-void
.end method

.method public static checkPluginInstalled(Landroid/content/Context;)Z
    .locals 5

    const/4 v0, 0x0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    new-instance v2, Landroid/content/ComponentName;

    const-string/jumbo v3, "com.lumiyaviewer.lumiya.cloud"

    const-string/jumbo v4, "com.lumiyaviewer.lumiya.cloud.DriveSyncService"

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

.method private onLogMessagesCompleted(Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;)V
    .locals 4

    const-string/jumbo v0, "LumiyaCloud: written messages until %d for agent %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->lastWrittenMessageID:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->agentUUID:Ljava/util/UUID;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSyncManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    move-result-object v0

    iget-wide v2, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->lastWrittenMessageID:J

    invoke-virtual {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->onMessagesWritten(J)V

    :cond_0
    return-void
.end method

.method private onLogMessagesFlushed(Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;)V
    .locals 4

    const-string/jumbo v0, "LumiyaCloud: flushed some messages for agent %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->agentUUID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSyncManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->messageIDs:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->onMessagesFlushed(Lcom/google/common/collect/ImmutableList;)V

    :cond_0
    return-void
.end method

.method private onLogSyncStatus(Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;)V
    .locals 6

    const/4 v5, 0x0

    const/4 v3, 0x1

    const-string/jumbo v0, "LumiyaCloud: got logSyncStatus %s, plugin version %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->status:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    aput-object v2, v1, v5

    iget v2, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->pluginVersionCode:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->toPluginMessenger:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->-getcom-lumiyaviewer-lumiya-cloud-common-LogSyncStatus$StatusSwitchesValues()[I

    move-result-object v0

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->status:Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget v0, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->pluginVersionCode:I

    if-lt v0, v3, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->syncingStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSyncManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->startSyncing(Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;)V

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya.cloud"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    const v2, 0x7f0900c8

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    const v3, 0x7f0900c9

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->showSyncingError(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_1
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "https://play.google.com/store/apps/details?id=com.lumiyaviewer.lumiya"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    const v2, 0x7f0900c1

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    const v3, 0x7f0900c2

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->showSyncingError(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_2
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v0, "android.intent.action.VIEW"

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v0, "https://drive.google.com/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    const v2, 0x7f0900c3

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->errorMessage:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    const v3, 0x7f0900c4

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {p0, v2, v0, v1}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->showSyncingError(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    goto/16 :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStatus;->errorMessage:Ljava/lang/String;

    aput-object v4, v3, v5

    const v4, 0x7f0900c5

    invoke-virtual {v0, v4, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public disconnect()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->mainThreadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/sync/-$Lambda$WmOOQW2pFqpMpXOyAP45N3kh7mE;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/sync/-$Lambda$WmOOQW2pFqpMpXOyAP45N3kh7mE;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_sync_CloudSyncServiceConnection_8286()V
    .locals 2

    const-string/jumbo v0, "LumiyaCloud: disconnecting from sync service"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4

    const/4 v1, 0x0

    const-string/jumbo v0, "LumiyaCloud: service connected"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Landroid/os/Messenger;

    invoke-direct {v0, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->toPluginMessenger:Landroid/os/Messenger;

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;->LogSyncStart:Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/cloud/common/LogSyncStart;-><init>(ILjava/util/UUID;)V

    invoke-virtual {p0, v1, v2}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->sendMessage(Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;)Z
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
    .locals 2

    const-string/jumbo v0, "LumiyaCloud: service disconnected"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public sendMessage(Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;)Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->toPluginMessenger:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->toPluginMessenger:Landroid/os/Messenger;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->fromPluginMessenger:Landroid/os/Messenger;

    invoke-static {v0, p1, p2, v1}, Lcom/lumiyaviewer/lumiya/cloud/common/CloudSyncMessenger;->sendMessage(Landroid/os/Messenger;Lcom/lumiyaviewer/lumiya/cloud/common/MessageType;Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;Landroid/os/Messenger;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public showSyncingError(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    invoke-direct {v1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    const v0, 0x7f020070

    invoke-virtual {v1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    const/high16 v3, 0x8000000

    invoke-static {v2, v4, p3, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->context:Landroid/content/Context;

    const-string/jumbo v2, "notification"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {v1}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v1

    const v2, 0x7f10000a

    invoke-virtual {v0, v2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method public stopSyncing()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->syncingStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->toPluginMessenger:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getSyncManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/SyncManager;->stopSyncing()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/sync/CloudSyncServiceConnection;->disconnect()V

    goto :goto_0
.end method
