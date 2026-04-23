.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;
    }
.end annotation


# static fields
.field private static final FLEXIBLE_OBJECT_MAX_INTERNAL_TENSION_FORCE:F = 0.99f

.field private static final MIN_UPDATE_INTERVAL:J = 0xc8L


# instance fields
.field private NumSections:I

.field private lastUpdateMillis:J

.field private volatile needVertexBufferUpdate:Z

.field private sectionData:[F

.field private sectionMatrices:[F

.field private sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

.field private vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->needVertexBufferUpdate:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    return-void
.end method


# virtual methods
.method public doFlexibleUpdate(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;[FIFFF)Z
    .locals 18

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->lastUpdateMillis:J

    const-wide/16 v6, 0xc8

    add-long/2addr v4, v6

    cmp-long v4, v2, v4

    if-gez v4, :cond_0

    const/4 v2, 0x0

    return v2

    :cond_0
    move-object/from16 v0, p1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    if-eq v4, v5, :cond_1

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionData:[F

    move-object/from16 v0, p1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    move-object/from16 v0, p0

    iput v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    :cond_1
    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    if-nez v4, :cond_2

    const/4 v2, 0x0

    return v2

    :cond_2
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->lastUpdateMillis:J

    sub-long v4, v2, v4

    long-to-float v4, v4

    const/high16 v5, 0x447a0000    # 1000.0f

    div-float/2addr v4, v5

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->lastUpdateMillis:J

    const/high16 v2, 0x40a00000    # 5.0f

    mul-float v10, v4, v2

    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionData:[F

    if-nez v2, :cond_3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getFlexiDataSize(I)I

    move-result v2

    new-array v2, v2, [F

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionData:[F

    move-object/from16 v0, p0

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    mul-int/lit8 v2, v2, 0x10

    new-array v2, v2, [F

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    const/16 v17, 0x1

    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionData:[F

    move-object/from16 v0, p0

    iget v3, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    move-object/from16 v0, p1

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Tension:F

    move-object/from16 v0, p1

    iget v12, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->AirFriction:F

    move-object/from16 v0, p1

    iget v13, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Gravity:F

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v14, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v15, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    move/from16 v16, v0

    move-object/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-static/range {v2 .. v17}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->calcFlexiSections([FI[F[FIFFFFFFFFFFZ)V

    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->needVertexBufferUpdate:Z

    const/4 v2, 0x1

    return v2
.end method

.method public doFlexibleUpdateSlow(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;[FIFFF)Z
    .locals 24

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->lastUpdateMillis:J

    const-wide/16 v8, 0xc8

    add-long/2addr v6, v8

    cmp-long v6, v4, v6

    if-gez v6, :cond_0

    const/4 v4, 0x0

    return v4

    :cond_0
    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v6, p3, 0xc

    aget v6, p2, v6

    add-int/lit8 v7, p3, 0xd

    aget v7, p2, v7

    add-int/lit8 v8, p3, 0xe

    aget v8, p2, v8

    invoke-direct {v10, v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move/from16 v0, p4

    move/from16 v1, p5

    move/from16 v2, p6

    invoke-direct {v13, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v6, 0x20

    new-array v6, v6, [F

    const/4 v7, 0x0

    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-static {v6, v7, v0, v1}, Landroid/opengl/Matrix;->invertM([FI[FI)Z

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v14, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>([F)V

    move-object/from16 v0, p1

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    if-eq v6, v7, :cond_1

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    move-object/from16 v0, p1

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->NumFlexiSections:I

    move-object/from16 v0, p0

    iput v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    :cond_1
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    if-nez v6, :cond_2

    const/4 v4, 0x0

    return v4

    :cond_2
    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->lastUpdateMillis:J

    sub-long v6, v4, v6

    long-to-float v6, v6

    const/high16 v7, 0x447a0000    # 1000.0f

    div-float/2addr v6, v7

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->lastUpdateMillis:J

    const/high16 v4, 0x40a00000    # 5.0f

    mul-float/2addr v6, v4

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v7, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z_axis:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget v4, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    move-object/from16 v0, p0

    iget v8, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    int-to-float v8, v8

    div-float v8, v4, v8

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget v9, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v9, v11

    invoke-virtual {v4, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    invoke-static {v10, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    if-nez v4, :cond_3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    new-array v4, v4, [Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    const/4 v4, 0x0

    :goto_0
    move-object/from16 v0, p0

    iget v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    if-ge v4, v11, :cond_3

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    const/4 v15, 0x0

    invoke-direct {v12, v15}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;-><init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;)V

    aput-object v12, v11, v4

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v11, v11, v4

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v12, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iput-object v12, v11, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v11, v11, v4

    iget-object v11, v11, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    int-to-float v12, v4

    mul-float/2addr v12, v8

    invoke-virtual {v11, v5, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v11, v11, v4

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v12, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iput-object v12, v11, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v11, v11, v4

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v12, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iput-object v12, v11, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v11, v11, v4

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v12, v11, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    const/4 v11, 0x0

    aget-object v4, v4, v11

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v4, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    const/4 v9, 0x0

    aget-object v4, v4, v9

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {v4, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    move-object/from16 v0, p1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Tension:F

    const v5, 0x3dcccccd    # 0.1f

    mul-float/2addr v4, v5

    float-to-double v0, v6

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x403e000000000000L    # 30.0

    mul-double v16, v16, v18

    const-wide v18, 0x3feb333333333333L    # 0.85

    move-wide/from16 v0, v18

    move-wide/from16 v2, v16

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-float v5, v0

    const/high16 v9, 0x3f800000    # 1.0f

    sub-float v5, v9, v5

    mul-float/2addr v4, v5

    const v5, 0x3f7d70a4    # 0.99f

    cmpl-float v5, v4, v5

    if-lez v5, :cond_4

    const v4, 0x3f7d70a4    # 0.99f

    :cond_4
    move-object/from16 v0, p1

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->AirFriction:F

    const/high16 v9, 0x40000000    # 2.0f

    mul-float/2addr v5, v9

    const/high16 v9, 0x3f800000    # 1.0f

    add-float/2addr v5, v9

    mul-float/2addr v5, v6

    float-to-double v0, v5

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4024000000000000L    # 10.0

    move-wide/from16 v0, v18

    move-wide/from16 v2, v16

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-float v5, v0

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v9, v5, v9

    if-lez v9, :cond_a

    :goto_1
    const/high16 v9, 0x3f800000    # 1.0f

    div-float/2addr v9, v5

    const/high16 v5, 0x40000000    # 2.0f

    mul-float/2addr v5, v8

    float-to-double v0, v5

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->atan(D)D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-float v11, v0

    mul-float v12, v8, v6

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v15}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct/range {v16 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct/range {v17 .. v17}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    new-instance v18, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct/range {v18 .. v18}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    new-instance v19, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    const/4 v5, 0x1

    :goto_2
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    if-ge v5, v6, :cond_d

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v15, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    move/from16 v20, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->Gravity:F

    move/from16 v21, v0

    mul-float v21, v21, v12

    sub-float v20, v20, v21

    move/from16 v0, v20

    iput v0, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleParams;->UserForce:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v6, v0, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    add-int/lit8 v20, v5, -0x1

    aget-object v6, v6, v20

    iget-object v0, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    add-int/lit8 v21, v5, -0x1

    aget-object v6, v6, v21

    iget-object v0, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v21, v0

    const/4 v6, 0x1

    if-ne v5, v6, :cond_b

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    const/16 v22, 0x0

    aget-object v6, v6, v22

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v22, v0

    aget-object v22, v22, v5

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v22

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, v23

    invoke-direct {v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(F)V

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->sub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, v23

    invoke-virtual {v6, v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v22, v0

    aget-object v22, v22, v5

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v6, v0, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v22, v0

    aget-object v22, v22, v5

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setSub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, v21

    invoke-static {v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->shortestArc(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getAngleAxis(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)F

    move-result v6

    const v23, 0x40490fdb    # (float)Math.PI

    cmpl-float v23, v6, v23

    if-lez v23, :cond_5

    const v23, 0x40c90fdb

    sub-float v6, v6, v23

    :cond_5
    const v23, -0x3fb6f025

    cmpg-float v23, v6, v23

    if-gez v23, :cond_6

    const v23, 0x40c90fdb

    add-float v6, v6, v23

    :cond_6
    cmpl-float v23, v6, v11

    if-lez v23, :cond_c

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v11, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    :cond_7
    :goto_4
    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v7, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v23, v0

    aget-object v23, v23, v5

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v21, v0

    aget-object v21, v21, v5

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v21, v0

    aget-object v21, v21, v5

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v20, v0

    aget-object v20, v20, v5

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v21, v0

    aget-object v21, v21, v5

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;F)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v20, v0

    aget-object v20, v20, v5

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v20, 0x1

    move/from16 v0, v20

    if-le v5, v0, :cond_8

    const/high16 v20, 0x40000000    # 2.0f

    div-float v6, v6, v20

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v6, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    add-int/lit8 v20, v5, -0x1

    aget-object v6, v6, v20

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v6, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setMul(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    add-int/lit8 v20, v5, -0x1

    aget-object v6, v6, v20

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    :cond_8
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    move-object/from16 v20, v0

    aget-object v20, v20, v5

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v6, v0, v15}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->setSub(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->magVecSquared()F

    move-result v6

    const/high16 v20, 0x3f800000    # 1.0f

    cmpl-float v6, v6, v20

    if-lez v6, :cond_9

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v5

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->normVec()F

    :cond_9
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_2

    :cond_a
    const/high16 v5, 0x3f800000    # 1.0f

    goto/16 :goto_1

    :cond_b
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    add-int/lit8 v22, v5, -0x2

    aget-object v6, v6, v22

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Direction:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    goto/16 :goto_3

    :cond_c
    neg-float v0, v11

    move/from16 v23, v0

    cmpg-float v23, v6, v23

    if-gez v23, :cond_7

    neg-float v0, v11

    move/from16 v23, v0

    move-object/from16 v0, v22

    move/from16 v1, v23

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setQuat(FLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    goto/16 :goto_4

    :cond_d
    const/16 v4, 0x20

    new-array v4, v4, [F

    const/16 v5, 0x10

    invoke-static {v4, v5}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget v5, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/high16 v6, 0x3f800000    # 1.0f

    div-float v5, v6, v5

    iget v6, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    const/high16 v7, 0x3f800000    # 1.0f

    div-float v6, v7, v6

    iget v7, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/high16 v8, 0x3f800000    # 1.0f

    div-float v7, v8, v7

    const/16 v8, 0x10

    invoke-static {v4, v8, v5, v6, v7}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    invoke-virtual {v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getMatrix()[F

    move-result-object v8

    const/4 v5, 0x0

    const/16 v7, 0x10

    const/4 v9, 0x0

    move-object v6, v4

    invoke-static/range {v4 .. v9}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    iget v5, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    neg-float v5, v5

    iget v6, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    neg-float v6, v6

    iget v7, v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    neg-float v7, v7

    const/4 v8, 0x0

    invoke-static {v4, v8, v5, v6, v7}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    if-nez v5, :cond_e

    move-object/from16 v0, p0

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    mul-int/lit8 v5, v5, 0x10

    new-array v5, v5, [F

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    :cond_e
    const/16 v5, 0x8

    new-array v5, v5, [F

    const/4 v6, 0x0

    move v12, v6

    :goto_5
    move-object/from16 v0, p0

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    if-ge v12, v6, :cond_f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v12

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/4 v7, 0x0

    aput v6, v5, v7

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v12

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    const/4 v7, 0x1

    aput v6, v5, v7

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v6, v6, v12

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/4 v7, 0x2

    aput v6, v5, v7

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x3

    aput v6, v5, v7

    const/4 v6, 0x4

    const/4 v8, 0x0

    const/4 v10, 0x0

    move-object v7, v4

    move-object v9, v5

    invoke-static/range {v5 .. v10}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    int-to-float v6, v12

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->NumSections:I

    int-to-float v7, v7

    div-float/2addr v6, v7

    const/high16 v7, 0x3f000000    # 0.5f

    sub-float v15, v6, v7

    const/16 v6, 0x20

    new-array v6, v6, [F

    const/16 v7, 0x10

    invoke-static {v6, v7}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    const/4 v7, 0x4

    aget v7, v5, v7

    const/4 v8, 0x5

    aget v8, v5, v8

    const/4 v9, 0x6

    aget v9, v5, v9

    sub-float/2addr v9, v15

    const/16 v10, 0x10

    invoke-static {v6, v10, v7, v8, v9}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    const/16 v7, 0x10

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v6, v7, v8, v9, v15}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    iget v7, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    const/high16 v8, 0x3f800000    # 1.0f

    div-float v7, v8, v7

    iget v8, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    const/high16 v9, 0x3f800000    # 1.0f

    div-float v8, v9, v8

    iget v9, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/high16 v10, 0x3f800000    # 1.0f

    div-float v9, v10, v9

    const/16 v10, 0x10

    invoke-static {v6, v10, v7, v8, v9}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    invoke-virtual {v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getMatrix()[F

    move-result-object v10

    const/4 v7, 0x0

    const/16 v9, 0x10

    const/4 v11, 0x0

    move-object v8, v6

    invoke-static/range {v6 .. v11}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sections:[Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;

    aget-object v7, v7, v12

    iget-object v7, v7, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo$FlexibleSection;->Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getInverseMatrix()[F

    move-result-object v10

    const/16 v7, 0x10

    const/4 v9, 0x0

    const/4 v11, 0x0

    move-object v8, v6

    invoke-static/range {v6 .. v11}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    iget v7, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v8, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v9, v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    const/16 v10, 0x10

    invoke-static {v6, v10, v7, v8, v9}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    neg-float v7, v15

    const/16 v8, 0x10

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {v6, v8, v9, v10, v7}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    mul-int/lit8 v8, v12, 0x10

    const/16 v9, 0x10

    const/16 v10, 0x10

    invoke-static {v6, v9, v7, v8, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v6, v12, 0x1

    move v12, v6

    goto/16 :goto_5

    :cond_f
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->needVertexBufferUpdate:Z

    const/4 v4, 0x1

    return v4
.end method

.method public getFlexedVertexBuffer(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;I)Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->needVertexBufferUpdate:Z

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getRawBuffer()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-nez v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-direct {v2, v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;-><init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->getRawBuffer()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    invoke-static {v1, v0, p3, v2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->applyFlexibleMorph(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I[F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->Reload(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->needVertexBufferUpdate:Z

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->vertexBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;

    return-object v0

    :cond_2
    return-object p2
.end method

.method public getMatrices()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimFlexibleInfo;->sectionMatrices:[F

    return-object v0
.end method
