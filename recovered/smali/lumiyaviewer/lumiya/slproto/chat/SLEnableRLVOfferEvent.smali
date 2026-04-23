.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLEnableRLVOfferEvent;
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

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;Ljava/util/UUID;)V
    .locals 3
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->SourceID:Ljava/util/UUID;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->FromName:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceObject;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;->ChatData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;->Message:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, p2, v1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->EnableRLVOffer:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getNoButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090110

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f09010f

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQuestion(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090111

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 1
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const v0, 0x7f0902aa

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090112

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getYesMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f09010e

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
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getDefaultSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "rlv_enabled"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

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
