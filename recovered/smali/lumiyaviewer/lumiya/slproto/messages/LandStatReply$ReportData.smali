.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatReply$ReportData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReportData"
.end annotation


# instance fields
.field public LocationX:F

.field public LocationY:F

.field public LocationZ:F

.field public OwnerName:[B

.field public Score:F

.field public TaskID:Ljava/util/UUID;

.field public TaskLocalID:I

.field public TaskName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
