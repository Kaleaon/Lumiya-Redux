.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;
.super Landroid/widget/BaseAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupRoleAdapter"
.end annotation


# instance fields
.field private data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private groupProfile:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;

.field private titlesByRole:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;)V
    .locals 1

    const/4 v0, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->groupProfile:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->titlesByRole:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

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

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;->RoleData_Fields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

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

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10

    const v9, 0x7f10017d

    const/4 v3, 0x1

    const/4 v8, 0x0

    const/4 v2, 0x0

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040047

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    move-result-object v4

    if-eqz v4, :cond_1

    iget v0, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Members:I

    iget-object v1, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    sget-object v5, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v1, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->groupProfile:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->groupProfile:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->GroupMembershipCount:I

    move v1, v0

    :goto_0
    invoke-virtual {p2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v5, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Name:[B

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f10017e

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    const v7, 0x7f110001

    invoke-virtual {v5, v7, v1, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->titlesByRole:Ljava/util/Map;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->titlesByRole:Ljava/util/Map;

    iget-object v1, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;

    if-eqz v0, :cond_5

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;->Selected:Z

    move v1, v0

    move v0, v3

    :goto_1
    const v4, 0x7f10017c

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v0, :cond_3

    move v0, v2

    :goto_2
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v1, :cond_4

    :goto_3
    invoke-virtual {v0, v8, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_1
    return-object p2

    :cond_2
    move v1, v0

    goto :goto_0

    :cond_3
    const/4 v0, 0x4

    goto :goto_2

    :cond_4
    move v3, v2

    goto :goto_3

    :cond_5
    move v1, v2

    move v0, v2

    goto :goto_1
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setData(Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->data:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    if-eqz p2, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->titlesByRole:Ljava/util/Map;

    iget-object v0, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->titlesByRole:Ljava/util/Map;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply$GroupData;->RoleID:Ljava/util/UUID;

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->titlesByRole:Ljava/util/Map;

    :cond_1
    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->groupProfile:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab$GroupRoleAdapter;->notifyDataSetInvalidated()V

    return-void
.end method
