.class public Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;
.super Ljava/lang/Object;


# instance fields
.field private layerSet:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

.field private resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

.field private uploadedID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;)V
    .locals 7

    const/4 v6, -0x1

    const/4 v3, 0x4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->layerSet:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    new-instance v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iget v1, p1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->width:I

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->height:I

    const/4 v5, 0x1

    move v4, v3

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(IIIIII)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v0, v3, v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->setComponent(IB)V

    return-void
.end method


# virtual methods
.method public Bake(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)V
    .locals 6

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->layerSet:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->layers:[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    array-length v3, v2

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v4, v2, v1

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v4, v5, p1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->Bake(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->layerSet:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    iget-boolean v1, v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->clear_alpha:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->layerSet:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->maskLayers:[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    array-length v1, v1

    if-lez v1, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    const/4 v2, 0x3

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->setComponent(IB)V

    :cond_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->layerSet:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->maskLayers:[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    array-length v2, v1

    :goto_1
    if-ge v0, v2, :cond_3

    aget-object v3, v1, v0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v3, v4, p1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->BakeAlpha(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public SaveToJPEG2K(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->SaveJPEG2K(Ljava/io/File;)V

    return-void
.end method

.method public getAsBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getAsBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getBakedImage()Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->resultImage:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    return-object v0
.end method

.method public getUploadedID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->uploadedID:Ljava/util/UUID;

    return-object v0
.end method

.method public setUploadedID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;->uploadedID:Ljava/util/UUID;

    return-void
.end method
