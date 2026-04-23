.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;


# static fields
.field private static final PICK_ID_KEY:Ljava/lang/String; = "pickID"


# instance fields
.field changePicButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b2
    .end annotation
.end field

.field private menuItemDelete:Landroid/view/MenuItem;

.field private menuItemRename:Landroid/view/MenuItem;

.field pickDescription:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b3
    .end annotation
.end field

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

.field setLocationButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b0
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;

.field userPickDescEditButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002b4
    .end annotation
.end field

.field userPickImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f1002ae
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$3;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$3;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->menuItemRename:Landroid/view/MenuItem;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->menuItemDelete:Landroid/view/MenuItem;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->setArguments(Landroid/os/Bundle;)V

    return-void
.end method

.method private deletePick()V
    .locals 6

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0900e0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string/jumbo v4, "Yes"

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$4;

    invoke-direct {v5, p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo;-><init>()V

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method private getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "pickID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    return-object v0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_11235(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_12813(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_13525(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;Ljava/lang/String;)V
    .locals 10

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;->pickID:Ljava/util/UUID;

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->CreatorID:Ljava/util/UUID;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->ParcelID:Ljava/util/UUID;

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Desc:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v5

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v6, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget v8, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SortOrder:I

    iget-object v4, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-boolean v9, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Enabled:Z

    move-object v4, p3

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->UpdatePickInfo(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;IZ)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_7788(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method public static makeSelection(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "activeAgentUUID"

    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v1, "pickID"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object v0
.end method

.method private onPickInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V
    .locals 7

    const/4 v6, 0x0

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    const-string/jumbo v1, "GlobalPos: got pick global pos %f, %f, %f"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->x:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->y:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->z:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v3, 0x2

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Name:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v6}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->updateMenuItems()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickDescription:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Desc:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->userPickImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAssetID(Ljava/util/UUID;)V

    :cond_1
    return-void
.end method

.method private renamePick()V
    .locals 5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f090275

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setTitle(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Name:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setDefaultText(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    new-instance v4, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;

    invoke-direct {v4, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->setOnTextEnteredListener(Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder$OnTextEnteredListener;)Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/ui/common/TextFieldDialogBuilder;->show()V

    :cond_0
    return-void
.end method

.method private updateMenuItems()V
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v2

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, v2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;->avatarID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->menuItemRename:Landroid/view/MenuItem;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->menuItemRename:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->menuItemDelete:Landroid/view/MenuItem;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->menuItemDelete:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2
    return-void
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment-mthref-0(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->onPickInfo(Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_12153(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;Landroid/content/DialogInterface;I)V
    .locals 2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;->pickID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->DeletePick(Ljava/util/UUID;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_0
    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_7285(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Landroid/content/DialogInterface;I)V
    .locals 4

    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090350

    invoke-direct {v1, v2, p1, v3}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/common/TeleportProgressDialog;->show()V

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->TeleportToGlobalPosition(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_UserPickFragment_9741(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;Landroid/content/DialogInterface;I)V
    .locals 10

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentGlobalPosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    move-result-object v7

    if-eqz v7, :cond_0

    const-string/jumbo v1, "GlobalPos: setting pick to global pos %f %f %f"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-wide v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->x:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-wide v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->y:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget-wide v4, v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->z:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->userProfiles:Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;->pickID:Ljava/util/UUID;

    iget-object v2, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->CreatorID:Ljava/util/UUID;

    iget-object v3, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->ParcelID:Ljava/util/UUID;

    iget-object v4, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Name:[B

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Desc:[B

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SnapshotID:Ljava/util/UUID;

    iget-object v8, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->SortOrder:I

    iget-object v9, p3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-boolean v9, v9, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->Enabled:Z

    invoke-virtual/range {v0 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLUserProfiles;->UpdatePickInfo(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;IZ)V

    :cond_0
    invoke-interface {p4}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f090274

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method protected onChangePic(Landroid/view/View;)V
    .locals 5
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002b2
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v3, "oldPickData"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    sget-object v3, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;->applyPickImage:Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-static {v0, v1, v3, v2, v4}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeSelectActionIntent(Landroid/content/Context;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity$SelectAction;Landroid/os/Bundle;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f12001a

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f100344

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->menuItemRename:Landroid/view/MenuItem;

    const v0, 0x7f100345

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->menuItemDelete:Landroid/view/MenuItem;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->updateMenuItems()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    const/4 v2, 0x1

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f0400b4

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->unbinder:Lbutterknife/Unbinder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->userPickImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setAlignTop(Z)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->userPickImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;->setVerticalFit(Z)V

    return-object v0
.end method

.method protected onDescEdit(Landroid/view/View;)V
    .locals 5
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002b4
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v4, v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;->avatarID:Ljava/util/UUID;

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/PickDescriptionEditFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onDestroyView()V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->renamePick()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->deletePick()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7f100344
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onSetLocation(Landroid/view/View;)V
    .locals 7
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002b0
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f090300

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string/jumbo v5, "Yes"

    new-instance v6, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$7;

    invoke-direct {v6, p0, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string/jumbo v1, "No"

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$1;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$1;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 7

    const/4 v3, 0x0

    const/16 v2, 0x8

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    const v0, 0x7f0901c8

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getPickKey()Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;

    move-result-object v4

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AvatarPickKey;->avatarID:Ljava/util/UUID;

    invoke-virtual {v0, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->userPickDescEditButton:Landroid/widget/Button;

    if-eqz v5, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v6, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->changePicButton:Landroid/widget/Button;

    if-eqz v5, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {v6, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->setLocationButton:Landroid/widget/Button;

    if-eqz v5, :cond_2

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarPickInfos()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    invoke-virtual {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :goto_3
    return-void

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_1

    :cond_2
    move v1, v2

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    goto :goto_3
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->unsubscribe()V

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method

.method protected onTeleportToPickClick(Landroid/view/View;)V
    .locals 8
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f1002b1
        }
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->pickInfo:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-wide v4, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->x:D

    double-to-float v3, v4

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-wide v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->y:D

    double-to-float v4, v4

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;->Data_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply$Data;->PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    iget-wide v6, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->z:D

    double-to-float v0, v6

    invoke-direct {v2, v3, v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const v4, 0x7f09034b

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string/jumbo v4, "Yes"

    new-instance v5, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$5;

    invoke-direct {v5, p0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$2;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$pe_zD6dKvPMIxwvN5gLJ2hSMvgo$2;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method
