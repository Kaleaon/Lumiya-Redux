.class public Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AvatarGroupEntry"
.end annotation


# instance fields
.field public final AcceptNotices:Z

.field public final Contribution:I

.field public final GroupID:Ljava/util/UUID;

.field public final GroupInsigniaID:Ljava/util/UUID;

.field public final GroupName:Ljava/lang/String;

.field public final GroupPowers:J

.field public final GroupTitle:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final ListInProfile:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;->GroupName:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupName:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupTitle:Ljava/lang/String;

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;->AcceptNotices:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->AcceptNotices:Z

    iget-wide v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;->GroupPowers:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;->GroupInsigniaID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupInsigniaID:Ljava/util/UUID;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->ListInProfile:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;->GroupID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupID:Ljava/util/UUID;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;->Contribution:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->Contribution:I

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;)V
    .locals 2
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupName:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupName:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupTitle:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupTitle:Ljava/lang/String;

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->AcceptNotices:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->AcceptNotices:Z

    iget-wide v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupPowers:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupInsigniaID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupInsigniaID:Ljava/util/UUID;

    if-eqz p2, :cond_0

    iget-boolean v0, p2, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$NewGroupData;->ListInProfile:Z

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->ListInProfile:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply$GroupData;->GroupID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupID:Ljava/util/UUID;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->Contribution:I

    return-void

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$NewGroupDataEntry;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->GroupName:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupName:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->GroupTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupTitle:Ljava/lang/String;

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->AcceptNotices:Z

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->AcceptNotices:Z

    iget-wide v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->GroupPowers:J

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->GroupInsigniaID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupInsigniaID:Ljava/util/UUID;

    if-eqz p2, :cond_0

    iget-boolean v0, p2, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$NewGroupDataEntry;->ListInProfile:Z

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->ListInProfile:Z

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->GroupID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupID:Ljava/util/UUID;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->Contribution:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->Contribution:I

    return-void

    :cond_0
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;->ListInProfile:Z

    goto :goto_0
.end method
