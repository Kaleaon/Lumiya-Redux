.class Lcom/lumiyaviewer/lumiya/res/ResourceManager$2;
.super Lcom/google/common/cache/CacheLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/ResourceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/cache/CacheLoader",
        "<TResourceParams;",
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<TResourceParams;TResourceType;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$2;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    invoke-direct {p0}, Lcom/google/common/cache/CacheLoader;-><init>()V

    return-void
.end method


# virtual methods
.method public load(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<TResourceParams;TResourceType;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$2;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceManager$2;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceManager;

    invoke-virtual {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/res/ResourceManager;->CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic load(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/res/ResourceManager$2;->load(Ljava/lang/Object;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method
