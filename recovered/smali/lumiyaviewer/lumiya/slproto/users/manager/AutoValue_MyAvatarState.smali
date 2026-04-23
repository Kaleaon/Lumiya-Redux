.class final Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;
.super Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;


# instance fields
.field private final hasHUDs:Z

.field private final isFlying:Z

.field private final isSitting:Z

.field private final sittingOn:I


# direct methods
.method constructor <init>(ZIZZ)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isSitting:Z

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->sittingOn:I

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isFlying:Z

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->hasHUDs:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;

    if-eqz v2, :cond_3

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isSitting:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->isSitting()Z

    move-result v3

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->sittingOn:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->sittingOn()I

    move-result v3

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isFlying:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->isFlying()Z

    move-result v3

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->hasHUDs:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/MyAvatarState;->hasHUDs()Z

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

.method public hasHUDs()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->hasHUDs:Z

    return v0
.end method

.method public hashCode()I
    .locals 5

    const/16 v2, 0x4d5

    const/16 v1, 0x4cf

    const v4, 0xf4243

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isSitting:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    xor-int/2addr v0, v4

    mul-int/2addr v0, v4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->sittingOn:I

    xor-int/2addr v0, v3

    mul-int v3, v0, v4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isFlying:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    xor-int/2addr v0, v3

    mul-int/2addr v0, v4

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->hasHUDs:Z

    if-eqz v3, :cond_2

    :goto_2
    xor-int/2addr v0, v1

    return v0

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_1

    :cond_2
    move v1, v2

    goto :goto_2
.end method

.method public isFlying()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isFlying:Z

    return v0
.end method

.method public isSitting()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isSitting:Z

    return v0
.end method

.method public sittingOn()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->sittingOn:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "MyAvatarState{isSitting="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isSitting:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "sittingOn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->sittingOn:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "isFlying="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->isFlying:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "hasHUDs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_MyAvatarState;->hasHUDs:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
