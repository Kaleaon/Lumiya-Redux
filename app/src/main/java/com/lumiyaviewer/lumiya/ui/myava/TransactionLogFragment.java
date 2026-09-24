package com.lumiyaviewer.lumiya.ui.myava;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import androidx.annotation.Nullable;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.lumiyaviewer.lumiya.ui.common.binding.Unbinder;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.MoneyTransaction;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout;
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor;
import com.lumiyaviewer.lumiya.ui.myava.TransactionLogAdapter;
import de.greenrobot.dao.query.LazyList;
import java.util.UUID;

public class TransactionLogFragment extends FragmentWithTitle implements LoadableMonitor.OnLoadableDataChangedListener, TransactionLogAdapter.OnTransactionClickListener {
    private TransactionLogAdapter adapter;

    LoadingLayout loadingLayout;

    RecyclerView transactionLogView;
    private Unbinder unbinder;
    private final SubscriptionData<SubscriptionSingleKey, LazyList<MoneyTransaction>> moneyTransactions = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final LoadableMonitor loadableMonitor = new LoadableMonitor(this.moneyTransactions).withDataChangedListener(this);
    private boolean scrollToBottomRunnablePosted = false;
    private final Handler mHandler = new Handler();
    private final Runnable scrollToBottomRunnable = new Runnable() {
        @Override
        public void run() {
            int itemCount;
            TransactionLogFragment.this.scrollToBottomRunnablePosted = false;
            if (TransactionLogFragment.this.unbinder != null) {
                RecyclerView recyclerView = TransactionLogFragment.this.transactionLogView;
                if (recyclerView.hasPendingAdapterUpdates()) {
                    TransactionLogFragment.this.scrollToBottomRunnablePosted = true;
                    TransactionLogFragment.this.mHandler.post(TransactionLogFragment.this.scrollToBottomRunnable);
                } else {
                    if (TransactionLogFragment.this.adapter == null || (itemCount = TransactionLogFragment.this.adapter.getItemCount()) <= 0) {
                        return;
                    }
                    recyclerView.scrollToPosition(itemCount - 1);
                }
            }
        }
    };

    private void clearTransactionLog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setMessage(R.string.clear_transaction_log_message).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                TransactionLogFragment.this.m675xf57d8a84(dialogInterface, i);
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        });
        builder.create().show();
    }

    public static Bundle makeSelection(UUID uuid) {
        Bundle bundle = new Bundle();
        ActivityUtils.setActiveAgentID(bundle, uuid);
        return bundle;
    }

    private void performClearTransactionLog() {
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (userManager != null) {
            userManager.getBalanceManager().clearMoneyTransactions();
        }
    }

    private void scrollToBottom() {
        if (this.scrollToBottomRunnablePosted) {
            return;
        }
        this.scrollToBottomRunnablePosted = true;
        this.mHandler.post(this.scrollToBottomRunnable);
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_myava_TransactionLogFragment_4757, reason: not valid java name */
    /* synthetic */ void m675xf57d8a84(DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
        performClearTransactionLog();
    }

    @Override
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater);
        menuInflater.inflate(R.menu.transaction_log_menu, menu);
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.transaction_log, viewGroup, false);
        this.unbinder = new TransactionLogFragment_ViewBinding(this, inflate);
        this.adapter = new TransactionLogAdapter(getContext(), ActivityUtils.getActiveAgentID(getArguments()), this);
        this.transactionLogView.setAdapter(this.adapter);
        this.loadableMonitor.setLoadingLayout(this.loadingLayout, null, getString(R.string.cannot_load_transaction_list));
        return inflate;
    }

    @Override
    public void onDestroyView() {
        if (this.unbinder != null) {
            this.unbinder.unbind();
            this.unbinder = null;
        }
        super.onDestroyView();
    }

    @Override
    public void onLoadableDataChanged() {
        LazyList<MoneyTransaction> data = this.moneyTransactions.getData();
        if (data != null) {
            this.loadableMonitor.setEmptyMessage(data.isEmpty(), getString(R.string.no_transactions_per_session));
            if (this.adapter != null) {
                this.adapter.setData(data);
                scrollToBottom();
            }
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.item_clear_transaction_log:
                clearTransactionLog();
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    @Override
    public void onStart() {
        super.onStart();
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (userManager != null) {
            this.moneyTransactions.subscribe(userManager.getBalanceManager().moneyTransactions(), SubscriptionSingleKey.Value);
        }
    }

    @Override
    public void onStop() {
        this.loadableMonitor.unsubscribeAll();
        super.onStop();
    }

    @Override
    public void onTransactionClicked(MoneyTransaction moneyTransaction) {
        UUID activeAgentID = ActivityUtils.getActiveAgentID(getArguments());
        if (activeAgentID != null) {
            DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(activeAgentID, moneyTransaction.getAgentUUID())));
        }
    }
}
