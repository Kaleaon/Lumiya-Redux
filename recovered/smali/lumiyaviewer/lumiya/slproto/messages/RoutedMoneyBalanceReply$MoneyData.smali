.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply$MoneyData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MoneyData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public Description:[B

.field public MoneyBalance:I

.field public SquareMetersCommitted:I

.field public SquareMetersCredit:I

.field public TransactionID:Ljava/util/UUID;

.field public TransactionSuccess:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
