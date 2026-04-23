.class Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TerrainRawTextureRequest"
.end annotation


# instance fields
.field private final layer:I

.field final synthetic this$1:Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;Ljava/util/UUID;I)V
    .locals 2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;->this$1:Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;->layer:I

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Terrain:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-static {p2, v1}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 3

    const/4 v2, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;->this$1:Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;->layer:I

    check-cast p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    invoke-virtual {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->onLayerReady(ILcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;->this$1:Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest$TerrainRawTextureRequest;->layer:I

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;->onLayerReady(ILcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V

    goto :goto_0
.end method
