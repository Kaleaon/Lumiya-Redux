.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->UpdatePickInfo(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

.field final synthetic val$pickID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;->val$pickID:Ljava/util/UUID;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;->onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPickInfos()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;->val$pickID:Ljava/util/UUID;

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;-><init>(Ljava/util/UUID;Ljava/util/UUID;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->requestUpdate(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPicks()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$8;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->requestUpdate(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
