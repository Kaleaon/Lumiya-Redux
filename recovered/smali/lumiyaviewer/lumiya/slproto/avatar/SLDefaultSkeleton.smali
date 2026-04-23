.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;
.super Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;


# direct methods
.method protected constructor <init>()V
    .locals 46

    invoke-direct/range {p0 .. p0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeleton;-><init>()V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSkull:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const v9, 0x3da1cac1    # 0.079f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v10, 0x3da1cac1    # 0.079f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSkull:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mEyeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3dc8b439

    const v9, -0x42ec8b44    # -0.036f

    const v10, 0x3da1cac1    # 0.079f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3dc9a88b

    const v10, -0x42ec8b44    # -0.036f

    const v11, 0x3da1cac1    # 0.079f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mEyeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mEyeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3dc8b439

    const v10, 0x3d1374bc    # 0.036f

    const v11, 0x3da1cac1    # 0.079f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, 0x3dc9a5ec

    const v11, 0x3d1374bc    # 0.036f

    const v12, 0x3da1cac1    # 0.079f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mEyeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeAltRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, 0x3d958106    # 0.073f

    const v11, -0x42ec8b44    # -0.036f

    const v12, 0x3d0b4396    # 0.034f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3d967558

    const v12, -0x42ec8b44    # -0.036f

    const v13, 0x3d0afa2f    # 0.03393f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeAltRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeAltLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3d958106    # 0.073f

    const v12, 0x3d1374bc    # 0.036f

    const v13, 0x3d0b4396    # 0.034f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3d9672b9

    const v13, 0x3d1374bc    # 0.036f

    const v14, 0x3d0afa2f    # 0.03393f

    invoke-direct {v11, v12, v13, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeAltLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceForeheadLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3d79db23    # 0.061f

    const v13, 0x3d0f5c29    # 0.035f

    const v14, 0x3da9fbe7    # 0.083f

    invoke-direct {v11, v12, v13, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v13, 0x3d79db23    # 0.061f

    const v14, 0x3d0f5c29    # 0.035f

    const v15, 0x3da9fbe7    # 0.083f

    invoke-direct {v12, v13, v14, v15}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v9 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceForeheadLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v10, v11, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceForeheadRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v13, 0x3d79db23    # 0.061f

    const v14, -0x42f0a3d7    # -0.035f

    const v15, 0x3da9fbe7    # 0.083f

    invoke-direct {v12, v13, v14, v15}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v14, 0x3d79db23    # 0.061f

    const v15, -0x42f0a3d7    # -0.035f

    const v16, 0x3da9fbe7    # 0.083f

    invoke-direct/range {v13 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-direct/range {v10 .. v15}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceForeheadRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v11, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowOuterLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v14, 0x3d83126f    # 0.064f

    const v15, 0x3d50e560    # 0.051f

    const v16, 0x3d449ba6    # 0.048f

    invoke-direct/range {v13 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v15, 0x3d83126f    # 0.064f

    const v16, 0x3d50e560    # 0.051f

    const v17, 0x3d449ba6    # 0.048f

    invoke-direct/range {v14 .. v17}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v11 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v13, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowOuterLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v12, v13, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v13, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowCenterLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v15, 0x3d8f5c29    # 0.07f

    const v16, 0x3d3020c5    # 0.043f

    const v17, 0x3d656042    # 0.056f

    invoke-direct/range {v14 .. v17}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v16, 0x3d8f5c29    # 0.07f

    const v17, 0x3d3020c5    # 0.043f

    const v18, 0x3d656042    # 0.056f

    invoke-direct/range {v15 .. v18}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-direct/range {v12 .. v17}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v14, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowCenterLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v13, v14, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v14, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowInnerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v16, 0x3d99999a    # 0.075f

    const v17, 0x3cb43958    # 0.022f

    const v18, 0x3d50e560    # 0.051f

    invoke-direct/range {v15 .. v18}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v17, 0x3d99999a    # 0.075f

    const v18, 0x3cb43958    # 0.022f

    const v19, 0x3d50e560    # 0.051f

    invoke-direct/range {v16 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v13 .. v18}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v15, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowInnerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v14, v15, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v15, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowOuterRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v17, 0x3d83126f    # 0.064f

    const v18, -0x42af1aa0    # -0.051f

    const v19, 0x3d449ba6    # 0.048f

    invoke-direct/range {v16 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v18, 0x3d83126f    # 0.064f

    const v19, -0x42af1aa0    # -0.051f

    const v20, 0x3d449ba6    # 0.048f

    invoke-direct/range {v17 .. v20}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-direct/range {v14 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v16, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowOuterRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v16, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowCenterRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v18, 0x3d8f5c29    # 0.07f

    const v19, -0x42cfdf3b    # -0.043f

    const v20, 0x3d656042    # 0.056f

    invoke-direct/range {v17 .. v20}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v18, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v19, 0x3d8f5c29    # 0.07f

    const v20, -0x42cfdf3b    # -0.043f

    const v21, 0x3d656042    # 0.056f

    invoke-direct/range {v18 .. v21}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v15 .. v20}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v16, v0

    sget-object v17, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowCenterRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-interface {v0, v1, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v17, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowInnerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v18, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v19, 0x3d99999a    # 0.075f

    const v20, -0x434bc6a8    # -0.022f

    const v21, 0x3d50e560    # 0.051f

    invoke-direct/range {v18 .. v21}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v19, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v20, 0x3d99999a    # 0.075f

    const v21, -0x434bc6a8    # -0.022f

    const v22, 0x3d50e560    # 0.051f

    invoke-direct/range {v19 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v16 .. v21}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v17, v0

    sget-object v18, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyebrowInnerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v18, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeLidUpperLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v19, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v20, 0x3d958106    # 0.073f

    const v21, 0x3d1374bc    # 0.036f

    const v22, 0x3d0b4396    # 0.034f

    invoke-direct/range {v19 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v20, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v21, 0x3d958106    # 0.073f

    const v22, 0x3d1374bc    # 0.036f

    const v23, 0x3d0b4396    # 0.034f

    invoke-direct/range {v20 .. v23}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v17 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v18, v0

    sget-object v19, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeLidUpperLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v17

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v18, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v19, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeLidLowerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v20, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v21, 0x3d958106    # 0.073f

    const v22, 0x3d1374bc    # 0.036f

    const v23, 0x3d0b4396    # 0.034f

    invoke-direct/range {v20 .. v23}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v22, 0x3d958106    # 0.073f

    const v23, 0x3d1374bc    # 0.036f

    const v24, 0x3d0b4396    # 0.034f

    invoke-direct/range {v21 .. v24}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-direct/range {v18 .. v23}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v19, v0

    sget-object v20, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeLidLowerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v19, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v20, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeLidUpperRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v22, 0x3d958106    # 0.073f

    const v23, -0x42ec8b44    # -0.036f

    const v24, 0x3d0b4396    # 0.034f

    invoke-direct/range {v21 .. v24}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v22, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v23, 0x3d958106    # 0.073f

    const v24, -0x42ec8b44    # -0.036f

    const v25, 0x3d0b4396    # 0.034f

    invoke-direct/range {v22 .. v25}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v19 .. v24}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v20, v0

    sget-object v21, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeLidUpperRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v20, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v21, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeLidLowerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v22, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v23, 0x3d958106    # 0.073f

    const v24, -0x42ec8b44    # -0.036f

    const v25, 0x3d0b4396    # 0.034f

    invoke-direct/range {v22 .. v25}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v24, 0x3d958106    # 0.073f

    const v25, -0x42ec8b44    # -0.036f

    const v26, 0x3d0b4396    # 0.034f

    invoke-direct/range {v23 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-direct/range {v20 .. v25}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v21, v0

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeLidLowerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v24, -0x43645a1d    # -0.019f

    const v25, 0x3c9374bc    # 0.018f

    const v26, 0x3ccccccd    # 0.025f

    invoke-direct/range {v23 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v24, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v25, -0x43645a1d    # -0.019f

    const v26, 0x3c9374bc    # 0.018f

    const v27, 0x3ccccccd    # 0.025f

    invoke-direct/range {v24 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-direct/range {v21 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v22, v0

    sget-object v23, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v41, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/16 v24, 0x0

    const v25, 0x3da3d70a    # 0.08f

    const v26, 0x3b03126f    # 0.002f

    invoke-direct/range {v23 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v24, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/16 v25, 0x0

    const v26, 0x3da3d70a    # 0.08f

    const v27, 0x3b03126f    # 0.002f

    invoke-direct/range {v24 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v21, v25, v26

    const/16 v26, 0x0

    move-object/from16 v21, v41

    invoke-direct/range {v21 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v21, v0

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v41

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v24, -0x43645a1d    # -0.019f

    const v25, -0x436c8b44    # -0.018f

    const v26, 0x3ccccccd    # 0.025f

    invoke-direct/range {v23 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v24, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v25, -0x43645a1d    # -0.019f

    const v26, -0x436c8b44    # -0.018f

    const v27, 0x3ccccccd    # 0.025f

    invoke-direct/range {v24 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-direct/range {v21 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v22, v0

    sget-object v23, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v42, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/16 v24, 0x0

    const v25, -0x425c28f6    # -0.08f

    const v26, 0x3b03126f    # 0.002f

    invoke-direct/range {v23 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v24, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/16 v25, 0x0

    const v26, -0x425c28f6    # -0.08f

    const v27, 0x3b03126f    # 0.002f

    invoke-direct/range {v24 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v21, v25, v26

    const/16 v26, 0x0

    move-object/from16 v21, v42

    invoke-direct/range {v21 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v21, v0

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v42

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v24, 0x3db020c5    # 0.086f

    const v25, 0x3c75c28f    # 0.015f

    const v26, -0x447ced91    # -0.004f

    invoke-direct/range {v23 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v24, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v25, 0x3db020c5    # 0.086f

    const v26, 0x3c75c28f    # 0.015f

    const v27, -0x447ced91    # -0.004f

    invoke-direct/range {v24 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-direct/range {v21 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v22, v0

    sget-object v23, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v23, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseCenter:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v24, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v25, 0x3dd0e560    # 0.102f

    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-direct/range {v24 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v25, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v26, 0x3dd0e560    # 0.102f

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v28}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-direct/range {v22 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v23, v0

    sget-object v24, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseCenter:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v24, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v25, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v26, 0x3db020c5    # 0.086f

    const v27, -0x438a3d71    # -0.015f

    const v28, -0x447ced91    # -0.004f

    invoke-direct/range {v25 .. v28}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v26, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v27, 0x3db020c5    # 0.086f

    const v28, -0x438a3d71    # -0.015f

    const v29, -0x447ced91    # -0.004f

    invoke-direct/range {v26 .. v29}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v23 .. v28}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v24, v0

    sget-object v25, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v24, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v25, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceCheekLowerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v26, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v27, 0x3d4ccccd    # 0.05f

    const v28, 0x3d0b4396    # 0.034f

    const v29, -0x43020c4a    # -0.031f

    invoke-direct/range {v26 .. v29}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v27, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v28, 0x3d4ccccd    # 0.05f

    const v29, 0x3d0b4396    # 0.034f

    const v30, -0x43020c4a    # -0.031f

    invoke-direct/range {v27 .. v30}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v28, 0x0

    const/16 v29, 0x0

    invoke-direct/range {v24 .. v29}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v25, v0

    sget-object v26, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceCheekLowerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v24

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v25, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v26, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceCheekUpperLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v27, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v28, 0x3d8f5c29    # 0.07f

    const v29, 0x3d0b4396    # 0.034f

    const v30, -0x445c28f6    # -0.005f

    invoke-direct/range {v27 .. v30}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v28, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v29, 0x3d8f5c29    # 0.07f

    const v30, 0x3d0b4396    # 0.034f

    const v31, -0x445c28f6    # -0.005f

    invoke-direct/range {v28 .. v31}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v29, 0x0

    const/16 v30, 0x0

    invoke-direct/range {v25 .. v30}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v26, v0

    sget-object v27, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceCheekUpperLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v26, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v27, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceCheekLowerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v28, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v29, 0x3d4ccccd    # 0.05f

    const v30, -0x42f4bc6a    # -0.034f

    const v31, -0x43020c4a    # -0.031f

    invoke-direct/range {v28 .. v31}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v29, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v30, 0x3d4ccccd    # 0.05f

    const v31, -0x42f4bc6a    # -0.034f

    const v32, -0x43020c4a    # -0.031f

    invoke-direct/range {v29 .. v32}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v30, 0x0

    const/16 v31, 0x0

    invoke-direct/range {v26 .. v31}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v27, v0

    sget-object v28, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceCheekLowerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v27, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v28, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceCheekUpperRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v29, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v30, 0x3d8f5c29    # 0.07f

    const v31, -0x42f4bc6a    # -0.034f

    const v32, -0x445c28f6    # -0.005f

    invoke-direct/range {v29 .. v32}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v30, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v31, 0x3d8f5c29    # 0.07f

    const v32, -0x42f4bc6a    # -0.034f

    const v33, -0x445c28f6    # -0.005f

    invoke-direct/range {v30 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v27 .. v32}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v28, v0

    sget-object v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceCheekUpperRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v27

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v28, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceChin:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v30, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v31, 0x3d978d50    # 0.074f

    const/16 v32, 0x0

    const v33, -0x42a2d0e5    # -0.054f

    invoke-direct/range {v30 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v31, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v32, 0x3d978d50    # 0.074f

    const/16 v33, 0x0

    const v34, -0x42a2d0e5    # -0.054f

    invoke-direct/range {v31 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v32, 0x0

    const/16 v33, 0x0

    invoke-direct/range {v28 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v29, v0

    sget-object v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceChin:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipLowerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v31, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v32, 0x3d3851ec    # 0.045f

    const/16 v33, 0x0

    const/16 v34, 0x0

    invoke-direct/range {v31 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v32, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v33, 0x3d3851ec    # 0.045f

    const/16 v34, 0x0

    const/16 v35, 0x0

    invoke-direct/range {v32 .. v35}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v33, 0x0

    const/16 v34, 0x0

    invoke-direct/range {v29 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v30, v0

    sget-object v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipLowerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    move-object/from16 v2, v29

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipLowerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v32, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v33, 0x3d3851ec    # 0.045f

    const/16 v34, 0x0

    const/16 v35, 0x0

    invoke-direct/range {v32 .. v35}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v33, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v34, 0x3d3851ec    # 0.045f

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v33 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v34, 0x0

    const/16 v35, 0x0

    invoke-direct/range {v30 .. v35}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v31, v0

    sget-object v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipLowerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, v30

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipLowerCenter:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v33, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v34, 0x3d3851ec    # 0.045f

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v33 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v35, 0x3d3851ec    # 0.045f

    const/16 v36, 0x0

    const/16 v37, 0x0

    invoke-direct/range {v34 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v31 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v32, v0

    sget-object v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipLowerCenter:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v31

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTongueTip:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v35, 0x3cb43958    # 0.022f

    const/16 v36, 0x0

    const v37, 0x3be56042    # 0.007f

    invoke-direct/range {v34 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v35, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v36, 0x3cb43958    # 0.022f

    const/16 v37, 0x0

    const v38, 0x3be56042    # 0.007f

    invoke-direct/range {v35 .. v38}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v36, 0x0

    const/16 v37, 0x0

    invoke-direct/range {v32 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v33, v0

    sget-object v34, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTongueTip:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v38, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTongueBase:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v35, 0x3d1fbe77    # 0.039f

    const/16 v36, 0x0

    const v37, 0x3ba3d70a    # 0.005f

    invoke-direct/range {v34 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v35, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v36, 0x3d1fbe77    # 0.039f

    const/16 v37, 0x0

    const v39, 0x3ba3d70a    # 0.005f

    move-object/from16 v0, v35

    move/from16 v1, v36

    move/from16 v2, v37

    move/from16 v3, v39

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v32, v36, v37

    const/16 v37, 0x0

    move-object/from16 v32, v38

    invoke-direct/range {v32 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v32, v0

    sget-object v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTongueBase:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v38

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v35, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v36, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTeethLower:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v37, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v32, 0x3cac0831    # 0.021f

    const/16 v33, 0x0

    const v34, -0x42e04189    # -0.039f

    move-object/from16 v0, v37

    move/from16 v1, v32

    move/from16 v2, v33

    move/from16 v3, v34

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v32, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v33, 0x3cac0831    # 0.021f

    const/16 v34, 0x0

    const v39, -0x42e04189    # -0.039f

    move-object/from16 v0, v32

    move/from16 v1, v33

    move/from16 v2, v34

    move/from16 v3, v39

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v33, 0x4

    move/from16 v0, v33

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    aput-object v29, v33, v34

    const/16 v29, 0x1

    aput-object v30, v33, v29

    const/16 v29, 0x2

    aput-object v31, v33, v29

    const/16 v29, 0x3

    aput-object v38, v33, v29

    const/16 v34, 0x0

    move-object/from16 v29, v35

    move-object/from16 v30, v36

    move-object/from16 v31, v37

    invoke-direct/range {v29 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v29, v0

    sget-object v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTeethLower:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, v35

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v43, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceJaw:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v30, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v31, -0x457ced91    # -0.001f

    const/16 v32, 0x0

    const v33, -0x438a3d71    # -0.015f

    invoke-direct/range {v30 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v31, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v32, -0x457ced91    # -0.001f

    const/16 v33, 0x0

    const v34, -0x438a3d71    # -0.015f

    invoke-direct/range {v31 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v32, 0x2

    move/from16 v0, v32

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    aput-object v28, v32, v33

    const/16 v28, 0x1

    aput-object v35, v32, v28

    const/16 v33, 0x0

    move-object/from16 v28, v43

    invoke-direct/range {v28 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v28, v0

    sget-object v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceJaw:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v43

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v28, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceJawShaper:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v30, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    invoke-direct/range {v30 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v31, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    invoke-direct/range {v31 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v32, 0x0

    const/16 v33, 0x0

    invoke-direct/range {v28 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v29, v0

    sget-object v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceJawShaper:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceForeheadCenter:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v31, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v32, 0x3d8d4fdf    # 0.069f

    const/16 v33, 0x0

    const v34, 0x3d851eb8    # 0.065f

    invoke-direct/range {v31 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v32, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v33, 0x3d8d4fdf    # 0.069f

    const/16 v34, 0x0

    const v35, 0x3d851eb8    # 0.065f

    invoke-direct/range {v32 .. v35}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v33, 0x0

    const/16 v34, 0x0

    invoke-direct/range {v29 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v30, v0

    sget-object v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceForeheadCenter:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    move-object/from16 v2, v29

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseBase:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v32, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v33, 0x3dc08312    # 0.094f

    const/16 v34, 0x0

    const v35, -0x437ced91    # -0.016f

    invoke-direct/range {v32 .. v35}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v33, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v34, 0x3dc08312    # 0.094f

    const/16 v35, 0x0

    const v36, -0x437ced91    # -0.016f

    invoke-direct/range {v33 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v34, 0x0

    const/16 v35, 0x0

    invoke-direct/range {v30 .. v35}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v31, v0

    sget-object v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseBase:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, v30

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipUpperLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v33, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v34, 0x3d3851ec    # 0.045f

    const/16 v35, 0x0

    const v36, -0x44bb645a    # -0.003f

    invoke-direct/range {v33 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v35, 0x3d3851ec    # 0.045f

    const/16 v36, 0x0

    const v37, -0x44bb645a    # -0.003f

    invoke-direct/range {v34 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v31 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v32, v0

    sget-object v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipUpperLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v31

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipUpperRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v35, 0x3d3851ec    # 0.045f

    const/16 v36, 0x0

    const v37, -0x44bb645a    # -0.003f

    invoke-direct/range {v34 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v35, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v36, 0x3d3851ec    # 0.045f

    const/16 v37, 0x0

    const v38, -0x44bb645a    # -0.003f

    invoke-direct/range {v35 .. v38}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v36, 0x0

    const/16 v37, 0x0

    invoke-direct/range {v32 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v33, v0

    sget-object v34, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipUpperRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v34, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipCornerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v35, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v36, 0x3ce56042    # 0.028f

    const v37, -0x43645a1d    # -0.019f

    const v38, -0x43dc28f6    # -0.01f

    invoke-direct/range {v35 .. v38}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v36, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v37, 0x3ce56042    # 0.028f

    const v38, -0x43645a1d    # -0.019f

    const v39, -0x43dc28f6    # -0.01f

    invoke-direct/range {v36 .. v39}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v37, 0x0

    const/16 v38, 0x0

    invoke-direct/range {v33 .. v38}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v34, v0

    sget-object v35, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipCornerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v33

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v35, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipCornerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v36, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v37, 0x3ce56042    # 0.028f

    const v38, 0x3c9ba5e3    # 0.019f

    const v39, -0x43dc28f6    # -0.01f

    invoke-direct/range {v36 .. v39}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v37, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v38, 0x3ce56042    # 0.028f

    const v39, 0x3c9ba5e3    # 0.019f

    const v40, -0x43dc28f6    # -0.01f

    invoke-direct/range {v37 .. v40}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v38, 0x0

    const/16 v39, 0x0

    invoke-direct/range {v34 .. v39}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v35, v0

    sget-object v36, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipCornerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v34

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v35, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v36, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipUpperCenter:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v37, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v38, 0x3d3851ec    # 0.045f

    const/16 v39, 0x0

    const v40, -0x44bb645a    # -0.003f

    invoke-direct/range {v37 .. v40}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v38, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v39, 0x3d3851ec    # 0.045f

    const/16 v40, 0x0

    const v44, -0x44bb645a    # -0.003f

    move-object/from16 v0, v38

    move/from16 v1, v39

    move/from16 v2, v40

    move/from16 v3, v44

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v39, 0x0

    const/16 v40, 0x0

    invoke-direct/range {v35 .. v40}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v36, v0

    sget-object v37, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceLipUpperCenter:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v35

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v39, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v37, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTeethUpper:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v38, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v36, 0x3ca3d70a    # 0.02f

    const/16 v40, 0x0

    const v44, -0x430a3d71    # -0.03f

    move-object/from16 v0, v38

    move/from16 v1, v36

    move/from16 v2, v40

    move/from16 v3, v44

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v40, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v36, 0x3ca3d70a    # 0.02f

    const/16 v44, 0x0

    const v45, -0x430a3d71    # -0.03f

    move-object/from16 v0, v40

    move/from16 v1, v36

    move/from16 v2, v44

    move/from16 v3, v45

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v36, 0x5

    move/from16 v0, v36

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v44, v0

    const/16 v36, 0x0

    aput-object v31, v44, v36

    const/16 v31, 0x1

    aput-object v32, v44, v31

    const/16 v31, 0x2

    aput-object v33, v44, v31

    const/16 v31, 0x3

    aput-object v34, v44, v31

    const/16 v31, 0x4

    aput-object v35, v44, v31

    const/16 v36, 0x0

    move-object/from16 v31, v39

    move-object/from16 v32, v37

    move-object/from16 v33, v38

    move-object/from16 v34, v40

    move-object/from16 v35, v44

    invoke-direct/range {v31 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v31, v0

    sget-object v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTeethUpper:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move-object/from16 v2, v39

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyecornerInnerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v33, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v34, 0x3d99999a    # 0.075f

    const v35, 0x3c8b4396    # 0.017f

    const v36, 0x3d03126f    # 0.032f

    invoke-direct/range {v33 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v35, 0x3d99999a    # 0.075f

    const v36, 0x3c8b4396    # 0.017f

    const v37, 0x3d03126f    # 0.032f

    invoke-direct/range {v34 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v31 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v32, v0

    sget-object v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyecornerInnerLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v31

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyecornerInnerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v35, 0x3d99999a    # 0.075f

    const v36, -0x4374bc6a    # -0.017f

    const v37, 0x3d03126f    # 0.032f

    invoke-direct/range {v34 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v35, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v36, 0x3d99999a    # 0.075f

    const v37, -0x4374bc6a    # -0.017f

    const v38, 0x3d03126f    # 0.032f

    invoke-direct/range {v35 .. v38}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v36, 0x0

    const/16 v37, 0x0

    invoke-direct/range {v32 .. v37}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v33, v0

    sget-object v34, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyecornerInnerRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v33, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v34, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseBridge:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v35, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v36, 0x3dba5e35    # 0.091f

    const/16 v37, 0x0

    const v38, 0x3ca3d70a    # 0.02f

    invoke-direct/range {v35 .. v38}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v36, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v37, 0x3dba5e35    # 0.091f

    const/16 v38, 0x0

    const v40, 0x3ca3d70a    # 0.02f

    move-object/from16 v0, v36

    move/from16 v1, v37

    move/from16 v2, v38

    move/from16 v3, v40

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v37, 0x0

    const/16 v38, 0x0

    invoke-direct/range {v33 .. v38}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    move-object/from16 v34, v0

    sget-object v35, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceNoseBridge:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v33

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v34, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v35, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceRoot:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v36, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v37, 0x3ccccccd    # 0.025f

    const/16 v38, 0x0

    const v40, 0x3d3851ec    # 0.045f

    move-object/from16 v0, v36

    move/from16 v1, v37

    move/from16 v2, v38

    move/from16 v3, v40

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v37, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v38, 0x3ccccccd    # 0.025f

    const/16 v40, 0x0

    const v44, 0x3d3851ec    # 0.045f

    move-object/from16 v0, v37

    move/from16 v1, v38

    move/from16 v2, v40

    move/from16 v3, v44

    invoke-direct {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/16 v38, 0x1f

    move/from16 v0, v38

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v38, v0

    const/16 v40, 0x0

    aput-object v7, v38, v40

    const/4 v7, 0x1

    aput-object v8, v38, v7

    const/4 v7, 0x2

    aput-object v9, v38, v7

    const/4 v7, 0x3

    aput-object v10, v38, v7

    const/4 v7, 0x4

    aput-object v11, v38, v7

    const/4 v7, 0x5

    aput-object v12, v38, v7

    const/4 v7, 0x6

    aput-object v13, v38, v7

    const/4 v7, 0x7

    aput-object v14, v38, v7

    const/16 v7, 0x8

    aput-object v15, v38, v7

    const/16 v7, 0x9

    aput-object v16, v38, v7

    const/16 v7, 0xa

    aput-object v17, v38, v7

    const/16 v7, 0xb

    aput-object v18, v38, v7

    const/16 v7, 0xc

    aput-object v19, v38, v7

    const/16 v7, 0xd

    aput-object v20, v38, v7

    const/16 v7, 0xe

    aput-object v41, v38, v7

    const/16 v7, 0xf

    aput-object v42, v38, v7

    const/16 v7, 0x10

    aput-object v21, v38, v7

    const/16 v7, 0x11

    aput-object v22, v38, v7

    const/16 v7, 0x12

    aput-object v23, v38, v7

    const/16 v7, 0x13

    aput-object v24, v38, v7

    const/16 v7, 0x14

    aput-object v25, v38, v7

    const/16 v7, 0x15

    aput-object v26, v38, v7

    const/16 v7, 0x16

    aput-object v27, v38, v7

    const/16 v7, 0x17

    aput-object v43, v38, v7

    const/16 v7, 0x18

    aput-object v28, v38, v7

    const/16 v7, 0x19

    aput-object v29, v38, v7

    const/16 v7, 0x1a

    aput-object v30, v38, v7

    const/16 v7, 0x1b

    aput-object v39, v38, v7

    const/16 v7, 0x1c

    aput-object v31, v38, v7

    const/16 v7, 0x1d

    aput-object v32, v38, v7

    const/16 v7, 0x1e

    aput-object v33, v38, v7

    const/4 v12, 0x0

    move-object/from16 v7, v34

    move-object/from16 v8, v35

    move-object/from16 v9, v36

    move-object/from16 v10, v37

    move-object/from16 v11, v38

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceRoot:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v34

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, 0x3ca3d70a    # 0.02f

    const/4 v11, 0x0

    const v12, 0x3d8f5c29    # 0.07f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, 0x3de147ae    # 0.11f

    const v11, 0x3db851ec    # 0.09f

    const v12, 0x3df5c28f    # 0.12f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/high16 v9, -0x80000000

    const v13, 0x3d9ba5e3    # 0.076f

    invoke-direct {v12, v8, v9, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/high16 v9, -0x80000000

    const v14, 0x3d9ae3e7    # 0.07563f

    invoke-direct {v13, v8, v9, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x4

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v4, 0x1

    aput-object v5, v8, v4

    const/4 v4, 0x2

    aput-object v6, v8, v4

    const/4 v4, 0x3

    aput-object v34, v8, v4

    const/4 v4, 0x1

    new-array v9, v4, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v4, 0x0

    aput-object v7, v9, v4

    move-object v4, v10

    move-object v5, v11

    move-object v6, v12

    move-object v7, v13

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->NECK:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const v9, 0x3ca3d70a    # 0.02f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d4ccccd    # 0.05f

    const v8, 0x3d75c28f    # 0.06f

    const v9, 0x3da3d70a    # 0.08f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->NECK:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mNeck:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x43dc28f6    # -0.01f

    const/4 v8, 0x0

    const v9, 0x3e808312    # 0.251f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x43e43cc0    # -0.009507f

    const/4 v9, 0x0

    const v11, 0x3e80913a

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object v4, v15

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mNeck:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x457ced91    # -0.001f

    const v8, 0x3d48b439    # 0.049f

    const v9, -0x43fced91    # -0.008f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x457ced91    # -0.001f

    const v9, 0x3d48b439    # 0.049f

    const v10, -0x43fced91    # -0.008f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x457ced91    # -0.001f

    const v8, 0x3d23d70a    # 0.04f

    const v9, -0x443b645a    # -0.006f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x457ced91    # -0.001f

    const v9, 0x3d23d70a    # 0.04f

    const v11, -0x443b645a    # -0.006f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3c54fdf4    # 0.013f

    const v8, 0x3dced917    # 0.101f

    const v9, 0x3c75c28f    # 0.015f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3c54fdf4    # 0.013f

    const v9, 0x3dced917    # 0.101f

    const v11, 0x3c75c28f    # 0.015f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3c656042    # 0.014f

    const v9, 0x3d03126f    # 0.032f

    const v10, -0x443b645a    # -0.006f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3c656042    # 0.014f

    const v10, 0x3d03126f    # 0.032f

    const v11, -0x443b645a    # -0.006f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3c8b4396    # 0.017f

    const v9, 0x3d1374bc    # 0.036f

    const v10, -0x443b645a    # -0.006f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3c8b4396    # 0.017f

    const v10, 0x3d1374bc    # 0.036f

    const v12, -0x443b645a    # -0.006f

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x0

    move-object v5, v11

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3d1ba5e3    # 0.038f

    const v9, 0x3dc6a7f0    # 0.097f

    const v10, 0x3c75c28f    # 0.015f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3d1ba5e3    # 0.038f

    const v10, 0x3dc6a7f0    # 0.097f

    const v12, 0x3c75c28f    # 0.015f

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v11, v9, v10

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x43ab020c    # -0.013f

    const v10, 0x3d23d70a    # 0.04f

    const v11, -0x43ec8b44    # -0.009f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x43ab020c    # -0.013f

    const v11, 0x3d23d70a    # 0.04f

    const v12, -0x43ec8b44    # -0.009f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x43ab020c    # -0.013f

    const v10, 0x3d1ba5e3    # 0.038f

    const v11, -0x43fced91    # -0.008f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x43ab020c    # -0.013f

    const v11, 0x3d1ba5e3    # 0.038f

    const v13, -0x43fced91    # -0.008f

    invoke-direct {v9, v10, v11, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x1

    new-array v10, v10, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v11, 0x0

    aput-object v6, v10, v11

    const/4 v11, 0x0

    move-object v6, v12

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x43dc28f6    # -0.01f

    const v10, 0x3dcac083    # 0.099f

    const v11, 0x3c1374bc    # 0.009f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x43dc28f6    # -0.01f

    const v11, 0x3dcac083    # 0.099f

    const v13, 0x3c1374bc    # 0.009f

    invoke-direct {v9, v10, v11, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x1

    new-array v10, v10, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v11, 0x0

    aput-object v12, v10, v11

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x438a3d71    # -0.015f

    const v11, 0x3c9374bc    # 0.018f

    const v12, -0x447ced91    # -0.004f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, -0x438a3d71    # -0.015f

    const v12, 0x3c9374bc    # 0.018f

    const v13, -0x447ced91    # -0.004f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x433b645a    # -0.024f

    const v11, 0x3ccccccd    # 0.025f

    const v12, -0x443b645a    # -0.006f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, -0x433b645a    # -0.024f

    const v12, 0x3ccccccd    # 0.025f

    const v14, -0x443b645a    # -0.006f

    invoke-direct {v10, v11, v12, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x1

    new-array v11, v11, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v12, 0x0

    aput-object v7, v11, v12

    const/4 v12, 0x0

    move-object v7, v13

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x43020c4a    # -0.031f

    const v11, 0x3dc28f5c    # 0.095f

    const v12, 0x3b449ba6    # 0.003f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, -0x43020c4a    # -0.031f

    const v12, 0x3dc28f5c    # 0.095f

    const v14, 0x3b449ba6    # 0.003f

    invoke-direct {v10, v11, v12, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x1

    new-array v11, v11, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v12, 0x0

    aput-object v13, v11, v12

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3cbc6a7f    # 0.023f

    const v12, 0x3cfdf3b6    # 0.031f

    const v13, -0x457ced91    # -0.001f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3cbc6a7f    # 0.023f

    const v13, 0x3cfdf3b6    # 0.031f

    const v14, -0x457ced91    # -0.001f

    invoke-direct {v11, v12, v13, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3ce56042    # 0.028f

    const v12, 0x3d03126f    # 0.032f

    const v13, -0x457ced91    # -0.001f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3ce56042    # 0.028f

    const v13, 0x3d03126f    # 0.032f

    const v16, -0x457ced91    # -0.001f

    move/from16 v0, v16

    invoke-direct {v11, v12, v13, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v12, 0x1

    new-array v12, v12, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v13, 0x0

    aput-object v8, v12, v13

    const/4 v13, 0x0

    move-object v8, v14

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3cfdf3b6    # 0.031f

    const v12, 0x3cd4fdf4    # 0.026f

    const v13, 0x3b83126f    # 0.004f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3cfdf3b6    # 0.031f

    const v13, 0x3cd4fdf4    # 0.026f

    const v16, 0x3b83126f    # 0.004f

    move/from16 v0, v16

    invoke-direct {v11, v12, v13, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v12, 0x1

    new-array v12, v12, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v13, 0x0

    aput-object v14, v12, v13

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_HAND:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3c23d70a    # 0.01f

    const v13, 0x3d4ccccd    # 0.05f

    const/4 v14, 0x0

    invoke-direct {v11, v12, v13, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-direct {v12, v13, v14, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v9 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3d4ccccd    # 0.05f

    const v13, 0x3da3d70a    # 0.08f

    const v14, 0x3cf5c28f    # 0.03f

    invoke-direct {v11, v12, v13, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_HAND:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v10, v11, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWristLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v13, -0x80000000

    const v14, 0x3e51eb85    # 0.205f

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-direct {v12, v13, v14, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v14, -0x80000000

    const v16, 0x3e51c326

    const/16 v17, 0x0

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v13, v14, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v14, 0x5

    new-array v14, v14, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/16 v16, 0x0

    aput-object v4, v14, v16

    const/4 v4, 0x1

    aput-object v5, v14, v4

    const/4 v4, 0x2

    aput-object v6, v14, v4

    const/4 v4, 0x3

    aput-object v7, v14, v4

    const/4 v4, 0x4

    aput-object v8, v14, v4

    const/4 v4, 0x1

    new-array v0, v4, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v16, v0

    const/4 v4, 0x0

    aput-object v9, v16, v4

    move-object v4, v10

    move-object v5, v11

    move-object v6, v12

    move-object v7, v13

    move-object v8, v14

    move-object/from16 v9, v16

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWristLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_LOWER_ARM:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const v8, 0x3dcccccd    # 0.1f

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d23d70a    # 0.04f

    const v8, 0x3e0f5c29    # 0.14f

    const v9, 0x3d23d70a    # 0.04f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_LOWER_ARM:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mElbowLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const v8, 0x3e7df3b6    # 0.248f

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const v9, 0x3e7df3b6    # 0.248f

    const/4 v12, 0x0

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object v4, v11

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mElbowLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_UPPER_ARM:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const v8, 0x3df5c28f    # 0.12f

    const v9, 0x3c23d70a    # 0.01f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d4ccccd    # 0.05f

    const v8, 0x3e2e147b    # 0.17f

    const v9, 0x3d4ccccd    # 0.05f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_UPPER_ARM:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mShoulderLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const v8, 0x3da1cac1    # 0.079f

    const/high16 v9, -0x80000000

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const v9, 0x3da1cac1    # 0.079f

    const/high16 v12, -0x80000000

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v11, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v11, 0x0

    aput-object v4, v9, v11

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mShoulderLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_CLAVICLE:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3ca3d70a    # 0.02f

    const/4 v8, 0x0

    const v9, 0x3ca3d70a    # 0.02f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d8f5c29    # 0.07f

    const v8, 0x3e0f5c29    # 0.14f

    const v9, 0x3d4ccccd    # 0.05f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_CLAVICLE:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mCollarLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x4353f7cf    # -0.021f

    const v8, 0x3dae147b    # 0.085f

    const v9, 0x3e28f5c3    # 0.165f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x435490e6    # -0.020927f

    const v9, 0x3dad64d8    # 0.084665f

    const v11, 0x3e295d92

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object/from16 v4, v16

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mCollarLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v16

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x457ced91    # -0.001f

    const v8, -0x42b74bc7    # -0.049f

    const v9, -0x43fced91    # -0.008f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x457ced91    # -0.001f

    const v9, -0x42b74bc7    # -0.049f

    const v10, -0x43fced91    # -0.008f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x457ced91    # -0.001f

    const v8, -0x42dc28f6    # -0.04f

    const v9, -0x443b645a    # -0.006f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x457ced91    # -0.001f

    const v9, -0x42dc28f6    # -0.04f

    const v11, -0x443b645a    # -0.006f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3c54fdf4    # 0.013f

    const v8, -0x423126e9    # -0.101f

    const v9, 0x3c75c28f    # 0.015f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3c54fdf4    # 0.013f

    const v9, -0x423126e9    # -0.101f

    const v11, 0x3c75c28f    # 0.015f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandMiddle1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3c656042    # 0.014f

    const v9, -0x42fced91    # -0.032f

    const v10, -0x443b645a    # -0.006f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3c656042    # 0.014f

    const v10, -0x42fced91    # -0.032f

    const v11, -0x443b645a    # -0.006f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3c8b4396    # 0.017f

    const v9, -0x42ec8b44    # -0.036f

    const v10, -0x443b645a    # -0.006f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3c8b4396    # 0.017f

    const v10, -0x42ec8b44    # -0.036f

    const v12, -0x443b645a    # -0.006f

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x0

    move-object v5, v11

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3d1ba5e3    # 0.038f

    const v9, -0x42395810    # -0.097f

    const v10, 0x3c75c28f    # 0.015f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3d1ba5e3    # 0.038f

    const v10, -0x42395810    # -0.097f

    const v12, 0x3c75c28f    # 0.015f

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v11, v9, v10

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandIndex1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x43ab020c    # -0.013f

    const v10, -0x42dc28f6    # -0.04f

    const v11, -0x43ec8b44    # -0.009f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x43ab020c    # -0.013f

    const v11, -0x42dc28f6    # -0.04f

    const v12, -0x43ec8b44    # -0.009f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x43ab020c    # -0.013f

    const v10, -0x42e45a1d    # -0.038f

    const v11, -0x43fced91    # -0.008f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x43ab020c    # -0.013f

    const v11, -0x42e45a1d    # -0.038f

    const v13, -0x43fced91    # -0.008f

    invoke-direct {v9, v10, v11, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x1

    new-array v10, v10, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v11, 0x0

    aput-object v6, v10, v11

    const/4 v11, 0x0

    move-object v6, v12

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x43dc28f6    # -0.01f

    const v10, -0x42353f7d    # -0.099f

    const v11, 0x3c1374bc    # 0.009f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x43dc28f6    # -0.01f

    const v11, -0x42353f7d    # -0.099f

    const v13, 0x3c1374bc    # 0.009f

    invoke-direct {v9, v10, v11, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x1

    new-array v10, v10, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v11, 0x0

    aput-object v12, v10, v11

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x438a3d71    # -0.015f

    const v11, -0x436c8b44    # -0.018f

    const v12, -0x447ced91    # -0.004f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, -0x438a3d71    # -0.015f

    const v12, -0x436c8b44    # -0.018f

    const v13, -0x447ced91    # -0.004f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x433b645a    # -0.024f

    const v11, -0x43333333    # -0.025f

    const v12, -0x443b645a    # -0.006f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, -0x433b645a    # -0.024f

    const v12, -0x43333333    # -0.025f

    const v14, -0x443b645a    # -0.006f

    invoke-direct {v10, v11, v12, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x1

    new-array v11, v11, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v12, 0x0

    aput-object v7, v11, v12

    const/4 v12, 0x0

    move-object v7, v13

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x43020c4a    # -0.031f

    const v11, -0x423d70a4    # -0.095f

    const v12, 0x3b449ba6    # 0.003f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, -0x43020c4a    # -0.031f

    const v12, -0x423d70a4    # -0.095f

    const v14, 0x3b449ba6    # 0.003f

    invoke-direct {v10, v11, v12, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x1

    new-array v11, v11, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v12, 0x0

    aput-object v13, v11, v12

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandPinky1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3cbc6a7f    # 0.023f

    const v12, -0x43020c4a    # -0.031f

    const v13, -0x457ced91    # -0.001f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3cbc6a7f    # 0.023f

    const v13, -0x43020c4a    # -0.031f

    const v14, -0x457ced91    # -0.001f

    invoke-direct {v11, v12, v13, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3ce56042    # 0.028f

    const v12, -0x42fced91    # -0.032f

    const v13, -0x457ced91    # -0.001f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3ce56042    # 0.028f

    const v13, -0x42fced91    # -0.032f

    const v17, -0x457ced91    # -0.001f

    move/from16 v0, v17

    invoke-direct {v11, v12, v13, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v12, 0x1

    new-array v12, v12, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v13, 0x0

    aput-object v8, v12, v13

    const/4 v13, 0x0

    move-object v8, v14

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3cfdf3b6    # 0.031f

    const v12, -0x432b020c    # -0.026f

    const v13, 0x3b83126f    # 0.004f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3cfdf3b6    # 0.031f

    const v13, -0x432b020c    # -0.026f

    const v17, 0x3b83126f    # 0.004f

    move/from16 v0, v17

    invoke-direct {v11, v12, v13, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v12, 0x1

    new-array v12, v12, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v13, 0x0

    aput-object v14, v12, v13

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandThumb1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_HAND:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3c23d70a    # 0.01f

    const v13, -0x42b33333    # -0.05f

    const/4 v14, 0x0

    invoke-direct {v11, v12, v13, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-direct {v12, v13, v14, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v9 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v12, 0x3d4ccccd    # 0.05f

    const v13, 0x3da3d70a    # 0.08f

    const v14, 0x3cf5c28f    # 0.03f

    invoke-direct {v11, v12, v13, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_HAND:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v10, v11, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWristRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v13, 0x0

    const v14, -0x41ae147b    # -0.205f

    const/high16 v17, -0x80000000

    move/from16 v0, v17

    invoke-direct {v12, v13, v14, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v14, -0x80000000

    const v17, -0x41ae147b    # -0.205f

    const/high16 v18, -0x80000000

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v13, v14, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v14, 0x5

    new-array v14, v14, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/16 v17, 0x0

    aput-object v4, v14, v17

    const/4 v4, 0x1

    aput-object v5, v14, v4

    const/4 v4, 0x2

    aput-object v6, v14, v4

    const/4 v4, 0x3

    aput-object v7, v14, v4

    const/4 v4, 0x4

    aput-object v8, v14, v4

    const/4 v4, 0x1

    new-array v0, v4, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v17, v0

    const/4 v4, 0x0

    aput-object v9, v17, v4

    move-object v4, v10

    move-object v5, v11

    move-object v6, v12

    move-object v7, v13

    move-object v8, v14

    move-object/from16 v9, v17

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWristRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_LOWER_ARM:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const v8, -0x42333333    # -0.1f

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d23d70a    # 0.04f

    const v8, 0x3e0f5c29    # 0.14f

    const v9, 0x3d23d70a    # 0.04f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_LOWER_ARM:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mElbowRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const v8, -0x41820c4a    # -0.248f

    const/high16 v9, -0x80000000

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const v9, -0x41820c4a    # -0.248f

    const/high16 v12, -0x80000000

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object v4, v11

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mElbowRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_UPPER_ARM:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const v8, -0x420a3d71    # -0.12f

    const v9, 0x3c23d70a    # 0.01f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d4ccccd    # 0.05f

    const v8, 0x3e2e147b    # 0.17f

    const v9, 0x3d4ccccd    # 0.05f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_UPPER_ARM:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mShoulderRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const v8, -0x425e353f    # -0.079f

    const/high16 v9, -0x80000000

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const v9, -0x425d5a18

    const/high16 v12, -0x80000000

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v11, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v11, 0x0

    aput-object v4, v9, v11

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mShoulderRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_CLAVICLE:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3ca3d70a    # 0.02f

    const/4 v8, 0x0

    const v9, 0x3ca3d70a    # 0.02f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d8f5c29    # 0.07f

    const v8, 0x3e0f5c29    # 0.14f

    const v9, 0x3d4ccccd    # 0.05f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_CLAVICLE:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mCollarRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x4353f7cf    # -0.021f

    const v8, -0x4251eb85    # -0.085f

    const v9, 0x3e28f5c3    # 0.165f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x435490e6    # -0.020927f

    const v9, -0x4251eb85    # -0.085f

    const v11, 0x3e295d92

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object v4, v14

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mCollarRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41d0e560    # -0.171f

    const v8, 0x3e3126e9    # 0.173f

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41d0e560    # -0.171f

    const v9, 0x3e3126e9    # 0.173f

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4FanLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41d0e560    # -0.171f

    const v9, 0x3e3126e9    # 0.173f

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x41d0e560    # -0.171f

    const v10, 0x3e3126e9    # 0.173f

    const/4 v11, 0x0

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4FanLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41c6a7f0    # -0.181f

    const v8, 0x3e3b645a    # 0.183f

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41c6a7f0    # -0.181f

    const v9, 0x3e3b645a    # 0.183f

    const/4 v12, 0x0

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x2

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v4, 0x1

    aput-object v5, v8, v4

    const/4 v9, 0x0

    move-object v4, v10

    move-object v5, v11

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41d3f7cf    # -0.168f

    const v8, 0x3e2d0e56    # 0.169f

    const v9, 0x3d89374c    # 0.067f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41d3f7cf    # -0.168f

    const v9, 0x3e2d0e56    # 0.169f

    const v11, 0x3d89374c    # 0.067f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x42353f7d    # -0.099f

    const v8, 0x3dd70a3d    # 0.105f

    const v9, 0x3e395810    # 0.181f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x42353f7d    # -0.099f

    const v9, 0x3dd70a3d    # 0.105f

    const v10, 0x3e395810    # 0.181f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v11

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41d0e560    # -0.171f

    const v8, -0x41ced917    # -0.173f

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41d0e560    # -0.171f

    const v9, -0x41ced917    # -0.173f

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4FanRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41d0e560    # -0.171f

    const v9, -0x41ced917    # -0.173f

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x41d0e560    # -0.171f

    const v10, -0x41ced917    # -0.173f

    const/4 v12, 0x0

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4FanRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41c6a7f0    # -0.181f

    const v8, -0x41c49ba6    # -0.183f

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41c6a7f0    # -0.181f

    const v9, -0x41c49ba6    # -0.183f

    const/4 v13, 0x0

    invoke-direct {v7, v8, v9, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x2

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v4, 0x1

    aput-object v5, v8, v4

    const/4 v9, 0x0

    move-object v4, v10

    move-object v5, v12

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41d3f7cf    # -0.168f

    const v8, -0x41d2f1aa    # -0.169f

    const v9, 0x3d89374c    # 0.067f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41d3f7cf    # -0.168f

    const v9, -0x41d2f1aa    # -0.169f

    const v12, 0x3d89374c    # 0.067f

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x42353f7d    # -0.099f

    const v8, -0x4228f5c3    # -0.105f

    const v9, 0x3e395810    # 0.181f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x42353f7d    # -0.099f

    const v9, -0x4228f5c3    # -0.105f

    const v12, 0x3e395810    # 0.181f

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWingsRoot:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x439a9fbe    # -0.014f

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x439a9fbe    # -0.014f

    const/4 v9, 0x0

    const/4 v12, 0x0

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x2

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v11, v8, v9

    const/4 v9, 0x1

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWingsRoot:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->CHEST:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3ce56042    # 0.028f

    const/4 v9, 0x0

    const v10, 0x3d8f5c29    # 0.07f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3de147ae    # 0.11f

    const v9, 0x3e19999a    # 0.15f

    const v10, 0x3e4ccccd    # 0.2f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v5, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->CHEST:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->LEFT_PEC:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3df3b646    # 0.119f

    const v10, 0x3da7ef9e    # 0.082f

    const v11, 0x3d2c0831    # 0.042f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3d4ccccd    # 0.05f

    const v10, 0x3d4ccccd    # 0.05f

    const v11, 0x3d4ccccd    # 0.05f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->LEFT_PEC:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->RIGHT_PEC:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, 0x3df3b646    # 0.119f

    const v11, -0x42581062    # -0.082f

    const v12, 0x3d2c0831    # 0.042f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, 0x3d4ccccd    # 0.05f

    const v11, 0x3d4ccccd    # 0.05f

    const v12, 0x3d4ccccd    # 0.05f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->RIGHT_PEC:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->UPPER_BACK:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const v13, 0x3c8b4396    # 0.017f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-direct {v11, v12, v13, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v11, 0x3db851ec    # 0.09f

    const v12, 0x3e051eb8    # 0.13f

    const v13, 0x3e19999a    # 0.15f

    invoke-direct {v10, v11, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->UPPER_BACK:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mChest:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x438a3d71    # -0.015f

    const/4 v13, 0x0

    const v17, 0x3e51eb85    # 0.205f

    move/from16 v0, v17

    invoke-direct {v12, v9, v13, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x438435f0    # -0.015368f

    const/16 v17, 0x0

    const v18, 0x3e51cb47

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v13, v9, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x4

    new-array v0, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v17, v0

    const/4 v9, 0x0

    aput-object v15, v17, v9

    const/4 v9, 0x1

    aput-object v16, v17, v9

    const/4 v9, 0x2

    aput-object v14, v17, v9

    const/4 v9, 0x3

    aput-object v4, v17, v9

    const/4 v4, 0x4

    new-array v9, v4, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v4, 0x0

    aput-object v5, v9, v4

    const/4 v4, 0x1

    aput-object v6, v9, v4

    const/4 v4, 0x2

    aput-object v7, v9, v4

    const/4 v4, 0x3

    aput-object v8, v9, v4

    move-object v4, v10

    move-object v5, v11

    move-object v6, v12

    move-object v7, v13

    move-object/from16 v8, v17

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mChest:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSpine4:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3c75c28f    # 0.015f

    const/4 v8, 0x0

    const v9, -0x41ae147b    # -0.205f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3c7bca10    # 0.015368f

    const/4 v9, 0x0

    const v11, -0x41ae34b9

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSpine4:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSpine3:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x438a3d71    # -0.015f

    const/4 v8, 0x0

    const v9, 0x3e51eb85    # 0.205f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x438435f0    # -0.015368f

    const/4 v9, 0x0

    const v10, 0x3e51cb47

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v13

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSpine3:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->BELLY:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3ce56042    # 0.028f

    const/4 v8, 0x0

    const v9, 0x3d23d70a    # 0.04f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3db851ec    # 0.09f

    const v8, 0x3e051eb8    # 0.13f

    const v9, 0x3e19999a    # 0.15f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->BELLY:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->LEFT_HANDLE:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const v9, 0x3dcccccd    # 0.1f

    const v10, 0x3d6d9168    # 0.058f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3d4ccccd    # 0.05f

    const v9, 0x3d4ccccd    # 0.05f

    const v10, 0x3d4ccccd    # 0.05f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v5, v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->LEFT_HANDLE:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->RIGHT_HANDLE:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v9, 0x0

    const v10, -0x42333333    # -0.1f

    const v11, 0x3d6d9168    # 0.058f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3d4ccccd    # 0.05f

    const v10, 0x3d4ccccd    # 0.05f

    const v11, 0x3d4ccccd    # 0.05f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->RIGHT_HANDLE:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->LOWER_BACK:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const v12, 0x3cbc6a7f    # 0.023f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    invoke-direct {v10, v11, v12, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, 0x3db851ec    # 0.09f

    const v11, 0x3e051eb8    # 0.13f

    const v12, 0x3e19999a    # 0.15f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->LOWER_BACK:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTorso:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v14, 0x3dac0831    # 0.084f

    invoke-direct {v12, v8, v9, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v15, 0x3dac2e77    # 0.084073f

    invoke-direct {v14, v8, v9, v15}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v13, v8, v9

    const/4 v9, 0x4

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v13, 0x0

    aput-object v4, v9, v13

    const/4 v4, 0x1

    aput-object v5, v9, v4

    const/4 v4, 0x2

    aput-object v6, v9, v4

    const/4 v4, 0x3

    aput-object v7, v9, v4

    move-object v4, v10

    move-object v5, v11

    move-object v6, v12

    move-object v7, v14

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTorso:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSpine2:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const v9, -0x4253f7cf    # -0.084f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v11, -0x4253d189    # -0.084073f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSpine2:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSpine1:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const v9, 0x3dac0831    # 0.084f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v10, 0x3dac2e77    # 0.084073f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v13

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mSpine1:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mToeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3ddf3b64    # 0.109f

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3dd7db6e

    const v9, -0x43d579af    # -0.010408f

    const v10, -0x4725e56d    # -1.04E-4f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mToeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFootRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3de56042    # 0.112f

    const/high16 v8, -0x80000000

    const v9, -0x428624dd    # -0.061f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3de54930    # 0.111956f

    const/high16 v9, -0x80000000

    const v11, -0x4287a17f    # -0.060637f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFootRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_FOOT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d9db22d    # 0.077f

    const/4 v8, 0x0

    const v9, -0x42d81062    # -0.041f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3e051eb8    # 0.13f

    const v8, 0x3d4ccccd    # 0.05f

    const v9, 0x3d4ccccd    # 0.05f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_FOOT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mAnkleRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x43126e98    # -0.029f

    const/4 v8, 0x0

    const v9, -0x4110624e    # -0.468f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x43138152    # -0.028869f

    const/4 v9, 0x0

    const v12, -0x4110218e

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object v4, v11

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mAnkleRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_LOWER_LEG:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x435c28f6    # -0.02f

    const/4 v8, 0x0

    const v9, -0x41b33333    # -0.2f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d75c28f    # 0.06f

    const v8, 0x3d75c28f    # 0.06f

    const/high16 v9, 0x3e800000    # 0.25f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_LOWER_LEG:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mKneeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x457ced91    # -0.001f

    const v8, 0x3d48b439    # 0.049f

    const v9, -0x41049ba6    # -0.491f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x45b38716    # -7.8E-4f

    const v9, 0x3d47357e

    const v12, -0x4104a5df

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v11, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v11, 0x0

    aput-object v4, v9, v11

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mKneeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_UPPER_LEG:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x435c28f6    # -0.02f

    const v8, 0x3d4ccccd    # 0.05f

    const v9, -0x419eb852    # -0.22f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3db851ec    # 0.09f

    const v8, 0x3db851ec    # 0.09f

    const v9, 0x3ea3d70a    # 0.32f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->R_UPPER_LEG:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d0b4396    # 0.034f

    const v8, -0x41fbe76d    # -0.129f

    const v9, -0x42d81062    # -0.041f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3d09b520    # 0.03362f

    const v9, -0x41fc1a48

    const v11, -0x42d7b635    # -0.041086f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object v4, v14

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mToeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3ddf3b64    # 0.109f

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3dd7d524

    const v9, 0x3c077ee5    # 0.00827f

    const v10, 0x3a6453d2    # 8.71E-4f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mToeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFootLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3de56042    # 0.112f

    const/high16 v8, -0x80000000

    const v9, -0x428624dd    # -0.061f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3de54930    # 0.111956f

    const/high16 v9, -0x80000000

    const v11, -0x4287b353    # -0.06062f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFootLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_FOOT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d9db22d    # 0.077f

    const/4 v8, 0x0

    const v9, -0x42d81062    # -0.041f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3e051eb8    # 0.13f

    const v8, 0x3d4ccccd    # 0.05f

    const v9, 0x3d4ccccd    # 0.05f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_FOOT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mAnkleLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x43126e98    # -0.029f

    const v8, 0x3a83126f    # 0.001f

    const v9, -0x4110624e    # -0.468f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x43135b92    # -0.028887f

    const v9, 0x3ab49e02    # 0.001378f

    const v12, -0x41102774

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object v4, v11

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mAnkleLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_LOWER_LEG:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x435c28f6    # -0.02f

    const/4 v8, 0x0

    const v9, -0x41b33333    # -0.2f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d75c28f    # 0.06f

    const v8, 0x3d75c28f    # 0.06f

    const/high16 v9, 0x3e800000    # 0.25f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_LOWER_LEG:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mKneeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x457ced91    # -0.001f

    const v8, -0x42c39581    # -0.046f

    const v9, -0x41049ba6    # -0.491f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x45977a70    # -8.87E-4f

    const v9, -0x42c55a7d    # -0.045568f

    const v12, -0x410494b4

    invoke-direct {v7, v8, v9, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v11, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v11, 0x0

    aput-object v4, v9, v11

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mKneeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_UPPER_LEG:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x435c28f6    # -0.02f

    const v8, -0x42b33333    # -0.05f

    const v9, -0x419eb852    # -0.22f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3db851ec    # 0.09f

    const v8, 0x3db851ec    # 0.09f

    const v9, 0x3ea3d70a    # 0.32f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->L_UPPER_LEG:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d0b4396    # 0.034f

    const v8, 0x3e020c4a    # 0.127f

    const v9, -0x42d81062    # -0.041f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3d0a44c8

    const v9, 0x3e01ceaf

    const v11, -0x42d8127b    # -0.040998f

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    move-object v4, v15

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail6:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x423f7cee    # -0.094f

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x423f7cee    # -0.094f

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail6:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail5:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x421a9fbe    # -0.112f

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x421a9fbe    # -0.112f

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail5:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail4:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41ee978d    # -0.142f

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41ee978d    # -0.142f

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail4:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail3:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41d3f7cf    # -0.168f

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41d3f7cf    # -0.168f

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail3:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail2:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x41b645a2    # -0.197f

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41b645a2    # -0.197f

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-direct {v7, v8, v9, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v10, v8, v9

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail2:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail1:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, -0x42126e98    # -0.116f

    const/4 v8, 0x0

    const v9, 0x3d408312    # 0.047f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x42126e98    # -0.116f

    const/4 v9, 0x0

    const v10, 0x3d408312    # 0.047f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x1

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x0

    move-object/from16 v4, v16

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail1:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    move-object/from16 v0, v16

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mGroin:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v7, 0x3d83126f    # 0.064f

    const/4 v8, 0x0

    const v9, -0x42395810    # -0.097f

    invoke-direct {v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3d83126f    # 0.064f

    const/4 v9, 0x0

    const v10, -0x42395810    # -0.097f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mGroin:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb4Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3de56042    # 0.112f

    const/4 v9, 0x0

    const v10, -0x428624dd    # -0.061f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3de56042    # 0.112f

    const/4 v10, 0x0

    const v11, -0x428624dd    # -0.061f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb4Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x430a3d71    # -0.03f

    const v9, -0x44bb645a    # -0.003f

    const v10, -0x4110624e    # -0.468f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x430a3d71    # -0.03f

    const v10, -0x44bb645a    # -0.003f

    const v12, -0x4110624e    # -0.468f

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x0

    move-object v5, v11

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb3Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3b03126f    # 0.002f

    const v9, -0x42c39581    # -0.046f

    const v10, -0x41049ba6    # -0.491f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3b03126f    # 0.002f

    const v10, -0x42c39581    # -0.046f

    const v12, -0x41049ba6    # -0.491f

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v11, v9, v10

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb2Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41af1aa0    # -0.204f

    const v9, 0x3e041893    # 0.129f

    const/high16 v10, -0x42000000    # -0.125f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x41af1aa0    # -0.204f

    const v10, 0x3e041893    # 0.129f

    const/high16 v12, -0x42000000    # -0.125f

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x0

    move-object v5, v11

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb4Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3de56042    # 0.112f

    const/4 v9, 0x0

    const v10, -0x428624dd    # -0.061f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3de56042    # 0.112f

    const/4 v10, 0x0

    const v12, -0x428624dd    # -0.061f

    invoke-direct {v8, v9, v10, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb4Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x430a3d71    # -0.03f

    const v9, 0x3b449ba6    # 0.003f

    const v10, -0x4110624e    # -0.468f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x430a3d71    # -0.03f

    const v10, 0x3b449ba6    # 0.003f

    const v17, -0x4110624e    # -0.468f

    move/from16 v0, v17

    invoke-direct {v8, v9, v10, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x0

    move-object v5, v12

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb3Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, 0x3b03126f    # 0.002f

    const v9, 0x3d3c6a7f    # 0.046f

    const v10, -0x41049ba6    # -0.491f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3b03126f    # 0.002f

    const v10, 0x3d3c6a7f    # 0.046f

    const v17, -0x41049ba6    # -0.491f

    move/from16 v0, v17

    invoke-direct {v8, v9, v10, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v12, v9, v10

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb2Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41af1aa0    # -0.204f

    const v9, -0x41fbe76d    # -0.129f

    const/high16 v10, -0x42000000    # -0.125f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x41af1aa0    # -0.204f

    const v10, -0x41fbe76d    # -0.129f

    const/high16 v17, -0x42000000    # -0.125f

    move/from16 v0, v17

    invoke-direct {v8, v9, v10, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x1

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x0

    move-object v5, v12

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v5, v6, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimbsRoot:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v8, -0x41b33333    # -0.2f

    const/4 v9, 0x0

    const v10, 0x3dac0831    # 0.084f

    invoke-direct {v7, v8, v9, v10}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x41b33333    # -0.2f

    const/4 v10, 0x0

    const v17, 0x3dac0831    # 0.084f

    move/from16 v0, v17

    invoke-direct {v8, v9, v10, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v9, 0x2

    new-array v9, v9, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v10, 0x0

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object v12, v9, v10

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimbsRoot:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->PELVIS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, -0x43dc28f6    # -0.01f

    const/4 v10, 0x0

    const v11, -0x435c28f6    # -0.02f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v9, 0x3df5c28f    # 0.12f

    const v10, 0x3e23d70a    # 0.16f

    const v11, 0x3e2e147b    # 0.17f

    invoke-direct {v8, v9, v10, v11}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v6, v7, v8}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->PELVIS:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->BUTT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, -0x428a3d71    # -0.06f

    const/4 v11, 0x0

    const v12, -0x42333333    # -0.1f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-direct {v10, v11, v12, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v8}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v10, 0x3dcccccd    # 0.1f

    const v11, 0x3dcccccd    # 0.1f

    const v12, 0x3dcccccd    # 0.1f

    invoke-direct {v9, v10, v11, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    invoke-virtual {v7, v8, v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;->deform(Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->BUTT:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mPelvis:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v17, 0x3f889375    # 1.067f

    move/from16 v0, v17

    invoke-direct {v12, v8, v9, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v18, 0x3f8893f3

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v0, v8, v9, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    const/4 v8, 0x6

    new-array v8, v8, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v9, 0x0

    aput-object v13, v8, v9

    const/4 v9, 0x1

    aput-object v14, v8, v9

    const/4 v9, 0x2

    aput-object v15, v8, v9

    const/4 v9, 0x3

    aput-object v16, v8, v9

    const/4 v9, 0x4

    aput-object v4, v8, v9

    const/4 v4, 0x5

    aput-object v5, v8, v4

    const/4 v4, 0x2

    new-array v9, v4, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    const/4 v4, 0x0

    aput-object v6, v9, v4

    const/4 v4, 0x1

    aput-object v7, v9, v4

    move-object v4, v10

    move-object v5, v11

    move-object v6, v12

    move-object/from16 v7, v17

    invoke-direct/range {v4 .. v9}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;)V

    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->rootBone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBone;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLDefaultSkeleton;->bones:Ljava/util/Map;

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mPelvis:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
