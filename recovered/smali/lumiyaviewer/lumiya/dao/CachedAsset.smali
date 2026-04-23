.class public Lcom/lumiyaviewer/lumiya/dao/CachedAsset;
.super Ljava/lang/Object;


# instance fields
.field private data:[B

.field private key:Ljava/lang/String;

.field private mustRevalidate:Z

.field private status:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->key:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I[BZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->key:Ljava/lang/String;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->status:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->data:[B

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->mustRevalidate:Z

    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->data:[B

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getMustRevalidate()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->mustRevalidate:Z

    return v0
.end method

.method public getStatus()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->status:I

    return v0
.end method

.method public setData([B)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->data:[B

    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->key:Ljava/lang/String;

    return-void
.end method

.method public setMustRevalidate(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->mustRevalidate:Z

    return-void
.end method

.method public setStatus(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/CachedAsset;->status:I

    return-void
.end method
