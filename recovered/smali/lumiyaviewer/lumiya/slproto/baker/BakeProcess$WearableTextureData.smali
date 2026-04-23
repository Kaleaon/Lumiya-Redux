.class Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WearableTextureData"
.end annotation


# instance fields
.field private final texture:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

.field private volatile textureData:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

.field private volatile textureReady:Z

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->textureData:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    return-object v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->this$0:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->texture:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->textureReady:Z

    return-void
.end method


# virtual methods
.method public OnResourceReady(Ljava/lang/Object;Z)V
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->textureData:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->textureReady:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->this$0:Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)V

    return-void
.end method

.method protected getTexture()Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->texture:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

    return-object v0
.end method

.method getTextureData()Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->textureData:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    return-object v0
.end method

.method getTextureReady()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->textureReady:Z

    return v0
.end method

.method requestData()V
    .locals 3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->getInstance()Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$WearableTextureData;->texture:Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;->textureID:Ljava/util/UUID;

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;->Asset:Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;->create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/render/tex/TextureClass;)Lcom/lumiyaviewer/lumiya/render/tex/DrawableTextureParams;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/lumiyaviewer/lumiya/res/textures/TextureCache;->RequestResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V

    return-void
.end method
