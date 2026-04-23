.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;
.super Ljava/lang/Object;


# static fields
.field public static final NON_HUD_ATTACHMENT_POINTS:I = 0x2f

.field public static final NUM_ATTACHMENT_POINTS:I = 0x38

.field public static final attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

.field public static final nonHUDpoints:[I

.field public static final pointsByName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final bone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

.field public final id:I

.field public final isHUD:Z

.field public final name:Ljava/lang/String;

.field public final nonHUDindex:I

.field public final position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public final rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    const/high16 v14, 0x3f000000    # 0.5f

    const/4 v1, 0x1

    const/4 v3, 0x0

    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/16 v0, 0x38

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const/16 v0, 0x2f

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->nonHUDpoints:[I

    sget-object v8, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v2, "Chest"

    sget-object v5, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mChest:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v4, 0x3e19999a    # 0.15f

    const v7, -0x42333333    # -0.1f

    invoke-direct {v6, v4, v12, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v7, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v7, v14, v14, v14, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    move v4, v3

    invoke-direct/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    aput-object v0, v8, v1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Skull"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3e19999a    # 0.15f

    invoke-direct {v10, v12, v12, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    const v2, 0x3f3504f7

    const v5, 0x3f3504f7

    invoke-direct {v11, v12, v12, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/4 v5, 0x2

    move v7, v1

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/4 v2, 0x2

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Shoulder"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mCollarLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3da3d70a    # 0.08f

    invoke-direct {v10, v12, v12, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/4 v5, 0x3

    const/4 v7, 0x2

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/4 v2, 0x3

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Shoulder"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mCollarRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3da3d70a    # 0.08f

    invoke-direct {v10, v12, v12, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/4 v5, 0x4

    const/4 v7, 0x3

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/4 v2, 0x4

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Hand"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWristLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3da3d70a    # 0.08f

    const v5, -0x435c28f6    # -0.02f

    invoke-direct {v10, v12, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/4 v5, 0x5

    const/4 v7, 0x4

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/4 v2, 0x5

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Hand"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWristRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x425c28f6    # -0.08f

    const v5, -0x435c28f6    # -0.02f

    invoke-direct {v10, v12, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/4 v5, 0x6

    const/4 v7, 0x5

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/4 v2, 0x6

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Foot"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFootLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/4 v5, 0x7

    const/4 v7, 0x6

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/4 v2, 0x7

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Foot"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFootRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x8

    const/4 v7, 0x7

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x8

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Spine"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mChest:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x41e66666    # -0.15f

    const v5, -0x42333333    # -0.1f

    invoke-direct {v10, v2, v12, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    const/high16 v2, -0x41000000    # -0.5f

    const/high16 v5, -0x41000000    # -0.5f

    invoke-direct {v11, v2, v5, v14, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x9

    const/16 v7, 0x8

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x9

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Pelvis"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mPelvis:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x41e66666    # -0.15f

    invoke-direct {v10, v12, v12, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0xa

    const/16 v7, 0x9

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0xa

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Mouth"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3df5c28f    # 0.12f

    const v5, 0x3a83126f    # 0.001f

    invoke-direct {v10, v2, v12, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0xb

    const/16 v7, 0xa

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0xb

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Chin"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3df5c28f    # 0.12f

    const v5, -0x42dc28f6    # -0.04f

    invoke-direct {v10, v2, v12, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0xc

    const/16 v7, 0xb

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0xc

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Ear"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3c75c28f    # 0.015f

    const v5, 0x3da3d70a    # 0.08f

    const v7, 0x3c8b4396    # 0.017f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0xd

    const/16 v7, 0xc

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0xd

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Ear"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3c75c28f    # 0.015f

    const v5, -0x425c28f6    # -0.08f

    const v7, 0x3c8b4396    # 0.017f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0xe

    const/16 v7, 0xd

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0xe

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Eyeball"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mEyeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0xf

    const/16 v7, 0xe

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0xf

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Eyeball"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mEyeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x10

    const/16 v7, 0xf

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x10

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Nose"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHead:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3dcccccd    # 0.1f

    const v5, 0x3d4ccccd    # 0.05f

    invoke-direct {v10, v2, v12, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x11

    const/16 v7, 0x10

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x11

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "R Upper Arm"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mShoulderRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3c23d70a    # 0.01f

    const v5, -0x41fae148    # -0.13f

    const v7, 0x3c23d70a    # 0.01f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x12

    const/16 v7, 0x11

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x12

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "R Forearm"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mElbowRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x420a3d71    # -0.12f

    invoke-direct {v10, v12, v2, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x13

    const/16 v7, 0x12

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x13

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "L Upper Arm"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mShoulderLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3c23d70a    # 0.01f

    const v5, 0x3e19999a    # 0.15f

    const v7, -0x43dc28f6    # -0.01f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x14

    const/16 v7, 0x13

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x14

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "L Forearm"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mElbowLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3de76c8b    # 0.113f

    invoke-direct {v10, v12, v2, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x15

    const/16 v7, 0x14

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x15

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Hip"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x16

    const/16 v7, 0x15

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x16

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "R Upper Leg"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x4374bc6a    # -0.017f

    const v5, 0x3d27ef9e    # 0.041f

    const v7, -0x416147ae    # -0.31f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x17

    const/16 v7, 0x16

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x17

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "R Lower Leg"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mKneeRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x42cbc6a8    # -0.044f

    const v5, -0x441a9fbe    # -0.007f

    const v7, -0x4179db23    # -0.262f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x18

    const/16 v7, 0x17

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x18

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Hip"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x19

    const/16 v7, 0x18

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x19

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "L Upper Leg"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHipLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x43645a1d    # -0.019f

    const v5, -0x42f4bc6a    # -0.034f

    const v7, -0x416147ae    # -0.31f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x1a

    const/16 v7, 0x19

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x1a

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "L Lower Leg"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mKneeLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x42cbc6a8    # -0.044f

    const v5, -0x441a9fbe    # -0.007f

    const v7, -0x417a5e35    # -0.261f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x1b

    const/16 v7, 0x1a

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x1b

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Stomach"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mPelvis:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3dbc6a7f    # 0.092f

    const v5, 0x3db43958    # 0.088f

    invoke-direct {v10, v2, v12, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x1c

    const/16 v7, 0x1b

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x1c

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Pec"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTorso:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3dd4fdf4    # 0.104f

    const v5, 0x3da7ef9e    # 0.082f

    const v7, 0x3e7ced91    # 0.247f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x1d

    const/16 v7, 0x1c

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x1d

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Pec"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTorso:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, 0x3dd4fdf4    # 0.104f

    const v5, -0x42581062    # -0.082f

    const v7, 0x3e7ced91    # 0.247f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x1e

    const/16 v7, 0x1d

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x1e

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Center 2"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x1f

    const/4 v7, -0x1

    const/4 v9, 0x0

    move v8, v1

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x1f

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Top Right"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v2, -0x41000000    # -0.5f

    invoke-direct {v10, v12, v2, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x20

    const/4 v7, -0x1

    const/4 v9, 0x0

    move v8, v1

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x20

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Top"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x21

    const/4 v7, -0x1

    const/4 v9, 0x0

    move v8, v1

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x21

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Top Left"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v14, v14}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x22

    const/4 v7, -0x1

    const/4 v9, 0x0

    move v8, v1

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x22

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Center"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x23

    const/4 v7, -0x1

    const/4 v9, 0x0

    move v8, v1

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x23

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Bottom Left"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v2, -0x41000000    # -0.5f

    invoke-direct {v10, v12, v14, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x24

    const/4 v7, -0x1

    const/4 v9, 0x0

    move v8, v1

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x24

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Bottom"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v2, -0x41000000    # -0.5f

    invoke-direct {v10, v12, v12, v2}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x25

    const/4 v7, -0x1

    const/4 v9, 0x0

    move v8, v1

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x25

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Bottom Right"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/high16 v2, -0x41000000    # -0.5f

    const/high16 v5, -0x41000000    # -0.5f

    invoke-direct {v10, v12, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x26

    const/4 v7, -0x1

    const/4 v9, 0x0

    move v8, v1

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x26

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Neck"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mNeck:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x27

    const/16 v7, 0x1e

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x27

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Avatar Center"

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x28

    const/16 v7, 0x1f

    const/4 v9, 0x0

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x28

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Ring Finger"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x443b645a    # -0.006f

    const v5, 0x3c9ba5e3    # 0.019f

    const v7, -0x44fced91    # -0.002f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x29

    const/16 v7, 0x20

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x29

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Ring Finger"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHandRing1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x443b645a    # -0.006f

    const v5, -0x43645a1d    # -0.019f

    const v7, -0x44fced91    # -0.002f

    invoke-direct {v10, v2, v5, v7}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x2a

    const/16 v7, 0x21

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x2a

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Tail Base"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail1:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x2b

    const/16 v7, 0x22

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x2b

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Tail Tip"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mTail6:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const v2, -0x43333333    # -0.025f

    invoke-direct {v10, v2, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x2c

    const/16 v7, 0x23

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x2c

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Wing"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x2d

    const/16 v7, 0x24

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x2d

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Wing"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mWing4Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x2e

    const/16 v7, 0x25

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x2e

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Jaw"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceJaw:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x2f

    const/16 v7, 0x26

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x2f

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Alt Left Ear"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar1Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x30

    const/16 v7, 0x27

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x30

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Alt Right Ear"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEar1Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x31

    const/16 v7, 0x28

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x31

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Alt Left Eye"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeAltLeft:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x32

    const/16 v7, 0x29

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x32

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Alt Right Eye"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceEyeAltRight:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x33

    const/16 v7, 0x2a

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x33

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Tongue"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mFaceTongueTip:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x34

    const/16 v7, 0x2b

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x34

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Groin"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mGroin:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x35

    const/16 v7, 0x2c

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x35

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Left Hind Foot"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb4Left:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x36

    const/16 v7, 0x2d

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x36

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const-string/jumbo v6, "Right Hind Foot"

    sget-object v9, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;->mHindLimb4Right:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v10, v12, v12, v12}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>(FFF)V

    new-instance v11, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v11, v12, v12, v12, v13}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>(FFFF)V

    const/16 v5, 0x37

    const/16 v7, 0x2e

    move v8, v3

    invoke-direct/range {v4 .. v11}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;-><init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    const/16 v2, 0x37

    aput-object v4, v0, v2

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v2, "Chest"

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    aget-object v1, v3, v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Skull"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Shoulder"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Shoulder"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Hand"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Hand"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Foot"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Foot"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Spine"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Pelvis"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Mouth"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0xb

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Chin"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0xc

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Ear"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0xd

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Ear"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0xe

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Eyeball"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0xf

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Eyeball"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x10

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Nose"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x11

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "R Upper Arm"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x12

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "R Forearm"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x13

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "L Upper Arm"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x14

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "L Forearm"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x15

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Hip"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x16

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "R Upper Leg"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x17

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "R Lower Leg"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x18

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Hip"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x19

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "L Upper Leg"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x1a

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "L Lower Leg"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x1b

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Stomach"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x1c

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Pec"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x1d

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Pec"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x1e

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Center 2"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x1f

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Top Right"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x20

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Top"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x21

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Top Left"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x22

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Center"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x23

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Bottom Left"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x24

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Bottom"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x25

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Bottom Right"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x26

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Neck"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x27

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Avatar Center"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x28

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Ring Finger"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x29

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Ring Finger"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x2a

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Tail Base"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x2b

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Tail Tip"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x2c

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Wing"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x2d

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Wing"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x2e

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Jaw"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x2f

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Alt Left Ear"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x30

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Alt Right Ear"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x31

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Alt Left Eye"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x32

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Alt Right Eye"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x33

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Tongue"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x34

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Groin"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x35

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Left Hind Foot"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x36

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->pointsByName:Ljava/util/Map;

    const-string/jumbo v1, "Right Hind Foot"

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->attachmentPoints:[Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;

    const/16 v3, 0x37

    aget-object v2, v2, v3

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :array_0
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
        0x11
        0x12
        0x13
        0x14
        0x15
        0x16
        0x17
        0x18
        0x19
        0x1a
        0x1b
        0x1c
        0x1d
        0x1e
        0x27
        0x28
        0x29
        0x2a
        0x2b
        0x2c
        0x2d
        0x2e
        0x2f
        0x30
        0x31
        0x32
        0x33
        0x34
        0x35
        0x36
        0x37
    .end array-data
.end method

.method private constructor <init>(ILjava/lang/String;IZLcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->id:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->name:Ljava/lang/String;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->nonHUDindex:I

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->isHUD:Z

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->bone:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAttachmentPoint;->rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    return-void
.end method
