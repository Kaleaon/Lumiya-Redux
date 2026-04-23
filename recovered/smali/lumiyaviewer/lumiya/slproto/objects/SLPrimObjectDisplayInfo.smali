.class public Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;


# instance fields
.field public final localID:I

.field public final payable:Z

.field public final touchable:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;F)V
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget v4, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    invoke-direct {p0, v3, v0, p2, v4}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;-><init>(ILjava/lang/String;FI)V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;->localID:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;->touchable:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isPayable()Z

    move-result v0

    if-nez v0, :cond_0

    iget-byte v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->saleType:B

    if-eqz v0, :cond_2

    :cond_0
    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;->payable:Z

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1
.end method
