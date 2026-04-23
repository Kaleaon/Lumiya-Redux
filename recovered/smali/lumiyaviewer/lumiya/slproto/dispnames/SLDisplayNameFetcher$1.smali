.class Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Ljava/util/UUID;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/util/UUID;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;->onRequest(Ljava/util/UUID;)V

    return-void
.end method

.method public onRequest(Ljava/util/UUID;)V
    .locals 3
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;

    invoke-direct {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;-><init>()V

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;->ID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;->UUIDNameBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    iget-object v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;->UUIDNameBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->-get0(Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;)Lcom/lumiyaviewer/lumiya/react/RequestQueue;

    move-result-object v0

    invoke-interface {v0}, Lcom/lumiyaviewer/lumiya/react/RequestQueue;->getNextRequest()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;-><init>()V

    iput-object p1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest$UUIDNameBlock;->ID:Ljava/util/UUID;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;->UUIDNameBlock_Fields:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;->isReliable:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/dispnames/SLDisplayNameFetcher;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method
