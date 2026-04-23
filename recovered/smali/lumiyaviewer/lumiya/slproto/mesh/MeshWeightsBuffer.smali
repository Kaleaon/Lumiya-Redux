.class public Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;
.super Ljava/lang/Object;


# instance fields
.field public final jointIndexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    mul-int/lit8 v1, p1, 0x4

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;->jointIndexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    mul-int/lit8 v1, p1, 0x4

    mul-int/lit8 v1, v1, 0x4

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshWeightsBuffer;->weightsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    return-void
.end method
