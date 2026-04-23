.class public Lcom/lumiyaviewer/lumiya/dao/GroupMember;
.super Ljava/lang/Object;


# instance fields
.field private agentPowers:J

.field private contribution:I

.field private groupID:Ljava/util/UUID;

.field private isOwner:Z

.field private onlineStatus:Ljava/lang/String;

.field private requestID:Ljava/util/UUID;

.field private title:Ljava/lang/String;

.field private userID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;ILjava/lang/String;JLjava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->groupID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->requestID:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->userID:Ljava/util/UUID;

    iput p4, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->contribution:I

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->onlineStatus:Ljava/lang/String;

    iput-wide p6, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->agentPowers:J

    iput-object p8, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->title:Ljava/lang/String;

    iput-boolean p9, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->isOwner:Z

    return-void
.end method


# virtual methods
.method public getAgentPowers()J
    .locals 2

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->agentPowers:J

    return-wide v0
.end method

.method public getContribution()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->contribution:I

    return v0
.end method

.method public getGroupID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->groupID:Ljava/util/UUID;

    return-object v0
.end method

.method public getIsOwner()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->isOwner:Z

    return v0
.end method

.method public getOnlineStatus()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->onlineStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->requestID:Ljava/util/UUID;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getUserID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->userID:Ljava/util/UUID;

    return-object v0
.end method

.method public setAgentPowers(J)V
    .locals 1

    iput-wide p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->agentPowers:J

    return-void
.end method

.method public setContribution(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->contribution:I

    return-void
.end method

.method public setGroupID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->groupID:Ljava/util/UUID;

    return-void
.end method

.method public setIsOwner(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->isOwner:Z

    return-void
.end method

.method public setOnlineStatus(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->onlineStatus:Ljava/lang/String;

    return-void
.end method

.method public setRequestID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->requestID:Ljava/util/UUID;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->title:Ljava/lang/String;

    return-void
.end method

.method public setUserID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupMember;->userID:Ljava/util/UUID;

    return-void
.end method
