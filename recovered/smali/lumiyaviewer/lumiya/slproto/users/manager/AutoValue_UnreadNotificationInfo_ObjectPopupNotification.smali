.class final Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;


# instance fields
.field private final freshObjectPopupsCount:I

.field private final lastObjectPopup:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;",
            ">;"
        }
    .end annotation
.end field

.field private final objectPopupsCount:I


# direct methods
.method constructor <init>(IILcom/google/common/base/Optional;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/google/common/base/Optional",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->freshObjectPopupsCount:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->objectPopupsCount:I

    if-nez p3, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null lastObjectPopup"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->lastObjectPopup:Lcom/google/common/base/Optional;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    if-eqz v1, :cond_2

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->freshObjectPopupsCount:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->freshObjectPopupsCount()I

    move-result v2

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->objectPopupsCount:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->objectPopupsCount()I

    move-result v2

    if-ne v1, v2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->lastObjectPopup:Lcom/google/common/base/Optional;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupNotification;->lastObjectPopup()Lcom/google/common/base/Optional;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/Optional;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_1
    return v0

    :cond_2
    return v0
.end method

.method public freshObjectPopupsCount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->freshObjectPopupsCount:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    const v2, 0xf4243

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->freshObjectPopupsCount:I

    xor-int/2addr v0, v2

    mul-int/2addr v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->objectPopupsCount:I

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->lastObjectPopup:Lcom/google/common/base/Optional;

    invoke-virtual {v1}, Lcom/google/common/base/Optional;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public lastObjectPopup()Lcom/google/common/base/Optional;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadNotificationInfo$ObjectPopupMessage;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->lastObjectPopup:Lcom/google/common/base/Optional;

    return-object v0
.end method

.method public objectPopupsCount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->objectPopupsCount:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ObjectPopupNotification{freshObjectPopupsCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->freshObjectPopupsCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "objectPopupsCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->objectPopupsCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "lastObjectPopup="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadNotificationInfo_ObjectPopupNotification;->lastObjectPopup:Lcom/google/common/base/Optional;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
