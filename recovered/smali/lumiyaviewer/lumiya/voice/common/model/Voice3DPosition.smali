.class public Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;
.super Ljava/lang/Object;


# annotations
.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# instance fields
.field public final atOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final leftOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final position:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final upOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final velocity:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const-string/jumbo v1, "position"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->position:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const-string/jumbo v1, "velocity"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->velocity:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const-string/jumbo v1, "atOrientation"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->atOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const-string/jumbo v1, "upOrientation"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->upOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    new-instance v0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const-string/jumbo v1, "leftOrientation"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->leftOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->position:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->velocity:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->atOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->upOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->leftOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->position:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "position"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->velocity:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "velocity"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->atOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "atOrientation"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->upOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "upOrientation"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->leftOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "leftOrientation"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->position:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const-string/jumbo v2, "(pos %s vel %s at %s up %s left %s)"

    const/4 v3, 0x0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->velocity:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const/4 v3, 0x1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->atOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const/4 v3, 0x2

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->upOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const/4 v3, 0x3

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DPosition;->leftOrientation:Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;

    const/4 v3, 0x4

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/voice/common/model/Voice3DVector;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
