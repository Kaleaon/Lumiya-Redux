.class public interface abstract Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannelManager;
.super Ljava/lang/Object;


# virtual methods
.method public abstract areNotificationsSystemControlled()Z
.end method

.method public abstract getEnabledTypes(Landroid/content/Context;)Lcom/google/common/collect/ImmutableSet;
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
.end method

.method public abstract getNotificationChannelName(Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;
    .param p1    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract getNotificationSummary(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Ljava/lang/String;
    .param p2    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract showSystemNotificationSettings(Landroid/content/Context;Landroid/support/v4/app/Fragment;Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;)Z
    .param p2    # Landroid/support/v4/app/Fragment;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/notify/NotificationChannels$Channel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
.end method

.method public abstract useNotificationGroups()Z
.end method
