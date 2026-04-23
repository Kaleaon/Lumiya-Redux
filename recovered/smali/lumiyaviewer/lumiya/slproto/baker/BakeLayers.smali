.class public Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;
.super Ljava/lang/Object;


# static fields
.field public static layerSets:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;",
            "Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 37

    new-instance v1, Ljava/util/EnumMap;

    const-class v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-direct {v1, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;->layerSets:Ljava/util/Map;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v2, "base"

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->hair_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v4, 0x0

    new-array v13, v4, [I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v1 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v3, "hair texture alpha layer"

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v4, 0x0

    new-array v14, v4, [I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v2 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v4, "hair alpha"

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HAIR_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v5, 0x0

    new-array v15, v5, [I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v3 .. v15}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    const/4 v4, 0x1

    new-array v6, v4, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const/4 v4, 0x0

    aput-object v1, v6, v4

    const/4 v1, 0x2

    new-array v7, v1, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const/4 v1, 0x0

    aput-object v2, v7, v1

    const/4 v1, 0x1

    aput-object v3, v7, v1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const/16 v3, 0x200

    const/16 v4, 0x200

    const/4 v5, 0x0

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;IIZ[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;->layerSets:Ljava/util/Map;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HAIR:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v2, "head bump base"

    const/4 v3, 0x0

    new-array v13, v3, [I

    const/4 v3, 0x0

    const/4 v4, 0x1

    const v5, -0x7f7f80

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v1 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v3, "head bump definition"

    const-string/jumbo v12, "bump_head_base.tga"

    const/4 v4, 0x1

    new-array v14, v4, [I

    const/16 v4, 0x369

    const/4 v5, 0x0

    aput v4, v14, v5

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v2 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v4, "base"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->skin_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const-string/jumbo v13, "head_skingrain.tga"

    const/4 v6, 0x0

    new-array v15, v6, [I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v3 .. v15}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v5, "headcolor"

    const-string/jumbo v14, "head_color.tga"

    const/4 v6, 0x0

    new-array v0, v6, [I

    move-object/from16 v16, v0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x0

    invoke-direct/range {v4 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v6, "shadow"

    const-string/jumbo v15, "head_shading_alpha.tga"

    const/4 v7, 0x1

    new-array v0, v7, [I

    move-object/from16 v17, v0

    const/16 v7, 0x9e

    const/4 v8, 0x0

    aput v7, v17, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x1

    invoke-direct/range {v5 .. v17}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v7, "highlight"

    const-string/jumbo v16, "head_highlights_alpha.tga"

    const/4 v8, 0x1

    new-array v0, v8, [I

    move-object/from16 v18, v0

    const/16 v8, 0x9f

    const/4 v9, 0x0

    aput v8, v18, v9

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x1

    invoke-direct/range {v6 .. v18}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v8, "rosyface"

    const-string/jumbo v17, "rosyface_alpha.tga"

    const/4 v9, 0x1

    new-array v0, v9, [I

    move-object/from16 v19, v0

    const/16 v9, 0x74

    const/4 v10, 0x0

    aput v9, v19, v10

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x1

    invoke-direct/range {v7 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v9, "lips"

    const-string/jumbo v18, "lips_mask.tga"

    const/4 v10, 0x1

    new-array v0, v10, [I

    move-object/from16 v20, v0

    const/16 v10, 0x75

    const/4 v11, 0x0

    aput v10, v20, v11

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x1

    invoke-direct/range {v8 .. v20}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v10, "wrinkles_shading"

    const/4 v11, 0x1

    new-array v0, v11, [I

    move-object/from16 v21, v0

    const/16 v11, 0x76

    const/4 v12, 0x0

    aput v11, v21, v12

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/high16 v13, 0x64000000

    const/4 v14, 0x1

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v9 .. v21}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v11, "freckles"

    const/4 v12, 0x1

    new-array v0, v12, [I

    move-object/from16 v22, v0

    const/16 v12, 0xa5

    const/4 v13, 0x0

    aput v12, v22, v13

    const/4 v12, 0x0

    const/4 v13, 0x1

    const v14, -0x7febd088

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v10 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v12, "eyebrowsbump"

    const-string/jumbo v21, "head_hair.tga"

    const/16 v13, 0x3e8

    const/16 v14, 0x3ea

    filled-new-array {v13, v14}, [I

    move-result-object v23

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v11 .. v23}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v13, "eyebrows"

    sget-object v14, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->hair_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const-string/jumbo v22, "head_hair.tga"

    const/16 v15, 0x3e9

    const/16 v16, 0x3eb

    filled-new-array/range {v15 .. v16}, [I

    move-result-object v24

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    invoke-direct/range {v12 .. v24}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v14, "lipstick"

    const/16 v15, 0x2bc

    const/16 v16, 0x2bd

    filled-new-array/range {v15 .. v16}, [I

    move-result-object v25

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v13 .. v25}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v15, "lipgloss"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v26, v0

    const/16 v16, 0x2be

    const/16 v17, 0x0

    aput v16, v26, v17

    const/16 v16, 0x0

    const/16 v17, 0x1

    const v18, -0x41000001    # -0.49999997f

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-direct/range {v14 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v16, "blush"

    const/16 v17, 0x2c0

    const/16 v18, 0x2c1

    const/16 v19, 0x2c7

    filled-new-array/range {v17 .. v19}, [I

    move-result-object v27

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-direct/range {v15 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v17, "Outer Eye Shadow"

    const/16 v18, 0x2c4

    const/16 v19, 0x2c2

    const/16 v20, 0x2c3

    filled-new-array/range {v18 .. v20}, [I

    move-result-object v28

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-direct/range {v16 .. v28}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v18, "Inner Eye Shadow"

    const/16 v19, 0x2c8

    const/16 v20, 0x2c9

    const/16 v21, 0x2c5

    filled-new-array/range {v19 .. v21}, [I

    move-result-object v29

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v17 .. v29}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v18, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v19, "eyeliner"

    const/16 v20, 0x2bf

    const/16 v21, 0x2ca

    filled-new-array/range {v20 .. v21}, [I

    move-result-object v30

    const/16 v20, 0x0

    const/16 v21, 0x1

    const/high16 v22, -0x38000000    # -131072.0f

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    invoke-direct/range {v18 .. v30}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v19, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v20, "facialhair bump"

    const-string/jumbo v29, "head_hair.tga"

    const/16 v21, 0x3ec

    const/16 v22, 0x3ee

    const/16 v23, 0x3f0

    const/16 v24, 0x3f2

    const/16 v25, 0x3f4

    filled-new-array/range {v21 .. v25}, [I

    move-result-object v31

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x1

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v30, 0x0

    invoke-direct/range {v19 .. v31}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v20, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v21, "facialhair"

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->hair_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const-string/jumbo v30, "head_hair.tga"

    const/16 v23, 0x3ed

    const/16 v24, 0x3ef

    const/16 v25, 0x3f1

    const/16 v26, 0x3f3

    const/16 v27, 0x2ef

    filled-new-array/range {v23 .. v27}, [I

    move-result-object v32

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v31, 0x0

    invoke-direct/range {v20 .. v32}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v22, "head_bodypaint"

    sget-object v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HEAD_BODYPAINT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v33, v0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v21 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v22, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v23, "eyelash alpha"

    const-string/jumbo v32, "head_alpha.tga"

    const/16 v24, 0x0

    move/from16 v0, v24

    new-array v0, v0, [I

    move-object/from16 v34, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x1

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v33, 0x1

    invoke-direct/range {v22 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v24, "head alpha"

    sget-object v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HEAD_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [I

    move-object/from16 v35, v0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x1

    const/16 v30, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    invoke-direct/range {v23 .. v35}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v24, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v25, "head_tattoo"

    sget-object v32, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_HEAD_TATTOO:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v26, 0x426

    const/16 v27, 0x427

    const/16 v28, 0x428

    filled-new-array/range {v26 .. v28}, [I

    move-result-object v36

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    invoke-direct/range {v24 .. v36}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    const/16 v25, 0x16

    move/from16 v0, v25

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v1, v25, v26

    const/4 v1, 0x1

    aput-object v2, v25, v1

    const/4 v1, 0x2

    aput-object v3, v25, v1

    const/4 v1, 0x3

    aput-object v4, v25, v1

    const/4 v1, 0x4

    aput-object v5, v25, v1

    const/4 v1, 0x5

    aput-object v6, v25, v1

    const/4 v1, 0x6

    aput-object v7, v25, v1

    const/4 v1, 0x7

    aput-object v8, v25, v1

    const/16 v1, 0x8

    aput-object v9, v25, v1

    const/16 v1, 0x9

    aput-object v10, v25, v1

    const/16 v1, 0xa

    aput-object v11, v25, v1

    const/16 v1, 0xb

    aput-object v12, v25, v1

    const/16 v1, 0xc

    aput-object v13, v25, v1

    const/16 v1, 0xd

    aput-object v14, v25, v1

    const/16 v1, 0xe

    aput-object v15, v25, v1

    const/16 v1, 0xf

    aput-object v16, v25, v1

    const/16 v1, 0x10

    aput-object v17, v25, v1

    const/16 v1, 0x11

    aput-object v18, v25, v1

    const/16 v1, 0x12

    aput-object v19, v25, v1

    const/16 v1, 0x13

    aput-object v20, v25, v1

    const/16 v1, 0x14

    aput-object v21, v25, v1

    const/16 v1, 0x15

    aput-object v24, v25, v1

    const/4 v1, 0x2

    new-array v7, v1, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const/4 v1, 0x0

    aput-object v22, v7, v1

    const/4 v1, 0x1

    aput-object v23, v7, v1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const/16 v3, 0x200

    const/16 v4, 0x200

    const/4 v5, 0x1

    move-object/from16 v6, v25

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;IIZ[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;->layerSets:Ljava/util/Map;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_HEAD:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v2, "base_upperbody bump"

    const/4 v3, 0x0

    new-array v13, v3, [I

    const/4 v3, 0x0

    const/4 v4, 0x1

    const v5, -0x7f7f80

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v1 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v3, "upperbody bump definition"

    const-string/jumbo v12, "bump_upperbody_base.tga"

    const/4 v4, 0x1

    new-array v14, v4, [I

    const/16 v4, 0x36a

    const/4 v5, 0x0

    aput v4, v14, v5

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v2 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v4, "base"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->skin_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const-string/jumbo v13, "body_skingrain.tga"

    const/4 v6, 0x0

    new-array v15, v6, [I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v3 .. v15}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v5, "nipples"

    const-string/jumbo v14, "upperbody_color.tga"

    const/4 v6, 0x0

    new-array v0, v6, [I

    move-object/from16 v16, v0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x0

    invoke-direct/range {v4 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v6, "shadow"

    const-string/jumbo v15, "upperbody_shading_alpha.tga"

    const/4 v7, 0x1

    new-array v0, v7, [I

    move-object/from16 v17, v0

    const/16 v7, 0x7d

    const/4 v8, 0x0

    aput v7, v17, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x1

    invoke-direct/range {v5 .. v17}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v7, "highlight"

    const-string/jumbo v16, "upperbody_highlights_alpha.tga"

    const/4 v8, 0x1

    new-array v0, v8, [I

    move-object/from16 v18, v0

    const/16 v8, 0x7e

    const/4 v9, 0x0

    aput v8, v18, v9

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x1

    invoke-direct/range {v6 .. v18}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v8, "upper_bodypaint"

    sget-object v15, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_BODYPAINT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v9, 0x0

    new-array v0, v9, [I

    move-object/from16 v19, v0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v7 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v9, "freckles upper"

    const/4 v10, 0x1

    new-array v0, v10, [I

    move-object/from16 v20, v0

    const/16 v10, 0x308

    const/4 v11, 0x0

    aput v10, v20, v11

    const/4 v10, 0x0

    const/4 v11, 0x1

    const v12, -0x7febd088

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-direct/range {v8 .. v20}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v10, "upper_tattoo"

    sget-object v17, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_TATTOO:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v11, 0x429

    const/16 v12, 0x42a

    const/16 v13, 0x42b

    filled-new-array {v11, v12, v13}, [I

    move-result-object v21

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v9 .. v21}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v11, "upper_undershirt bump"

    sget-object v18, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_UNDERSHIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v12, 0x413

    const/16 v13, 0x415

    const/16 v14, 0x417

    const/16 v15, 0x419

    filled-new-array {v12, v13, v14, v15}, [I

    move-result-object v22

    const/4 v12, 0x0

    const/4 v13, 0x1

    const v14, -0x7f7f80

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v10 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v12, "upper_undershirt"

    sget-object v19, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_UNDERSHIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v13, 0x7

    new-array v0, v13, [I

    move-object/from16 v23, v0

    fill-array-data v23, :array_0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v11 .. v23}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v13, "Nail Polish"

    const/16 v14, 0x2c6

    const/16 v15, 0x2cb

    filled-new-array {v14, v15}, [I

    move-result-object v24

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-direct/range {v12 .. v24}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v14, "upper_gloves bump"

    sget-object v21, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_GLOVES:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v15, 0x423

    const/16 v16, 0x425

    filled-new-array/range {v15 .. v16}, [I

    move-result-object v25

    const/4 v15, 0x0

    const/16 v16, 0x1

    const v17, -0x7f7f80

    const/16 v18, 0x1

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x1

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v13 .. v25}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v15, "upper_gloves"

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_GLOVES:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v16, 0x33b

    const/16 v17, 0x33d

    const/16 v18, 0x33e

    const/16 v19, 0x422

    const/16 v20, 0x424

    filled-new-array/range {v16 .. v20}, [I

    move-result-object v26

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-direct/range {v14 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v16, "upper_clothes_shadow"

    sget-object v23, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_SHIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v17, 0x383

    const/16 v18, 0x384

    const/16 v19, 0x385

    const/16 v20, 0x386

    const/16 v21, 0x387

    filled-new-array/range {v17 .. v21}, [I

    move-result-object v27

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-direct/range {v15 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v17, "upper_shirt base bump"

    sget-object v24, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_SHIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v18, 0x405

    const/16 v19, 0x406

    const/16 v20, 0x407

    const/16 v21, 0x408

    filled-new-array/range {v18 .. v21}, [I

    move-result-object v28

    const/16 v18, 0x0

    const/16 v19, 0x1

    const v20, -0x7f7f80

    const/16 v21, 0x1

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v25, 0x1

    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-direct/range {v16 .. v28}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v18, "upper_clothes bump"

    sget-object v25, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_SHIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v27, "bump_shirt_wrinkles.tga"

    const/16 v19, 0x364

    const/16 v20, 0x3f5

    const/16 v21, 0x3f6

    const/16 v22, 0x3f7

    const/16 v23, 0x3f8

    filled-new-array/range {v19 .. v23}, [I

    move-result-object v29

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x1

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v26, 0x1

    const/16 v28, 0x0

    invoke-direct/range {v17 .. v29}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v18, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v19, "upper_clothes"

    sget-object v26, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_SHIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v20, 0x7

    move/from16 v0, v20

    new-array v0, v0, [I

    move-object/from16 v30, v0

    fill-array-data v30, :array_1

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    invoke-direct/range {v18 .. v30}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v19, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v20, "upper_jacket base bump"

    sget-object v27, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_JACKET:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v21, 0x40f

    const/16 v22, 0x410

    const/16 v23, 0x411

    const/16 v24, 0x40d

    const/16 v25, 0x40e

    filled-new-array/range {v21 .. v25}, [I

    move-result-object v31

    const/16 v21, 0x0

    const/16 v22, 0x1

    const v23, -0x7f7f80

    const/16 v24, 0x1

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v28, 0x1

    const/16 v29, 0x0

    const/16 v30, 0x0

    invoke-direct/range {v19 .. v31}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v20, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v21, "upper_jacket bump"

    sget-object v28, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_JACKET:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v30, "bump_shirt_wrinkles.tga"

    const/16 v22, 0x6

    move/from16 v0, v22

    new-array v0, v0, [I

    move-object/from16 v32, v0

    fill-array-data v32, :array_2

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x1

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v29, 0x1

    const/16 v31, 0x0

    invoke-direct/range {v20 .. v32}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v22, "upper_jacket"

    sget-object v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_JACKET:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v23, 0x8

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v33, v0

    fill-array-data v33, :array_3

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    invoke-direct/range {v21 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v22, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v23, "upper alpha"

    sget-object v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_UPPER_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v24, 0x0

    move/from16 v0, v24

    new-array v0, v0, [I

    move-object/from16 v34, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x1

    const/16 v29, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    invoke-direct/range {v22 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    const/16 v23, 0x15

    move/from16 v0, v23

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v1, v23, v24

    const/4 v1, 0x1

    aput-object v2, v23, v1

    const/4 v1, 0x2

    aput-object v3, v23, v1

    const/4 v1, 0x3

    aput-object v4, v23, v1

    const/4 v1, 0x4

    aput-object v5, v23, v1

    const/4 v1, 0x5

    aput-object v6, v23, v1

    const/4 v1, 0x6

    aput-object v7, v23, v1

    const/4 v1, 0x7

    aput-object v8, v23, v1

    const/16 v1, 0x8

    aput-object v9, v23, v1

    const/16 v1, 0x9

    aput-object v10, v23, v1

    const/16 v1, 0xa

    aput-object v11, v23, v1

    const/16 v1, 0xb

    aput-object v12, v23, v1

    const/16 v1, 0xc

    aput-object v13, v23, v1

    const/16 v1, 0xd

    aput-object v14, v23, v1

    const/16 v1, 0xe

    aput-object v15, v23, v1

    const/16 v1, 0xf

    aput-object v16, v23, v1

    const/16 v1, 0x10

    aput-object v17, v23, v1

    const/16 v1, 0x11

    aput-object v18, v23, v1

    const/16 v1, 0x12

    aput-object v19, v23, v1

    const/16 v1, 0x13

    aput-object v20, v23, v1

    const/16 v1, 0x14

    aput-object v21, v23, v1

    const/4 v1, 0x1

    new-array v7, v1, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const/4 v1, 0x0

    aput-object v22, v7, v1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_UPPER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const/16 v3, 0x200

    const/16 v4, 0x200

    const/4 v5, 0x1

    move-object/from16 v6, v23

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;IIZ[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;->layerSets:Ljava/util/Map;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_UPPER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v2, "lower body bump base"

    const/4 v3, 0x0

    new-array v13, v3, [I

    const/4 v3, 0x0

    const/4 v4, 0x1

    const v5, -0x7f7f80

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v1 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v3, "base_lowerbody bump"

    const-string/jumbo v12, "bump_lowerbody_base.tga"

    const/4 v4, 0x1

    new-array v14, v4, [I

    const/16 v4, 0x36e

    const/4 v5, 0x0

    aput v4, v14, v5

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v2 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v4, "base"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->skin_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    const-string/jumbo v13, "body_skingrain.tga"

    const/4 v6, 0x0

    new-array v15, v6, [I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v3 .. v15}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v5, "shadow"

    const-string/jumbo v14, "lowerbody_shading_alpha.tga"

    const/4 v6, 0x1

    new-array v0, v6, [I

    move-object/from16 v16, v0

    const/16 v6, 0xa0

    const/4 v7, 0x0

    aput v6, v16, v7

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x1

    invoke-direct/range {v4 .. v16}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v6, "highlight"

    const-string/jumbo v15, "lowerbody_highlights_alpha.tga"

    const/4 v7, 0x1

    new-array v0, v7, [I

    move-object/from16 v17, v0

    const/16 v7, 0xa1

    const/4 v8, 0x0

    aput v7, v17, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x1

    invoke-direct/range {v5 .. v17}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v7, "toenails"

    const-string/jumbo v16, "lowerbody_color.tga"

    const/4 v8, 0x0

    new-array v0, v8, [I

    move-object/from16 v18, v0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x0

    invoke-direct/range {v6 .. v18}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v8, "lower_bodypaint"

    sget-object v15, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_BODYPAINT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v9, 0x0

    new-array v0, v9, [I

    move-object/from16 v19, v0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v7 .. v19}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v8, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v9, "freckles lower"

    const/4 v10, 0x1

    new-array v0, v10, [I

    move-object/from16 v20, v0

    const/16 v10, 0x309

    const/4 v11, 0x0

    aput v10, v20, v11

    const/4 v10, 0x0

    const/4 v11, 0x1

    const v12, -0x7febd088

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-direct/range {v8 .. v20}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v10, "lower_tattoo"

    sget-object v17, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_TATTOO:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v11, 0x42c

    const/16 v12, 0x42d

    const/16 v13, 0x42e

    filled-new-array {v11, v12, v13}, [I

    move-result-object v21

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v9 .. v21}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v11, "lower_underpants bump"

    sget-object v18, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_UNDERPANTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v12, 0x41f

    const/16 v13, 0x421

    filled-new-array {v12, v13}, [I

    move-result-object v22

    const/4 v12, 0x0

    const/4 v13, 0x1

    const v14, -0x7f7f80

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v10 .. v22}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v12, "lower_underpants"

    sget-object v19, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_UNDERPANTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v13, 0x338

    const/16 v14, 0x339

    const/16 v15, 0x33a

    const/16 v16, 0x41e

    const/16 v17, 0x420

    filled-new-array/range {v13 .. v17}, [I

    move-result-object v23

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-direct/range {v11 .. v23}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v12, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v13, "lower_socks bump"

    sget-object v20, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_SOCKS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v14, 0x1

    new-array v0, v14, [I

    move-object/from16 v24, v0

    const/16 v14, 0x41b

    const/4 v15, 0x0

    aput v14, v24, v15

    const/4 v14, 0x0

    const/4 v15, 0x1

    const v16, -0x7f7f80

    const/16 v17, 0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v21, 0x1

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-direct/range {v12 .. v24}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v13, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v14, "lower_socks"

    sget-object v21, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_SOCKS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v15, 0x332

    const/16 v16, 0x333

    const/16 v17, 0x334

    const/16 v18, 0x41a

    filled-new-array/range {v15 .. v18}, [I

    move-result-object v25

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v13 .. v25}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v14, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v15, "lower_shoes bump"

    sget-object v22, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_SHOES:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v26, v0

    const/16 v16, 0x41d

    const/16 v17, 0x0

    aput v16, v26, v17

    const/16 v16, 0x0

    const/16 v17, 0x1

    const v18, -0x7f7f80

    const/16 v19, 0x1

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x1

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-direct/range {v14 .. v26}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v15, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v16, "lower_shoes"

    sget-object v23, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_SHOES:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v17, 0x32c

    const/16 v18, 0x32d

    const/16 v19, 0x331

    const/16 v20, 0x41c

    filled-new-array/range {v17 .. v20}, [I

    move-result-object v27

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-direct/range {v15 .. v27}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v16, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v17, "lower_clothes_shadow"

    sget-object v24, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_PANTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v18, 0x391

    const/16 v19, 0x392

    const/16 v20, 0x393

    filled-new-array/range {v18 .. v20}, [I

    move-result-object v28

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-direct/range {v16 .. v28}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v17, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v18, "lower_pants base bump"

    sget-object v25, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_PANTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v19, 0x40b

    const/16 v20, 0x40c

    filled-new-array/range {v19 .. v20}, [I

    move-result-object v29

    const/16 v19, 0x0

    const/16 v20, 0x1

    const v21, -0x7f7f80

    const/16 v22, 0x1

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v26, 0x1

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v17 .. v29}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v18, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v19, "lower_pants bump"

    sget-object v26, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_PANTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v28, "bump_pants_wrinkles.tga"

    const/16 v20, 0x365

    const/16 v21, 0x3f9

    const/16 v22, 0x3fa

    filled-new-array/range {v20 .. v22}, [I

    move-result-object v30

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x1

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x1

    const/16 v29, 0x0

    invoke-direct/range {v18 .. v30}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v19, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v20, "lower_pants"

    sget-object v27, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_PANTS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v21, 0x326

    const/16 v22, 0x327

    const/16 v23, 0x328

    const/16 v24, 0x266

    const/16 v25, 0x267

    filled-new-array/range {v21 .. v25}, [I

    move-result-object v31

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    invoke-direct/range {v19 .. v31}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v20, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v21, "lower_jacket base bump"

    sget-object v28, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_JACKET:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v22, 0x409

    const/16 v23, 0x40a

    filled-new-array/range {v22 .. v23}, [I

    move-result-object v32

    const/16 v22, 0x0

    const/16 v23, 0x1

    const v24, -0x7f7f80

    const/16 v25, 0x1

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v29, 0x1

    const/16 v30, 0x0

    const/16 v31, 0x0

    invoke-direct/range {v20 .. v32}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v21, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v22, "lower_jacket bump"

    sget-object v29, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_JACKET:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const-string/jumbo v31, "bump_pants_wrinkles.tga"

    const/16 v23, 0x36c

    const/16 v24, 0x403

    const/16 v25, 0x404

    filled-new-array/range {v23 .. v25}, [I

    move-result-object v33

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x1

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v30, 0x1

    const/16 v32, 0x0

    invoke-direct/range {v21 .. v33}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v22, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v23, "lower_jacket"

    sget-object v30, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_JACKET:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v24, 0x329

    const/16 v25, 0x32a

    const/16 v26, 0x32b

    const/16 v27, 0x26d

    const/16 v28, 0x26f

    filled-new-array/range {v24 .. v28}, [I

    move-result-object v34

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    invoke-direct/range {v22 .. v34}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v23, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v24, "lower alpha"

    sget-object v31, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_LOWER_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v0, v0, [I

    move-object/from16 v35, v0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x1

    const/16 v30, 0x0

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    invoke-direct/range {v23 .. v35}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    const/16 v24, 0x16

    move/from16 v0, v24

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput-object v1, v24, v25

    const/4 v1, 0x1

    aput-object v2, v24, v1

    const/4 v1, 0x2

    aput-object v3, v24, v1

    const/4 v1, 0x3

    aput-object v4, v24, v1

    const/4 v1, 0x4

    aput-object v5, v24, v1

    const/4 v1, 0x5

    aput-object v6, v24, v1

    const/4 v1, 0x6

    aput-object v7, v24, v1

    const/4 v1, 0x7

    aput-object v8, v24, v1

    const/16 v1, 0x8

    aput-object v9, v24, v1

    const/16 v1, 0x9

    aput-object v10, v24, v1

    const/16 v1, 0xa

    aput-object v11, v24, v1

    const/16 v1, 0xb

    aput-object v12, v24, v1

    const/16 v1, 0xc

    aput-object v13, v24, v1

    const/16 v1, 0xd

    aput-object v14, v24, v1

    const/16 v1, 0xe

    aput-object v15, v24, v1

    const/16 v1, 0xf

    aput-object v16, v24, v1

    const/16 v1, 0x10

    aput-object v17, v24, v1

    const/16 v1, 0x11

    aput-object v18, v24, v1

    const/16 v1, 0x12

    aput-object v19, v24, v1

    const/16 v1, 0x13

    aput-object v20, v24, v1

    const/16 v1, 0x14

    aput-object v21, v24, v1

    const/16 v1, 0x15

    aput-object v22, v24, v1

    const/4 v1, 0x1

    new-array v7, v1, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const/4 v1, 0x0

    aput-object v23, v7, v1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_LOWER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const/16 v3, 0x200

    const/16 v4, 0x200

    const/4 v5, 0x1

    move-object/from16 v6, v24

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;IIZ[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;->layerSets:Ljava/util/Map;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_LOWER:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v2, "whites"

    const-string/jumbo v11, "eyewhite.tga"

    const/4 v3, 0x0

    new-array v13, v3, [I

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v1 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v3, "iris"

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->eye_color:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    sget-object v10, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_EYES_IRIS:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v5, 0x0

    new-array v14, v5, [I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v2 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v4, "eyes alpha"

    sget-object v11, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_EYES_ALPHA:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/4 v5, 0x0

    new-array v15, v5, [I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v3 .. v15}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    const/4 v4, 0x2

    new-array v6, v4, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const/4 v4, 0x0

    aput-object v1, v6, v4

    const/4 v1, 0x1

    aput-object v2, v6, v1

    const/4 v1, 0x1

    new-array v7, v1, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const/4 v1, 0x0

    aput-object v3, v7, v1

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_EYES:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const/16 v3, 0x80

    const/16 v4, 0x80

    const/4 v5, 0x1

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;IIZ[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;->layerSets:Ljava/util/Map;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_EYES:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v2, "skirt_fabric"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->TEX_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    const/16 v3, 0x399

    const/16 v4, 0x39a

    const/16 v5, 0x39b

    filled-new-array {v3, v4, v5}, [I

    move-result-object v13

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v1 .. v13}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const-string/jumbo v3, "skirt_fabric_alpha"

    const/16 v4, 0x35a

    const/16 v5, 0x35b

    const/16 v6, 0x35c

    const/16 v7, 0x35d

    const/16 v8, 0x35e

    filled-new-array {v4, v5, v6, v7, v8}, [I

    move-result-object v14

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v2 .. v14}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;-><init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V

    const/4 v3, 0x2

    new-array v6, v3, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    const/4 v3, 0x0

    aput-object v1, v6, v3

    const/4 v1, 0x1

    aput-object v2, v6, v1

    const/4 v1, 0x0

    new-array v7, v1, [Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    const/16 v3, 0x200

    const/16 v4, 0x200

    const/4 v5, 0x0

    invoke-direct/range {v1 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;IIZ[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;)V

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayers;->layerSets:Ljava/util/Map;

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;->BAKED_SKIRT:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :array_0
    .array-data 4
        0x335
        0x336
        0x337
        0x412
        0x414
        0x416
        0x418
    .end array-data

    :array_1
    .array-data 4
        0x323
        0x324
        0x325
        0x258
        0x259
        0x25a
        0x30a
    .end array-data

    :array_2
    .array-data 4
        0x36b
        0x3fb
        0x3fd
        0x3ff
        0x401
        0x402
    .end array-data

    :array_3
    .array-data 4
        0x33f
        0x340
        0x341
        0x3fc
        0x3fe
        0x400
        0x26c
        0x26e
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
