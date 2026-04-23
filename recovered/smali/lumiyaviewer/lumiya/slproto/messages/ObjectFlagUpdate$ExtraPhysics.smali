.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectFlagUpdate$ExtraPhysics;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectFlagUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExtraPhysics"
.end annotation


# instance fields
.field public Density:F

.field public Friction:F

.field public GravityMultiplier:F

.field public PhysicsShapeType:I

.field public Restitution:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
