.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$2;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;
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
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

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

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$2;->onRequest(Ljava/util/UUID;)V

    return-void
.end method

.method public onRequest(Ljava/util/UUID;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$2;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->requestAgentDataUpdate()V

    return-void
.end method
