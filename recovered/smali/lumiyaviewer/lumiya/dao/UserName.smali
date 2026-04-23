.class public Lcom/lumiyaviewer/lumiya/dao/UserName;
.super Ljava/lang/Object;


# instance fields
.field private displayName:Ljava/lang/String;

.field private isBadUUID:Z

.field private userName:Ljava/lang/String;

.field private uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->uuid:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->uuid:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->isBadUUID:Z

    return-void
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getIsBadUUID()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->isBadUUID:Z

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public getUuid()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public isComplete()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->isBadUUID:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public mergeWith(Lcom/lumiyaviewer/lumiya/dao/UserName;)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/dao/UserName;->isBadUUID:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->isBadUUID:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->isBadUUID:Z

    return v1

    :cond_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->isBadUUID:Z

    if-eqz v2, :cond_1

    return v0

    :cond_1
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    move v0, v1

    :cond_2
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    move v0, v1

    :cond_3
    return v0
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->displayName:Ljava/lang/String;

    return-void
.end method

.method public setIsBadUUID(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->isBadUUID:Z

    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->userName:Ljava/lang/String;

    return-void
.end method

.method public setUuid(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserName;->uuid:Ljava/util/UUID;

    return-void
.end method
