.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 0
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->LureRequest:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getNoButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090346

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090344

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQuestion(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090347

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 2
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const v0, 0x7f090345

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestEvent;->text:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestEvent;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getYesButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090348

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090343

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected isActionMessage(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Z
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x1

    return v0
.end method

.method public onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 5

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatLureRequestEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v2

    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getRegionName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const v0, 0x7f090362

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const v0, 0x7f09018e

    invoke-virtual {p1, v0, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->OfferTeleport(Ljava/util/UUID;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    return-void
.end method
