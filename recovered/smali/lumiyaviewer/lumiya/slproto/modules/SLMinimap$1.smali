.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V
    .locals 5
    .param p1    # Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)F

    move-result v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;->-get2(Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;)Ljava/util/Map;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;FLjava/util/Map;)V

    invoke-interface {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/react/ResultHandler;->onResultData(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$1;->onRequest(Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;)V

    return-void
.end method
