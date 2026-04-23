.class final Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;


# instance fields
.field private final chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

.field private final chatterName:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final unreadMessages:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
            ">;"
        }
    .end annotation
.end field

.field private final unreadMessagesCount:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/google/common/base/Optional;Lcom/google/common/collect/ImmutableList;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;",
            ">;I)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;-><init>()V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null chatterID"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null chatterName"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterName:Lcom/google/common/base/Optional;

    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null unreadMessages"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessages:Lcom/google/common/collect/ImmutableList;

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessagesCount:I

    return-void
.end method


# virtual methods
.method public chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    return-object v0
.end method

.method public chatterName()Lcom/google/common/base/Optional;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterName:Lcom/google/common/base/Optional;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    if-eqz v2, :cond_3

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterID()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterName:Lcom/google/common/base/Optional;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->chatterName()Lcom/google/common/base/Optional;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/common/base/Optional;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessages:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessages()Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/common/collect/ImmutableList;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessagesCount:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$UnreadMessageSource;->unreadMessagesCount()I

    move-result v3

    if-ne v2, v3, :cond_1

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public hashCode()I
    .locals 3

    const v2, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->hashCode()I

    move-result v0

    xor-int/2addr v0, v2

    mul-int/2addr v0, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterName:Lcom/google/common/base/Optional;

    invoke-virtual {v1}, Lcom/google/common/base/Optional;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessages:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessagesCount:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "UnreadMessageSource{chatterID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "chatterName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->chatterName:Lcom/google/common/base/Optional;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "unreadMessages="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessages:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "unreadMessagesCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessagesCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unreadMessages()Lcom/google/common/collect/ImmutableList;
    .locals 1
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessages:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public unreadMessagesCount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_UnreadMessageSource;->unreadMessagesCount:I

    return v0
.end method
