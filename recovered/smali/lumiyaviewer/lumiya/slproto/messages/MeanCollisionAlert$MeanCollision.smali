.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MeanCollisionAlert$MeanCollision;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/MeanCollisionAlert;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MeanCollision"
.end annotation


# instance fields
.field public Mag:F

.field public Perp:Ljava/util/UUID;

.field public Time:I

.field public Type:I

.field public Victim:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
