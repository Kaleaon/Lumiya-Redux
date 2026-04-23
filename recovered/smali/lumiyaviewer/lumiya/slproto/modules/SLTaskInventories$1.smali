.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories$1;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Ljava/lang/Integer;)V
    .locals 2
    .param p1    # Ljava/lang/Integer;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories;I)V

    return-void
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLTaskInventories$1;->onRequest(Ljava/lang/Integer;)V

    return-void
.end method
