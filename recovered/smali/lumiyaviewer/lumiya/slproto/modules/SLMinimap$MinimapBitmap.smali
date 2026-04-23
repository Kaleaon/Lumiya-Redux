.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MinimapBitmap"
.end annotation


# instance fields
.field private final bitmapHeight:I

.field private final bitmapWidth:I

.field final colors:[I


# direct methods
.method constructor <init>(II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapWidth:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapHeight:I

    mul-int v0, p1, p2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->colors:[I

    return-void
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;II[I)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapWidth:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapWidth:I

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapHeight:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapHeight:I

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->colors:[I

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->colors:[I

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->colors:[I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->colors:[I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapHeight:I

    mul-int/2addr v1, p3

    add-int/2addr v1, p2

    array-length v2, p4

    const/4 v3, 0x0

    invoke-static {p4, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method


# virtual methods
.method public makeBitmap()Landroid/graphics/Bitmap;
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->colors:[I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapWidth:I

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapHeight:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public updateBitmap(Landroid/graphics/Bitmap;)V
    .locals 8

    const/4 v2, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->colors:[I

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapWidth:I

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapWidth:I

    iget v7, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$MinimapBitmap;->bitmapHeight:I

    move-object v0, p1

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-void
.end method
