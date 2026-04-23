.class public Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;
.super Ljava/lang/Object;


# instance fields
.field private agentUUID:Ljava/util/UUID;

.field private id:Ljava/lang/Long;

.field private newBalance:I

.field private timestamp:Ljava/util/Date;

.field private transactionAmount:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/util/Date;Ljava/util/UUID;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->id:Ljava/lang/Long;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->timestamp:Ljava/util/Date;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->agentUUID:Ljava/util/UUID;

    iput p4, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->transactionAmount:I

    iput p5, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->newBalance:I

    return-void
.end method


# virtual methods
.method public getAgentUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->agentUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getId()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getNewBalance()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->newBalance:I

    return v0
.end method

.method public getTimestamp()Ljava/util/Date;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->timestamp:Ljava/util/Date;

    return-object v0
.end method

.method public getTransactionAmount()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->transactionAmount:I

    return v0
.end method

.method public setAgentUUID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->agentUUID:Ljava/util/UUID;

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->id:Ljava/lang/Long;

    return-void
.end method

.method public setNewBalance(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->newBalance:I

    return-void
.end method

.method public setTimestamp(Ljava/util/Date;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->timestamp:Ljava/util/Date;

    return-void
.end method

.method public setTransactionAmount(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;->transactionAmount:I

    return-void
.end method
