.class public Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;
.super Ljava/lang/Object;


# static fields
.field private static final numAnimatedBones:I = 0x85


# instance fields
.field private animMatrix:[F

.field private animMatrix_Swap:[F

.field private animOffsets:[F

.field private animOffsets_Swap:[F

.field private final animPosArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field private final animPriorityPosArray:[F

.field private final animPriorityRotArray:[F

.field private final animRotArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;


# direct methods
.method constructor <init>()V
    .locals 4

    const/16 v2, 0x850

    const/16 v1, 0x214

    const/16 v3, 0x85

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPriorityRotArray:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPriorityPosArray:[F

    new-array v0, v3, [Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animRotArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    new-array v0, v3, [Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPosArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix:[F

    new-array v0, v2, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix_Swap:[F

    new-array v0, v1, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets:[F

    new-array v0, v1, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets_Swap:[F

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix:[F

    mul-int/lit8 v2, v0, 0x10

    invoke-static {v1, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPosArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    aput-object v2, v1, v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animRotArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    return-void
.end method


# virtual methods
.method animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;)V
    .locals 9

    const/16 v8, 0x85

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPriorityRotArray:[F

    invoke-static {v0, v7}, Ljava/util/Arrays;->fill([FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPriorityPosArray:[F

    invoke-static {v0, v7}, Ljava/util/Arrays;->fill([FF)V

    move v0, v6

    :goto_0
    if-ge v0, v8, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animRotArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->setZero()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPosArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget-object v1, v1, v0

    invoke-virtual {v1, v2, v2, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPriorityRotArray:[F

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPriorityPosArray:[F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animRotArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPosArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-object v0, p2

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarAnimationList;->animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;[F[F[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move v0, v6

    :goto_1
    if-ge v0, v8, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animRotArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix_Swap:[F

    mul-int/lit8 v3, v0, 0x10

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getInverseMatrix([FI)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets_Swap:[F

    mul-int/lit8 v2, v0, 0x4

    add-int/lit8 v2, v2, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPosArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aput v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets_Swap:[F

    mul-int/lit8 v2, v0, 0x4

    add-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPosArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aput v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets_Swap:[F

    mul-int/lit8 v2, v0, 0x4

    add-int/lit8 v2, v2, 0x2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPosArray:[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aput v3, v1, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets_Swap:[F

    mul-int/lit8 v2, v0, 0x4

    add-int/lit8 v2, v2, 0x3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animPriorityPosArray:[F

    aget v3, v3, v0

    sub-float v3, v7, v3

    aput v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix:[F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix_Swap:[F

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix:[F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix_Swap:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets:[F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets_Swap:[F

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets:[F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets_Swap:[F

    return-void
.end method

.method public final getAnimMatrix()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animMatrix:[F

    return-object v0
.end method

.method public final getAnimOffsets()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;->animOffsets:[F

    return-object v0
.end method
