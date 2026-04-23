.class public Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MoneyData"
.end annotation


# instance fields
.field public AggregatePermInventory:I

.field public AggregatePermNextOwner:I

.field public Amount:I

.field public Description:[B

.field public DestID:Ljava/util/UUID;

.field public Flags:I

.field public SourceID:Ljava/util/UUID;

.field public TransactionType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
