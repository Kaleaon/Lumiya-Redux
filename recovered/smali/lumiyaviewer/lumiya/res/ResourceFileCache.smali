.class public abstract Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ResourceParams:",
        "Ljava/lang/Object;",
        "ResourceType:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<TResourceParams;TResourceType;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    return-void
.end method


# virtual methods
.method protected CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<TResourceParams;TResourceType;>;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;->getResourceFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)V

    return-object v1

    :cond_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;->createResourceGenRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method

.method protected abstract createResourceFromFile(Ljava/lang/Object;Ljava/io/File;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Ljava/io/File;",
            ")TResourceType;"
        }
    .end annotation
.end method

.method protected abstract createResourceGenRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<TResourceParams;TResourceType;>;",
            "Ljava/io/File;",
            ")",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;"
        }
    .end annotation
.end method

.method protected abstract getResourceFile(Ljava/lang/Object;)Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;)",
            "Ljava/io/File;"
        }
    .end annotation
.end method
