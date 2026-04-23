.class public Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesReply$QueryData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryData"
.end annotation


# instance fields
.field public ActualArea:I

.field public BillableArea:I

.field public Desc:[B

.field public Dwell:F

.field public Flags:I

.field public GlobalX:F

.field public GlobalY:F

.field public GlobalZ:F

.field public Name:[B

.field public OwnerID:Ljava/util/UUID;

.field public Price:I

.field public SimName:[B

.field public SnapshotID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
