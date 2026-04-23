.class public final enum Lcom/lumiyaviewer/lumiya/render/shaders/Shader;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/shaders/Shader;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum AvatarVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum BoundingBoxFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum BoundingBoxVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum ExtTextureFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum ExtTextureVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum FXAAFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum FXAAVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum FlexiVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum PrimFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum PrimFragmentShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum PrimOpaqueFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum PrimOpaqueFragmentShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum PrimVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum QuadFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum QuadVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum RawFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum RawVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum RiggedMeshVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum RiggedMeshVertexShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum SkyFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum SkyNoCloudsFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum SkyVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum StarsFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum StarsVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum WaterFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

.field public static final enum WaterVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;


# instance fields
.field private final fileName:Ljava/lang/String;

.field private handle:I

.field private final type:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    const v5, 0x8b31

    const v4, 0x8b30

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "PrimFragmentShader"

    const-string/jumbo v2, "prim.fsh"

    invoke-direct {v0, v1, v6, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "PrimFragmentShader30"

    const-string/jumbo v2, "prim_30.fsh"

    invoke-direct {v0, v1, v7, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimFragmentShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "PrimOpaqueFragmentShader"

    const-string/jumbo v2, "prim_opaque.fsh"

    invoke-direct {v0, v1, v8, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimOpaqueFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "PrimOpaqueFragmentShader30"

    const-string/jumbo v2, "prim_opaque_30.fsh"

    const/4 v3, 0x3

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimOpaqueFragmentShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "PrimVertexShader"

    const-string/jumbo v2, "prim.vsh"

    const/4 v3, 0x4

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "AvatarVertexShader"

    const-string/jumbo v2, "avatar.vsh"

    const/4 v3, 0x5

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->AvatarVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "FlexiVertexShader"

    const-string/jumbo v2, "prim_flexible.vsh"

    const/4 v3, 0x6

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FlexiVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "RiggedMeshVertexShader"

    const-string/jumbo v2, "rigged_mesh.vsh"

    const/4 v3, 0x7

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RiggedMeshVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "RiggedMeshVertexShader30"

    const-string/jumbo v2, "rigged_mesh_30.vsh"

    const/16 v3, 0x8

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RiggedMeshVertexShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "QuadVertexShader"

    const-string/jumbo v2, "quad.vsh"

    const/16 v3, 0x9

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->QuadVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "QuadFragmentShader"

    const-string/jumbo v2, "quad.fsh"

    const/16 v3, 0xa

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->QuadFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "BoundingBoxVertexShader"

    const-string/jumbo v2, "bounding_box_30.vsh"

    const/16 v3, 0xb

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->BoundingBoxVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "BoundingBoxFragmentShader"

    const-string/jumbo v2, "bounding_box_30.fsh"

    const/16 v3, 0xc

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->BoundingBoxFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "WaterVertexShader"

    const-string/jumbo v2, "water.vsh"

    const/16 v3, 0xd

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->WaterVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "WaterFragmentShader"

    const-string/jumbo v2, "water.fsh"

    const/16 v3, 0xe

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->WaterFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "SkyVertexShader"

    const-string/jumbo v2, "sky.vsh"

    const/16 v3, 0xf

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "SkyFragmentShader"

    const-string/jumbo v2, "sky.fsh"

    const/16 v3, 0x10

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "SkyNoCloudsFragmentShader"

    const-string/jumbo v2, "sky_no_clouds.fsh"

    const/16 v3, 0x11

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyNoCloudsFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "StarsVertexShader"

    const-string/jumbo v2, "stars.vsh"

    const/16 v3, 0x12

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->StarsVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "StarsFragmentShader"

    const-string/jumbo v2, "stars.fsh"

    const/16 v3, 0x13

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->StarsFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "ExtTextureVertexShader"

    const-string/jumbo v2, "external_texture.vsh"

    const/16 v3, 0x14

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->ExtTextureVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "ExtTextureFragmentShader"

    const-string/jumbo v2, "external_texture.fsh"

    const/16 v3, 0x15

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->ExtTextureFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "RawVertexShader"

    const-string/jumbo v2, "raw.vsh"

    const/16 v3, 0x16

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RawVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "RawFragmentShader"

    const-string/jumbo v2, "raw.fsh"

    const/16 v3, 0x17

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RawFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "FXAAVertexShader"

    const-string/jumbo v2, "fxaa.vsh"

    const/16 v3, 0x18

    invoke-direct {v0, v1, v3, v5, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FXAAVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const-string/jumbo v1, "FXAAFragmentShader"

    const-string/jumbo v2, "fxaa.fsh"

    const/16 v3, 0x19

    invoke-direct {v0, v1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FXAAFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v0, 0x1a

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimFragmentShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    aput-object v1, v0, v7

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimOpaqueFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    aput-object v1, v0, v8

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimOpaqueFragmentShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->PrimVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->AvatarVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FlexiVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RiggedMeshVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RiggedMeshVertexShader30:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->QuadVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->QuadFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->BoundingBoxVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->BoundingBoxFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->WaterVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->WaterFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->SkyNoCloudsFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->StarsVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->StarsFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->ExtTextureVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->ExtTextureFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RawVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->RawFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FXAAVertexShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->FXAAFragmentShader:Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->$VALUES:[Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->type:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->fileName:Ljava/lang/String;

    return-void
.end method

.method private getShaderCode(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)Ljava/lang/String;
    .locals 5

    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "shaders/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->fileName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;->processCode(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/render/shaders/Shader;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/render/shaders/Shader;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->$VALUES:[Lcom/lumiyaviewer/lumiya/render/shaders/Shader;

    return-object v0
.end method


# virtual methods
.method public Compile(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;
        }
    .end annotation

    const/4 v6, 0x1

    const/4 v5, 0x0

    const-string/jumbo v0, "Shaders: Compiling shader \'%s\'..."

    new-array v1, v6, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->fileName:Ljava/lang/String;

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->getShaderCode(Lcom/lumiyaviewer/lumiya/render/shaders/ShaderPreprocessor;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    iput v5, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->handle:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "No shader code for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->fileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->type:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->handle:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->handle:I

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->handle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    new-array v0, v6, [I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->handle:I

    const v2, 0x8b81

    invoke-static {v1, v2, v0, v5}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    aget v0, v0, v5

    if-eq v0, v6, :cond_1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->handle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;

    const-string/jumbo v2, "Shader (%s) compile error: \'%s\'"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->fileName:Ljava/lang/String;

    aput-object v4, v3, v5

    aput-object v0, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/render/shaders/ShaderCompileException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->handle:I

    return v0
.end method

.method public getHandle()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/shaders/Shader;->handle:I

    return v0
.end method
