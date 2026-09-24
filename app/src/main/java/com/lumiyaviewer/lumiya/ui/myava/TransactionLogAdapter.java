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
import com.lumiyaviewer.lumiya.ui.common.binding.Unbinder;
import com.lumiyaviewer.lumiya.ui.common.binding.Utils;
import com.lumiyaviewer.lumiya.dao.MoneyTransaction;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;
import com.lumiyaviewer.lumiya.ui.common.ChatterNameDisplayer;
import de.greenrobot.dao.query.LazyList;
import java.util.Calendar;
import java.util.UUID;
import javax.annotation.Nullable;

public class TransactionLogAdapter extends RecyclerView.Adapter<TransactionLogAdapter.TransactionViewHolder> {
    private final UUID agentUUID;
    private final Context context;

    @Nullable
    private LazyList<MoneyTransaction> data;
    private final LayoutInflater inflater;
    private final OnTransactionClickListener onTransactionClickListener;

    interface OnTransactionClickListener {
        void onTransactionClicked(MoneyTransaction moneyTransaction);
    }

    class TransactionViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        TextView amountTextView;
        private Calendar calendar;
        private final ChatterNameDisplayer chatterNameDisplayer;
        TextView finalBalanceTextView;
        private MoneyTransaction moneyTransaction;
        TextView timestampTextView;
        TextView userName;
        ChatterPicView userPicView;

        TransactionViewHolder(View view) {
            super(view);
            this.chatterNameDisplayer = new ChatterNameDisplayer();
            new TransactionViewHolder_ViewBinding(this, view);
            this.chatterNameDisplayer.bindViews(this.userName, this.userPicView);
            view.setOnClickListener(this);
            this.calendar = Calendar.getInstance();
        }

        @SuppressLint({"DefaultLocale", "SetTextI18n"})
        void bindToData(MoneyTransaction moneyTransaction) {
            this.moneyTransaction = moneyTransaction;
            this.chatterNameDisplayer.setChatterID(ChatterID.getUserChatterID(TransactionLogAdapter.this.agentUUID, moneyTransaction.getAgentUUID()));
            this.amountTextView.setText(TransactionLogAdapter.this.context.getString(com.lumiyaviewer.lumiya.R.string.transaction_amount_format, Integer.valueOf(moneyTransaction.getTransactionAmount())));
            this.finalBalanceTextView.setText(TransactionLogAdapter.this.context.getString(com.lumiyaviewer.lumiya.R.string.transaction_balance_amount, Integer.valueOf(moneyTransaction.getNewBalance())));
            this.calendar.setTime(moneyTransaction.getTimestamp());
            this.timestampTextView.setText(DateUtils.getRelativeTimeSpanString(TransactionLogAdapter.this.context, this.calendar.getTimeInMillis(), false));
        }

        @Override
        public void onClick(View view) {
            if (TransactionLogAdapter.this.onTransactionClickListener == null || this.moneyTransaction == null) {
                return;
            }
            TransactionLogAdapter.this.onTransactionClickListener.onTransactionClicked(this.moneyTransaction);
        }

        void onRecycled() {
            this.chatterNameDisplayer.setChatterID(null);
            this.moneyTransaction = null;
        }
    }

    /**
     * ButterKnife binding generated for 3.4.2, kept as source; the holder
     * constructs it directly (see ui/common/binding).
     */
    public static class TransactionViewHolder_ViewBinding implements Unbinder {
        private TransactionViewHolder target;

        @UiThread
        public TransactionViewHolder_ViewBinding(TransactionViewHolder transactionViewHolder, View view) {
            this.target = transactionViewHolder;
            transactionViewHolder.userName = (TextView) Utils.findRequiredViewAsType(view, com.lumiyaviewer.lumiya.R.id.user_name, "field 'userName'", TextView.class);
            transactionViewHolder.userPicView = (ChatterPicView) Utils.findRequiredViewAsType(view, com.lumiyaviewer.lumiya.R.id.userPicView, "field 'userPicView'", ChatterPicView.class);
            transactionViewHolder.timestampTextView = (TextView) Utils.findRequiredViewAsType(view, com.lumiyaviewer.lumiya.R.id.timeStampTextView, "field 'timestampTextView'", TextView.class);
            transactionViewHolder.amountTextView = (TextView) Utils.findRequiredViewAsType(view, com.lumiyaviewer.lumiya.R.id.amountTextView, "field 'amountTextView'", TextView.class);
            transactionViewHolder.finalBalanceTextView = (TextView) Utils.findRequiredViewAsType(view, com.lumiyaviewer.lumiya.R.id.finalBalanceTextView, "field 'finalBalanceTextView'", TextView.class);
        }

        @Override
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

    TransactionLogAdapter(Context context, UUID uuid, OnTransactionClickListener onTransactionClickListener) {
        this.context = context;
        this.agentUUID = uuid;
        this.inflater = LayoutInflater.from(context);
        this.onTransactionClickListener = onTransactionClickListener;
        setHasStableIds(true);
    }

    @Override
    public int getItemCount() {
        if (this.data != null) {
            return this.data.size();
        }
        return 0;
    }

    @Override
    public long getItemId(int i) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return -1L;
        }
        return this.data.get(i).getId().longValue();
    }

    @Override
    public void onBindViewHolder(TransactionViewHolder transactionViewHolder, int i) {
        if (this.data == null || i < 0 || i >= this.data.size()) {
            return;
        }
        transactionViewHolder.bindToData(this.data.get(i));
    }

    @Override
    public TransactionViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new TransactionViewHolder(this.inflater.inflate(com.lumiyaviewer.lumiya.R.layout.transaction_log_item, viewGroup, false));
    }

    @Override
    public void onViewRecycled(TransactionViewHolder transactionViewHolder) {
        transactionViewHolder.onRecycled();
    }

    public void setData(@Nullable LazyList<MoneyTransaction> lazyList) {
        this.data = lazyList;
        notifyDataSetChanged();
    }
}
