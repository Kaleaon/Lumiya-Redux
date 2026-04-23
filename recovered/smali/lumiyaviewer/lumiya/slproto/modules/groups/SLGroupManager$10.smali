.class Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SetRoleProperties(Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

.field final synthetic val$groupID:Ljava/util/UUID;

.field final synthetic val$roleID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;->val$roleID:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;->val$groupID:Ljava/util/UUID;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 4

    const-string/jumbo v0, "GroupRole: ack set properties for role %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;->val$roleID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->-get4(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getGroupRoles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager$10;->val$groupID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->requestUpdate(Ljava/lang/Object;)V

    return-void
.end method
