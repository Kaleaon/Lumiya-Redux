.class Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache$TextGenRequest;
.super Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TextGenRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
        "<",
        "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;",
        "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;",
        ">;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private final fontSize:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;ILcom/lumiyaviewer/lumiya/res/ResourceManager;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;",
            "I",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;",
            "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p3}, Lcom/lumiyaviewer/lumiya/res/ResourceRequest;-><init>(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    iput p2, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache$TextGenRequest;->fontSize:I

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->getInstance()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public run()V
    .locals 3

    new-instance v1, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache$TextGenRequest;->getParams()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache$TextGenRequest;->fontSize:I

    invoke-direct {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;-><init>(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;I)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache$TextGenRequest;->completeRequest(Ljava/lang/Object;)V

    return-void
.end method
