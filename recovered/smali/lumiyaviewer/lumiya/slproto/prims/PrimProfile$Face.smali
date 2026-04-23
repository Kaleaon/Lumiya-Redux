.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile$Face;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Face"
.end annotation


# static fields
.field public static final LL_FACE_INNER_SIDE:S = 0x4s

.field public static final LL_FACE_OUTER_SIDE_0:S = 0x20s

.field public static final LL_FACE_OUTER_SIDE_1:S = 0x40s

.field public static final LL_FACE_OUTER_SIDE_2:S = 0x80s

.field public static final LL_FACE_OUTER_SIDE_3:S = 0x100s

.field public static final LL_FACE_PATH_BEGIN:S = 0x1s

.field public static final LL_FACE_PATH_END:S = 0x2s

.field public static final LL_FACE_PROFILE_BEGIN:S = 0x8s

.field public static final LL_FACE_PROFILE_END:S = 0x10s


# instance fields
.field public Cap:Z

.field public Count:I

.field public FaceID:S

.field public Flat:Z

.field public Index:I

.field public ScaleU:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
