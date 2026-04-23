.class public Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;


# instance fields
.field private final newBalance:I

.field private final transactionAmount:I

.field private final transactionAmountValid:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 2
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getTransactionAmount()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmountValid:Z

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getTransactionAmount()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getTransactionAmount()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :cond_0
    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getNewBalance()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->newBalance:I

    return-void

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;ZII)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;)V

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmountValid:Z

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    iput p5, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->newBalance:I

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->BalanceChanged:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getNewBalance()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->newBalance:I

    return v0
.end method

.method protected getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 6
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmountValid:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    if-ltz v1, :cond_0

    new-array v0, v5, [Ljava/lang/Object;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->getNewBalance()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    const v1, 0x7f090394

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    neg-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    aput-object v0, v1, v4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->getNewBalance()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v5

    const v0, 0x7f090392

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    if-ltz v0, :cond_2

    new-array v0, v5, [Ljava/lang/Object;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->newBalance:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    const v1, 0x7f090393

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2
    new-array v0, v5, [Ljava/lang/Object;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    neg-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->newBalance:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    const v1, 0x7f090391

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    new-array v0, v4, [Ljava/lang/Object;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->newBalance:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    const v1, 0x7f090395

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTransactionAmount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    return v0
.end method

.method public getTransactionAmountValid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmountValid:Z

    return v0
.end method

.method public getViewType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;->VIEW_TYPE_NORMAL:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageViewType;

    return-object v0
.end method

.method protected isActionMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Z
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmountValid:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->getTransactionAmount()I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    return v0
.end method

.method public opensNewChatter()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmountValid:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->transactionAmount:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setTransactionAmount(Ljava/lang/Integer;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatBalanceChangedEvent;->newBalance:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setNewBalance(Ljava/lang/Integer;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
