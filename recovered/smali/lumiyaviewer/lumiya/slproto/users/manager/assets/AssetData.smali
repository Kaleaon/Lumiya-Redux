.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;
.super Ljava/lang/Object;


# instance fields
.field private final data:[B

.field private final status:I


# direct methods
.method public constructor <init>(I[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->status:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->data:[B

    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->data:[B

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/assets/AssetData;->status:I

    return v0
.end method
