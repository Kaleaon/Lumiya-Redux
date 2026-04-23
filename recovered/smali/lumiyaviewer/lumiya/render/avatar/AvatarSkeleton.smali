.class public Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;
.super Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;
    }
.end annotation


# instance fields
.field private final animatedBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

.field private final attachmentPoints:[Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

.field private final bodySize:F

.field private final forceAnimate:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final hasExtendedBones:Z

.field private final partMorphParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;",
            "[F>;"
        }
    .end annotation
.end field

.field private final pelvisOffset:F

.field private final pelvisToFoot:F


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;Z)V
    .locals 20
    .param p1    # Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;-><init>()V

    new-instance v2, Ljava/util/EnumMap;

    const-class v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    invoke-direct {v2, v3}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->partMorphParams:Ljava/util/Map;

    const/16 v2, 0x38

    new-array v2, v2, [Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->forceAnimate:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/16 v2, 0x85

    new-array v2, v2, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->animatedBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move/from16 v0, p3

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->hasExtendedBones:Z

    invoke-virtual/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->prepareSkeleton()V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bones:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->animatedIndex:I

    if-ltz v3, :cond_0

    const/16 v5, 0x85

    if-ge v3, v5, :cond_0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->animatedBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    aput-object v2, v5, v3

    goto :goto_0

    :cond_1
    new-instance v4, Ljava/util/EnumMap;

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-direct {v4, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->getInstance()Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->applyJointTranslations(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;)V

    move-object/from16 v0, p2

    iget v2, v0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;->pelvisOffset:F

    move-object/from16 v0, p0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->pelvisOffset:F

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    const/4 v2, 0x0

    array-length v6, v5

    :goto_1
    if-ge v2, v6, :cond_2

    aget-object v7, v5, v2

    invoke-virtual {v3, v7}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->getMeshEntry(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    move-result-object v8

    iget-object v8, v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;->polyMesh:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->getNumMorphs()I

    move-result v8

    new-array v8, v8, [F

    const/4 v9, 0x0

    invoke-static {v8, v9}, Ljava/util/Arrays;->fill([FF)V

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->partMorphParams:Ljava/util/Map;

    invoke-interface {v9, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    const/4 v2, 0x0

    array-length v7, v6

    move v5, v2

    :goto_2
    if-ge v5, v7, :cond_3

    aget-object v8, v6, v5

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    invoke-direct {v2, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-interface {v4, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v9, 0x3f800000    # 1.0f

    const/high16 v10, 0x3f800000    # 1.0f

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-virtual {v2, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    invoke-interface {v4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v2, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->set(FFF)V

    add-int/lit8 v2, v5, 0x1

    move v5, v2

    goto :goto_2

    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->getParamCount()I

    move-result v15

    const/4 v2, 0x0

    move v14, v2

    :goto_3
    if-ge v14, v15, :cond_7

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramDefs:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    aget-object v16, v2, v14

    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_4
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarShapeParams;->getParamValue(I)I

    move-result v2

    int-to-float v2, v2

    iget v6, v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->maxValue:F

    iget v7, v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    sub-float/2addr v6, v7

    mul-float/2addr v2, v6

    const/high16 v6, 0x437f0000    # 255.0f

    div-float/2addr v2, v6

    iget v6, v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    add-float v7, v2, v6

    move-object/from16 v0, v16

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->name:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->ApplyMorphParam(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;Ljava/util/Map;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;F)V

    iget-object v2, v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->drivenParams:Lcom/google/common/collect/ImmutableList;

    if-eqz v2, :cond_4

    iget-object v2, v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->drivenParams:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_5
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    iget v8, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->drivenID:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    if-eqz v6, :cond_5

    iget-object v8, v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_4
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    invoke-static {v7, v5, v2, v11}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->getDrivenWeight(FLcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;)F

    move-result v13

    iget-object v12, v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->name:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;

    move-object/from16 v8, p0

    move-object v9, v3

    move-object v10, v4

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->ApplyMorphParam(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;Ljava/util/Map;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;F)V

    goto :goto_4

    :cond_6
    add-int/lit8 v2, v14, 0x1

    move v14, v2

    goto :goto_3

    :cond_7
    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    const/4 v2, 0x0

    array-length v7, v6

    move v5, v2

    :goto_5
    if-ge v5, v7, :cond_8

    aget-object v8, v6, v5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bones:Ljava/util/Map;

    invoke-interface {v2, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    invoke-interface {v4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;

    iget-object v9, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-interface {v4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v2, v9, v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deformHierarchy(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    add-int/lit8 v2, v5, 0x1

    move v5, v2

    goto :goto_5

    :cond_8
    invoke-super/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->getPelvisToFoot()F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->pelvisToFoot:F

    invoke-super/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->getBodySize()F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bodySize:F

    const/4 v2, 0x0

    move v3, v2

    :goto_6
    const/16 v2, 0x38

    if-ge v3, v2, :cond_b

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v4, v2, v3

    if-eqz v4, :cond_9

    iget-boolean v2, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->isHUD:Z

    if-nez v2, :cond_9

    iget-object v2, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->bone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    if-eqz v2, :cond_a

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bones:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v2, :cond_9

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    new-instance v6, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    const/4 v7, 0x0

    invoke-direct {v6, v2, v4, v7}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;)V

    aput-object v6, v5, v3

    :cond_9
    :goto_7
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_6

    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    new-instance v5, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v5, v6, v4, v7}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;)V

    aput-object v5, v2, v3

    goto :goto_7

    :cond_b
    invoke-direct/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->updateAttachmentMatrix()V

    return-void
.end method

.method private ApplyMorphParam(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;Ljava/util/Map;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;F)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;",
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;",
            "F)V"
        }
    .end annotation

    iget-boolean v0, p3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->morph:Z

    if-eqz v0, :cond_0

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->meshIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->partMorphParams:Ljava/util/Map;

    iget-object v1, p3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->meshIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    if-eqz v0, :cond_0

    iget-object v1, p3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->meshIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    invoke-virtual {p1, v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;->getMeshEntry(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;->polyMesh:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    invoke-virtual {v1, p4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->getMorphIndex(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    aget v2, v0, v1

    add-float/2addr v2, p5

    aput v2, v0, v1

    :cond_0
    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->skeletonParams:Lcom/google/common/collect/ImmutableMap;

    if-eqz v0, :cond_3

    iget-object v0, p3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->skeletonParams:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    if-eqz v3, :cond_2

    iget-object v3, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;->scale:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v3, v4, p5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->mulWeighted(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;F)V

    :cond_2
    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    if-eqz v3, :cond_1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamValue;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;->offset:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    invoke-virtual {v1, v0, p5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->addMul(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;F)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method public static getDrivenWeight(FLcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;)F
    .locals 5

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->maxValue:F

    iget v1, p3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->minValue:F

    iget v0, p3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->maxValue:F

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min1:F

    cmpg-float v4, p0, v4

    if-gtz v4, :cond_2

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min1:F

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max1:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_1

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min1:F

    cmpg-float v2, v3, v2

    if-gtz v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max1:F

    cmpg-float v2, p0, v2

    if-gtz v2, :cond_3

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min1:F

    sub-float v2, p0, v2

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max1:F

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min1:F

    sub-float/2addr v3, v4

    div-float/2addr v2, v3

    sub-float/2addr v0, v1

    mul-float/2addr v0, v2

    add-float/2addr v0, v1

    goto :goto_0

    :cond_3
    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max2:F

    cmpg-float v2, p0, v2

    if-lez v2, :cond_0

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min2:F

    cmpg-float v2, p0, v2

    if-gtz v2, :cond_4

    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max2:F

    sub-float v2, p0, v2

    iget v3, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min2:F

    iget v4, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max2:F

    sub-float/2addr v3, v4

    div-float/2addr v2, v3

    sub-float/2addr v1, v0

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    goto :goto_0

    :cond_4
    iget v2, p2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max2:F

    cmpl-float v2, v2, v3

    if-gez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method private updateAttachmentMatrix()V
    .locals 11

    const/16 v10, 0x10

    const/4 v1, 0x0

    new-array v0, v10, [F

    move v8, v1

    :goto_0
    const/16 v2, 0x38

    if-ge v8, v2, :cond_2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    aget-object v9, v2, v8

    if-eqz v9, :cond_0

    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->bone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getGlobalMatrix()[F

    move-result-object v2

    iget-object v4, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleX()F

    move-result v5

    mul-float/2addr v4, v5

    iget-object v5, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iget-object v5, v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v5, v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleY()F

    move-result v6

    mul-float/2addr v5, v6

    iget-object v6, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v6, v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getScaleZ()F

    move-result v3

    mul-float/2addr v6, v3

    move v3, v1

    invoke-static/range {v0 .. v6}, Landroid/opengl/Matrix;->translateM([FI[FIFFF)V

    iget-object v2, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->matrix:[F

    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getInverseMatrix()[F

    move-result-object v6

    move v3, v1

    move-object v4, v0

    move v5, v1

    move v7, v1

    invoke-static/range {v2 .. v7}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    :goto_1
    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v2, v2, v8

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->nonHUDindex:I

    if-ltz v2, :cond_0

    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->matrix:[F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->jointWorldMatrix:[F

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    array-length v5, v5

    add-int/2addr v2, v5

    mul-int/lit8 v2, v2, 0x10

    invoke-static {v3, v1, v4, v2, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    add-int/lit8 v2, v8, 0x1

    move v8, v2

    goto :goto_0

    :cond_1
    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionX()F

    move-result v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionY()F

    move-result v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->getPositionZ()F

    move-result v4

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    iget-object v2, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v3, v3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v4, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    iget-object v2, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->matrix:[F

    iget-object v3, v9, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->point:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    iget-object v3, v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getInverseMatrix()[F

    move-result-object v6

    move v3, v1

    move-object v4, v0

    move v5, v1

    move v7, v1

    invoke-static/range {v2 .. v7}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    goto :goto_1

    :cond_2
    return-void
.end method


# virtual methods
.method public UpdateGlobalPositions(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->UpdateGlobalPositions(Lcom/lumiyaviewer/lumiya/render/avatar/AnimationSkeletonData;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->updateAttachmentMatrix()V

    return-void
.end method

.method public getAnimatedBone(I)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->animatedBones:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    aget-object v0, v0, p1

    return-object v0
.end method

.method final getAttachmentMatrix(I)[F
    .locals 2

    const/4 v1, 0x0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton$AttachmentPoint;->matrix:[F

    return-object v0

    :cond_0
    return-object v1
.end method

.method public final getBodySize()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->bodySize:F

    return v0
.end method

.method final getMorphParams(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;)[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->partMorphParams:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    return-object v0
.end method

.method final getPelvisOffset()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->pelvisOffset:F

    return v0
.end method

.method public final getPelvisToFoot()F
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->pelvisToFoot:F

    return v0
.end method

.method public hasExtendedBones()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->hasExtendedBones:Z

    return v0
.end method

.method public needForceAnimate()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->forceAnimate:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    return v0
.end method

.method public setForceAnimate()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/AvatarSkeleton;->forceAnimate:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method
