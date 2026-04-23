.class public Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;
.super Ljava/lang/Object;


# instance fields
.field private groupID:Ljava/util/UUID;

.field private requestID:Ljava/util/UUID;

.field private roleID:Ljava/util/UUID;

.field private userID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->groupID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->requestID:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->roleID:Ljava/util/UUID;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->userID:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public getGroupID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->groupID:Ljava/util/UUID;

    return-object v0
.end method

.method public getRequestID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->requestID:Ljava/util/UUID;

    return-object v0
.end method

.method public getRoleID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->roleID:Ljava/util/UUID;

    return-object v0
.end method

.method public getUserID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->userID:Ljava/util/UUID;

    return-object v0
.end method

.method public setGroupID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->groupID:Ljava/util/UUID;

    return-void
.end method

.method public setRequestID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->requestID:Ljava/util/UUID;

    return-void
.end method

.method public setRoleID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->roleID:Ljava/util/UUID;

    return-void
.end method

.method public setUserID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMember;->userID:Ljava/util/UUID;

    return-void
.end method
