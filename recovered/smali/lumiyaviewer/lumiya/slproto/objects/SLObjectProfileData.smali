.class public abstract Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;
    .locals 15
    .param p0    # Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getHoverText()Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;->text()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v12, v0

    :goto_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v1

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v2

    :goto_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getOwnerUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z

    move-result v5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getTouchName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isPayable()Z

    move-result v7

    iget-byte v8, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->saleType:B

    iget v9, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->salePrice:I

    iget v10, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->UpdateFlags:I

    and-int/lit8 v10, v10, 0x8

    if-eqz v10, :cond_2

    const/4 v10, 0x1

    :goto_2
    iget-boolean v11, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    invoke-static {v12}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v12

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getPayInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v13

    iget v14, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->UpdateFlags:I

    and-int/lit8 v14, v14, 0x4

    if-eqz v14, :cond_3

    const/4 v14, 0x1

    :goto_3
    invoke-direct/range {v0 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;-><init>(Ljava/util/UUID;Lcom/google/common/base/Optional;Lcom/google/common/base/Optional;Ljava/util/UUID;ZLjava/lang/String;ZBIZZLcom/google/common/base/Optional;Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;Z)V

    return-object v0

    :cond_0
    const/4 v0, 0x0

    move-object v12, v0

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v2

    goto :goto_1

    :cond_2
    const/4 v10, 0x0

    goto :goto_2

    :cond_3
    const/4 v14, 0x0

    goto :goto_3
.end method


# virtual methods
.method public abstract description()Lcom/google/common/base/Optional;
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

.method public abstract floatingText()Lcom/google/common/base/Optional;
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

.method public abstract isCopyable()Z
.end method

.method public abstract isDead()Z
.end method

.method public abstract isModifiable()Z
.end method

.method public abstract isPayable()Z
.end method

.method public abstract isTouchable()Z
.end method

.method public abstract name()Lcom/google/common/base/Optional;
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

.method public abstract objectUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract ownerUUID()Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract salePrice()I
.end method

.method public abstract saleType()B
.end method

.method public abstract touchName()Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method
