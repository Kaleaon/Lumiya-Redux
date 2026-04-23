.class public Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;


# static fields
.field private static final ATTACHED_ENTRY_KEY:Ljava/lang/String; = "attachedEntry"

.field private static final ITEM_FOR_ATTACH_REQUEST:I = 0x1


# instance fields
.field private attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

.field groupNoticeAttachmentButton:Landroid/widget/Button;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100177
    .end annotation
.end field

.field groupNoticeAttachmentText:Landroid/widget/TextView;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100176
    .end annotation
.end field

.field groupNoticeEditText:Landroid/widget/EditText;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100178
    .end annotation
.end field

.field groupNoticeSubject:Landroid/widget/EditText;
    .annotation build Lbutterknife/BindView;
        value = 0x7f100175
    .end annotation
.end field

.field private unbinder:Lbutterknife/Unbinder;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->unbinder:Lbutterknife/Unbinder;

    return-void
.end method

.method private updateAttachedEntry()V
    .locals 4

    const-string/jumbo v0, "GroupNotice: current attached entry %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->groupNoticeAttachmentText:Landroid/widget/TextView;

    const v1, 0x7f090148

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->groupNoticeAttachmentButton:Landroid/widget/Button;

    const v1, 0x7f090146

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->groupNoticeAttachmentText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->groupNoticeAttachmentButton:Landroid/widget/Button;

    const v1, 0x7f090149

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    goto :goto_0
.end method


# virtual methods
.method protected decorateFragmentTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const v1, 0x7f09014d

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->onActivityResult(IILandroid/content/Intent;)V

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    const-string/jumbo v0, "selectedInventoryEntry"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "selectedInventoryEntry"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v0, "GroupNotice: new attached entry %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->updateAttachedEntry()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p2    # Landroid/view/ViewGroup;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v4, 0x0

    const v0, 0x7f040045

    invoke-virtual {p1, v0, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {p0, v1}, Lbutterknife/ButterKnife;->bind(Ljava/lang/Object;Landroid/view/View;)Lbutterknife/Unbinder;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz p3, :cond_0

    const-string/jumbo v0, "attachedEntry"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "attachedEntry"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const-string/jumbo v0, "GroupNotice: restored state attached entry %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->updateAttachedEntry()V

    return-object v1

    :cond_1
    const-string/jumbo v0, "GroupNotice: restored state no entry"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->unbinder:Lbutterknife/Unbinder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->unbinder:Lbutterknife/Unbinder;

    invoke-interface {v0}, Lbutterknife/Unbinder;->unbind()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->unbinder:Lbutterknife/Unbinder;

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->onDestroyView()V

    return-void
.end method

.method public onGroupNoticeAttachmentButton()V
    .locals 6
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100177
        }
    .end annotation

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-string/jumbo v0, "GroupNotice: current attached entry %s"

    new-array v1, v5, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;->makeSelectIntent(Landroid/content/Context;Ljava/util/UUID;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->updateAttachedEntry()V

    goto :goto_0
.end method

.method public onGroupNoticeSendButton()V
    .locals 5
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f100179
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->groupNoticeSubject:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->groupNoticeEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SendGroupNotice(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4

    const-string/jumbo v0, "GroupNotice: saved state attached entry %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    const-string/jumbo v0, "attachedEntry"

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/GroupNoticeFragment;->attachedEntry:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_0
    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method
