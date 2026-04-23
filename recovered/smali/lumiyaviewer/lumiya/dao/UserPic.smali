.class public Lcom/lumiyaviewer/lumiya/dao/UserPic;
.super Ljava/lang/Object;


# instance fields
.field private bitmap:[B

.field private id:Ljava/lang/Long;

.field private uuid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/String;[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->id:Ljava/lang/Long;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->uuid:Ljava/lang/String;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->bitmap:[B

    return-void
.end method


# virtual methods
.method public getBitmap()[B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->bitmap:[B

    return-object v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getUuid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->uuid:Ljava/lang/String;

    return-object v0
.end method

.method public setBitmap([B)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->bitmap:[B

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->id:Ljava/lang/Long;

    return-void
.end method

.method public setUuid(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/UserPic;->uuid:Ljava/lang/String;

    return-void
.end method
