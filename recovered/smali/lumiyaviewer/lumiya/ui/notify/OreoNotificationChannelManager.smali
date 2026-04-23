.class public Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    api = 0x1a
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;
    }
.end annotation


# instance fields
.field private final channelSettings:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;",
            "Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;",
            ">;"
        }
    .end annotation
.end field

.field private final channels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;",
            "Landroid/app/NotificationChannel;",
            ">;"
        }
    .end annotation
.end field

.field private final lock:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 12

    const/4 v7, 0x3

    const/4 v11, 0x1

    const/4 v10, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->lock:Ljava/lang/Object;

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->channels:Ljava/util/Map;

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->OnlineStatus:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v10, v10}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;-><init>(IZLcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->Local:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;

    sget-object v4, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->LocalChat:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v3, v7, v11, v4, v10}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;-><init>(IZLcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;)V

    sget-object v4, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->Group:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;

    sget-object v6, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Group:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-direct {v5, v7, v11, v6, v10}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;-><init>(IZLcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;)V

    sget-object v6, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->IM:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    new-instance v7, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;

    sget-object v8, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->Private:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    const/4 v9, 0x4

    invoke-direct {v7, v9, v11, v8, v10}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;-><init>(IZLcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;)V

    invoke-static/range {v0 .. v7}, Lcom/google/common/collect/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->channelSettings:Lcom/google/common/collect/ImmutableMap;

    return-void
.end method


# virtual methods
.method public areNotificationsSystemControlled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getEnabledTypes(Landroid/content/Context;)Lcom/google/common/collect/ImmutableSet;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v2

    const-string/jumbo v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->VALUES:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->getChannelByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->getNotificationChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-virtual {v5}, Landroid/app/NotificationChannel;->getImportance()I

    move-result v5

    if-lez v5, :cond_0

    invoke-virtual {v3, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    goto :goto_0

    :cond_1
    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public getNotificationChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;
    .locals 8
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->lock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->channels:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationChannel;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/NotificationChannel;->getId()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    :goto_0
    monitor-exit v3

    return-object v0

    :cond_0
    :try_start_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v0, "notification"

    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->channelSettings:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;

    new-instance v4, Landroid/app/NotificationChannel;

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->channelId:Ljava/lang/String;

    iget v6, p1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->nameStringId:I

    invoke-virtual {v2, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    iget v7, v1, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;->importance:I

    invoke-direct {v4, v5, v6, v7}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    iget v5, p1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->descriptionStringId:I

    invoke-virtual {v2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    if-eqz v2, :cond_1

    new-instance v5, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v5}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v2, 0x4

    invoke-virtual {v5, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    const/4 v2, 0x5

    invoke-virtual {v5, v2}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->defaultSounds:Lcom/google/common/collect/ImmutableMap;

    iget-object v6, v1, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;->notificationType:Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v2, v6}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/media/NotificationSounds;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v5}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Landroid/app/NotificationChannel;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)V

    :cond_1
    iget-boolean v1, v1, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager$NotificationChannelSettings;->showBadge:Z

    invoke-virtual {v4, v1}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    const-string/jumbo v1, "Notifications: Creating new notification channel with id \'%s\'"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->channelId:Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v2, v6

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v4}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->channels:Ljava/util/Map;

    invoke-interface {v0, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->channelId:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0
.end method

.method public getNotificationSummary(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;
    .locals 3
    .param p2    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    const-string/jumbo v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->getNotificationChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/NotificationChannel;->getImportance()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    const v0, 0x7f090201

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_1
    const v0, 0x7f090203

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_2
    const v0, 0x7f090204

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_3
    const v0, 0x7f090205

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_4
    const v0, 0x7f090202

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public showSystemNotificationSettings(Landroid/content/Context;Landroid/support/v4/app/Fragment;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Z
    .locals 3
    .param p2    # Landroid/support/v4/app/Fragment;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.settings.CHANNEL_NOTIFICATION_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "android.provider.extra.CHANNEL_ID"

    invoke-virtual {p0, p3}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;->getNotificationChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "android.provider.extra.APP_PACKAGE"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p2, :cond_0

    const/16 v1, 0xb

    invoke-virtual {p2, v0, v1}, Landroid/support/v4/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_0
    const/4 v0, 0x1

    return v0

    :cond_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public useNotificationGroups()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
