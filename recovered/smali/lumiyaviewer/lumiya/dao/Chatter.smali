.class public Lcom/lumiyaviewer/lumiya/dao/Chatter;
.super Ljava/lang/Object;


# instance fields
.field private active:Z

.field private id:Ljava/lang/Long;

.field private lastMessageID:Ljava/lang/Long;

.field private lastSessionID:Ljava/util/UUID;

.field private muted:Z

.field private type:I

.field private unreadCount:I

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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;ILjava/util/UUID;ZZILjava/lang/Long;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->id:Ljava/lang/Long;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->type:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->uuid:Ljava/util/UUID;

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->active:Z

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->muted:Z

    iput p6, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->unreadCount:I

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->lastMessageID:Ljava/lang/Long;

    iput-object p8, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->lastSessionID:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public getActive()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->active:Z

    return v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getLastMessageID()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->lastMessageID:Ljava/lang/Long;

    return-object v0
.end method

.method public getLastSessionID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->lastSessionID:Ljava/util/UUID;

    return-object v0
.end method

.method public getMuted()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->muted:Z

    return v0
.end method

.method public getType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->type:I

    return v0
.end method

.method public getUnreadCount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->unreadCount:I

    return v0
.end method

.method public getUuid()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public setActive(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->active:Z

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->id:Ljava/lang/Long;

    return-void
.end method

.method public setLastMessageID(Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->lastMessageID:Ljava/lang/Long;

    return-void
.end method

.method public setLastSessionID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->lastSessionID:Ljava/util/UUID;

    return-void
.end method

.method public setMuted(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->muted:Z

    return-void
.end method

.method public setType(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->type:I

    return-void
.end method

.method public setUnreadCount(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->unreadCount:I

    return-void
.end method

.method public setUuid(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Chatter;->uuid:Ljava/util/UUID;

    return-void
.end method
