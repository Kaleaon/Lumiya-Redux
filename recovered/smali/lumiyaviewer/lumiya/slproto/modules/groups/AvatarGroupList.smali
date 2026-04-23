.class public Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;
    }
.end annotation


# instance fields
.field public final Groups:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;",
            ">;"
        }
    .end annotation
.end field

.field public final avatarID:Ljava/util/UUID;

.field public final newGroupDataValid:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate;)V
    .locals 6

    const/4 v5, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$AgentData;->AgentID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    const-string/jumbo v0, "AvatarGroupList: created from AgentGroupDataUpdate (%s)"

    new-array v1, v5, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-direct {v1}, Lcom/google/common/collect/ImmutableMap$Builder;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;->GroupID:Ljava/util/UUID;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    invoke-direct {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;)V

    invoke-virtual {v1, v3, v4}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    iput-boolean v5, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->newGroupDataValid:Z

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;)V
    .locals 7

    const/4 v6, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$AgentData;->AvatarID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    const-string/jumbo v0, "AvatarGroupList: created from AvatarGroupsReply (%s)"

    new-array v1, v6, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-direct {v1}, Lcom/google/common/collect/ImmutableMap$Builder;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->GroupData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;

    sget-object v3, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupID:Ljava/util/UUID;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;->NewGroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;

    invoke-direct {v4, v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;)V

    invoke-virtual {v1, v3, v4}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    iput-boolean v6, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->newGroupDataValid:Z

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;)V
    .locals 9

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->AgentData:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$AgentDataEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$AgentDataEntry;->AvatarID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->AgentData:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$AgentDataEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$AgentDataEntry;->AvatarID:Ljava/util/UUID;

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    const-string/jumbo v0, "AvatarGroupList: created from AgentGroupDataInfo (%s)"

    new-array v1, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->avatarID:Ljava/util/UUID;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v6, Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-direct {v6}, Lcom/google/common/collect/ImmutableMap$Builder;-><init>()V

    move v1, v2

    :goto_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->GroupData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->NewGroupData:Ljava/util/List;

    if-eqz v0, :cond_4

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->NewGroupData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_4

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->NewGroupData:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$NewGroupDataEntry;

    move-object v3, v0

    :goto_2
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->GroupData:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->GroupID:Ljava/util/UUID;

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0, v7}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->GroupData:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;

    invoke-direct {v8, v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$NewGroupDataEntry;)V

    invoke-virtual {v6, v7, v8}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->AgentData:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$AgentDataEntry;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$AgentDataEntry;->AgentID:Ljava/util/UUID;

    goto :goto_0

    :cond_2
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;->NewGroupData:Ljava/util/List;

    if-eqz v0, :cond_3

    move v2, v5

    :cond_3
    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->newGroupDataValid:Z

    return-void

    :cond_4
    move-object v3, v4

    goto :goto_2
.end method
