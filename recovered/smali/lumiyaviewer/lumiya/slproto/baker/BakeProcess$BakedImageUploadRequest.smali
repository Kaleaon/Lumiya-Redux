.class Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BakedImageUploadRequest"
.end annotation


# instance fields
.field final bakedImage:Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;

.field final bakedIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Ljava/io/File;)V
    .locals 1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->ordinal()I

    move-result v0

    invoke-direct {p0, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/texuploader/SLTextureUploadRequest;-><init>(Ljava/io/File;I)V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;->bakedImage:Lcom/lumiyaviewer/lumiya/slproto/baker/BakedImage;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$BakedImageUploadRequest;->bakedIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    return-void
.end method
