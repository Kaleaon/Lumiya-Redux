.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;
.super Ljava/lang/Object;


# instance fields
.field private final basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public final boneID:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

.field private final boneIndex:I

.field private final childBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

.field private final collisionVolumes:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

.field private final defaultBasePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private globalBaseX:F

.field private globalBaseY:F

.field private globalBaseZ:F

.field private final globalMatrix:[F

.field private final offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

.field private final scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private final tempMatrix:[F

.field private final usePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V
    .locals 7

    const/16 v2, 0x10

    const/4 v1, 0x0

    const/4 v6, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalMatrix:[F

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->tempMatrix:[F

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneID:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->ordinal()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneIndex:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, p3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->defaultBasePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2, v5, v5, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->childBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->collisionVolumes:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->isJoint:Z

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    :cond_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->usePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseX:F

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseY:F

    iput v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseZ:F

    if-eqz p4, :cond_1

    array-length v2, p4

    move v0, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, p4, v0

    iput-object p0, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    if-eqz p5, :cond_2

    array-length v2, p5

    move v0, v1

    :goto_1
    if-ge v0, v2, :cond_2

    aget-object v1, p5, v0

    iput-object p0, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method


# virtual methods
.method deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method public deformHierarchy(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->add(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mul(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->collisionVolumes:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->collisionVolumes:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v0, 0x0

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    invoke-virtual {v3, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getBasePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    return-object v0
.end method

.method public getGlobalMatrix()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalMatrix:[F

    return-object v0
.end method

.method public getPositionX()F
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getPositionY()F
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getPositionZ()F
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getScaleX()F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    return v0
.end method

.method public getScaleY()F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    return v0
.end method

.method public getScaleZ()F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return v0
.end method

.method prepareSkeleton([Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;I)I
    .locals 6

    const/4 v1, 0x0

    add-int/lit8 v0, p2, 0x1

    aput-object p0, p1, p2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->defaultBasePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseX:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->defaultBasePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseY:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->defaultBasePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseZ:F

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->childBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v2, :cond_1

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->childBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    array-length v5, v4

    move v2, v1

    :goto_1
    if-ge v2, v5, :cond_1

    aget-object v3, v4, v2

    invoke-virtual {v3, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->prepareSkeleton([Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;I)I

    move-result v3

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    move v0, v3

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseX:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->defaultBasePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v2, v3

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseX:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseY:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->defaultBasePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v2, v3

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseY:F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseZ:F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->defaultBasePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v2, v3

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseZ:F

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->collisionVolumes:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v2, :cond_2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->collisionVolumes:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    array-length v4, v3

    :goto_2
    if-ge v1, v4, :cond_2

    aget-object v2, v3, v1

    invoke-virtual {v2, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->prepareSkeleton([Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;I)I

    move-result v2

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move v0, v2

    goto :goto_2

    :cond_2
    return v0
.end method

.method setPositionOverride(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->basePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    return-void
.end method

.method final updateGlobalPos(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;[F[F)V
    .locals 10

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneID:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    iget v7, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->animatedIndex:I

    mul-int/lit8 v4, v7, 0x4

    mul-int/lit8 v8, v7, 0x10

    if-ltz v7, :cond_1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->getAnimOffsets()[F

    move-result-object v5

    add-int/lit8 v2, v4, 0x3

    aget v6, v5, v2

    cmpl-float v2, v6, v0

    if-lez v2, :cond_0

    aget v0, v5, v4

    mul-float v3, v6, v0

    add-int/lit8 v0, v4, 0x1

    aget v0, v5, v0

    mul-float v2, v6, v0

    add-int/lit8 v0, v4, 0x2

    aget v0, v5, v0

    mul-float/2addr v0, v6

    move v5, v2

    move v4, v3

    move v3, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->tempMatrix:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalMatrix:[F

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->usePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v9, v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    mul-float/2addr v6, v9

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v6, v9

    add-float/2addr v4, v6

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->usePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v9, v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    mul-float/2addr v6, v9

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v6, v9

    add-float/2addr v5, v6

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->usePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->parent:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v9, v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    mul-float/2addr v6, v9

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v9, v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v6, v9

    add-float/2addr v6, v3

    move v3, v1

    invoke-static/range {v0 .. v6}, Landroid/opengl/Matrix;->translateM([FI[FIFFF)V

    :goto_1
    if-ltz v7, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalMatrix:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->tempMatrix:[F

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->getAnimMatrix()[F

    move-result-object v4

    move v3, v1

    move v5, v8

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    :goto_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneIndex:I

    mul-int/lit8 v3, v0, 0x10

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalMatrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v7, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v8, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    move-object v2, p3

    move v5, v1

    invoke-static/range {v2 .. v8}, Landroid/opengl/Matrix;->scaleM([FI[FIFFF)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneIndex:I

    mul-int/lit8 v1, v0, 0x10

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->boneIndex:I

    mul-int/lit8 v3, v0, 0x10

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseX:F

    neg-float v4, v0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseY:F

    neg-float v5, v0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalBaseZ:F

    neg-float v6, v0

    move-object v0, p2

    move-object v2, p3

    invoke-static/range {v0 .. v6}, Landroid/opengl/Matrix;->translateM([FI[FIFFF)V

    return-void

    :cond_0
    move v3, v0

    move v5, v0

    move v4, v0

    goto/16 :goto_0

    :cond_1
    move v3, v0

    move v5, v0

    move v4, v0

    goto/16 :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->tempMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->tempMatrix:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->usePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    add-float/2addr v2, v6

    add-float/2addr v2, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->usePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    add-float/2addr v4, v6

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->usePosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    add-float/2addr v5, v6

    add-float/2addr v3, v5

    invoke-static {v0, v1, v2, v4, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->tempMatrix:[F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->globalMatrix:[F

    const/16 v3, 0x10

    invoke-static {v0, v1, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method
