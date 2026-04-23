.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/BackButtonHandler;


# instance fields
.field private avatarNotesSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->avatarNotesSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    return-void
.end method

.method private onAvatarNotes(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;)V
    .locals 1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply$Data;->Notes:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->setOriginalText(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_profiles_UserNotesEditFragment-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->onAvatarNotes(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;)V

    return-void
.end method

.method protected decorateFragmentTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const v1, 0x7f0901fd

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getFieldHint(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f09036a

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->avatarNotesSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->avatarNotesSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->avatarNotesSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarNotes()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$gtFtIPtqrsfNaJBMezEYcryNxGg;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$gtFtIPtqrsfNaJBMezEYcryNxGg;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserNotesEditFragment;->avatarNotesSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_1
    return-void
.end method

.method protected saveEditedText(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getOptionalChatterUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->SaveUserNotes(Ljava/util/UUID;Ljava/lang/String;)V

    return-void
.end method
