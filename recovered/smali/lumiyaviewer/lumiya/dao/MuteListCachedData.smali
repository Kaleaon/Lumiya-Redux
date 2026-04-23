.class public Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;
.super Ljava/lang/Object;


# instance fields
.field private CRC:I

.field private data:[B

.field private id:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;I[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->id:Ljava/lang/Long;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->CRC:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->data:[B

    return-void
.end method


# virtual methods
.method public getCRC()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->CRC:I

    return v0
.end method

.method public getData()[B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->data:[B

    return-object v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public setCRC(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->CRC:I

    return-void
.end method

.method public setData([B)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->data:[B

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MuteListCachedData;->id:Ljava/lang/Long;

    return-void
.end method
