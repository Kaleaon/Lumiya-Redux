.class public Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;
.super Ljava/lang/Object;


# instance fields
.field public final eulerAngles:[F

.field public final headTransformMatrix:[F

.field public lastYaw:F

.field public neutralYaw:F

.field public neutralYawValid:Z

.field public pitchDegrees:F

.field public final rightVector:[F

.field public final rightVectorRaw:[F

.field public final rotationQuat:[F

.field public final translationVector:[F

.field public useButtonsYaw:F

.field public viewExtraYaw:F

.field public yawDegrees:F


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v1, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->rotationQuat:[F

    new-array v0, v1, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->translationVector:[F

    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->headTransformMatrix:[F

    new-array v0, v1, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->rightVectorRaw:[F

    new-array v0, v1, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->rightVector:[F

    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->eulerAngles:[F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->neutralYawValid:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/HeadTransformCompat;->viewExtraYaw:F

    return-void
.end method
