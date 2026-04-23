.class final Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;


# instance fields
.field private final filterText:Ljava/lang/String;

.field private final range:F

.field private final showAttachments:Z

.field private final showNonDescriptive:Z

.field private final showNonTouchable:Z


# direct methods
.method constructor <init>(Ljava/lang/String;ZZZF)V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;-><init>()V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null filterText"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->filterText:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showAttachments:Z

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonDescriptive:Z

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonTouchable:Z

    iput p5, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->range:F

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
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    if-eqz v2, :cond_3

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->filterText:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->filterText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showAttachments:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->showAttachments()Z

    move-result v3

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonDescriptive:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->showNonDescriptive()Z

    move-result v3

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonTouchable:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->showNonTouchable()Z

    move-result v3

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->range:F

    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->range()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

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

.method public filterText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->filterText:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    const/16 v2, 0x4d5

    const/16 v1, 0x4cf

    const v4, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->filterText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    xor-int/2addr v0, v4

    mul-int v3, v0, v4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showAttachments:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    xor-int/2addr v0, v3

    mul-int v3, v0, v4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonDescriptive:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    xor-int/2addr v0, v3

    mul-int/2addr v0, v4

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonTouchable:Z

    if-eqz v3, :cond_2

    :goto_2
    xor-int/2addr v0, v1

    mul-int/2addr v0, v4

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->range:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

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

.method public range()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->range:F

    return v0
.end method

.method public showAttachments()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showAttachments:Z

    return v0
.end method

.method public showNonDescriptive()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonDescriptive:Z

    return v0
.end method

.method public showNonTouchable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonTouchable:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SLObjectFilterInfo{filterText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->filterText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "showAttachments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showAttachments:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "showNonDescriptive="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonDescriptive:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "showNonTouchable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->showNonTouchable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "range="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;->range:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
