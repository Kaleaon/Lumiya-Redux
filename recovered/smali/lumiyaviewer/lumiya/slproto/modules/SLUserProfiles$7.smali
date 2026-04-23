.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$7;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->DeletePick(Ljava/util/UUID;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener$SLMessageBaseEventListener;->onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPicks()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles$7;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->requestUpdate(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
