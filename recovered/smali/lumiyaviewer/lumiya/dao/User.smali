.class public Lcom/lumiyaviewer/lumiya/dao/User;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;


# instance fields
.field private badUUID:Z

.field private displayName:Ljava/lang/String;

.field private id:Ljava/lang/Long;

.field private isFriend:Z

.field private rightsGiven:I

.field private rightsHas:I

.field private userName:Ljava/lang/String;

.field private uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;ZZII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->id:Ljava/lang/Long;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/dao/User;->uuid:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/User;->userName:Ljava/lang/String;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/dao/User;->displayName:Ljava/lang/String;

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/dao/User;->badUUID:Z

    iput-boolean p6, p0, Lcom/lumiyaviewer/lumiya/dao/User;->isFriend:Z

    iput p7, p0, Lcom/lumiyaviewer/lumiya/dao/User;->rightsGiven:I

    iput p8, p0, Lcom/lumiyaviewer/lumiya/dao/User;->rightsHas:I

    return-void
.end method


# virtual methods
.method public buildView(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->displayName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setLabel(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Lcom/lumiyaviewer/lumiya/dao/User;->getChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->displayName:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterItemViewBuilder;->setThumbnailChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    return-void
.end method

.method public getBadUUID()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->badUUID:Z

    return v0
.end method

.method public getChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->uuid:Ljava/util/UUID;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getIsFriend()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->isFriend:Z

    return v0
.end method

.method public getRightsGiven()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->rightsGiven:I

    return v0
.end method

.method public getRightsHas()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->rightsHas:I

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public getUuid()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public nameNeedsFetching()Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->userName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->displayName:Ljava/lang/String;

    if-nez v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/User;->badUUID:Z

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setBadUUID(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->badUUID:Z

    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->displayName:Ljava/lang/String;

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->id:Ljava/lang/Long;

    return-void
.end method

.method public setIsFriend(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->isFriend:Z

    return-void
.end method

.method public setRightsGiven(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->rightsGiven:I

    return-void
.end method

.method public setRightsHas(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->rightsHas:I

    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->userName:Ljava/lang/String;

    return-void
.end method

.method public setUuid(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/User;->uuid:Ljava/util/UUID;

    return-void
.end method
