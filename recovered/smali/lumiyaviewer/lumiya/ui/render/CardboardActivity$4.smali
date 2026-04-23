.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, -0x1

    const/4 v0, 0x0

    :goto_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get5()[I

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get5()[I

    move-result-object v3

    aget v3, v3, v0

    if-ne v2, v3, :cond_1

    :goto_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get29(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->onDialogButton(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set0(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;)Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap2(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;->pageDefault:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap6(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$ControlsPage;)V

    return-void

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1
.end method
