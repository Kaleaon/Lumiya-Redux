.class final Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;
.super Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;


# instance fields
.field private final description:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final floatingText:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final isCopyable:Z

.field private final isDead:Z

.field private final isModifiable:Z

.field private final isPayable:Z

.field private final isTouchable:Z

.field private final name:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final objectUUID:Ljava/util/UUID;

.field private final ownerUUID:Ljava/util/UUID;

.field private final payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

.field private final salePrice:I

.field private final saleType:B

.field private final touchName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/util/UUID;Lcom/google/common/base/Optional;Lcom/google/common/base/Optional;Ljava/util/UUID;ZLjava/lang/String;ZBIZZLcom/google/common/base/Optional;Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;Z)V
    .locals 3
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/UUID;",
            "Z",
            "Ljava/lang/String;",
            "ZBIZZ",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;",
            "Z)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->objectUUID:Ljava/util/UUID;

    if-nez p2, :cond_0

    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Null name"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->name:Lcom/google/common/base/Optional;

    if-nez p3, :cond_1

    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Null description"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->description:Lcom/google/common/base/Optional;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->ownerUUID:Ljava/util/UUID;

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isTouchable:Z

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->touchName:Ljava/lang/String;

    iput-boolean p7, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isPayable:Z

    iput-byte p8, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->saleType:B

    iput p9, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->salePrice:I

    iput-boolean p10, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isCopyable:Z

    iput-boolean p11, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isDead:Z

    if-nez p12, :cond_2

    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Null floatingText"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    iput-object p12, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->floatingText:Lcom/google/common/base/Optional;

    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move/from16 v0, p14

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isModifiable:Z

    return-void
.end method


# virtual methods
.method public description()Lcom/google/common/base/Optional;
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->description:Lcom/google/common/base/Optional;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v2, :cond_8

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->objectUUID:Ljava/util/UUID;

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_3

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->name:Lcom/google/common/base/Optional;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/common/base/Optional;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->description:Lcom/google/common/base/Optional;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->description()Lcom/google/common/base/Optional;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/common/base/Optional;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->ownerUUID:Ljava/util/UUID;

    if-nez v2, :cond_4

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v2

    if-nez v2, :cond_3

    :goto_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isTouchable:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isTouchable()Z

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->touchName:Ljava/lang/String;

    if-nez v2, :cond_5

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->touchName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    :goto_1
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isPayable:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isPayable()Z

    move-result v3

    if-ne v2, v3, :cond_3

    iget-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->saleType:B

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->saleType()B

    move-result v3

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->salePrice:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->salePrice()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isCopyable:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isCopyable()Z

    move-result v3

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isDead:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isDead()Z

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->floatingText:Lcom/google/common/base/Optional;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->floatingText()Lcom/google/common/base/Optional;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/common/base/Optional;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    if-nez v2, :cond_6

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v2

    if-nez v2, :cond_3

    :goto_2
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isModifiable:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isModifiable()Z

    move-result v3

    if-ne v2, v3, :cond_7

    :goto_3
    return v0

    :cond_2
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->objectUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->objectUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_3
    move v0, v1

    goto :goto_3

    :cond_4
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->touchName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->touchName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_6
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    :cond_7
    move v0, v1

    goto :goto_3

    :cond_8
    return v1
.end method

.method public floatingText()Lcom/google/common/base/Optional;
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->floatingText:Lcom/google/common/base/Optional;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    const/4 v1, 0x0

    const/16 v3, 0x4d5

    const/16 v2, 0x4cf

    const v5, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->objectUUID:Ljava/util/UUID;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    xor-int/2addr v0, v5

    mul-int/2addr v0, v5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->name:Lcom/google/common/base/Optional;

    invoke-virtual {v4}, Lcom/google/common/base/Optional;->hashCode()I

    move-result v4

    xor-int/2addr v0, v4

    mul-int/2addr v0, v5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->description:Lcom/google/common/base/Optional;

    invoke-virtual {v4}, Lcom/google/common/base/Optional;->hashCode()I

    move-result v4

    xor-int/2addr v0, v4

    mul-int v4, v0, v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->ownerUUID:Ljava/util/UUID;

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    xor-int/2addr v0, v4

    mul-int v4, v0, v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isTouchable:Z

    if-eqz v0, :cond_2

    move v0, v2

    :goto_2
    xor-int/2addr v0, v4

    mul-int v4, v0, v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->touchName:Ljava/lang/String;

    if-nez v0, :cond_3

    move v0, v1

    :goto_3
    xor-int/2addr v0, v4

    mul-int v4, v0, v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isPayable:Z

    if-eqz v0, :cond_4

    move v0, v2

    :goto_4
    xor-int/2addr v0, v4

    mul-int/2addr v0, v5

    iget-byte v4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->saleType:B

    xor-int/2addr v0, v4

    mul-int/2addr v0, v5

    iget v4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->salePrice:I

    xor-int/2addr v0, v4

    mul-int v4, v0, v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isCopyable:Z

    if-eqz v0, :cond_5

    move v0, v2

    :goto_5
    xor-int/2addr v0, v4

    mul-int v4, v0, v5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isDead:Z

    if-eqz v0, :cond_6

    move v0, v2

    :goto_6
    xor-int/2addr v0, v4

    mul-int/2addr v0, v5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->floatingText:Lcom/google/common/base/Optional;

    invoke-virtual {v4}, Lcom/google/common/base/Optional;->hashCode()I

    move-result v4

    xor-int/2addr v0, v4

    mul-int/2addr v0, v5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    if-nez v4, :cond_7

    :goto_7
    xor-int/2addr v0, v1

    mul-int/2addr v0, v5

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isModifiable:Z

    if-eqz v1, :cond_8

    :goto_8
    xor-int/2addr v0, v2

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->objectUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    goto :goto_1

    :cond_2
    move v0, v3

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->touchName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_3

    :cond_4
    move v0, v3

    goto :goto_4

    :cond_5
    move v0, v3

    goto :goto_5

    :cond_6
    move v0, v3

    goto :goto_6

    :cond_7
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->hashCode()I

    move-result v1

    goto :goto_7

    :cond_8
    move v2, v3

    goto :goto_8
.end method

.method public isCopyable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isCopyable:Z

    return v0
.end method

.method public isDead()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isDead:Z

    return v0
.end method

.method public isModifiable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isModifiable:Z

    return v0
.end method

.method public isPayable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isPayable:Z

    return v0
.end method

.method public isTouchable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isTouchable:Z

    return v0
.end method

.method public name()Lcom/google/common/base/Optional;
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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->name:Lcom/google/common/base/Optional;

    return-object v0
.end method

.method public objectUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->objectUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public ownerUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->ownerUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public payInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    return-object v0
.end method

.method public salePrice()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->salePrice:I

    return v0
.end method

.method public saleType()B
    .locals 1

    iget-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->saleType:B

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SLObjectProfileData{objectUUID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->objectUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->name:Lcom/google/common/base/Optional;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "description="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->description:Lcom/google/common/base/Optional;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "ownerUUID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "isTouchable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isTouchable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "touchName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->touchName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "isPayable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isPayable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "saleType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-byte v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->saleType:B

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "salePrice="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->salePrice:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "isCopyable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isCopyable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "isDead="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isDead:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "floatingText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->floatingText:Lcom/google/common/base/Optional;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "payInfo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "isModifiable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->isModifiable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public touchName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectProfileData;->touchName:Ljava/lang/String;

    return-object v0
.end method
