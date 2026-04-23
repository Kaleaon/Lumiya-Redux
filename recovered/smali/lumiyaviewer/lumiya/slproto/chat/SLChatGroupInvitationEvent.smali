.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;


# instance fields
.field private final groupID:Ljava/util/UUID;

.field private final joinFee:I

.field private final sessionID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getTransactionAmount()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->joinFee:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getSessionID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->sessionID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getItemID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->groupID:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V
    .locals 2
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$AgentData;->AgentID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->groupID:Ljava/util/UUID;

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->sessionID:Ljava/util/UUID;

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    array-length v0, v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->joinFee:I

    :goto_0
    return-void

    :cond_0
    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->joinFee:I

    goto :goto_0
.end method

.method private DoAcceptGroupInvite(Ljava/util/UUID;Ljava/util/UUID;Z)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->agentUUID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->AcceptGroupInvite(Ljava/util/UUID;Ljava/util/UUID;Z)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_chat_SLChatGroupInvitationEvent_3762(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->GroupInvitation:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getNoButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090186

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090183

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQuestion(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    const/4 v2, 0x0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->joinFee:I

    if-nez v0, :cond_0

    const v0, 0x7f090189

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->joinFee:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    const v1, 0x7f09018c

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f09018d

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090181

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_slproto_chat_SLChatGroupInvitationEvent_3561(Landroid/content/DialogInterface;I)V
    .locals 3

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->groupID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->sessionID:Ljava/util/UUID;

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->DoAcceptGroupInvite(Ljava/util/UUID;Ljava/util/UUID;Z)V

    return-void
.end method

.method protected onNoAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onNoAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->groupID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->sessionID:Ljava/util/UUID;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->DoAcceptGroupInvite(Ljava/util/UUID;Ljava/util/UUID;Z)V

    return-void
.end method

.method public onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 5

    const/4 v4, 0x0

    const/4 v3, 0x1

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->joinFee:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->groupID:Ljava/util/UUID;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->sessionID:Ljava/util/UUID;

    invoke-direct {p0, v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->DoAcceptGroupInvite(Ljava/util/UUID;Ljava/util/UUID;Z)V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-array v1, v3, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->joinFee:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    const v2, 0x7f090182

    invoke-virtual {p1, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$hXLxI3fDexZfuKx5RzOoCtsGy3I$1;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$hXLxI3fDexZfuKx5RzOoCtsGy3I$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$hXLxI3fDexZfuKx5RzOoCtsGy3I;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/slproto/chat/-$Lambda$hXLxI3fDexZfuKx5RzOoCtsGy3I;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->joinFee:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setTransactionAmount(Ljava/lang/Integer;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->sessionID:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setSessionID(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatGroupInvitationEvent;->groupID:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setItemID(Ljava/util/UUID;)V

    return-void
.end method
