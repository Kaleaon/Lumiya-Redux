.class public Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;
.super Ljava/lang/Object;


# instance fields
.field public Normal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

.field public Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

.field public TexCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static LerpPlanarVertex(Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;FF)Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;
    .locals 5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->mul(F)V

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    move-result-object v1

    invoke-virtual {v1, p4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->mul(F)V

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;-><init>()V

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Normal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    if-eqz v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Normal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-direct {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->Normal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    :cond_0
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->TexCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->TexCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-result-object v1

    invoke-virtual {v1, p3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->mul(F)V

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->TexCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->TexCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    move-result-object v2

    invoke-virtual {v2, p4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->mul(F)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->TexCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    invoke-direct {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    invoke-virtual {v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    iput-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/VertexData;->TexCoord:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;

    return-object v0
.end method
