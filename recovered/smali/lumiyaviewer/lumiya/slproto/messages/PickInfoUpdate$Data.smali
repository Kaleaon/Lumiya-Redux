.class public Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public CreatorID:Ljava/util/UUID;

.field public Desc:[B

.field public Enabled:Z

.field public Name:[B

.field public ParcelID:Ljava/util/UUID;

.field public PickID:Ljava/util/UUID;

.field public PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

.field public SnapshotID:Ljava/util/UUID;

.field public SortOrder:I

.field public TopPick:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
