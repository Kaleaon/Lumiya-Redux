.class public Lcom/lumiyaviewer/lumiya/render/RenderContext;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;
    }
.end annotation


# static fields
.field public static final NEAR_PLANE:F = 0.5f

.field public static final UNIFORM_BLOCK_ANIMATION_DATA:I = 0x1

.field public static final UNIFORM_BLOCK_RIGGING_DATA:I = 0x2

.field public static final VIEWPORT_RECT_HEIGHT:I = 0x3

.field public static final VIEWPORT_RECT_LEFT:I = 0x0

.field public static final VIEWPORT_RECT_TOP:I = 0x1

.field public static final VIEWPORT_RECT_WIDTH:I = 0x2

.field private static final _tempGluUnProjectData:[F

.field private static final _temp_A:I = 0x10

.field private static final _temp_in:I = 0x20

.field private static final _temp_m:I = 0x0

.field private static final _temp_out:I = 0x24


# instance fields
.field public FOVAngle:F

.field private final activeOcclusionQueries:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;",
            ">;"
        }
    .end annotation
.end field

.field private activeProjectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

.field public aspectRatio:F

.field public final avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

.field private boundFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

.field private boundMeshRiggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

.field public final boundingBox:Lcom/lumiyaviewer/lumiya/render/BoundingBox;

.field public final boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

.field public final crosshairTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

.field public curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

.field public currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

.field public drawDistance:F

.field public final drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

.field public final extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

.field public final flexiPrimOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

.field public final flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

.field public final frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public frameCount:I

.field private final frameKeepBitmaps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final frameKeepBuffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private final frameKeepTextures:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;",
            ">;"
        }
    .end annotation
.end field

.field public final fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

.field private final glRenderer:Ljava/lang/String;

.field public final glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

.field public final hasGL11:Z

.field public final hasGL20:Z

.field public final hasGL30:Z

.field public final hasVBO:Z

.field private final loadQueue:Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

.field public final modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

.field public final myAviPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public final nearPlane:F

.field public final objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

.field public final primOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

.field public final primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

.field public final projectionHUDMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

.field public final projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

.field public final quad:Lcom/lumiyaviewer/lumiya/render/Quad;

.field public final quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

.field public final rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

.field public final riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

.field private final riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

.field private final riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

.field public scaleX:F

.field public scaleY:F

.field public scaleZ:F

.field private final shaderCompileErrors:Z

.field public final skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

.field public final starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

.field public underWater:Z

.field public final useFXAA:Z

.field public final useVBO:Z

.field public final viewportRect:[I

.field public final waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

.field public waterTime:F

.field public final windlightDay:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;

.field public final windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

.field public final windlightSky:Lcom/lumiyaviewer/lumiya/render/WindlightSky;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x28

    new-array v0, v0, [F

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    return-void
.end method

.method public constructor <init>(Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/String;ZZZZIZIZLjava/lang/Object;)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->viewportRect:[I

    const/high16 v0, 0x42700000    # 60.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->FOVAngle:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->aspectRatio:F

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->nearPlane:F

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->projectionHUDMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleX:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleY:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleZ:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->underWater:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightDay:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->myAviPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCamera:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepBuffers:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepTextures:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepBitmaps:Ljava/util/List;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundMeshRiggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameCount:I

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->activeOcclusionQueries:Ljava/util/LinkedList;

    invoke-static {p2}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glRenderer:Ljava/lang/String;

    if-nez p4, :cond_1

    move v0, p3

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    iput-boolean p5, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL11:Z

    iput-boolean p6, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasVBO:Z

    if-nez p4, :cond_2

    if-nez p3, :cond_2

    if-eqz p5, :cond_3

    :goto_1
    iput-boolean p6, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useVBO:Z

    if-eqz p4, :cond_4

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getUseFXAA()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useFXAA:Z

    :goto_2
    const/4 v1, 0x0

    if-eqz p4, :cond_9

    new-instance v2, Lcom/lumiyaviewer/lumiya/render/GPUDetection;

    invoke-direct {v2, p2}, Lcom/lumiyaviewer/lumiya/render/GPUDetection;-><init>(Ljava/lang/String;)V

    const-string/jumbo v0, "Detected GPU family \'%s\', version \'%s\', numeric version %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedFamily:Lcom/google/common/base/Optional;

    const-string/jumbo v5, "unknown"

    invoke-virtual {v4, v5}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget-object v4, v2, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedVersion:Lcom/google/common/base/Optional;

    const-string/jumbo v5, "unknown"

    invoke-virtual {v4, v5}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget v4, v2, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedNumericVersion:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->AlwaysPrintf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v0, "__NUM_BASE_JOINTS__"

    const/16 v4, 0x1a

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "__NUM_BASE_BONE_VECTORS__"

    const/16 v4, 0x9c

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "__MAX_RIGGED_MESH_BONES__"

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->VALUES:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    array-length v4, v4

    add-int/lit8 v4, v4, 0x2f

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "__MAX_RIGGED_MESH_JOINTS__"

    const/16 v4, 0xa3

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v2, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedFamily:Lcom/google/common/base/Optional;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v4, "Adreno"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "__ADRENO__"

    const-string/jumbo v4, ""

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, v2, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedNumericVersion:I

    const/4 v4, -0x1

    if-eq v0, v4, :cond_0

    iget v0, v2, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedNumericVersion:I

    const/16 v2, 0x14a

    if-ge v0, v2, :cond_0

    const/4 p3, 0x0

    :cond_0
    new-instance v2, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;-><init>(Ljava/util/Map;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getRenderClouds()Z

    move-result v0

    if-eqz v0, :cond_5

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyCloudsProgram;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    :goto_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    if-eqz p10, :cond_6

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    const/4 v3, 0x1

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;-><init>(Z)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    :goto_4
    const-string/jumbo v0, "Renderer: Going to compile shaders."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    invoke-direct {p0, v2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->CompileShaders(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    :goto_5
    const-string/jumbo v1, "Renderer: Shaders compiled, errors: %b."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->AlwaysPrintf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p3, :cond_8

    :try_start_1
    new-instance v1, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;-><init>(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_6
    if-eqz v1, :cond_7

    const-string/jumbo v2, "Renderer: 3.0 shaders compiled."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->AlwaysPrintf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/render/RenderContext$Shaders30;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    move v7, v0

    :goto_7
    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    iput-boolean v7, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->shaderCompileErrors:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/Quad;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/Quad;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quad:Lcom/lumiyaviewer/lumiya/render/Quad;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->createLoadQueue(Ljavax/microedition/khronos/egl/EGLConfig;)Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->loadQueue:Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->loadQueue:Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    move v2, p4

    move v3, p7

    move/from16 v4, p8

    move/from16 v5, p9

    move-object/from16 v6, p11

    invoke-direct/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/DrawableStore;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;ZIZILjava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    if-nez v7, :cond_a

    if-eqz p3, :cond_a

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/BoundingBox;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/render/BoundingBox;-><init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBox:Lcom/lumiyaviewer/lumiya/render/BoundingBox;

    :goto_8
    if-eqz p4, :cond_b

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/WindlightSky;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/render/WindlightSky;-><init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :goto_9
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightSky:Lcom/lumiyaviewer/lumiya/render/WindlightSky;

    if-eqz p10, :cond_c

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "misc/crosshair.png"

    invoke-static {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->loadFromAssets(Lcom/lumiyaviewer/lumiya/render/RenderContext;Landroid/content/Context;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->crosshairTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    :goto_a
    return-void

    :cond_1
    const/4 v0, 0x1

    goto/16 :goto_0

    :cond_2
    const/4 p6, 0x1

    goto/16 :goto_1

    :cond_3
    const/4 p6, 0x0

    goto/16 :goto_1

    :cond_4
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useFXAA:Z

    goto/16 :goto_2

    :cond_5
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    goto/16 :goto_3

    :cond_6
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    goto/16 :goto_4

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    goto/16 :goto_5

    :catch_1
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Renderer: 3.0 shaders failed to compile: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v1, 0x0

    goto/16 :goto_6

    :cond_7
    const-string/jumbo v1, "Renderer: 3.0 shaders did not compile."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->AlwaysPrintf(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    const/4 p3, 0x0

    move v7, v0

    goto/16 :goto_7

    :cond_8
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    move v7, v0

    goto/16 :goto_7

    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBoxProgram:Lcom/lumiyaviewer/lumiya/render/shaders/BoundingBoxProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    move v7, v1

    goto/16 :goto_7

    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundingBox:Lcom/lumiyaviewer/lumiya/render/BoundingBox;

    goto/16 :goto_8

    :cond_b
    const/4 v0, 0x0

    goto/16 :goto_9

    :cond_c
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->crosshairTexture:Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    goto/16 :goto_a
.end method

.method private CompileShaders(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->waterProgram:Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/WaterProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->avatarProgram:Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/AvatarProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->fxaaProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/FXAAProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->skyProgram:Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/SkyProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->starsProgram:Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/StarsProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->quadProgram:Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/QuadProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->extTextureProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->rawShaderProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/RawShaderProgram;->Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I

    :cond_1
    return-void
.end method

.method private clearRiggingMeshData()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundMeshRiggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    return-void
.end method

.method private createLoadQueue(Ljavax/microedition/khronos/egl/EGLConfig;)Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;
    .locals 6

    const-string/jumbo v0, "TexLoad: creating load queue."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glRenderer:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "tegra"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v2

    instance-of v0, v2, Ljavax/microedition/khronos/egl/EGL10;

    if-eqz v0, :cond_0

    check-cast v2, Ljavax/microedition/khronos/egl/EGL10;

    :try_start_0
    invoke-interface {v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentDisplay()Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eq v0, v1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;

    invoke-interface {v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentDisplay()Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v3

    iget-boolean v5, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/render/glres/GLAsyncLoadQueue;-><init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Z)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLSyncLoadQueue;-><init>()V

    return-object v0
.end method

.method public static gluUnProject(FFF[FI[FI[II[FI)I
    .locals 6

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    aget v1, p7, p8

    int-to-float v1, v1

    sub-float v1, p0, v1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v1, v2

    add-int/lit8 v2, p8, 0x2

    aget v2, p7, v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v1, v2

    const/16 v2, 0x20

    aput v1, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    add-int/lit8 v1, p8, 0x1

    aget v1, p7, v1

    int-to-float v1, v1

    sub-float v1, p1, v1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v1, v2

    add-int/lit8 v2, p8, 0x3

    aget v2, p7, v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v1, v2

    const/16 v2, 0x21

    aput v1, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v1, p2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v1, v2

    const/16 v2, 0x22

    aput v1, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/16 v2, 0x23

    aput v1, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v1, 0x10

    move-object v2, p5

    move v3, p6

    move-object v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/4 v2, 0x0

    const/16 v3, 0x10

    invoke-static {v0, v2, v1, v3}, Landroid/opengl/Matrix;->invertM([FI[FI)Z

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    sget-object v4, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v1, 0x24

    const/4 v3, 0x0

    const/16 v5, 0x20

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v1, 0x27

    aget v0, v0, v1

    float-to-double v0, v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v1, 0x24

    aget v0, v0, v1

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v2, 0x27

    aget v1, v1, v2

    div-float/2addr v0, v1

    aput v0, p9, p10

    add-int/lit8 v0, p10, 0x1

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v2, 0x25

    aget v1, v1, v2

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v3, 0x27

    aget v2, v2, v3

    div-float/2addr v1, v2

    aput v1, p9, v0

    add-int/lit8 v0, p10, 0x2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v2, 0x26

    aget v1, v1, v2

    sget-object v2, Lcom/lumiyaviewer/lumiya/render/RenderContext;->_tempGluUnProjectData:[F

    const/16 v3, 0x27

    aget v2, v2, v3

    div-float/2addr v1, v2

    aput v1, p9, v0

    const/4 v0, 0x1

    return v0
.end method

.method private initPrimProgram(Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;Z)V
    .locals 2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget v0, p1, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->sTexture:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->windlightPreset:Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    :goto_0
    invoke-virtual {p1, p0, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->SetupLighting(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method final ClearFrameKeeps()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepTextures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepBuffers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepBitmaps:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method public final KeepBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepBuffers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final KeepTexture(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1    # Landroid/graphics/Bitmap;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepBitmaps:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final KeepTexture(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->frameKeepTextures:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method final RunLoadQueue()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->loadQueue:Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->RunLoadQueue(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    return-void
.end method

.method final StopLoadQueue()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->loadQueue:Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;->StopLoadQueue()V

    return-void
.end method

.method public bindFaceTexture(Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    if-eq v0, p1, :cond_1

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    if-eqz p1, :cond_2

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;->GLDraw(Lcom/lumiyaviewer/lumiya/render/RenderContext;)Z

    move-result v0

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;->setTextureEnabled(Z)V

    :cond_0
    if-nez v0, :cond_1

    const/16 v0, 0xde1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :cond_1
    return-void

    :cond_2
    move v0, v1

    goto :goto_0
.end method

.method public bindRiggingMeshData(Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundMeshRiggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    if-eq v0, p1, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;->SetupBuffers30(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundMeshRiggingData:Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshRiggingData;

    :cond_1
    return-void
.end method

.method clearFaceTexture()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->boundFaceTexture:Lcom/lumiyaviewer/lumiya/render/drawable/DrawableFaceTexture;

    return-void
.end method

.method public clearRiggedMeshProgram()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-static {v1}, Landroid/opengl/GLES30;->glBindVertexArray(I)V

    const/16 v0, 0xde1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {v1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearRiggingMeshData()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearFaceTexture()V

    return-void
.end method

.method public enqueueOcclusionQuery(Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->activeOcclusionQueries:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method final getActiveProjectionMatrix()Lcom/lumiyaviewer/lumiya/render/MatrixStack;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->activeProjectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    return-object v0
.end method

.method getShaderCompileErrors()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->shaderCompileErrors:Z

    return v0
.end method

.method public glBindArrayBuffer(I)V
    .locals 2

    const v1, 0x8892

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    :goto_0
    return-void

    :cond_0
    invoke-static {v1, p1}, Landroid/opengl/GLES11;->glBindBuffer(II)V

    goto :goto_0
.end method

.method public glBindElementArrayBuffer(I)V
    .locals 2

    const v1, 0x8893

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    :goto_0
    return-void

    :cond_0
    invoke-static {v1, p1}, Landroid/opengl/GLES11;->glBindBuffer(II)V

    goto :goto_0
.end method

.method public glBufferArrayData(ILjava/nio/Buffer;Z)V
    .locals 4

    const v0, 0x88e8

    const v1, 0x88e4

    const v3, 0x8892

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v2, :cond_1

    if-eqz p3, :cond_0

    :goto_0
    invoke-static {v3, p1, p2, v0}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    :goto_1
    return-void

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    if-eqz p3, :cond_2

    :goto_2
    invoke-static {v3, p1, p2, v0}, Landroid/opengl/GLES11;->glBufferData(IILjava/nio/Buffer;I)V

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_2
.end method

.method public glBufferElementArrayData(ILjava/nio/Buffer;Z)V
    .locals 4

    const v0, 0x88e8

    const v1, 0x88e4

    const v3, 0x8893

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v2, :cond_1

    if-eqz p3, :cond_0

    :goto_0
    invoke-static {v3, p1, p2, v0}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    :goto_1
    return-void

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    if-eqz p3, :cond_2

    :goto_2
    invoke-static {v3, p1, p2, v0}, Landroid/opengl/GLES11;->glBufferData(IILjava/nio/Buffer;I)V

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_2
.end method

.method public glGenBuffers(I[II)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    :goto_0
    return-void

    :cond_0
    invoke-static {p1, p2, p3}, Landroid/opengl/GLES11;->glGenBuffers(I[II)V

    goto :goto_0
.end method

.method public glModelApplyMatrix(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glApplyUniformMatrix(I)V

    :cond_0
    return-void
.end method

.method public glModelMultMatrixf([FI)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {p1, p2}, Landroid/opengl/GLES10;->glMultMatrixf([FI)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glMultMatrixf([FI)V

    return-void
.end method

.method public glModelPopMatrix()V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/opengl/GLES10;->glPopMatrix()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPopMatrix()V

    return-void
.end method

.method public glModelPushAndMultMatrixf([FI)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/opengl/GLES10;->glPushMatrix()V

    invoke-static {p1, p2}, Landroid/opengl/GLES10;->glMultMatrixf([FI)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPushAndMultMatrixf([FI)V

    return-void
.end method

.method public glModelPushMatrix()V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/opengl/GLES10;->glPushMatrix()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPushMatrix()V

    return-void
.end method

.method glModelResetIdentity()V
    .locals 2

    const/high16 v1, 0x3f800000    # 1.0f

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->reset()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glLoadIdentity()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->reset()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glLoadIdentity()V

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleY:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleZ:F

    return-void
.end method

.method glModelRotatef(FFFF)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {p1, p2, p3, p4}, Landroid/opengl/GLES10;->glRotatef(FFFF)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glRotatef(FFFF)V

    return-void
.end method

.method public glModelScalef(FFF)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES10;->glScalef(FFF)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glScalef(FFF)V

    return-void
.end method

.method public glModelTranslatef(FFF)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES10;->glTranslatef(FFF)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glTranslatef(FFF)V

    return-void
.end method

.method public glObjScaleApplyVector(I)V
    .locals 4

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleX:F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleY:F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleZ:F

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {p1, v0, v1, v2, v3}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    :cond_0
    return-void
.end method

.method public glObjWorldApplyMatrix(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glApplyUniformMatrix(I)V

    :cond_0
    return-void
.end method

.method public glObjWorldPopMatrix()V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/opengl/GLES10;->glPopMatrix()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPopMatrix()V

    return-void
.end method

.method public glObjWorldPushAndLoadMatrixf([FI)V
    .locals 2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/opengl/GLES10;->glPushMatrix()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v1

    invoke-static {v0, v1}, Landroid/opengl/GLES10;->glLoadMatrixf([FI)V

    invoke-static {p1, p2}, Landroid/opengl/GLES10;->glMultMatrixf([FI)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPushAndLoadMatrixf([FI)V

    return-void
.end method

.method public glObjWorldPushAndMultMatrixf([FI)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/opengl/GLES10;->glPushMatrix()V

    invoke-static {p1, p2}, Landroid/opengl/GLES10;->glMultMatrixf([FI)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPushAndMultMatrixf([FI)V

    return-void
.end method

.method public glObjWorldTranslatef(FFF)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES10;->glTranslatef(FFF)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->objWorldMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glTranslatef(FFF)V

    return-void
.end method

.method glPopObjectScale()V
    .locals 2

    const/high16 v1, 0x3f800000    # 1.0f

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/opengl/GLES10;->glPopMatrix()V

    :cond_0
    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleX:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleY:F

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleZ:F

    return-void
.end method

.method glPushObjectScale(FFF)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    invoke-static {}, Landroid/opengl/GLES10;->glPushMatrix()V

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES10;->glScalef(FFF)V

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleX:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleX:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleY:F

    mul-float/2addr v0, p2

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleY:F

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleZ:F

    mul-float/2addr v0, p3

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->scaleZ:F

    return-void
.end method

.method initAllPrimPrograms(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initPrimProgram(Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->primOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initPrimProgram(Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initPrimProgram(Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->flexiPrimOpaqueProgram:Lcom/lumiyaviewer/lumiya/render/shaders/FlexiPrimProgram;

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initPrimProgram(Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram;

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initPrimProgram(Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;Z)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initPrimProgram(Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->initPrimProgram(Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;Z)V

    :cond_0
    return-void
.end method

.method processOcclusionQueries()V
    .locals 1

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->activeOcclusionQueries:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->peekFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/glres/GLQuery;->checkResult()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->activeOcclusionQueries:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method final setActiveProjectionMatrix(Lcom/lumiyaviewer/lumiya/render/MatrixStack;)V
    .locals 3

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->activeProjectionMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-nez v0, :cond_0

    const/16 v0, 0x1701

    invoke-static {v0}, Landroid/opengl/GLES10;->glMatrixMode(I)V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v1

    invoke-static {v0, v1}, Landroid/opengl/GLES10;->glLoadMatrixf([FI)V

    const/16 v0, 0x1700

    invoke-static {v0}, Landroid/opengl/GLES10;->glMatrixMode(I)V

    invoke-static {}, Landroid/opengl/GLES10;->glLoadIdentity()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->reset()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glLoadIdentity()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->reset()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glLoadMatrixf([FI)V

    goto :goto_0
.end method

.method final setActiveProjectionMatrix([FI)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->reset()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->modelViewMatrix:Lcom/lumiyaviewer/lumiya/render/MatrixStack;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glLoadMatrixf([FI)V

    return-void
.end method

.method setMeshCapURL(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->drawableStore:Lcom/lumiyaviewer/lumiya/render/DrawableStore;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/DrawableStore;->setMeshCapURL(Ljava/lang/String;)V

    return-void
.end method

.method public setupRiggedMeshProgram(Z)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgramOpaque30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearRiggingMeshData()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->clearFaceTexture()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->curPrimProgram:Lcom/lumiyaviewer/lumiya/render/shaders/PrimProgram;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->getHandle()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uMVPMatrix:I

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glModelApplyMatrix(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uObjWorldMatrix:I

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjWorldApplyMatrix(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->currentRiggedMeshProgram:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;->uObjCoordScale:I

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glObjScaleApplyVector(I)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/RenderContext;->riggedMeshProgram30:Lcom/lumiyaviewer/lumiya/render/shaders/RiggedMeshProgram30;

    goto :goto_0
.end method
