.class public Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;


# static fields
.field private static final DEFAULT_UPLOAD_COST:I = 0xa


# instance fields
.field private balance:I

.field private balanceKnown:Z

.field private final balanceLock:Ljava/lang/Object;

.field private final moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

.field private final uploadCost:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;-><init>(Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceLock:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceKnown:Z

    iput v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balance:I

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->uploadCost:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getAgentUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserManager(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getDaoSession()Lcom/lumiyaviewer/lumiya/dao/DaoSession;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/dao/DaoSession;->getMoneyTransactionDao()Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->setFinancialInfo(Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;)V

    :goto_0
    return-void

    :cond_0
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    goto :goto_0
.end method

.method private RequestEconomyData()V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyDataRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyDataRequest;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyDataRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method private setKnownBalance(I)V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceKnown:Z

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balance:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->updateBalance(I)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public AskForMoneyBalance()V
    .locals 6

    const-wide/16 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;

    new-instance v2, Ljava/util/UUID;

    invoke-direct {v2, v4, v5, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest$MoneyData;->TransactionID:Ljava/util/UUID;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public DoPayObject(Ljava/util/UUID;I)V
    .locals 4

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->SourceID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->DestID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Flags:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Amount:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->AggregatePermInventory:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->AggregatePermNextOwner:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    const-string/jumbo v2, ""

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Description:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    const/16 v2, 0x1390

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->TransactionType:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public DoPayUser(Ljava/util/UUID;ILjava/lang/String;)V
    .locals 4

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;-><init>()V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;->AgentID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->AgentData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->sessionID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$AgentData;->SessionID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->SourceID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput-object p1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->DestID:Ljava/util/UUID;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Flags:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput p2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Amount:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->AggregatePermInventory:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    iput v3, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->AggregatePermNextOwner:I

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    invoke-static {p3}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableOEM(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->Description:[B

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;

    const/16 v2, 0x1389

    iput v2, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest$MoneyData;->TransactionType:I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;->isReliable:Z

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->SendMessage(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    return-void
.end method

.method public HandleCircuitReady()V
    .locals 0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCircuitReady()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->AskForMoneyBalance()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->RequestEconomyData()V

    return-void
.end method

.method public HandleCloseCircuit()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->clearFinancialInfo(Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;)V

    :cond_0
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModule;->HandleCloseCircuit()V

    return-void
.end method

.method public HandleEconomyData(Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;)V
    .locals 4
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->uploadCost:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;->Info_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData$Info;->PriceUpload:I

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    const-string/jumbo v0, "Upload: upload cost %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->uploadCost:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public HandleMoneyBalanceReply(Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;)V
    .locals 5
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/handler/SLMessageHandler;
    .end annotation

    const/4 v1, 0x0

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceKnown:Z

    iget v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balance:I

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget v4, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->MoneyBalance:I

    invoke-direct {v3, v0, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;-><init>(ZII)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->MoneyData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$MoneyData;->MoneyBalance:I

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->setKnownBalance(I)V

    iget-boolean v0, v3, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->oldBalanceValid:Z

    if-eqz v0, :cond_0

    iget v0, v3, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->oldBalance:I

    iget v2, v3, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->newBalance:I

    if-eq v0, v2, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->SourceID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v0, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->IsDestGroup:Z

    if-nez v0, :cond_5

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->DestID:Ljava/util/UUID;

    :goto_0
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->Amount:I

    neg-int v2, v2

    :goto_1
    if-eqz v0, :cond_3

    sget-object v4, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    :goto_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    iget v4, v3, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->newBalance:I

    invoke-virtual {v0, v1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->GenerateChatMoneyEvent(Ljava/util/UUID;II)V

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->eventBus:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    invoke-virtual {v0, v3}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->publish(Ljava/lang/Object;)V

    return-void

    :cond_1
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->DestID:Ljava/util/UUID;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->circuitInfo:Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/SLCircuitInfo;->agentID:Ljava/util/UUID;

    invoke-virtual {v0, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->IsSourceGroup:Z

    if-nez v0, :cond_4

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->SourceID:Ljava/util/UUID;

    :goto_3
    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;->TransactionInfo_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply$TransactionInfo;->Amount:I

    goto :goto_1

    :cond_2
    iget v0, v3, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->newBalance:I

    iget v2, v3, Lcom/lumiyaviewer/lumiya/slproto/events/SLBalanceChangedEvent;->oldBalance:I

    sub-int/2addr v0, v2

    move v2, v0

    move-object v0, v1

    goto :goto_1

    :cond_3
    move-object v1, v0

    goto :goto_2

    :cond_4
    move-object v0, v1

    goto :goto_3

    :cond_5
    move-object v0, v1

    goto :goto_0
.end method

.method public RecordChatEvent(Ljava/util/UUID;II)V
    .locals 6

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransaction;-><init>(Ljava/lang/Long;Ljava/util/Date;Ljava/util/UUID;II)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->moneyTransactionDao:Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/dao/MoneyTransactionDao;->insert(Ljava/lang/Object;)J

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getBalanceManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/BalanceManager;->updateMoneyTransactions()V

    :cond_0
    return-void
.end method

.method public getBalance()I
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balance:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getBalanceKnown()Z
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceKnown:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getUploadCost()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->uploadCost:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balanceKnown:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/finance/SLFinancialInfo;->balance:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
