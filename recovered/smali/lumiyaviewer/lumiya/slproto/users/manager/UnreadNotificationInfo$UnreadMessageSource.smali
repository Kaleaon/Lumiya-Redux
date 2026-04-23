.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "UnreadMessageSource"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;Ljava/util/List;I)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;
    .locals 3
    .param p0    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
            ">;I)",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;"
        }
    .end annotation

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;

    invoke-static {p1}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v2

    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    :goto_0
    invoke-direct {v1, p0, v2, v0, p3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/google/common/base/Optional;Lcom/google/common/collect/ImmutableList;I)V

    return-object v1

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public abstract chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract chatterName()Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract unreadMessages()Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public abstract unreadMessagesCount()I
.end method

.method public withMessages(Ljava/util/List;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;"
        }
    .end annotation

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v3

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessagesCount()I

    move-result v4

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/google/common/base/Optional;Lcom/google/common/collect/ImmutableList;I)V

    return-object v1

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    goto :goto_0
.end method
