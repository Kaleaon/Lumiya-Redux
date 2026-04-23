.class final Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;


# instance fields
.field private final defaultPayPrice:I

.field private final payPrices:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILcom/google/common/collect/ImmutableList;)V
    .locals 0
    .param p2    # Lcom/google/common/collect/ImmutableList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->defaultPayPrice:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->payPrices:Lcom/google/common/collect/ImmutableList;

    return-void
.end method


# virtual methods
.method public defaultPayPrice()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->defaultPayPrice:I

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    if-eqz v2, :cond_4

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->defaultPayPrice:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->defaultPayPrice()I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->payPrices:Lcom/google/common/collect/ImmutableList;

    if-nez v2, :cond_2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->payPrices()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    if-nez v2, :cond_1

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->payPrices:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;->payPrices()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    return v1
.end method

.method public hashCode()I
    .locals 2

    const v1, 0xf4243

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->defaultPayPrice:I

    xor-int/2addr v0, v1

    mul-int/2addr v1, v0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->payPrices:Lcom/google/common/collect/ImmutableList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    xor-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->payPrices:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public payPrices()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->payPrices:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "PayInfo{defaultPayPrice="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->defaultPayPrice:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "payPrices="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;->payPrices:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
