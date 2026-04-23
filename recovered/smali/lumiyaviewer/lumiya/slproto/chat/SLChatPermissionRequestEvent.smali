.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;


# instance fields
.field private final ItemID:Ljava/util/UUID;

.field private final ObjectOwner:Ljava/lang/String;

.field private final Questions:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getItemID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->ItemID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getItemName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->ObjectOwner:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getQuestionMask()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->Questions:I

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;Ljava/util/UUID;)V
    .locals 7
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;->TaskID:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;->ObjectName:[B

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-direct {p0, v1, p2, v2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;->ObjectOwner:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->ObjectOwner:Ljava/lang/String;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;->ItemID:Ljava/util/UUID;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->ItemID:Ljava/util/UUID;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    move-result-object v2

    array-length v3, v2

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v4, v2, v1

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion$Data;->Questions:I

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->getPermMask()I

    move-result v6

    and-int/2addr v5, v6

    if-eqz v5, :cond_0

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->getPermMask()I

    move-result v4

    or-int/2addr v0, v4

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->Questions:I

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->PermissionRequest:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getNoButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f09026f

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f09026d

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQuestion(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090270

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQuestions()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->Questions:I

    return v0
.end method

.method public getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 8
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v2, 0x0

    const-string/jumbo v0, ""

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;

    move-result-object v3

    array-length v4, v3

    move v1, v2

    :goto_0
    if-ge v1, v4, :cond_2

    aget-object v5, v3, v1

    iget v6, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->Questions:I

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->getPermMask()I

    move-result v7

    and-int/2addr v6, v7

    if-eqz v6, :cond_1

    const-string/jumbo v6, ""

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v6, ", "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLScriptPermissions;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->ObjectOwner:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v0, v1, v2

    const v0, 0x7f09026e

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090271

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f09026c

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isObjectPopup()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected onNoAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onNoAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method public onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 4

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->avatarControl:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->ItemID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->source:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->getSourceUUID()Ljava/util/UUID;

    move-result-object v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->Questions:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->ScriptAnswerYes(Ljava/util/UUID;Ljava/util/UUID;I)V

    :cond_0
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-void
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->ItemID:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setItemID(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->ObjectOwner:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setItemName(Ljava/lang/String;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLChatPermissionRequestEvent;->Questions:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setQuestionMask(Ljava/lang/Integer;)V

    return-void
.end method
