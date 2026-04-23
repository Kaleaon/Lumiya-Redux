.class public Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceFileCache",
        "<",
        "Ljava/util/UUID;",
        "Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_ATTEMPTS:I = 0x2

.field private static volatile baseDir:Ljava/io/File;


# instance fields
.field private volatile capURL:Ljava/lang/String;

.field private final capURLlock:Ljava/lang/Object;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->capURL:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->capURLlock:Ljava/lang/Object;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->capURLlock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->capURL:Ljava/lang/String;

    return-void
.end method

.method private static getBaseDir()Ljava/io/File;
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->baseDir:Ljava/io/File;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    const-string/jumbo v1, "mesh"

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getCacheDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->baseDir:Ljava/io/File;

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->baseDir:Ljava/io/File;

    return-object v0
.end method

.method public static onCacheDirChanged()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->baseDir:Ljava/io/File;

    return-void
.end method


# virtual methods
.method protected createResourceFromFile(Ljava/util/UUID;Ljava/io/File;)Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;
    .locals 1

    :try_start_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    invoke-direct {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic createResourceFromFile(Ljava/lang/Object;Ljava/io/File;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->createResourceFromFile(Ljava/util/UUID;Ljava/io/File;)Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic createResourceGenRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->createResourceGenRequest(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method

.method protected createResourceGenRequest(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;",
            ">;",
            "Ljava/io/File;",
            ")",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshData;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache$MeshDownloadRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)V

    return-object v0
.end method

.method protected bridge synthetic getResourceFile(Ljava/lang/Object;)Ljava/io/File;
    .locals 1

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->getResourceFile(Ljava/util/UUID;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method protected getResourceFile(Ljava/util/UUID;)Ljava/io/File;
    .locals 6

    invoke-virtual {p1}, Ljava/util/UUID;->hashCode()I

    move-result v0

    shr-int/lit8 v1, v0, 0x8

    xor-int/2addr v1, v0

    shr-int/lit8 v2, v0, 0x10

    xor-int/2addr v1, v2

    shr-int/lit8 v0, v0, 0x18

    xor-int/2addr v0, v1

    and-int/lit16 v0, v0, 0xff

    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->getBaseDir()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v3, "%02x/%s.mesh"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x1

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method public setCapURL(Ljava/lang/String;)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->capURLlock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->capURL:Ljava/lang/String;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/mesh/MeshCache;->capURLlock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
