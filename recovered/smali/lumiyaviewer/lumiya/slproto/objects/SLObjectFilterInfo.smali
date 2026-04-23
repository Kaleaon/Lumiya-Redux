.class public abstract Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;
    .locals 6

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;

    const-string/jumbo v1, ""

    const/4 v5, 0x0

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;-><init>(Ljava/lang/String;ZZZF)V

    return-object v0
.end method

.method public static create(Ljava/lang/String;ZZZF)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;
    .locals 6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_SLObjectFilterInfo;-><init>(Ljava/lang/String;ZZZF)V

    return-object v0
.end method


# virtual methods
.method public abstract filterText()Ljava/lang/String;
.end method

.method public nameMatches(Ljava/lang/String;)Z
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->filterText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    return v2

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->showNonDescriptive()Z

    move-result v0

    if-nez v0, :cond_3

    const-string/jumbo v0, "Object"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "(loading)"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_1
    return v2

    :cond_2
    return v2

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method public objectMatches(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;FZ)Z
    .locals 3

    const/4 v2, 0x0

    if-eqz p3, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->showAttachments()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    return v2

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->showNonTouchable()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z

    move-result v0

    if-nez v0, :cond_1

    return v2

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->range()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_2

    return v2

    :cond_2
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->range()F

    move-result v0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_3

    return v2

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method public abstract range()F
.end method

.method public abstract showAttachments()Z
.end method

.method public abstract showNonDescriptive()Z
.end method

.method public abstract showNonTouchable()Z
.end method
