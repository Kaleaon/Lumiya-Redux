.class Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldViewActivity$1_50098(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->handleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V

    return-void
.end method

.method public onChatMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V
    .locals 2
    .annotation runtime Lcom/google/common/eventbus/Subscribe;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get15(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$11;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$YnTWxJEMPymM_sHfAdAKQ7gcDf8$11;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
