.class public abstract Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/utils/Identifiable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lumiyaviewer/lumiya/utils/Identifiable",
        "<",
        "Ljava/util/UUID;",
        ">;"
    }
.end annotation


# static fields
.field private static final AGENT_ATTACH_MASK:I = 0xf0

.field private static final AGENT_ATTACH_OFFSET:I = 0x4

.field public static final FLAGS_ALLOW_INVENTORY_DROP:I = 0x10000

.field public static final FLAGS_ANIM_SOURCE:I = 0x200000

.field public static final FLAGS_CAMERA_DECOUPLED:I = 0x100000

.field public static final FLAGS_CAMERA_SOURCE:I = 0x400000

.field public static final FLAGS_CAST_SHADOWS:I = 0x800000

.field public static final FLAGS_CREATE_SELECTED:I = 0x2

.field public static final FLAGS_HANDLE_TOUCH:I = 0x80

.field public static final FLAGS_INCLUDE_IN_SEARCH:I = 0x8000

.field public static final FLAGS_INVENTORY_EMPTY:I = 0x800

.field public static final FLAGS_JOINT_HINGE:I = 0x1000

.field public static final FLAGS_JOINT_LP2P:I = 0x4000

.field public static final FLAGS_JOINT_P2P:I = 0x2000

.field public static final FLAGS_OBJECT_ANY_OWNER:I = 0x10

.field public static final FLAGS_OBJECT_COPY:I = 0x8

.field public static final FLAGS_OBJECT_GROUP_OWNED:I = 0x40000

.field public static final FLAGS_OBJECT_MODIFY:I = 0x4

.field public static final FLAGS_OBJECT_MOVE:I = 0x100

.field public static final FLAGS_OBJECT_OWNER_MODIFY:I = 0x10000000

.field public static final FLAGS_OBJECT_TRANSFER:I = 0x20000

.field public static final FLAGS_OBJECT_YOU_OWNER:I = 0x20

.field public static final FLAGS_PHANTOM:I = 0x400

.field public static final FLAGS_SCRIPTED:I = 0x40

.field public static final FLAGS_TAKES_MONEY:I = 0x200

.field public static final FLAGS_TEMPORARY:I = 0x40000000

.field public static final FLAGS_TEMPORARY_ON_REZ:I = 0x20000000

.field public static final FLAGS_USE_PHYSICS:I = 0x1

.field public static final FLAGS_ZLIB_COMPRESSED:I = -0x80000000

.field public static final OBJ_COORD_POSITION:I = 0x0

.field public static final OBJ_COORD_SCALE:I = 0x1

.field public static final OBJ_COORD_VELOCITY:I = 0x2

.field public static final OBJ_COORD_WORLD_CENTER:I = 0x3

.field public static final PAY_DEFAULT:I = -0x2

.field public static final PAY_HIDE:I = -0x1


# instance fields
.field public UpdateFlags:I

.field public attachedToUUID:Ljava/util/UUID;

.field public attachmentID:I

.field public creatorUUID:Ljava/util/UUID;

.field public description:Ljava/lang/String;

.field private volatile drawListEntry:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public hierLevel:I

.field private volatile hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

.field public isAttachment:Z

.field public volatile isDead:Z

.field public localID:I

.field public name:Ljava/lang/String;

.field public nameKnown:Z

.field public nameRequested:Z

.field public nameRequestedAt:J

.field public objRadius:F

.field private final objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

.field public ownerUUID:Ljava/util/UUID;

.field public parentID:I

.field private payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

.field private rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field public salePrice:I

.field public saleType:B

.field public touchName:Ljava/lang/String;

.field public final treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected uuid:Ljava/util/UUID;

.field public worldMatrix:[F


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    const-string/jumbo v0, "(loading)"

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->description:Ljava/lang/String;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->touchName:Ljava/lang/String;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->creatorUUID:Ljava/util/UUID;

    iput-byte v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->saleType:B

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAttachment:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameRequested:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameRequestedAt:J

    iput v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hierLevel:I

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    return-void
.end method

.method private ParseObjectData(Ljava/nio/ByteBuffer;)V
    .locals 7

    const/4 v6, 0x0

    const/high16 v5, 0x45800000    # 4096.0f

    const/high16 v4, 0x43c00000    # 384.0f

    const/high16 v3, 0x43800000    # 256.0f

    const/high16 v2, -0x3c800000    # -256.0f

    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :goto_0
    return-void

    :sswitch_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x10

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :sswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseFloatVec(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-virtual {v0, v6, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseFloatVec(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0xc

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->parseFloatVec3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x10

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :sswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    const/high16 v1, -0x3d000000    # -128.0f

    invoke-static {p1, v1, v4, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseU16Vec(Ljava/nio/ByteBuffer;FFFF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-virtual {v0, v6, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-static {p1, v2, v3, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseU16Vec(Ljava/nio/ByteBuffer;FFFF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x6

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->parseU16Vec3(Ljava/nio/ByteBuffer;FF)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    goto :goto_0

    :sswitch_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-static {p1, v4, v4, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseU8Vec(Ljava/nio/ByteBuffer;FFFF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-virtual {v0, v6, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-static {p1, v2, v3, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseU8Vec(Ljava/nio/ByteBuffer;FFFF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p1, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->parseU8Vec3(Ljava/nio/ByteBuffer;FF)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_4
        0x20 -> :sswitch_3
        0x30 -> :sswitch_2
        0x3c -> :sswitch_1
        0x4c -> :sswitch_0
    .end sparse-switch
.end method

.method private applyHoverText(Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    invoke-static {v0, p1}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getDrawableObject()Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->setHoverText(Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;)V

    :cond_0
    return-void
.end method

.method private static attachmentIDFromState(I)I
    .locals 2

    and-int/lit16 v0, p0, 0xff

    and-int/lit16 v0, v0, 0xf0

    shr-int/lit8 v0, v0, 0x4

    and-int/lit16 v1, p0, 0xff

    and-int/lit16 v1, v1, -0xf1

    shl-int/lit8 v1, v1, 0x4

    or-int/2addr v0, v1

    return v0
.end method

.method private calculateWorldMatrix([F)[F
    .locals 10

    const/4 v1, 0x0

    const/16 v0, 0x10

    const/4 v2, 0x0

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    if-eqz v6, :cond_0

    new-array v9, v0, [F

    new-array v1, v0, [F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    move-object v3, p1

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->MatrixTranslate([FI[FII)V

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getInverseMatrix()[F

    move-result-object v7

    move-object v3, v9

    move v4, v2

    move-object v5, v1

    move v6, v2

    move v8, v2

    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    return-object v9

    :cond_0
    return-object v1
.end method

.method public static create(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/objects/UnsupportedObjectTypeException;
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectPrimInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectPrimInfo;-><init>()V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ApplyObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;)V

    return-object v0
.end method

.method public static create(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 3

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->PCode:I

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->FullID:Ljava/util/UUID;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->FullID:Ljava/util/UUID;

    invoke-virtual {p2, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-direct {v0, p0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;-><init>(Ljava/util/UUID;Ljava/util/UUID;Z)V

    :goto_1
    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ApplyObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)V

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectPrimInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectPrimInfo;-><init>()V

    goto :goto_1
.end method

.method private getDrawableObject()Lcom/lumiyaviewer/lumiya/render/DrawableObject;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getExistingDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;->getDrawableObject()Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getLocalID(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;)I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->Data:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    return v0
.end method

.method public static getLocalID(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;)I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;->Data:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    return v0
.end method

.method private parseNameValuePairs(Ljava/lang/String;)V
    .locals 9

    const/16 v8, 0x20

    const/4 v7, 0x4

    const/4 v2, 0x0

    const-string/jumbo v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    move v4, v2

    :goto_0
    if-ge v4, v6, :cond_6

    aget-object v0, v5, v4

    const-string/jumbo v1, "AttachItemID "

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    move v1, v2

    :goto_1
    if-ge v1, v7, :cond_1

    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_0

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move-object v0, v3

    goto :goto_1

    :cond_1
    :try_start_0
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_2
    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachedToUUID:Ljava/util/UUID;

    goto :goto_2

    :cond_3
    const-string/jumbo v1, "DisplayName "

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v2

    :goto_3
    if-ge v1, v7, :cond_5

    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_4

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move-object v0, v3

    goto :goto_3

    :cond_5
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    goto :goto_2

    :cond_6
    return-void
.end method

.method private updateAttachments()V
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getDrawableAvatar(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatar;->updateAttachments()V

    :cond_0
    return-void
.end method

.method private updateSpatialIndex(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Z)V
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateWorldMatrix(Z)V

    if-eqz p2, :cond_0

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->drawListEntry:Ljava/lang/ref/WeakReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    :cond_0
    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isDead:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;->updateObject(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;)V

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Z)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateWorldMatrix(Z)V

    goto :goto_1

    :cond_3
    return-void
.end method


# virtual methods
.method public ApplyObjectProperties(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;)V
    .locals 1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->Name:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->Description:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->description:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->TouchName:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->touchName:Ljava/lang/String;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->CreatorID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->creatorUUID:Ljava/util/UUID;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->OwnerID:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->SaleType:I

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->saleType:B

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties$ObjectData;->SalePrice:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->salePrice:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameKnown:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->nameRequested:Z

    return-void
.end method

.method public ApplyObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)V
    .locals 10

    const-wide/16 v8, 0x0

    const/4 v6, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ID:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->FullID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->uuid:Ljava/util/UUID;

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->UpdateFlags:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->UpdateFlags:I

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ParentID:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->State:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentIDFromState(I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v4

    cmp-long v0, v4, v8

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v4

    cmp-long v0, v4, v8

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->OwnerID:Ljava/util/UUID;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {v0, v6, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->Text:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v3

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextColor:[B

    array-length v0, v0

    const/4 v4, 0x4

    if-lt v0, v4, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextColor:[B

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextColor:[B

    aget-byte v4, v4, v6

    shl-int/lit8 v4, v4, 0x8

    const v5, 0xff00

    and-int/2addr v4, v5

    or-int/2addr v0, v4

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextColor:[B

    const/4 v5, 0x2

    aget-byte v4, v4, v5

    shl-int/lit8 v4, v4, 0x10

    const/high16 v5, 0xff0000

    and-int/2addr v4, v5

    or-int/2addr v0, v4

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextColor:[B

    const/4 v5, 0x3

    aget-byte v4, v4, v5

    shl-int/lit8 v4, v4, 0x18

    const/high16 v5, -0x1000000

    and-int/2addr v4, v5

    or-int/2addr v0, v4

    :goto_0
    invoke-static {v3}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    move-object v0, v2

    :goto_1
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->applyHoverText(Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;)V

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->createFromObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ExtraParams:[B

    if-eqz v3, :cond_2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ExtraParams:[B

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    sget-object v4, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->unpackExtraParams(Ljava/nio/ByteBuffer;)V

    :cond_2
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->ObjectData:[B

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ParseObjectData(Ljava/nio/ByteBuffer;)V

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    if-eqz v0, :cond_3

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v2

    :cond_3
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextureEntry:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->TextureEntry:[B

    array-length v4, v4

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->create(Ljava/nio/ByteBuffer;I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    move-result-object v0

    invoke-direct {v3, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;-><init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->getTextures()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->onTexturesUpdate(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-static {v2, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getDrawableObject()Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-result-object v2

    if-eqz v2, :cond_4

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-virtual {v2, v3}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->setPrimDrawParams(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)V

    :cond_4
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;->NameValue:[B

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parseNameValuePairs(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Z)V

    return-void

    :cond_5
    move v0, v1

    goto :goto_0

    :cond_6
    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;->create(Ljava/lang/String;I)Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    move-result-object v0

    goto :goto_1
.end method

.method public ApplyObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/objects/UnsupportedObjectTypeException;
        }
    .end annotation

    const-wide/16 v10, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x0

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;->UpdateFlags:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->UpdateFlags:I

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed$ObjectData;->Data:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->uuid:Ljava/util/UUID;

    invoke-static {v0, v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->setUUID(Ljava/util/UUID;JJ)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->uuid:Ljava/util/UUID;

    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->localID:I

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    const/16 v2, 0x9

    if-eq v0, v2, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/objects/UnsupportedObjectTypeException;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/UnsupportedObjectTypeException;-><init>(B)V

    throw v1

    :cond_0
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentIDFromState(I)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseFloatVec(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v0

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseFloatVec(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    const/4 v6, 0x1

    invoke-virtual {v5, v6, v0}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->parseFloatVec3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v5

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    cmp-long v0, v6, v10

    if-eqz v0, :cond_2

    cmp-long v0, v8, v10

    if-eqz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    invoke-static {v0, v6, v7, v8, v9}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->setUUID(Ljava/util/UUID;JJ)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    :cond_2
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    and-int/lit16 v0, v5, 0x80

    if-eqz v0, :cond_3

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0xc

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_3
    and-int/lit8 v0, v5, 0x20

    if-eqz v0, :cond_4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->parentID:I

    :cond_4
    and-int/lit8 v0, v5, 0x2

    if-eqz v0, :cond_b

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_5
    :goto_0
    and-int/lit8 v0, v5, 0x4

    if-eqz v0, :cond_7

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    move v0, v1

    :goto_1
    add-int v2, v6, v0

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v7

    if-ge v2, v7, :cond_6

    add-int v2, v6, v0

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    if-nez v2, :cond_c

    :cond_6
    if-eqz v0, :cond_15

    new-array v7, v0, [B

    invoke-virtual {v4, v7, v1, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string/jumbo v8, "ISO-8859-1"

    invoke-direct {v2, v7, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    add-int/2addr v0, v6

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v2}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_d

    move-object v0, v3

    :goto_3
    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->applyHoverText(Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;)V

    :cond_7
    and-int/lit16 v0, v5, 0x200

    if-eqz v0, :cond_9

    :cond_8
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-nez v0, :cond_8

    :cond_9
    and-int/lit8 v0, v5, 0x8

    if-eqz v0, :cond_a

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x56

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_a
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v6, v0, 0xff

    move v0, v1

    :goto_4
    if-ge v0, v6, :cond_e

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getShort()S

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_b
    and-int/lit8 v0, v5, 0x1

    if-eqz v0, :cond_5

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v0, v2

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto/16 :goto_0

    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :catch_0
    move-exception v2

    move-object v2, v3

    goto :goto_2

    :cond_d
    invoke-static {v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;->create(Ljava/lang/String;I)Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    move-result-object v0

    goto :goto_3

    :cond_e
    and-int/lit8 v0, v5, 0x10

    if-eqz v0, :cond_f

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x10

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_f
    and-int/lit16 v0, v5, 0x100

    if-eqz v0, :cond_11

    :cond_10
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-nez v0, :cond_10

    :cond_11
    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->createFromPackedData(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v5

    :try_start_1
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {v4, v0}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->create(Ljava/nio/ByteBuffer;I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    :try_start_2
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->onTexturesUpdate(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :goto_5
    if-eqz v5, :cond_12

    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v5, v4}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;->unpackExtraParams(Ljava/nio/ByteBuffer;)V

    :cond_12
    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    if-eqz v5, :cond_13

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v3

    :cond_13
    invoke-direct {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;-><init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-static {v2, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getDrawableObject()Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-result-object v0

    if-eqz v0, :cond_14

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->setPrimDrawParams(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)V

    :cond_14
    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Z)V

    return-void

    :catch_1
    move-exception v0

    move-object v0, v3

    :goto_6
    const-string/jumbo v6, "Failed to retrieve textures in compressed update"

    invoke-static {v6}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_5

    :catch_2
    move-exception v6

    goto :goto_6

    :cond_15
    move-object v2, v3

    goto/16 :goto_2
.end method

.method public ApplyTerseObjectUpdate(Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;)V
    .locals 6

    const/4 v5, 0x4

    const/high16 v3, 0x43000000    # 128.0f

    const/high16 v2, -0x3d000000    # -128.0f

    const/4 v4, 0x0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->Data:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentIDFromState(I)I

    move-result v1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->attachmentID:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/lit8 v1, v1, 0x10

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_0
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseFloatVec(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    invoke-static {v0, v2, v3, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->parseU16Vec(Ljava/nio/ByteBuffer;FFFF)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v3, v4, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    const/4 v3, 0x2

    invoke-virtual {v1, v3, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/lit8 v1, v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->parseU16Vec3(Ljava/nio/ByteBuffer;FF)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/lit8 v1, v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->TextureEntry:[B

    array-length v0, v0

    if-le v0, v5, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate$ObjectData;->TextureEntry:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->create(Ljava/nio/ByteBuffer;I)Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->onTexturesUpdate(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->getTextures()Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;->getVolumeParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;-><init>(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getDrawableObject()Lcom/lumiyaviewer/lumiya/render/DrawableObject;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/DrawableObject;->setPrimDrawParams(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)V

    :cond_1
    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Z)V

    return-void
.end method

.method public declared-synchronized addChild(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->addChild(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)V

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAttachment:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getAttachedTo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateAttachments()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public clearDrawListEntry()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->drawListEntry:Ljava/lang/ref/WeakReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected abstract createDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method

.method public getAbsolutePosition()Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->get(I)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v2, v3, v1}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->addToVector(ILcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public getAttachedTo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 2

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getAttachedTo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v1
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;
    .locals 2
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->drawListEntry:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    :goto_0
    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->drawListEntry:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    :goto_1
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->createDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    move-result-object v0

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->drawListEntry:Ljava/lang/ref/WeakReference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    :cond_1
    return-object v0

    :cond_2
    move-object v0, v1

    goto :goto_0

    :cond_3
    move-object v0, v1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getExistingDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->drawListEntry:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    :cond_0
    return-object v0
.end method

.method public getHoverText()Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->hoverText:Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;

    return-object v0
.end method

.method public bridge synthetic getId()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getId()Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public getId()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectCoords()Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    return-object v0
.end method

.method public getObjectExtents(Lcom/lumiyaviewer/lumiya/render/MatrixStack;ZLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 11

    const/4 v10, 0x6

    const/4 v9, 0x5

    const/high16 v8, 0x40000000    # 2.0f

    const/4 v5, 0x0

    const/4 v1, 0x4

    const/16 v0, 0x8

    new-array v0, v0, [F

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getElementOffset(I)I

    move-result v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getElementOffset(I)I

    move-result v6

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getData()[F

    move-result-object v7

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPushMatrix()V

    add-int/lit8 v3, v2, 0x0

    aget v3, v7, v3

    add-int/lit8 v4, v2, 0x1

    aget v4, v7, v4

    add-int/lit8 v2, v2, 0x2

    aget v2, v7, v2

    invoke-virtual {p1, v3, v4, v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glTranslatef(FFF)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->getInverseMatrix()[F

    move-result-object v2

    invoke-virtual {p1, v2, v5}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glMultMatrixf([FI)V

    add-int/lit8 v2, v6, 0x0

    aget v2, v7, v2

    neg-float v2, v2

    div-float/2addr v2, v8

    aput v2, v0, v5

    add-int/lit8 v2, v6, 0x1

    aget v2, v7, v2

    neg-float v2, v2

    div-float/2addr v2, v8

    const/4 v3, 0x1

    aput v2, v0, v3

    add-int/lit8 v2, v6, 0x2

    aget v2, v7, v2

    neg-float v2, v2

    div-float/2addr v2, v8

    const/4 v3, 0x2

    aput v2, v0, v3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x3

    aput v2, v0, v3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v3

    move-object v4, v0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    if-eqz p2, :cond_1

    aget v2, v0, v1

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v2, v0, v9

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v2, v0, v10

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v2, v0, v1

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v2, v0, v9

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v2, v0, v10

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :goto_0
    add-int/lit8 v2, v6, 0x0

    aget v2, v7, v2

    div-float/2addr v2, v8

    aput v2, v0, v5

    add-int/lit8 v2, v6, 0x1

    aget v2, v7, v2

    div-float/2addr v2, v8

    const/4 v3, 0x1

    aput v2, v0, v3

    add-int/lit8 v2, v6, 0x2

    aget v2, v7, v2

    div-float/2addr v2, v8

    const/4 v3, 0x2

    aput v2, v0, v3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x3

    aput v2, v0, v3

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixData()[F

    move-result-object v2

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->getMatrixDataOffset()I

    move-result v3

    move-object v4, v0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    iget v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v3, v0, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v3, v0, v9

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v3, v0, v10

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v1, v0, v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v1, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v2, v0, v9

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v1, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v0, v0, v10

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, p3, p4}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getObjectExtents(Lcom/lumiyaviewer/lumiya/render/MatrixStack;ZLcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/util/NoSuchElementException;->printStackTrace()V

    :cond_0
    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glPopMatrix()V

    return-void

    :cond_1
    iget v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v3, v0, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v3, v0, v9

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v3, v0, v10

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p3, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    iget v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    aget v3, v0, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    aget v3, v0, v9

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    aget v3, v0, v10

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    goto/16 :goto_0
.end method

.method public getOwnerUUID()Ljava/util/UUID;
    .locals 4

    const-wide/16 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->creatorUUID:Ljava/util/UUID;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->ownerUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getParent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    return-object v0
.end method

.method public getPayInfo()Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    return-object v0
.end method

.method public getPrimDrawParams()Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->primDrawParams:Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    return-object v0
.end method

.method public getRootPrim()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->getParent()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v1

    if-eqz v1, :cond_1

    return-object p0

    :cond_1
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getRootPrim()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    return-object v0
.end method

.method public final getRotation()Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    return-object v0
.end method

.method public getTouchName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->touchName:Ljava/lang/String;

    return-object v0
.end method

.method public hasTouchableChildren()Z
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isTouchable()Z
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/util/NoSuchElementException;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public abstract isAvatar()Z
.end method

.method public declared-synchronized isAvatarSittingOn()Z
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    instance-of v2, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {v0}, Ljava/util/NoSuchElementException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    const/4 v0, 0x0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isMyAttachment()Z
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectAvatarInfo;->isMyAvatar()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isPayable()Z
    .locals 2

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->UpdateFlags:I

    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public final isTouchable()Z
    .locals 2

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->UpdateFlags:I

    and-int/lit16 v1, v1, 0x80

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected onTexturesUpdate(Lcom/lumiyaviewer/lumiya/slproto/textures/SLTextureEntry;)V
    .locals 0

    return-void
.end method

.method public declared-synchronized removeChild(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAttachment:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getAttachedTo()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateAttachments()V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;->removeChild(Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeFromSpatialIndex()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getExistingDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;->requestEntryRemoval()V

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->removeFromSpatialIndex()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public declared-synchronized setIsAttachmentAll(Z)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAttachment:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->setIsAttachmentAll(Z)V
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Ljava/util/NoSuchElementException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setPayInfo(Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->payInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;

    return-void
.end method

.method public updateSpatialIndex(Z)V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getInstance()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;->getObjectIndex()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateSpatialIndex(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialObjectIndex;Z)V

    return-void
.end method

.method public updateWorldMatrix(Z)V
    .locals 6

    const/4 v5, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->getParentObject()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;->getMatrix()[F

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    invoke-virtual {v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->getMaxComponent(I)F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objRadius:F

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->calculateWorldMatrix([F)[F

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    if-eqz v1, :cond_2

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v1

    if-eqz v1, :cond_2

    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->isAvatar()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;->getMatrix()[F

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    goto :goto_0

    :cond_2
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->objectCoords:Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    const/16 v2, 0xc

    aget v1, v1, v2

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    const/16 v3, 0xd

    aget v2, v2, v3

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->worldMatrix:[F

    const/16 v4, 0xe

    aget v3, v3, v4

    const/4 v4, 0x3

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/types/Vector3Array;->set(IFFF)V

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->treeNode:Lcom/lumiyaviewer/lumiya/utils/LinkedTreeNode;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;

    invoke-virtual {v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;->updateWorldMatrix(Z)V

    goto :goto_1

    :cond_3
    return-void
.end method
