package com.lumiyaviewer.lumiya.ui.myava;

import android.annotation.SuppressLint;
import android.content.Context;
import androidx.annotation.CallSuper;
import androidx.annotation.UiThread;
import androidx.recyclerview.widget.RecyclerView;
import android.text.format.DateUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.Unbinder;
import butterknife.internal.Utils;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.MoneyTransaction;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import com.lumiyaviewer.lumiya.ui.common.ChatterNameDisplayer;
import de.greenrobot.dao.query.LazyList;
import java.util.Calendar;
import java.util.UUID;
import javax.annotation.Nullable;

/* loaded from: classes.dex */
public class TransactionLogAdapter extends RecyclerView.Adapter<TransactionViewHolder> {
    private final UUID agentUUID;
    private final Context context;

    @Nullable
    private LazyList<MoneyTransaction> data;
    private final LayoutInflater inflater;
    private final OnTransactionClickListener onTransactionClickListener;

    interface OnTransactionClickListener {
        void onTransactionClicked(MoneyTransaction moneyTransaction);
    }

    public class TransactionViewHolder_ViewBinding implements Unbinder {
        private TransactionViewHolder target;

        @UiThread
        public TransactionViewHolder_ViewBinding(TransactionViewHolder transactionViewHolder, View view) {
            this.target = transactionViewHolder;
            transactionViewHolder.userName = (TextView) Utils.findRequiredViewAsType(view, R.id.user_name, "field 'userName'", TextView.class);
            transactionViewHolder.userPicView = (ChatterPicView) Utils.findRequiredViewAsType(view, R.id.userPicView, "field 'userPicView'", ChatterPicView.class);
            transactionViewHolder.timestampTextView = (TextView) Utils.findRequiredViewAsType(view, R.id.timeStampTextView, "field 'timestampTextView'", TextView.class);
            transactionViewHolder.amountTextView = (TextView) Utils.findRequiredViewAsType(view, R.id.amountTextView, "field 'amountTextView'", TextView.class);
            transactionViewHolder.finalBalanceTextView = (TextView) Utils.findRequiredViewAsType(view, R.id.finalBalanceTextView, "field 'finalBalanceTextView'", TextView.class);
        }

        @Override // butterknife.Unbinder
        @CallSuper
        public void unbind() {
            TransactionViewHolder transactionViewHolder = this.target;
            if (transactionViewHolder == null) {
                throw new IllegalStateException("Bindings already cleared.");
            }
            this.target = null;
            transactionViewHolder.userName = null;
            transactionViewHolder.userPicView = null;
            transactionViewHolder.timestampTextView = null;
            transactionViewHolder.amountTextView = null;
            transactionViewHolder.finalBalanceTextView = null;
        }
    }


    UUID getAgentUUID() {
        return this.agentUUID;
    }

    Context getContext() {
        return this.context;
    }

    OnTransactionClickListener getOnTransactionClickListener() {
        return this.onTransactionClickListener;
    }

    TransactionLogAdapter(Context context, UUID uuid, OnTransactionClickListener onTransactionClickListener) {
        this.context = context;
        this.agentUUID = uuid;
        this.inflater = LayoutInflater.from(context);
        this.onTransactionClickListener = onTransactionClickListener;
        setHasStableIds(true);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        if (this.data != null) {
            return this.data.size();
        }
        return 0;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public long getItemId(int i) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return -1L;
        }
        return this.data.get(i).getId().longValue();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(TransactionViewHolder transactionViewHolder, int i) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return;
        }
        transactionViewHolder.bindToData(this.data.get(i));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public TransactionViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new TransactionViewHolder(this, this.inflater.inflate(R.layout.transaction_log_item, viewGroup, false));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onViewRecycled(TransactionViewHolder transactionViewHolder) {
        transactionViewHolder.onRecycled();
    }

    public void setData(@Nullable LazyList<MoneyTransaction> lazyList) {
        this.data = lazyList;
        notifyDataSetChanged();
    }
}
