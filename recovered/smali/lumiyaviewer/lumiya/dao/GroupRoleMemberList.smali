.class public Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;
.super Ljava/lang/Object;


# instance fields
.field private groupID:Ljava/util/UUID;

.field private mustRevalidate:Z

.field private requestID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->groupID:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/util/UUID;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->groupID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->requestID:Ljava/util/UUID;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->mustRevalidate:Z

    return-void
.end method


# virtual methods
.method public getGroupID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->groupID:Ljava/util/UUID;

    return-object v0
.end method

.method public getMustRevalidate()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->mustRevalidate:Z

    return v0
.end method

.method public getRequestID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->requestID:Ljava/util/UUID;

    return-object v0
.end method

.method public setGroupID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->groupID:Ljava/util/UUID;

    return-void
.end method

.method public setMustRevalidate(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->mustRevalidate:Z

    return-void
.end method

.method public setRequestID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberList;->requestID:Ljava/util/UUID;

    return-void
.end method
