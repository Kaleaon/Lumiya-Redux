.class abstract Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;
.super Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "ChatterIDWithUUID"
.end annotation


# instance fields
.field protected final uuid:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;-><init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(JJ)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    if-eqz p2, :cond_0

    :goto_0
    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    return-void

    :cond_0
    sget-object p2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    goto :goto_0
.end method

.method synthetic constructor <init>(Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;-><init>(Ljava/util/UUID;Ljava/util/UUID;)V

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)I
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->compareTo(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->compareTo(Ljava/util/UUID;)I

    move-result v0

    return v0

    :cond_1
    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getChatterUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public getOptionalChatterUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->hashCode()I

    move-result v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    :goto_0
    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isValidUUID()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 3

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "chatterUUID"

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, "null"

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    const-wide/16 v2, 0x0

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDWithUUID;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    goto :goto_0
.end method
