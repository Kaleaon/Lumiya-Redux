.class public final Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;
.super Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;


# instance fields
.field private final isInstall:Z

.field private final upgradeURL:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V
    .locals 2
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;Ljava/util/UUID;)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getItemName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->upgradeURL:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getAssetType()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->isInstall:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceUnknown;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;-><init>(Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;Ljava/util/UUID;Ljava/lang/String;)V

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->upgradeURL:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->isInstall:Z

    return-void
.end method


# virtual methods
.method protected getMessageType()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;->VoiceUpgrade:Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent$ChatMessageType;

    return-object v0
.end method

.method public getNoButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090386

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNoMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->isInstall:Z

    if-eqz v0, :cond_0

    const v0, 0x7f09037b

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const v0, 0x7f090385

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getQuestion(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->isInstall:Z

    if-eqz v0, :cond_0

    const v0, 0x7f09015d

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const v0, 0x7f090365

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getText(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 1
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getYesButton(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->isInstall:Z

    if-eqz v0, :cond_0

    const v0, 0x7f09037c

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const v0, 0x7f090387

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getYesMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, ""

    return-object v0
.end method

.method public isObjectPopup()Z
    .locals 1

    const/4 v0, 0x0

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
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->onYesAction(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectPopupsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectPopupsManager;->cancelObjectPopup(Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->upgradeURL:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatYesNoEvent;->serializeToDatabaseObject(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->upgradeURL:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setItemName(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/chat/SLVoiceUpgradeEvent;->isInstall:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setAssetType(Ljava/lang/Integer;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
