.class public Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;
.super Landroid/app/Dialog;

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ScriptDialogDialog"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    const/4 v2, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->this$0:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    invoke-direct {p0, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    const v0, 0x7f040096

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->setContentView(I)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->setCancelable(Z)V

    invoke-virtual {p0, p4}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->setTitle(Ljava/lang/CharSequence;)V

    const v0, 0x7f100274

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move v1, v2

    :goto_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get1()[I

    move-result-object v0

    array-length v0, v0

    if-ge v1, v0, :cond_1

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get0(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;)[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    if-ge v1, v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get1()[I

    move-result-object v0

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get0(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get1()[I

    move-result-object v0

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get1()[I

    move-result-object v0

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get1()[I

    move-result-object v0

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_1
    invoke-virtual {p0, p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->this$0:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->dismiss()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get1()[I

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->-get1()[I

    move-result-object v2

    aget v2, v2, v0

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->this$0:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->onDialogButton(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog$ScriptDialogDialog;->dismiss()V

    return-void

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
