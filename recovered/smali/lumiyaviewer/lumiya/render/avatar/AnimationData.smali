.class public Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;,
        Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;,
        Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationKeyframe;,
        Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationPosKeyframe;,
        Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationRotKeyframe;
    }
.end annotation


# static fields
.field private static final LL_MAX_PELVIS_OFFSET:F = 5.0f


# instance fields
.field private final animLength:F

.field private final animPriority:I

.field private final animationUUID:Ljava/util/UUID;

.field private final easeInTime:F

.field private final easeOutTime:F

.field private final expressionName:Ljava/lang/String;

.field private final handPose:I

.field private final inPoint:F

.field private final jointSets:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;",
            ">;"
        }
    .end annotation
.end field

.field private final loop:Z

.field private final outPoint:F


# direct methods
.method public constructor <init>(Ljava/util/UUID;Ljava/io/InputStream;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v8, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animationUUID:Ljava/util/UUID;

    new-instance v2, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;

    invoke-direct {v2, p2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v0, 0x4

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->skipBytes(I)I

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animPriority:I

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readZeroTerminatedString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->expressionName:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readInt()I

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->loop:Z

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeInTime:F

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeOutTime:F

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->handPose:I

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readInt()I

    move-result v3

    :goto_1
    if-ge v1, v3, :cond_3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;->readZeroTerminatedString()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->bones:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v4, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v4, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;

    iget v5, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    invoke-direct {v4, v2, v5}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;-><init>(Lcom/lumiyaviewer/lumiya/utils/LittleEndianDataInputStream;F)V

    if-eqz v0, :cond_1

    iget v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->animatedIndex:I

    if-ltz v5, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->-get0(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;)I

    move-result v6

    invoke-virtual {v0, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;

    iget v6, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->-get0(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;)I

    move-result v7

    invoke-direct {v0, p1, v6, v7, v8}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;-><init>(Ljava/util/UUID;FILcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;)V

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;->-get0(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;)I

    move-result v7

    invoke-virtual {v6, v7, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_0
    invoke-virtual {v0, v5, v4}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->addJointData(ILcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointData;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private static cubicStep(F)F
    .locals 3

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    mul-float v1, v0, v0

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v0, v2

    const/high16 v2, 0x40400000    # 3.0f

    sub-float v0, v2, v0

    mul-float/2addr v0, v1

    return v0
.end method

.method private getInAnimationTime(FF)F
    .locals 4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->loop:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    return p1

    :cond_0
    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    sub-float v0, p1, p2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    sub-float v1, v0, v1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    sub-float/2addr v2, v3

    div-float/2addr v1, v2

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-float v1, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    sub-float/2addr v2, v3

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    add-float/2addr v0, p2

    :goto_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    add-float/2addr v0, p2

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    sub-float v1, p1, v1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    sub-float/2addr v2, v3

    rem-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0

    :cond_3
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    return v0

    :cond_4
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method private getInFactor(F)F
    .locals 3

    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeInTime:F

    cmpg-float v1, p1, v1

    if-gez v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeInTime:F

    const v2, 0x3a83126f    # 0.001f

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeInTime:F

    div-float v1, p1, v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->cubicStep(F)F

    move-result v1

    cmpl-float v2, v1, v0

    if-lez v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method private getOutFactor(F)F
    .locals 4

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    cmpl-float v2, p1, v0

    if-ltz v2, :cond_1

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeOutTime:F

    const v3, 0x3a83126f    # 0.001f

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeOutTime:F

    div-float v2, p1, v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->cubicStep(F)F

    move-result v1

    cmpg-float v2, v1, v0

    if-gez v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method private getOutFactor(FF)F
    .locals 4

    const/4 v3, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p2, v3

    if-ltz v1, :cond_5

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->loop:Z

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_1

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->getOutFactor(F)F

    move-result v0

    :cond_0
    :goto_0
    return v0

    :cond_1
    sub-float v1, p1, p2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    cmpl-float v0, v0, v2

    if-lez v0, :cond_2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    sub-float v0, v1, v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    sub-float/2addr v2, v3

    div-float/2addr v0, v2

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-float v0, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    sub-float/2addr v2, v3

    mul-float/2addr v0, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    add-float/2addr v0, v2

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    add-float/2addr v0, v2

    :goto_1
    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeOutTime:F

    sub-float/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    sub-float v0, p1, v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->getOutFactor(F)F

    move-result v0

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    add-float/2addr v0, v1

    goto :goto_1

    :cond_3
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeOutTime:F

    sub-float/2addr v0, v1

    sub-float v0, p1, v0

    cmpl-float v1, v0, v3

    if-lez v1, :cond_4

    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    move-result p2

    :cond_4
    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->getOutFactor(F)F

    move-result v0

    goto :goto_0

    :cond_5
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->loop:Z

    if-nez v1, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeOutTime:F

    sub-float/2addr v1, v2

    sub-float v1, p1, v1

    cmpl-float v2, v1, v3

    if-ltz v2, :cond_0

    invoke-direct {p0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->getOutFactor(F)F

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method createRunningAnimations(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;)Lcom/google/common/collect/ImmutableList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;",
            ")",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v2

    const-string/jumbo v1, "Animation: creating anims: %d anims"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v3

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;

    new-instance v4, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;

    invoke-direct {v4, p1, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningAnimation;-><init>(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarRunningSequence;Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;)V

    invoke-virtual {v3, v4}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0
.end method

.method public dumpAnimationData()V
    .locals 8

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v2, 0x0

    const-string/jumbo v0, "Animation -- dump -- priority %d length %f joint sets %d (inPoint %f outPoint %f loop %b easeIn %f easeOut %f)"

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/Object;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animPriority:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animLength:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v7

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->inPoint:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v1, v4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->outPoint:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v1, v4

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->loop:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/4 v4, 0x5

    aput-object v3, v1, v4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeInTime:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x6

    aput-object v3, v1, v4

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->easeOutTime:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v4, 0x7

    aput-object v3, v1, v4

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    move v1, v2

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v0

    const-string/jumbo v3, "Anim -- joint set %d: prio %d"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v6

    invoke-static {v3, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->jointSets:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData$AnimationJointSet;->dumpJoints()V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "Animation -- dump end"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public getPriority()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->animPriority:I

    return v0
.end method

.method updateAnimationTiming(JJJZLcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;)Z
    .locals 7

    const/high16 v4, 0x447a0000    # 1000.0f

    const/4 v2, 0x1

    sub-long v0, p1, p3

    long-to-float v0, v0

    div-float v3, v0, v4

    const-wide/16 v0, -0x1

    cmp-long v0, p5, v0

    if-eqz v0, :cond_2

    cmp-long v0, p1, p5

    if-ltz v0, :cond_2

    sub-long v0, p1, p5

    long-to-float v0, v0

    div-float/2addr v0, v4

    :goto_0
    invoke-direct {p0, v3, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->getInAnimationTime(FF)F

    move-result v4

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->getInFactor(F)F

    move-result v1

    invoke-direct {p0, v3, v0}, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationData;->getOutFactor(FF)F

    move-result v5

    if-eqz p7, :cond_4

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_1
    const/4 v1, 0x0

    iput v3, p8, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->runningTime:F

    iget v3, p8, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->inAnimationTime:F

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_0

    iput v4, p8, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->inAnimationTime:F

    move v1, v2

    :cond_0
    iget v3, p8, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->inFactor:F

    cmpl-float v3, v3, v0

    if-eqz v3, :cond_1

    iput v0, p8, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->inFactor:F

    move v1, v2

    :cond_1
    iget v0, p8, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->outFactor:F

    cmpl-float v0, v0, v5

    if-eqz v0, :cond_3

    iput v5, p8, Lcom/lumiyaviewer/lumiya/render/avatar/AnimationTiming;->outFactor:F

    :goto_2
    return v2

    :cond_2
    const/high16 v0, -0x40800000    # -1.0f

    goto :goto_0

    :cond_3
    move v2, v1

    goto :goto_2

    :cond_4
    move v0, v1

    goto :goto_1
.end method
