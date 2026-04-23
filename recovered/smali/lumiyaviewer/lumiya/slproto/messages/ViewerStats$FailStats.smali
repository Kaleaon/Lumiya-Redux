.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats$FailStats;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FailStats"
.end annotation


# instance fields
.field public Dropped:I

.field public FailedResends:I

.field public Invalid:I

.field public OffCircuit:I

.field public Resent:I

.field public SendPacket:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
