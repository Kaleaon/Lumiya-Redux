.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$5;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardActivity$5_68853(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get6(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get6(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/FadingTextViewLog;->handleChatEvent(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V

    :cond_0
    return-void
.end method

.method public onChatMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;)V
    .locals 2
    .annotation runtime Lcom/google/common/eventbus/Subscribe;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$5;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$26;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$yhBpPTpVtOAhPHTLXL5B0hI4gXA$26;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
