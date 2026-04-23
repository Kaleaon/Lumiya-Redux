.class public Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;,
        Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$InstanceHolder;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues:[I = null

.field public static final MESSAGE_NOTIFICATION_GROUP:Ljava/lang/String; = "messageNotifications"


# instance fields
.field private final channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->-com-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->-com-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues:[I

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
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->-com-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues:[I

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

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/notify/DummyNotificationChannelManager;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/notify/DummyNotificationChannelManager;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;

    :goto_0
    return-void

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/notify/OreoNotificationChannelManager;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public areNotificationsSystemControlled()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;->areNotificationsSystemControlled()Z

    move-result v0

    return v0
.end method

.method public getChannelByType(Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;)Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->-getcom-lumiyaviewer-lumiya-ui-settings-NotificationTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return-object v0

    :pswitch_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->Local:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    return-object v0

    :pswitch_1
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->IM:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    return-object v0

    :pswitch_2
    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;->Group:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;->getNotificationChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEnabledTypes(Landroid/content/Context;)Lcom/google/common/collect/ImmutableSet;
    .locals 1
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;->getEnabledTypes(Landroid/content/Context;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public getNotificationSummary(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;
    .locals 1
    .param p2    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;

    invoke-interface {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;->getNotificationSummary(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public showSystemNotificationSettings(Landroid/content/Context;Landroid/support/v4/app/Fragment;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Z
    .locals 1
    .param p2    # Landroid/support/v4/app/Fragment;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;

    invoke-interface {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;->showSystemNotificationSettings(Landroid/content/Context;Landroid/support/v4/app/Fragment;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Z

    move-result v0

    return v0
.end method

.method public useNotificationGroups()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels;->channelManager:Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;->useNotificationGroups()Z

    move-result v0

    return v0
.end method
