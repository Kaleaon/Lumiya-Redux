.class public Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;


# instance fields
.field private final assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

.field private final itemID:Ljava/util/UUID;

.field private final itemName:Ljava/lang/String;

.field private final origIMType:I

.field private final sessionID:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getOrigIMType()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->origIMType:I

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getSessionID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->sessionID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getItemID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getItemName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getAssetType()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Message:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemName:Ljava/lang/String;

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->origIMType:I

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->sessionID:Ljava/util/UUID;

    invoke-static {p3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->extractItemID(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    invoke-static {p3}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->extractAssetType(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;Ljava/lang/String;)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemName:Ljava/lang/String;

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->Dialog:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->origIMType:I

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->ID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->sessionID:Ljava/util/UUID;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-void
.end method

.method protected static extractAssetType(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    array-length v0, v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-object v0
.end method

.method protected static extractItemID(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;)Ljava/util/UUID;
    .locals 5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    array-length v0, v0

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;->MessageBlock_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;->BinaryBucket:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    new-instance v4, Ljava/util/UUID;

    invoke-direct {v4, v2, v3, v0, v1}, Ljava/util/UUID;-><init>(JJ)V

    return-object v4

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public getAssetType()Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    return-object v0
.end method

.method public getItemID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    return-object v0
.end method

.method public getItemName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemName:Ljava/lang/String;

    return-object v0
.end method

.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->InventoryItemOffered:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getNoButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090161

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090160

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQuestion(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090162

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 3
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemName:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const v1, 0x7f0900ae

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090163

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f09015f

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

.method protected onNoAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 6

    const/4 v5, 0x0

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onNoAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v3, :cond_0

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->origIMType:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->sessionID:Ljava/util/UUID;

    const/4 v2, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->AcceptInventoryOffer(IZLjava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->DeleteInventoryItemRaw(Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method public onOfferAccepted(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Ljava/util/UUID;)V
    .locals 6

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->origIMType:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->sessionID:Ljava/util/UUID;

    const/4 v2, 0x1

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->AcceptInventoryOffer(IZLjava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->MoveInventoryItemRaw(Ljava/util/UUID;Ljava/lang/String;Ljava/util/UUID;)V

    :cond_0
    return-void
.end method

.method public onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 8

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->dbMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;->InventoryOffer:Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->getItemName()Ljava/lang/String;

    move-result-object v3

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->dbMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getId()Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;-><init>(Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo$InventorySaveType;Ljava/util/UUID;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;J)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->agentUUID:Ljava/util/UUID;

    invoke-static {p1, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeSaveItemIntent(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/inventory/InventorySaveInfo;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->origIMType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setOrigIMType(Ljava/lang/Integer;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->sessionID:Ljava/util/UUID;

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setSessionID(Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemID:Ljava/util/UUID;

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setItemID(Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->itemName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setItemName(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatInventoryItemOfferedEvent;->assetType:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getTypeCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_0
    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setAssetType(Ljava/lang/Integer;)V

    return-void
.end method
