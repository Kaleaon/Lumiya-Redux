.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;
.super Ljava/lang/Object;


# instance fields
.field public final bones:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;",
            ">;"
        }
    .end annotation
.end field

.field public final jointMatrix:[F

.field public final jointWorldMatrix:[F

.field public rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

.field private final updateBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->jointMatrix:[F

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2f

    mul-int/lit8 v0, v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->jointWorldMatrix:[F

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    array-length v0, v0

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->updateBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    return-void
.end method


# virtual methods
.method public UpdateGlobalPositions(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;)V
    .locals 6

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->updateBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v0, 0x0

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->jointMatrix:[F

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->jointWorldMatrix:[F

    invoke-virtual {v3, p1, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->updateGlobalPos(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;[F[F)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected applyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V
    .locals 7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;->jointTranslations:Ljava/util/EnumMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [F

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v4, 0x0

    aget v4, v1, v4

    const/4 v5, 0x1

    aget v5, v1, v5

    const/4 v6, 0x2

    aget v1, v1, v6

    invoke-direct {v3, v4, v5, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->setPositionOverride(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public getBodySize()F
    .locals 12

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mPelvis:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSkull:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mNeck:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mChest:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTorso:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->getPelvisToFoot()F

    move-result v6

    float-to-double v6, v6

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v10

    mul-float/2addr v1, v10

    float-to-double v10, v1

    mul-double/2addr v8, v10

    add-double/2addr v6, v8

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v1

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v2

    mul-float/2addr v1, v2

    float-to-double v8, v1

    add-double/2addr v6, v8

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v1

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v2

    mul-float/2addr v1, v2

    float-to-double v2, v1

    add-double/2addr v2, v6

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v1

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v4

    mul-float/2addr v1, v4

    float-to-double v6, v1

    add-double/2addr v2, v6

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v0

    mul-float/2addr v0, v1

    float-to-double v0, v0

    add-double/2addr v0, v2

    double-to-float v0, v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getPelvisToFoot()F
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mPelvis:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mKneeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mAnkleLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFootLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v5

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v0

    mul-float/2addr v0, v5

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v5

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v1

    mul-float/2addr v1, v5

    sub-float/2addr v0, v1

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v2

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v1

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v2

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected prepareSkeleton()V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;->updateBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->prepareSkeleton([Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;I)I

    return-void
.end method
