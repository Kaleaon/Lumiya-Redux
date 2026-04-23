.class public abstract Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ResourceParams:",
        "Ljava/lang/Object;",
        "RawType:",
        "Ljava/lang/Object;",
        "ResourceType:",
        "Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;",
        ">",
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<TResourceParams;TResourceType;>;"
    }
.end annotation


# instance fields
.field private final loadQueue:Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;)Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->loadQueue:Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;)V
    .locals 0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->collectReferences()V

    return-void
.end method

.method protected constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;->loadQueue:Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    return-void
.end method


# virtual methods
.method protected abstract CancelRawResource(Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
.end method

.method protected CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<TResourceParams;TResourceType;>;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;

    invoke-direct {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache$LoadRequest;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceCache;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0
.end method

.method protected abstract GetResourceSize(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TRawType;)I"
        }
    .end annotation
.end method

.method protected abstract LoadResource(Ljava/lang/Object;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/render/RenderContext;)Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;TRawType;",
            "Lcom/lumiyaviewer/lumiya/render/RenderContext;",
            ")TResourceType;"
        }
    .end annotation
.end method

.method protected abstract RequestRawResource(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceConsumer;",
            ")V"
        }
    .end annotation
.end method
