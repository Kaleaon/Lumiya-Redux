.class Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AnimationJointSet"
.end annotation


# instance fields
.field private final animLength:F

.field private final animationUUID:Ljava/util/UUID;

.field private final jointAnims:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;",
            ">;"
        }
    .end annotation
.end field

.field private final priority:I


# direct methods
.method private constructor <init>(Ljava/util/UUID;FI)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->animationUUID:Ljava/util/UUID;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->animLength:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->priority:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/UUID;FILcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;-><init>(Ljava/util/UUID;FI)V

    return-void
.end method


# virtual methods
.method addJointData(ILcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method animate(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;[F[F[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 15

    move-object/from16 v0, p2

    iget v4, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->inAnimationTime:F

    move-object/from16 v0, p2

    iget v1, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->inFactor:F

    move-object/from16 v0, p2

    iget v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->outFactor:F

    mul-float v8, v1, v2

    const/4 v1, 0x0

    cmpl-float v1, v8, v1

    if-lez v1, :cond_0

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v14

    const/4 v1, 0x0

    move v13, v1

    :goto_0
    if-ge v13, v14, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    invoke-virtual {v1, v13}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    invoke-virtual {v1, v13}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->getAnimatedBone(I)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-result-object v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->animLength:F

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    invoke-virtual/range {v1 .. v12}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->animate(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;FF[Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;[Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;IF[F[FLcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v1, v13, 0x1

    move v13, v1

    goto :goto_0

    :cond_0
    return-void
.end method

.method dumpJoints()V
    .locals 9

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v2, 0x0

    const-string/jumbo v0, "Anim -- joint set -- length %f prio %d joints %d"

    new-array v1, v8, [Ljava/lang/Object;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->animLength:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->priority:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v7

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    move v1, v2

    :goto_0
    if-ge v1, v3, :cond_0

    const-string/jumbo v4, "Anim -- joint[%d] - jointIndex %d, %s"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->jointAnims:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v5, v7

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getPriority()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->priority:I

    return v0
.end method
