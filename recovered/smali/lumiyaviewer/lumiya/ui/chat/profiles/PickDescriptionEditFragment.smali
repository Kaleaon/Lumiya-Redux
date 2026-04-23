.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;


# static fields
.field private static final AVATAR_PICK_KEY:Ljava/lang/String; = "avatarPickKey"


# instance fields
.field private final pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldEditFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$Y7Ne2VWglUcvjFUgJydWWKVgIXM;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$Y7Ne2VWglUcvjFUgJydWWKVgIXM;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    return-void
.end method

.method private getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "avatarPickKey"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "avatarPickKey"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    return-object v0

    :cond_0
    return-object v2
.end method

.method public static makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;)Landroid/os/Bundle;
    .locals 2

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "avatarPickKey"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object v0
.end method

.method private onPickInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Desc:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->setOriginalText(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_profiles_PickDescriptionEditFragment-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->onPickInfoReply(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V

    return-void
.end method

.method protected getFieldHint(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f090273

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v1, :cond_0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPickInfos()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_0
.end method

.method protected saveEditedText(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .locals 10

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;

    if-eqz p1, :cond_0

    if-eqz v1, :cond_0

    if-eqz v5, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;->pickID:Ljava/util/UUID;

    iget-object v2, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->CreatorID:Ljava/util/UUID;

    iget-object v3, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->ParcelID:Ljava/util/UUID;

    iget-object v4, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Name:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    iget-object v6, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v7, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v8, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SortOrder:I

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-boolean v9, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Enabled:Z

    move-object v5, p3

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->UpdatePickInfo(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;IZ)V

    :cond_0
    return-void
.end method
