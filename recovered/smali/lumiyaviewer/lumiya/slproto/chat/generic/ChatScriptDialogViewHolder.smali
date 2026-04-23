.class public Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final dialogButtonIds:[I


# instance fields
.field public final cardView:Landroid/support/v7/widget/CardView;

.field public final dialogButtonIgnore:Landroid/widget/Button;

.field public final dialogButtons:[Landroid/widget/Button;

.field public final dialogButtonsLayout:Landroid/view/View;

.field private dialogEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final dialogResultTextView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xc

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIds:[I

    return-void

    :array_0
    .array-data 4
        0x7f100135
        0x7f100136
        0x7f100137
        0x7f100132
        0x7f100133
        0x7f100134
        0x7f10012f
        0x7f100130
        0x7f100131
        0x7f10012c
        0x7f10012d
        0x7f10012e
    .end array-data
.end method

.method constructor <init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 3

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatEventViewHolder;-><init>(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    const v0, 0x7f10012a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogResultTextView:Landroid/widget/TextView;

    const v0, 0x7f10012b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonsLayout:Landroid/view/View;

    const v0, 0x7f100127

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/CardView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->cardView:Landroid/support/v7/widget/CardView;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIds:[I

    array-length v0, v0

    new-array v0, v0, [Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtons:[Landroid/widget/Button;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIds:[I

    array-length v0, v0

    if-ge v1, v0, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtons:[Landroid/widget/Button;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIds:[I

    aget v0, v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    aput-object v0, v2, v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtons:[Landroid/widget/Button;

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtons:[Landroid/widget/Button;

    aget-object v0, v0, v1

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    const v0, 0x7f100129

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIgnore:Landroid/widget/Button;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIgnore:Landroid/widget/Button;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIgnore:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIds:[I

    array-length v1, v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogButtonIds:[I

    aget v2, v2, v0

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->getAgentUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->onDialogButton(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->requestAdapterUpdate()V

    :cond_0
    :goto_1
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->getAgentUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;->onDialogIgnored(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->requestAdapterUpdate()V

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f100129
        :pswitch_0
    .end packed-switch
.end method

.method public setDialogEvent(Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/ChatScriptDialogViewHolder;->dialogEvent:Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatScriptDialog;

    return-void
.end method
