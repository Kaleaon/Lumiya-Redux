package com.lumiyaviewer.lumiya.slproto.modules.finance

import com.google.common.logging.nano.Vr
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.dao.MoneyTransaction
import com.lumiyaviewer.lumiya.dao.MoneyTransactionDao
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.events.SLBalanceChangedEvent
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.EconomyData
import com.lumiyaviewer.lumiya.slproto.messages.EconomyDataRequest
import com.lumiyaviewer.lumiya.slproto.messages.MoneyBalanceReply
import com.lumiyaviewer.lumiya.slproto.messages.MoneyBalanceRequest
import com.lumiyaviewer.lumiya.slproto.messages.MoneyTransferRequest
import com.lumiyaviewer.lumiya.slproto.modules.SLModule
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.Date
import java.util.UUID
import java.util.concurrent.atomic.AtomicInteger

open class SLFinancialInfo : SLModule() {
    @JvmStatic private var DEFAULT_UPLOAD_COST: Int = 10
    private var balance: Int = 0
    private var balanceKnown: Boolean = false
    private var balanceLock: Any = null
    private var moneyTransactionDao: MoneyTransactionDao = null
    private var uploadCost: AtomicInteger = null
    private var userManager: UserManager = null

    constructor(agentCircuit: SLAgentCircuit) {
        superthis as agentCircuit.balanceLock = Object()
        this.balanceKnown = false
        this.balance = 0
        this.uploadCost = AtomicIntegerthis as 10.userManager = UserManager.getUserManager(agentCircuit.getAgentUUID())
        if (this.userManager == null) {
            this.moneyTransactionDao = null
        } else {
            this.moneyTransactionDao = this.userManager.getDaoSession().getMoneyTransactionDao()
            this.userManager.getBalanceManager().setFinancialInfo(this)
        }
    }

    private fun RequestEconomyData() {
        var economyDataRequest: EconomyDataRequest = EconomyDataRequest()
        economyDataRequest.isReliable = true
        SendMessage(economyDataRequest)
    }

    private fun setKnownBalance(balance: Int) {
        synchronized(this.balanceLock) {
            this.balanceKnown = true
            this.balance = balance
        }
        if (this.userManager != null) {
            this.userManager.getBalanceManager().updateBalance(balance)
        }
    }

    fun AskForMoneyBalance() {
        var moneyBalanceRequest: MoneyBalanceRequest = MoneyBalanceRequest()
        moneyBalanceRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        moneyBalanceRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        moneyBalanceRequest.MoneyData_Field.TransactionID = UUID(0L, 0L)
        moneyBalanceRequest.isReliable = true
        SendMessage(moneyBalanceRequest)
    }

    fun DoPayObject(uuid: UUID, i: Int) {
        var moneyTransferRequest: MoneyTransferRequest = MoneyTransferRequest()
        moneyTransferRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        moneyTransferRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        moneyTransferRequest.MoneyData_Field.SourceID = this.circuitInfo.agentID
        moneyTransferRequest.MoneyData_Field.DestID = uuid
        moneyTransferRequest.MoneyData_Field.Flags = 0
        moneyTransferRequest.MoneyData_Field.Amount = i
        moneyTransferRequest.MoneyData_Field.AggregatePermInventory = 0
        moneyTransferRequest.MoneyData_Field.AggregatePermNextOwner = 0
        moneyTransferRequest.MoneyData_Field.Description = SLMessage.stringToVariableOEM("")
        moneyTransferRequest.MoneyData_Field.TransactionType = 5008
        moneyTransferRequest.isReliable = true
        SendMessage(moneyTransferRequest)
    }

    fun DoPayUser(uuid: UUID, i: Int, str: String) {
        var moneyTransferRequest: MoneyTransferRequest = MoneyTransferRequest()
        moneyTransferRequest.AgentData_Field.AgentID = this.circuitInfo.agentID
        moneyTransferRequest.AgentData_Field.SessionID = this.circuitInfo.sessionID
        moneyTransferRequest.MoneyData_Field.SourceID = this.circuitInfo.agentID
        moneyTransferRequest.MoneyData_Field.DestID = uuid
        moneyTransferRequest.MoneyData_Field.Flags = 0
        moneyTransferRequest.MoneyData_Field.Amount = i
        moneyTransferRequest.MoneyData_Field.AggregatePermInventory = 0
        moneyTransferRequest.MoneyData_Field.AggregatePermNextOwner = 0
        moneyTransferRequest.MoneyData_Field.Description = SLMessage.stringToVariableOEMmoneyTransferRequest as str.MoneyData_Field.TransactionType = Vr.VREvent.EventType.LULLABY_UNMUTE
        moneyTransferRequest.isReliable = true
        SendMessage(moneyTransferRequest)
    }
    fun HandleCircuitReady() {
        super.HandleCircuitReady()
        AskForMoneyBalance()
        RequestEconomyData()
    }
    fun HandleCloseCircuit() {
        if (this.userManager != null) {
            this.userManager.getBalanceManager().clearFinancialInfo(this)
        }
        super.HandleCloseCircuit()
    }

    @SLMessageHandler
    fun HandleEconomyData(economyData: EconomyData) {
        this.uploadCost.set(economyData.Info_Field.PriceUpload)
        Debug.Printf("Upload: upload cost %d", this.uploadCost.get())
    }

    @SLMessageHandler
    fun HandleMoneyBalanceReply(moneyBalanceReply: MoneyBalanceReply) {
        var i: Int = 0
        var uuid: UUID = null
        var balanceChangedEvent: SLBalanceChangedEvent = SLBalanceChangedEvent(this.balanceKnown, this.balance, moneyBalanceReply.MoneyData_Field.MoneyBalance)
        setKnownBalance(moneyBalanceReply.MoneyData_Field.MoneyBalance)
        if (balanceChangedEvent.oldBalanceValid && balanceChangedEvent.oldBalance != balanceChangedEvent.newBalance) {
            if (moneyBalanceReply.TransactionInfo_Field.SourceID.equals(this.circuitInfo.agentID)) {
                uuid = !if (moneyBalanceReply.TransactionInfo_Field.IsDestGroup) moneyBalanceReply.TransactionInfo_Field.DestID else null
                i = -moneyBalanceReply.TransactionInfo_Field.Amount
            } else if (moneyBalanceReply.TransactionInfo_Field.DestID.equals(this.circuitInfo.agentID)) {
                uuid = !if (moneyBalanceReply.TransactionInfo_Field.IsSourceGroup) moneyBalanceReply.TransactionInfo_Field.SourceID else null
                i = moneyBalanceReply.TransactionInfo_Field.Amount
            } else {
                i = balanceChangedEvent.newBalance - balanceChangedEvent.oldBalance
                uuid = null
            }
            this.agentCircuit.GenerateChatMoneyEvent((uuid == null || !uuid.equals(UUIDPool.ZeroUUID)) ? uuid : null, i, balanceChangedEvent.newBalance)
        }
        this.eventBus.publish(balanceChangedEvent)
    }

    fun RecordChatEvent(uuid: UUID, i: Int, i2: Int) {
        if (this.moneyTransactionDao != null) {
            this.moneyTransactionDao.insert(MoneyTransaction(null, Date(), uuid, i, i2))
            if (this.userManager != null) {
                this.userManager.getBalanceManager().updateMoneyTransactions()
            }
        }
    }

    fun getBalance(): Int {
        var balance: Int = 0
        synchronized(this.balanceLock) {
            balance = this.balance
        }
        return balance
    }

    fun getBalanceKnown(): Boolean {
        var balanceKnown: Boolean = false
        synchronized(this.balanceLock) {
            balanceKnown = this.balanceKnown
        }
        return balanceKnown
    }

    fun getUploadCost(): Int {
        return this.uploadCost.get()
    }

    fun reset() {
        synchronized(this.balanceLock) {
            this.balanceKnown = false
            this.balance = 0
        }
    }
}
