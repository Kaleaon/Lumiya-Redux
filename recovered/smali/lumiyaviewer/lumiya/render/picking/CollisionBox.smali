.class public Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox$InstanceHolder;
    }
.end annotation


# instance fields
.field public final vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method private constructor <init>()V
    .locals 15

    const/4 v14, 0x2

    const/4 v13, 0x1

    const/4 v1, 0x0

    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v2, -0x41000000    # -0.5f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x24

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object v0, p0

    move v3, v2

    move v5, v4

    move v6, v2

    move v7, v1

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->addCollisionFace(IFFFFFI)V

    move-object v5, p0

    move v6, v13

    move v7, v2

    move v8, v2

    move v9, v4

    move v10, v4

    move v11, v4

    move v12, v1

    invoke-direct/range {v5 .. v12}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->addCollisionFace(IFFFFFI)V

    move-object v0, p0

    move v1, v14

    move v3, v2

    move v5, v4

    move v6, v2

    move v7, v13

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->addCollisionFace(IFFFFFI)V

    const/4 v1, 0x3

    move-object v0, p0

    move v3, v2

    move v5, v4

    move v6, v4

    move v7, v13

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->addCollisionFace(IFFFFFI)V

    const/4 v1, 0x4

    move-object v0, p0

    move v3, v2

    move v5, v4

    move v6, v2

    move v7, v14

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->addCollisionFace(IFFFFFI)V

    const/4 v1, 0x5

    move-object v0, p0

    move v3, v2

    move v5, v4

    move v6, v4

    move v7, v14

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->addCollisionFace(IFFFFFI)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;-><init>()V

    return-void
.end method

.method private addCollisionFace(IFFFFFI)V
    .locals 8

    const/4 v7, 0x2

    const/4 v4, 0x0

    const/4 v6, 0x3

    const/4 v5, 0x1

    mul-int/lit8 v0, p1, 0x2

    mul-int/lit8 v0, v0, 0x3

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {p0, p2, p3, p6, p7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->getCollisionVertex(FFFI)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-direct {p0, p4, p3, p6, p7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->getCollisionVertex(FFFI)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-direct {p0, p4, p5, p6, p7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->getCollisionVertex(FFFI)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    aput-object v2, v1, v7

    invoke-direct {p0, p2, p5, p6, p7}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->getCollisionVertex(FFFI)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v3, v0, 0x0

    aget-object v4, v1, v4

    aput-object v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v3, v0, 0x1

    aget-object v4, v1, v5

    aput-object v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v3, v0, 0x2

    aget-object v4, v1, v6

    aput-object v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v3, v0, 0x3

    aget-object v4, v1, v5

    aput-object v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v3, v0, 0x4

    aget-object v4, v1, v7

    aput-object v4, v2, v3

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;->vertices:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    add-int/lit8 v0, v0, 0x5

    aget-object v1, v1, v6

    aput-object v1, v2, v0

    return-void
.end method

.method private getCollisionVertex(FFFI)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 1

    packed-switch p4, :pswitch_data_0

    const/4 v0, 0x0

    return-object v0

    :pswitch_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, p3, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v0

    :pswitch_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, p1, p3, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v0

    :pswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/render/picking/CollisionBox;

    move-result-object v0

    return-object v0
.end method
