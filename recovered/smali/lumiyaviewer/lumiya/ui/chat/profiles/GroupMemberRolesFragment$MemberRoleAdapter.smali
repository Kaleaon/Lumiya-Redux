.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;
.super Landroid/widget/BaseAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MemberRoleAdapter"
.end annotation


# instance fields
.field private data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final selectedRoles:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;->RoleData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItem(I)Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;->RoleData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;->RoleData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    return-object v0

    :cond_0
    return-object v1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedRoles()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    const v3, 0x7f100173

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040043

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckedTextView;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Name:[B

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckedTextView;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    :cond_1
    return-object p2

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setData(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;Ljava/util/Set;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;",
            "Ljava/util/Set",
            "<",
            "Ljava/util/UUID;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->notifyDataSetInvalidated()V

    return-void
.end method

.method public toggleChecked(Ljava/util/UUID;)V
    .locals 10

    const/4 v2, 0x0

    const-wide/16 v8, 0x0

    const/4 v1, 0x1

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-get4(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)J

    move-result-wide v4

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    if-ne v0, v3, :cond_2

    if-eqz v3, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    move v0, v1

    :goto_1
    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-wrap1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :catch_0
    move-exception v0

    move v0, v2

    goto :goto_1

    :cond_2
    if-nez v3, :cond_4

    const-wide/16 v6, 0x200

    and-long/2addr v4, v6

    cmp-long v0, v4, v8

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-get2(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->OwnerRole:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-get4(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v0, :cond_3

    if-eqz v3, :cond_7

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move v0, v1

    goto :goto_1

    :cond_4
    const-wide/16 v6, 0x100

    and-long/2addr v6, v4

    cmp-long v0, v6, v8

    if-eqz v0, :cond_5

    move v0, v1

    :goto_2
    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->selectedRoles:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move v0, v1

    goto :goto_1

    :cond_5
    const-wide/16 v6, 0x80

    and-long/2addr v4, v6

    cmp-long v0, v4, v8

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment$MemberRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;->-get3(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMemberRolesFragment;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;

    if-eqz v0, :cond_8

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;->RoleID:Ljava/util/UUID;

    invoke-virtual {v0, p1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    if-eqz v0, :cond_6

    move v0, v1

    goto :goto_2

    :cond_7
    move v0, v2

    goto/16 :goto_1

    :cond_8
    move v0, v2

    goto :goto_2
.end method
