.class public Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;
.super Ljava/lang/Object;


# instance fields
.field public final jointTranslations:Ljava/util/EnumMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;",
            "[F>;"
        }
    .end annotation
.end field

.field public pelvisOffset:F


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;->pelvisOffset:F

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLSkeletonBoneID;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/mesh/MeshJointTranslations;->jointTranslations:Ljava/util/EnumMap;

    return-void
.end method
