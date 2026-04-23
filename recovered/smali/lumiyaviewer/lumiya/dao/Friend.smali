.class public Lcom/lumiyaviewer/lumiya/dao/Friend;
.super Ljava/lang/Object;


# static fields
.field public static final GRANT_MAP_LOCATION:I = 0x2

.field public static final GRANT_MODIFY_OBJECTS:I = 0x4

.field public static final GRANT_ONLINE_STATUS:I = 0x1


# instance fields
.field private isOnline:Z

.field private rightsGiven:I

.field private rightsHas:I

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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->uuid:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;IIZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->uuid:Ljava/util/UUID;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->rightsGiven:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->rightsHas:I

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->isOnline:Z

    return-void
.end method


# virtual methods
.method public getIsOnline()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->isOnline:Z

    return v0
.end method

.method public getRightsGiven()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->rightsGiven:I

    return v0
.end method

.method public getRightsHas()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->rightsHas:I

    return v0
.end method

.method public getUuid()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public setIsOnline(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->isOnline:Z

    return-void
.end method

.method public setRightsGiven(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->rightsGiven:I

    return-void
.end method

.method public setRightsHas(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->rightsHas:I

    return-void
.end method

.method public setUuid(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/Friend;->uuid:Ljava/util/UUID;

    return-void
.end method
