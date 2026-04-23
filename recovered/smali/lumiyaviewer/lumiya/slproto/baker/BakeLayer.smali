.class public Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;
.super Ljava/lang/Object;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-avatar-SLAvatarParamColor$ColorOperationSwitchesValues:[I


# instance fields
.field public fixedColor:I

.field public globalColor:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

.field public hasFixedColor:Z

.field public isRenderPassBump:Z

.field public layerName:Ljava/lang/String;

.field public localTexture:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

.field public localTextureAlphaOnly:Z

.field public paramIDs:[I

.field public tgaFileIsMask:Z

.field public tgaTexture:Ljava/lang/String;

.field public visibilityMask:Z

.field public writeAllChannels:Z


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-avatar-SLAvatarParamColor$ColorOperationSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->-com-lumiyaviewer-lumiya-slproto-avatar-SLAvatarParamColor$ColorOperationSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->-com-lumiyaviewer-lumiya-slproto-avatar-SLAvatarParamColor$ColorOperationSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->values()[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->Blend:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->Default:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->Multiply:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->-com-lumiyaviewer-lumiya-slproto-avatar-SLAvatarParamColor$ColorOperationSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;ZIZZZLcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;ZLjava/lang/String;Z[I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->globalColor:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->hasFixedColor:Z

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->fixedColor:I

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->isRenderPassBump:Z

    iput-boolean p6, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->visibilityMask:Z

    iput-boolean p7, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->writeAllChannels:Z

    iput-object p8, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->localTexture:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    iput-boolean p9, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->localTextureAlphaOnly:Z

    iput-object p10, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaTexture:Ljava/lang/String;

    iput-boolean p11, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaFileIsMask:Z

    iput-object p12, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->paramIDs:[I

    return-void
.end method

.method private getColorByParamList(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;[III)I
    .locals 11

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const-string/jumbo v1, "lipstick"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Baking: lipstick start color %08x default %08x"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    array-length v4, p2

    move v3, v0

    move v1, p3

    :goto_0
    if-ge v3, v4, :cond_2

    aget v5, p2, v3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    if-eqz v0, :cond_5

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramColor:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;

    if-eqz v6, :cond_5

    const/4 v2, 0x1

    invoke-virtual {p1, v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->getParamWeight(ILcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;)F

    move-result v0

    invoke-virtual {v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->getColor(F)I

    move-result v5

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const-string/jumbo v8, "lipstick"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const-string/jumbo v7, "Baking: lipstick color param weight %ff color %08x"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v8, v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x1

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->-getcom-lumiyaviewer-lumiya-slproto-avatar-SLAvatarParamColor$ColorOperationSwitchesValues()[I

    move-result-object v7

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorOperation:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor$ColorOperation;->ordinal()I

    move-result v6

    aget v6, v7, v6

    packed-switch v6, :pswitch_data_0

    move v0, v1

    :goto_1
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const-string/jumbo v5, "lipstick"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "Baking: after op, lipstick color result %08x"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    move v1, v0

    move v0, v2

    :goto_2
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    move v2, v0

    goto/16 :goto_0

    :pswitch_0
    invoke-static {v1, v5, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorLerp(IIF)I

    move-result v0

    goto :goto_1

    :pswitch_1
    invoke-static {v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorMult(II)I

    move-result v0

    goto :goto_1

    :pswitch_2
    invoke-static {v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;->colorAdd(II)I

    move-result v0

    goto :goto_1

    :cond_2
    if-nez v2, :cond_3

    :goto_3
    return p4

    :cond_3
    move p4, v1

    goto :goto_3

    :cond_4
    move v1, v0

    move v0, v2

    goto :goto_2

    :cond_5
    move v0, v2

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private getNetColor(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)I
    .locals 6

    const/4 v1, 0x0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->paramIDs:[I

    array-length v4, v3

    move v2, v1

    :goto_0
    if-ge v2, v4, :cond_6

    aget v0, v3, v2

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramColor:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamColor;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->globalColor:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->globalColor:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->getParamIDs()[I

    move-result-object v0

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->getColorByParamList(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;[III)I

    move-result v0

    :goto_2
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->paramIDs:[I

    invoke-direct {p0, p1, v1, v0, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->getColorByParamList(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;[III)I

    move-result v0

    return v0

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->hasFixedColor:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->fixedColor:I

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->globalColor:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->globalColor:Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/SLAvatarGlobalColor;->getParamIDs()[I

    move-result-object v0

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->getColorByParamList(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;[III)I

    move-result v0

    :goto_3
    return v0

    :cond_3
    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->hasFixedColor:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->fixedColor:I

    goto :goto_3

    :cond_4
    const/4 v0, -0x1

    goto :goto_3

    :cond_5
    move v0, v1

    goto :goto_2

    :cond_6
    move v0, v1

    goto :goto_1
.end method


# virtual methods
.method public Bake(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)V
    .locals 20

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->getNetColor(Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)I

    move-result v17

    new-instance v2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-object/from16 v0, p1

    iget v3, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    move-object/from16 v0, p1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    const/4 v5, 0x4

    const/4 v6, 0x4

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v8}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(IIIIII)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-object/from16 v0, p1

    iget v4, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->width:I

    move-object/from16 v0, p1

    iget v5, v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->height:I

    const/4 v6, 0x4

    const/4 v7, 0x4

    const/4 v8, 0x0

    const/high16 v9, -0x1000000

    invoke-direct/range {v3 .. v9}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(IIIIII)V

    const-string/jumbo v4, "Baking: layer %s net_color 0x%08x."

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v5, 0x1

    const/4 v13, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->paramIDs:[I

    move-object/from16 v18, v0

    const/4 v4, 0x0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v16, v4

    :goto_0
    move/from16 v0, v16

    move/from16 v1, v19

    if-ge v0, v1, :cond_2

    aget v6, v18, v16

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;->paramByIDs:Lcom/google/common/collect/ImmutableMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;

    if-eqz v4, :cond_b

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$ParamSet;->params:Lcom/google/common/collect/ImmutableList;

    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;

    iget-object v4, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    if-eqz v4, :cond_b

    iget-object v4, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget-object v4, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    if-eqz v4, :cond_b

    move-object/from16 v0, p2

    invoke-virtual {v0, v6, v12}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->getParamWeight(ILcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;)F

    move-result v10

    if-eqz v5, :cond_a

    const/4 v14, 0x0

    iget-object v4, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget-boolean v4, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->multiplyBlend:Z

    if-nez v4, :cond_0

    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->setComponent(IB)V

    :cond_0
    :goto_1
    const/4 v4, 0x0

    cmpl-float v4, v10, v4

    if-nez v4, :cond_1

    iget-object v4, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget-boolean v4, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->skipIfZero:Z

    if-eqz v4, :cond_1

    move v4, v13

    move v5, v14

    :goto_2
    add-int/lit8 v6, v16, 0x1

    move/from16 v16, v6

    move v13, v4

    goto :goto_0

    :cond_1
    iget-object v4, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget-boolean v4, v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->multiplyBlend:Z

    or-int/2addr v13, v4

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "tga/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget-object v6, v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    new-instance v4, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    sget-object v6, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    iget-object v7, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget v9, v7, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->domain:F

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/4 v11, 0x0

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(Ljava/io/InputStream;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;ZZFFZ)V

    const-string/jumbo v6, "Baking: layer %s: applying alpha (weight %f domain %f) mask texture %s, width %d, height %d, num_comps %d"

    const/4 v7, 0x7

    new-array v7, v7, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    const/4 v9, 0x1

    aput-object v8, v7, v9

    iget-object v8, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget v8, v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->domain:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    const/4 v9, 0x2

    aput-object v8, v7, v9

    iget-object v8, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget-object v8, v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->tgaFile:Ljava/lang/String;

    const/4 v9, 0x3

    aput-object v8, v7, v9

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getWidth()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x4

    aput-object v8, v7, v9

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getHeight()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x5

    aput-object v8, v7, v9

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getNumComponents()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x6

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v6, v12, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$AvatarParam;->paramAlpha:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;

    iget-boolean v6, v6, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParamAlpha;->multiplyBlend:Z

    xor-int/lit8 v6, v6, 0x1

    invoke-virtual {v3, v4, v6}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->blendAlpha(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Z)V

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v4, v13

    move v5, v14

    goto/16 :goto_2

    :catch_0
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    move v4, v13

    move v5, v14

    goto/16 :goto_2

    :cond_2
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->localTexture:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    if-eqz v5, :cond_9

    :try_start_1
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->localTexture:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->getLocalTexture(Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$DefaultTextureException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    move v5, v4

    :goto_3
    :try_start_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    const-string/jumbo v7, "Baking: layer %s: applying local texture, writeAllChannels %s"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v9, v8, v10

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->writeAllChannels:Z

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    const/4 v10, 0x1

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v7, -0x1

    const/4 v8, 0x0

    invoke-virtual {v2, v4, v7, v8}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->draw(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;IZ)V
    :try_end_2
    .catch Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$DefaultTextureException; {:try_start_2 .. :try_end_2} :catch_3

    const/4 v5, 0x1

    goto :goto_3

    :cond_3
    :try_start_3
    const-string/jumbo v5, "Baking: layer %s: missing local texture"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V
    :try_end_3
    .catch Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$DefaultTextureException; {:try_start_3 .. :try_end_3} :catch_1

    const/4 v5, 0x1

    :goto_4
    move v12, v4

    move v15, v5

    :goto_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaTexture:Ljava/lang/String;

    if-eqz v4, :cond_4

    :try_start_4
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "tga/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaTexture:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    new-instance v4, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    sget-object v6, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaFileIsMask:Z

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(Ljava/io/InputStream;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;ZZFFZ)V

    const-string/jumbo v6, "Baking: layer %s: applying tga texture %s, writeAllChannels %s, width %d, height %d, num_comps %d"

    const/4 v7, 0x6

    new-array v7, v7, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaTexture:Ljava/lang/String;

    const/4 v9, 0x1

    aput-object v8, v7, v9

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->writeAllChannels:Z

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    const/4 v9, 0x2

    aput-object v8, v7, v9

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getWidth()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x3

    aput-object v8, v7, v9

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getHeight()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x4

    aput-object v8, v7, v9

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getNumComponents()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x5

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v6, -0x1

    const/4 v7, 0x0

    invoke-virtual {v2, v4, v6, v7}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->draw(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;IZ)V

    const/4 v12, 0x1

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :cond_4
    :goto_6
    if-nez v12, :cond_5

    const/4 v4, 0x0

    const/4 v5, -0x1

    invoke-virtual {v2, v4, v5}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->setComponent(IB)V

    const/4 v4, 0x1

    const/4 v5, -0x1

    invoke-virtual {v2, v4, v5}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->setComponent(IB)V

    const/4 v4, 0x2

    const/4 v5, -0x1

    invoke-virtual {v2, v4, v5}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->setComponent(IB)V

    const/4 v4, 0x3

    const/4 v5, -0x1

    invoke-virtual {v2, v4, v5}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->setComponent(IB)V

    :cond_5
    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->blendAlpha(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Z)V

    if-nez v15, :cond_6

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->isRenderPassBump:Z

    if-eqz v3, :cond_7

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->writeAllChannels:Z

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v2, v1, v3, v13}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->drawBump(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;IZZ)V

    :cond_6
    :goto_7
    return-void

    :catch_1
    move-exception v5

    move v5, v4

    :goto_8
    const-string/jumbo v4, "Baking: layer %s: default local texture"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v15, 0x1

    move v12, v5

    goto/16 :goto_5

    :catch_2
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6

    :cond_7
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->writeAllChannels:Z

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v2, v1, v3}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->draw(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;IZ)V

    goto :goto_7

    :catch_3
    move-exception v4

    goto :goto_8

    :cond_8
    move v4, v5

    move v5, v15

    goto/16 :goto_4

    :cond_9
    move v12, v4

    goto/16 :goto_5

    :cond_a
    move v14, v5

    goto/16 :goto_1

    :cond_b
    move v4, v13

    goto/16 :goto_2
.end method

.method public BakeAlpha(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;)V
    .locals 10

    const/4 v9, 0x1

    const/4 v8, 0x0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->isRenderPassBump:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaTexture:Ljava/lang/String;

    if-eqz v0, :cond_1

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "tga/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaTexture:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    new-instance v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    sget-object v2, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;->TGA:Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;

    iget-boolean v3, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaFileIsMask:Z

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;-><init>(Ljava/io/InputStream;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG$ImageFormat;ZZFFZ)V

    const-string/jumbo v2, "Baking: layer %s: applying tga alpha mask %swidth %d, height %d, num_comps %d"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->tgaTexture:Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getHeight()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getNumComponents()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->blendAlpha(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Z)V

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->localTexture:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    if-eqz v0, :cond_2

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->localTexture:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    invoke-virtual {p2, v0}, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess;->getLocalTexture(Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    const-string/jumbo v2, "Baking: layer %s: applying local texture alpha"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->blendAlpha(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;Z)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/baker/BakeProcess$DefaultTextureException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Baking: layer %s: default local texture for alpha"

    new-array v1, v9, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;->layerName:Ljava/lang/String;

    aput-object v2, v1, v8

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :cond_2
    return-void

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
