.class Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;
.super Landroid/text/style/ReplacementSpan;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$InventoryEntrySpan;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AttachmentSpan"
.end annotation


# instance fields
.field private entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field private linkText:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V
    .locals 1

    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->getReadableTextForLink()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;->linkText:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 8

    if-eq p3, p4, :cond_0

    new-instance v7, Landroid/graphics/Paint;

    move-object/from16 v0, p9

    invoke-direct {v7, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    const/4 v1, 0x1

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    const/4 v1, 0x0

    const/16 v2, 0x32

    const/16 v3, 0x64

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;->linkText:Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;->linkText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    int-to-float v6, p7

    const/4 v3, 0x0

    move-object v1, p1

    move v5, p5

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method public getEntry()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;->entry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    return-object v0
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 3

    const/4 v2, 0x0

    if-eqz p5, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    iget v1, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iget v1, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v1, v0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v1, v0, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->leading:I

    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iput v0, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    :cond_0
    if-eq p3, p4, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;->linkText:Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLNotecard$AttachmentSpan;->linkText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v2, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v0

    float-to-int v0, v0

    return v0

    :cond_1
    return v2
.end method
