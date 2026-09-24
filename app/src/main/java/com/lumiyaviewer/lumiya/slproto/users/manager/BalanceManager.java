package com.lumiyaviewer.lumiya.slproto.users.manager;

import com.lumiyaviewer.lumiya.dao.MoneyTransaction;
import com.lumiyaviewer.lumiya.dao.MoneyTransactionDao;
import com.lumiyaviewer.lumiya.react.AsyncRequestHandler;
import com.lumiyaviewer.lumiya.react.DisposeHandler;
import com.lumiyaviewer.lumiya.react.SimpleRequestHandler;
import com.lumiyaviewer.lumiya.react.Subscribable;
import com.lumiyaviewer.lumiya.react.SubscriptionPool;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.SLGridConnection;
import com.lumiyaviewer.lumiya.slproto.modules.finance.SLFinancialInfo;
import de.greenrobot.dao.query.LazyList;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;

public class BalanceManager {
    private final MoneyTransactionDao moneyTransactionDao;
    private final UserManager userManager;
    private final AtomicReference<SLFinancialInfo> financialInfo = new AtomicReference<>(null);
    private final SubscriptionPool<SubscriptionSingleKey, LazyList<MoneyTransaction>> moneyTransactionPool = new SubscriptionPool<>();
    private final SimpleRequestHandler<SubscriptionSingleKey> balanceRequestHandler = new SimpleRequestHandler<SubscriptionSingleKey>() {
        @Override
        public void onRequest(@Nonnull SubscriptionSingleKey subscriptionSingleKey) {
            SLFinancialInfo financialInfo = (SLFinancialInfo) BalanceManager.this.financialInfo.get();
            if (financialInfo == null) {
                BalanceManager.this.balancePool.onResultError(SubscriptionSingleKey.Value, new SLGridConnection.NotConnectedException());
                return;
            }
            if (financialInfo.getBalanceKnown()) {
                BalanceManager.this.balancePool.onResultData(SubscriptionSingleKey.Value, Integer.valueOf(financialInfo.getBalance()));
                return;
            }
            SLAgentCircuit activeAgentCircuit = BalanceManager.this.userManager.getActiveAgentCircuit();
            if (activeAgentCircuit != null) {
                activeAgentCircuit.execute(BalanceManager.this.requestBalanceRunnable);
            } else {
                BalanceManager.this.balancePool.onResultError(SubscriptionSingleKey.Value, new SLGridConnection.NotConnectedException());
            }
        }
    };
    private final Runnable requestBalanceRunnable = new Runnable() {
        @Override
        public void run() {
            SLFinancialInfo financialInfo = (SLFinancialInfo) BalanceManager.this.financialInfo.get();
            if (financialInfo != null) {
                financialInfo.AskForMoneyBalance();
            } else {
                BalanceManager.this.balancePool.onResultError(SubscriptionSingleKey.Value, new SLGridConnection.NotConnectedException());
            }
        }
    };
    private final SubscriptionPool<SubscriptionSingleKey, Integer> balancePool = new SubscriptionPool<>();

    BalanceManager(UserManager userManager) {
        this.userManager = userManager;
        this.moneyTransactionDao = userManager.getDaoSession().getMoneyTransactionDao();
        this.balancePool.attachRequestHandler(this.balanceRequestHandler);
        this.moneyTransactionPool.attachRequestHandler(new AsyncRequestHandler(userManager.getDatabaseExecutor(), new SimpleRequestHandler<SubscriptionSingleKey>() {
            @Override
            public void onRequest(@Nonnull SubscriptionSingleKey subscriptionSingleKey) {
                BalanceManager.this.moneyTransactionPool.onResultData(subscriptionSingleKey, BalanceManager.this.moneyTransactionDao.queryBuilder().orderAsc(MoneyTransactionDao.Properties.Timestamp).listLazy());
            }
        }));
        this.moneyTransactionPool.setDisposeHandler(new DisposeHandler() {
            private final /* synthetic */ void $m$0(Object obj) {
                BalanceManager.m296x44e075e0((LazyList) obj);
            }

            @Override
            public final void onDispose(Object obj) {
                $m$0(obj);
            }
        }, userManager.getDatabaseExecutor());
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_BalanceManager_1705, reason: not valid java name */
    static /* synthetic */ void m296x44e075e0(LazyList lazyList) {
        if (lazyList.isClosed()) {
            return;
        }
        lazyList.close();
    }

    public void clearFinancialInfo(SLFinancialInfo financialInfo) {
        this.financialInfo.compareAndSet(financialInfo, null);
    }

    public void clearMoneyTransactions() {
        this.userManager.getDatabaseExecutor().execute(new Runnable() {
            private final /* synthetic */ void $m$0() {
                BalanceManager.this.m297x44e1c14d();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    public Subscribable<SubscriptionSingleKey, Integer> getBalance() {
        return this.balancePool;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_BalanceManager_4293, reason: not valid java name */
    /* synthetic */ void m297x44e1c14d() {
        this.moneyTransactionDao.deleteAll();
        updateMoneyTransactions();
    }

    public Subscribable<SubscriptionSingleKey, LazyList<MoneyTransaction>> moneyTransactions() {
        return this.moneyTransactionPool;
    }

    public void setFinancialInfo(SLFinancialInfo financialInfo) {
        this.financialInfo.set(financialInfo);
    }

    public void updateBalance(int i) {
        this.balancePool.onResultData(SubscriptionSingleKey.Value, Integer.valueOf(i));
    }

    public void updateMoneyTransactions() {
        this.moneyTransactionPool.requestUpdate(SubscriptionSingleKey.Value);
    }
}
