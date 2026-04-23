.class Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2

    const/4 v1, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment$4;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/chat/ChatFragment;Z)V

    goto :goto_0
.end method
