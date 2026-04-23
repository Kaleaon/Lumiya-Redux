.class public Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;
.super Ljava/lang/Object;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues:[I


# instance fields
.field private final contentText:Ljava/lang/String;

.field private final hasProgress:Z

.field private final titleText:Ljava/lang/String;

.field private final visible:Z


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->-com-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->-com-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->values()[Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->-com-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues:[I

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

.method public constructor <init>(ZLandroid/content/Context;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;)V
    .locals 6
    .param p6    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    if-nez p4, :cond_1

    :cond_0
    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->visible:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->titleText:Ljava/lang/String;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->contentText:Ljava/lang/String;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->hasProgress:Z

    :goto_0
    return-void

    :cond_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->-getcom-lumiyaviewer-lumiya-slproto-SLGridConnection$ConnectionStateSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p4}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getConnectionState()Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->visible:Z

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->titleText:Ljava/lang/String;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->contentText:Ljava/lang/String;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->hasProgress:Z

    goto :goto_0

    :pswitch_0
    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->visible:Z

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->titleText:Ljava/lang/String;

    invoke-virtual {p4}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;->getIsReconnecting()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090138

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/Object;

    aput-object p3, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->contentText:Ljava/lang/String;

    :goto_1
    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->hasProgress:Z

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090137

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/Object;

    aput-object p3, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->contentText:Ljava/lang/String;

    goto :goto_1

    :pswitch_1
    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->visible:Z

    invoke-virtual {p5}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterNameRetriever;->getResolvedName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->titleText:Ljava/lang/String;

    if-eqz p6, :cond_5

    invoke-virtual {p6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->parcelData()Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ParcelData;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_3
    if-eqz v0, :cond_5

    const-string/jumbo v2, "(loading)"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {p6}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->nearbyUsers()I

    move-result v1

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090136

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_4
    if-nez v0, :cond_3

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090135

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/Object;

    aput-object p3, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :cond_3
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->contentText:Ljava/lang/String;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->hasProgress:Z

    goto/16 :goto_0

    :cond_4
    move-object v0, v1

    goto :goto_3

    :cond_5
    move-object v0, v1

    goto :goto_4

    :cond_6
    move-object v0, p3

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    if-eqz v1, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->titleText:Ljava/lang/String;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->titleText:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->contentText:Ljava/lang/String;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->contentText:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->visible:Z

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->visible:Z

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->hasProgress:Z

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->hasProgress:Z

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    return v0
.end method

.method public getNotification(Landroid/content/Context;)Landroid/app/Notification;
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->visible:Z

    if-eqz v0, :cond_1

    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->OnlineStatus:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const v1, 0x7f02007b

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->titleText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->contentText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/lumiyaviewer/lumiya/ui/login/LoginActivity;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x8000000

    invoke-static {p1, v4, v2, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OnlineNotificationInfo;->hasProgress:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0, v4, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
