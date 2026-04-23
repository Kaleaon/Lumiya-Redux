.class Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResourceLoadRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ResParams:TResourceParams;ResType:TResourceType;>",
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<TResourceParams;TResourceType;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private final file:Ljava/io/File;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResourceParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<TResourceParams;TResourceType;>;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;

    invoke-direct {p0, p2, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;->file:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->remove(Ljava/lang/Runnable;)Z

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;->cancelRequest()V

    return-void
.end method

.method public execute()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public run()V
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;->this$0:Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;->file:Ljava/io/File;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache;->createResourceFromFile(Ljava/lang/Object;Ljava/io/File;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;->completeRequest(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/res/ResourceFileCache$ResourceLoadRequest;->completeRequest(Ljava/lang/Object;)V

    goto :goto_0
.end method
