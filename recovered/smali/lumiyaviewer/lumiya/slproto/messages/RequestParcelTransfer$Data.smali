.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public ActualArea:I

.field public Amount:I

.field public BillableArea:I

.field public DestID:Ljava/util/UUID;

.field public Final:Z

.field public Flags:I

.field public OwnerID:Ljava/util/UUID;

.field public SourceID:Ljava/util/UUID;

.field public TransactionID:Ljava/util/UUID;

.field public TransactionTime:I

.field public TransactionType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
