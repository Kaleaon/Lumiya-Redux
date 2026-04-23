.class public Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction$TransactionData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TransactionData"
.end annotation


# instance fields
.field public Amount:I

.field public DestID:Ljava/util/UUID;

.field public FailureType:I

.field public Flags:I

.field public GridX:I

.field public GridY:I

.field public SimulatorIP:Ljava/net/Inet4Address;

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
