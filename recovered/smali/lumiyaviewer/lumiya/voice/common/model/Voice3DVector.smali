.class public Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
.super Ljava/lang/Object;


# annotations
.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# instance fields
.field public final x:F

.field public final y:F

.field public final z:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->x:F

    iput p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->y:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->z:F

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "x"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->x:F

    const-string/jumbo v0, "y"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->y:F

    const-string/jumbo v0, "z"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->z:F

    return-void
.end method

.method public static fromLLCoords(FFF)Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    neg-float v1, p1

    invoke-direct {v0, p0, p2, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;-><init>(FFF)V

    return-object v0
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->x:F

    const-string/jumbo v2, "x"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->y:F

    const-string/jumbo v2, "y"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->z:F

    const-string/jumbo v2, "z"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->x:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->y:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->z:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string/jumbo v1, "(%.2f, %.2f, %.2f)"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
