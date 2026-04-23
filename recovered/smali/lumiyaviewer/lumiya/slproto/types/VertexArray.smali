.class public Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;
.super Ljava/lang/Object;


# instance fields
.field private normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

.field private texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

.field private vertexAndNormalsData:Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;

.field private vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;


# direct methods
.method public constructor <init>(I)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;-><init>(II)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertexAndNormalsData:Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertexAndNormalsData:Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertexAndNormalsData:Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    return-void
.end method


# virtual methods
.method public LerpPlanarVertex(ILcom/lumiyaviewer/lumiya/slproto/types/VertexArray;ILcom/lumiyaviewer/lumiya/slproto/types/VertexArray;ILcom/lumiyaviewer/lumiya/slproto/types/VertexArray;IFFLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V
    .locals 5

    iget-object v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v2, p5, v3, p3, p10}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getSub(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {p10, p8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    iget-object v2, p6, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v0, p11

    invoke-virtual {v2, p7, v3, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getSub(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p11

    invoke-virtual {v0, p9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    move-object/from16 v0, p11

    invoke-virtual {v0, p10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v0, p11

    invoke-virtual {v2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->addToVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object/from16 v0, p11

    invoke-virtual {v2, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v2, p1, v3, p3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;I)V

    iget-object v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    move-object/from16 v0, p12

    invoke-virtual {v2, p5, v3, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->getSub(ILcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    move-object/from16 v0, p12

    invoke-virtual {v0, p8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->mul(F)V

    iget-object v2, p6, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    iget-object v3, p2, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    move-object/from16 v0, p13

    invoke-virtual {v2, p7, v3, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->getSub(ILcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    move-object/from16 v0, p13

    invoke-virtual {v0, p9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->mul(F)V

    move-object/from16 v0, p13

    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    move-object/from16 v0, p13

    invoke-virtual {v2, p3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->addToVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector2;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    move-object/from16 v0, p13

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->x:F

    move-object/from16 v0, p13

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector2;->y:F

    invoke-virtual {v2, p1, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->set(IFF)V

    return-void
.end method

.method public getData()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertexAndNormalsData:Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->getData()[F

    move-result-object v0

    return-object v0
.end method

.method public getLength()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertexAndNormalsData:Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->getLength()I

    move-result v0

    return v0
.end method

.method public getNormals()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->normals:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    return-object v0
.end method

.method public getTexCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    return-object v0
.end method

.method public getTexCoordsData()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->texCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector2Array;->getData()[F

    move-result-object v0

    return-object v0
.end method

.method public getVertices()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VertexArray;->vertices:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    return-object v0
.end method
