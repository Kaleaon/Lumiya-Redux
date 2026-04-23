.class public Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;",
        "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
        ">;"
    }
.end annotation


# static fields
.field public static final TextureResolution:I = 0x100


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    return-void
.end method


# virtual methods
.method protected CreateNewRequest(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;

    invoke-direct {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache$TerrainTextureRequest;-><init>(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0
.end method

.method protected bridge synthetic CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/terrain/TerrainTextureCache;->CreateNewRequest(Lcom/lumiyaviewer/lumiya/slproto/terrain/TerrainPatchInfo;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method
