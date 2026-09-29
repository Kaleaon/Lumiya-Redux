package com.lumiyaviewer.lumiya.slproto.users.manager

import com.lumiyaviewer.lumiya.dao.MoneyTransaction
import com.lumiyaviewer.lumiya.dao.MoneyTransactionDao
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler
import com.lumiyaviewer.lumiya.react.DisposeHandler
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler
import com.lumiyaviewer.lumiya.react.Subscribable
import com.lumiyaviewer.lumiya.react.SubscriptionPool
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.modules.finance.SLFinancialInfo
import de.greenrobot.dao.query.LazyList
import java.util.concurrent.atomic.AtomicReference

open class BalanceManager {
    private var moneyTransactionDao: MoneyTransactionDao? = null
    private var userManager: UserManager? = null
    private var financialInfo: AtomicReference<SLFinancialInfo> = AtomicReference<>(null)
    private SubscriptionPool<SubscriptionSingleKey, LazyList<MoneyTransaction>> moneyTransactionPool = SubscriptionPool<>()
    private var balanceRequestHandler: SimpleRequestHandler<SubscriptionSingleKey> = SimpleRequestHandler<SubscriptionSingleKey>() {
        fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
            var financialInfo: SLFinancialInfo = BalanceManager as SLFinancialInfo.this.financialInfo.get()
            if (financialInfo == null) {
                BalanceManager.this.balancePool.onResultError(SubscriptionSingleKey.Value, SLGridConnection.NotConnectedException())
                return
            }
            if (financialInfo.getBalanceKnown()) {
                BalanceManager.this.balancePool.onResultData(SubscriptionSingleKey.Value, financialInfo.getBalance())
                return
            }
            var activeAgentCircuit: SLAgentCircuit = BalanceManager.this.userManager.getActiveAgentCircuit()
            if (activeAgentCircuit != null) {
                activeAgentCircuit.execute(BalanceManager.this.requestBalanceRunnable)
            } else {
                BalanceManager.this.balancePool.onResultError(SubscriptionSingleKey.Value, SLGridConnection.NotConnectedException())
            }
        }
    }
    private var requestBalanceRunnable: Runnable = Runnable() {
        fun run() {
            var financialInfo: SLFinancialInfo = BalanceManager as SLFinancialInfo.this.financialInfo.get()
            if (financialInfo != null) {
                financialInfo.AskForMoneyBalance()
            } else {
                BalanceManager.this.balancePool.onResultError(SubscriptionSingleKey.Value, SLGridConnection.NotConnectedException())
            }
        }
    }
    private var balancePool: SubscriptionPool<SubscriptionSingleKey, if (Int) > = SubscriptionPool<>()

    constructor(userManager else UserManager) {
        this.userManager = userManager
        this.moneyTransactionDao = userManager.getDaoSession().getMoneyTransactionDao()
        this.balancePool.attachRequestHandler(this.balanceRequestHandler)
        this.moneyTransactionPool.attachRequestHandler(AsyncRequestHandler(userManager.getDatabaseExecutor(), SimpleRequestHandler<SubscriptionSingleKey>() {
            fun onRequest(subscriptionSingleKey: SubscriptionSingleKey) {
                BalanceManager.this.moneyTransactionPool.onResultData(subscriptionSingleKey, BalanceManager.this.moneyTransactionDao.queryBuilder().orderAsc(MoneyTransactionDao.Properties.Timestamp).listLazy())
            }
        }))
        this.moneyTransactionPool.setDisposeHandler(DisposeHandler() {
            private /* synthetic */ void $m$0(Object obj) {
                BalanceManager.m296x44e075e0(obj as LazyList)
            }
            fun onDispose(obj: Any) {
                $m$0(obj)
            }
        }, userManager.getDatabaseExecutor())
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_BalanceManager_1705, reason: not valid java name */
    static /* synthetic */ void m296x44e075e0(LazyList lazyList) {
        if (lazyList.isClosed()) {
            return
        }
        lazyList.close()
    }

    fun clearFinancialInfo(financialInfo: SLFinancialInfo) {
        this.financialInfo.compareAndSet(financialInfo, null)
    }

    fun clearMoneyTransactions() {
        this.userManager.getDatabaseExecutor().execute(Runnable() {
            private /* synthetic */ void $m$0() {
                BalanceManager.this.m297x44e1c14d()
            }
            fun run() {
                $m$0()
            }
        })
    }

    public Subscribable<SubscriptionSingleKey, Integer> getBalance() {
        return this.balancePool
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_BalanceManager_4293, reason: not valid java name */
    /* synthetic */ void m297x44e1c14d() {
        this.moneyTransactionDao.deleteAll()
        updateMoneyTransactions()
    }

    public Subscribable<SubscriptionSingleKey, LazyList<MoneyTransaction>> moneyTransactions() {
        return this.moneyTransactionPool
    }

    fun setFinancialInfo(financialInfo: SLFinancialInfo) {
        this.financialInfo.set(financialInfo)
    }

    fun updateBalance(i: Int) {
        this.balancePool.onResultData(SubscriptionSingleKey.Value, i)
    }

    fun updateMoneyTransactions() {
        this.moneyTransactionPool.requestUpdate(SubscriptionSingleKey.Value)
    }
}
