.class final Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;
.super Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;


# instance fields
.field private final backgroundColor:I

.field private final text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;-><init>()V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null text"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->text:Ljava/lang/String;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->backgroundColor:I

    return-void
.end method


# virtual methods
.method public backgroundColor()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->backgroundColor:I

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v2, p1, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;

    if-eqz v2, :cond_3

    check-cast p1, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->text:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->text()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->backgroundColor:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;->backgroundColor()I

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
    .locals 2

    const v1, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    xor-int/2addr v0, v1

    mul-int/2addr v0, v1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->backgroundColor:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public text()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->text:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "DrawableTextParams{text="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "backgroundColor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;->backgroundColor:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
