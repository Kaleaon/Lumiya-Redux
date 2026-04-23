.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/UUID;Lcom/google/common/collect/ImmutableMap;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;
    .locals 1
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # Lcom/google/common/collect/ImmutableMap;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotifications;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotifications;-><init>(Ljava/util/UUID;Lcom/google/common/collect/ImmutableMap;)V

    return-object v0
.end method


# virtual methods
.method public abstract agentUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public filter(Lcom/google/common/collect/ImmutableSet;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;
    .locals 4
    .param p1    # Lcom/google/common/collect/ImmutableSet;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->notificationGroups()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/common/collect/ImmutableSet;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->notificationGroups()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/google/common/collect/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableMap$Builder;

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->agentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->create(Ljava/util/UUID;Lcom/google/common/collect/ImmutableMap;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;

    move-result-object v0

    return-object v0
.end method

.method public merge()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;
    .locals 13

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->notificationGroups()Lcom/google/common/collect/ImmutableMap;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/common/collect/ImmutableMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->agentUUID()Ljava/util/UUID;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->create(IILcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v7

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->create(Ljava/util/UUID;ILjava/util/List;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-virtual {v10}, Lcom/google/common/collect/ImmutableMap;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {v10}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/UnmodifiableIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    return-object v0

    :cond_1
    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v1, 0x0

    const/4 v0, 0x0

    sget-object v8, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->VALUES_BY_DESCENDING_PRIORITY:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    move-object v8, v7

    move-object v7, v1

    move v1, v2

    move v2, v0

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    invoke-virtual {v10, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->totalUnreadCount()I

    move-result v9

    add-int/2addr v9, v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->unreadSources()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    if-nez v7, :cond_2

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v7

    :cond_2
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->unreadSources()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-virtual {v7, v1}, Lcom/google/common/collect/ImmutableList$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList$Builder;

    :cond_3
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->mostImportantType()Lcom/google/common/base/Optional;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    if-eqz v1, :cond_5

    if-eqz v3, :cond_4

    invoke-virtual {v1, v3}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->compareTo(Ljava/lang/Enum;)I

    move-result v12

    if-lez v12, :cond_5

    :cond_4
    move-object v3, v1

    :cond_5
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->mostImportantFreshType()Lcom/google/common/base/Optional;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;

    if-eqz v1, :cond_7

    if-eqz v5, :cond_6

    invoke-virtual {v1, v5}, Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;->compareTo(Ljava/lang/Enum;)I

    move-result v12

    if-lez v12, :cond_7

    :cond_6
    move-object v5, v1

    :cond_7
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->freshMessagesCount()I

    move-result v1

    add-int/2addr v4, v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->singleFreshSource()Lcom/google/common/base/Optional;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    if-eqz v1, :cond_d

    if-nez v6, :cond_8

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_8

    :goto_1
    const/4 v2, 0x1

    :goto_2
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->objectPopupInfo()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_c

    move-object v6, v1

    move-object v1, v7

    move-object v7, v0

    move v0, v2

    move v2, v9

    :goto_3
    move-object v8, v7

    move-object v7, v1

    move v1, v2

    move v2, v0

    goto/16 :goto_0

    :cond_8
    const/4 v1, 0x0

    goto :goto_1

    :cond_9
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotifications;->agentUUID()Ljava/util/UUID;

    move-result-object v0

    if-eqz v7, :cond_a

    invoke-virtual {v7}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    :goto_4
    if-eqz v8, :cond_b

    move-object v7, v8

    :goto_5
    invoke-static/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;->create(Ljava/util/UUID;ILjava/util/List;Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;ILcom/lumiyaviewer/lumiya/ui/settings/NotificationType;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;

    move-result-object v0

    return-object v0

    :cond_a
    const/4 v2, 0x0

    goto :goto_4

    :cond_b
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->create(IILcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    move-result-object v7

    goto :goto_5

    :cond_c
    move v0, v2

    move-object v6, v1

    move v2, v9

    move-object v1, v7

    move-object v7, v8

    goto :goto_3

    :cond_d
    move-object v1, v6

    goto :goto_2

    :cond_e
    move v0, v2

    move v2, v1

    move-object v1, v7

    move-object v7, v8

    goto :goto_3
.end method

.method public abstract notificationGroups()Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/settings/NotificationType;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method
