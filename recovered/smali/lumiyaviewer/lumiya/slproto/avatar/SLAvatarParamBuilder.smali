.class Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamBuilder;
.super Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static buildParams([Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;Ljava/util/Map;)V
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v2

    if-eqz v2, :cond_d

    const-string/jumbo v3, "character/avatar_params.xml"

    const/4 v4, 0x3

    invoke-virtual {v2, v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v15

    const-string/jumbo v2, "UTF-8"

    invoke-static {v15, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->parseXML(Ljava/io/InputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v17

    const/4 v2, 0x0

    move v14, v2

    :goto_0
    move/from16 v0, v17

    if-ge v14, v0, :cond_c

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v18

    const-string/jumbo v2, "params"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v20

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v21

    const/4 v2, 0x0

    move v13, v2

    :goto_1
    move/from16 v0, v20

    if-ge v13, v0, :cond_a

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v22

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string/jumbo v2, "paramColor"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "paramColor"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    const-string/jumbo v2, "values"

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v2

    new-array v5, v2, [I

    const/4 v2, 0x0

    :goto_2
    array-length v6, v5

    if-ge v2, v6, :cond_0

    invoke-virtual {v4, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v6

    aput v6, v5, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_0
    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;

    const-string/jumbo v2, "opcode"

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    move-result-object v2

    invoke-direct {v8, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;[I)V

    :cond_1
    const-string/jumbo v2, "paramAlpha"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v2, "paramAlpha"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    const-string/jumbo v2, "domain"

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v4

    double-to-float v4, v4

    const-string/jumbo v2, "tgaFile"

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "tgaFile"

    invoke-virtual {v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v2

    :goto_3
    const-string/jumbo v5, "skipIfZero"

    invoke-virtual {v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v5

    const-string/jumbo v6, "multiplyBlend"

    invoke-virtual {v3, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v3

    invoke-direct {v9, v4, v2, v5, v3}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;-><init>(FLjava/lang/String;ZZ)V

    :cond_2
    const-string/jumbo v2, "meshIndex"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v2, "meshIndex"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;

    move-result-object v2

    move-object v12, v2

    :goto_4
    const/4 v10, 0x0

    const-string/jumbo v2, "driven"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v11

    const-string/jumbo v2, "driven"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v23

    const/4 v2, 0x0

    move v10, v2

    :goto_5
    invoke-virtual/range {v23 .. v23}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v2

    if-ge v10, v2, :cond_5

    move-object/from16 v0, v23

    invoke-virtual {v0, v10}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;

    const-string/jumbo v3, "driven_id"

    invoke-virtual {v7, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v3

    const-string/jumbo v4, "min1"

    invoke-virtual {v7, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v4

    double-to-float v4, v4

    const-string/jumbo v5, "max1"

    invoke-virtual {v7, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v24

    move-wide/from16 v0, v24

    double-to-float v5, v0

    const-string/jumbo v6, "min2"

    invoke-virtual {v7, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v24

    move-wide/from16 v0, v24

    double-to-float v6, v0

    const-string/jumbo v24, "max2"

    move-object/from16 v0, v24

    invoke-virtual {v7, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v24

    move-wide/from16 v0, v24

    double-to-float v7, v0

    invoke-direct/range {v2 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;-><init>(IFFFF)V

    invoke-virtual {v11, v2}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    add-int/lit8 v2, v10, 0x1

    move v10, v2

    goto :goto_5

    :cond_3
    const/4 v2, 0x0

    goto/16 :goto_3

    :cond_4
    const/4 v2, 0x0

    move-object v12, v2

    goto :goto_4

    :cond_5
    invoke-virtual {v11}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v10

    :cond_6
    const/4 v11, 0x0

    const-string/jumbo v2, "skeleton"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    new-instance v4, Ljava/util/EnumMap;

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-direct {v4, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    const-string/jumbo v2, "skeleton"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    const/4 v2, 0x0

    move v3, v2

    :goto_6
    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getCount()I

    move-result v2

    if-ge v3, v2, :cond_8

    invoke-virtual {v5, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->bones:Lcom/google/common/collect/ImmutableMap;

    const-string/jumbo v7, "bone_id"

    invoke-virtual {v6, v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    if-eqz v2, :cond_7

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;

    const-string/jumbo v11, "scale"

    invoke-static {v6, v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamBuilder;->vectorFromNode(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    move-result-object v11

    const-string/jumbo v23, "offset"

    move-object/from16 v0, v23

    invoke-static {v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamBuilder;->vectorFromNode(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    move-result-object v6

    invoke-direct {v7, v11, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$SkeletonParamDefinition;-><init>(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)V

    invoke-interface {v4, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_6

    :cond_8
    invoke-static {v4}, Lcom/google/common/collect/Maps;->immutableEnumMap(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v11

    :cond_9
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    const-string/jumbo v3, "minValue"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v4

    double-to-float v4, v4

    const-string/jumbo v3, "maxValue"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v6

    double-to-float v5, v6

    const-string/jumbo v3, "defValue"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v6

    double-to-float v6, v6

    const-string/jumbo v3, "morph"

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v7

    move-object v3, v12

    invoke-direct/range {v2 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/MeshIndex;FFFZLcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;Lcom/google/common/collect/ImmutableList;Lcom/google/common/collect/ImmutableMap;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    add-int/lit8 v2, v13, 0x1

    move v13, v2

    goto/16 :goto_1

    :cond_a
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    const-string/jumbo v3, "setId"

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v3

    const-string/jumbo v4, "appearanceIndex"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v4

    const-string/jumbo v5, "setName"

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;->valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;

    move-result-object v5

    invoke-virtual/range {v21 .. v21}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;-><init>(IILcom/lumiyaviewer/lumiya/slproto/avatar/SLVisualParamID;Lcom/google/common/collect/ImmutableList;)V

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->appearanceIndex:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_b

    iget v3, v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->appearanceIndex:I

    aput-object v2, p0, v3

    :cond_b
    add-int/lit8 v2, v14, 0x1

    move v14, v2

    goto/16 :goto_0

    :cond_c
    invoke-virtual {v15}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_d
    :goto_7
    return-void

    :catch_0
    move-exception v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_7

    :catch_1
    move-exception v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_7
.end method

.method private static vectorFromNode(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    const-string/jumbo v2, "x"

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v2

    double-to-float v2, v2

    const-string/jumbo v3, "y"

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v4

    double-to-float v3, v4

    const-string/jumbo v4, "z"

    invoke-virtual {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v4

    double-to-float v0, v4

    invoke-direct {v1, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;-><init>(FFF)V

    return-object v1

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
