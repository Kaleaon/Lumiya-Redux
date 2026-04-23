.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;
.super Ljava/lang/Object;


# instance fields
.field protected indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

.field protected numFaces:I

.field protected numVertices:I

.field protected position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field protected referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

.field protected rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field protected scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field protected texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

.field protected vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numVertices:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->numVertices:I

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->numFaces:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->numFaces:I

    new-instance v0, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    return-void
.end method


# virtual methods
.method public initFromReference()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->vertexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyFrom(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->texCoordsBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyFrom(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;->referenceData:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->indexBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->copyFrom(ILcom/lumiyaviewer/rawbuffers/DirectByteBuffer;II)V

    return-void
.end method
