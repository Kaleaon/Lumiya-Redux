.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;,
        Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/UUID;ILjava/util/List;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;
    .locals 9
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            "I",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;",
            ")",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo;

    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    :goto_0
    invoke-static {p3}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v4

    invoke-static {p5}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v6

    invoke-static {p6}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v7

    move-object v1, p0

    move v2, p1

    move v5, p4

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo;-><init>(Ljava/util/UUID;ILcom/google/common/collect/ImmutableList;Lcom/google/common/base/Optional;ILcom/google/common/base/Optional;Lcom/google/common/base/Optional;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;)V

    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    goto :goto_0
.end method


# virtual methods
.method public abstract agentUUID()Ljava/util/UUID;
.end method

.method public abstract freshMessagesCount()I
.end method

.method public abstract mostImportantFreshType()Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract mostImportantType()Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract singleFreshSource()Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract totalUnreadCount()I
.end method

.method public abstract unreadSources()Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method
